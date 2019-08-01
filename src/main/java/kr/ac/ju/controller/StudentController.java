package kr.ac.ju.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.ju.form.StudentForm;
import kr.ac.ju.service.HomeService;
import kr.ac.ju.service.StudentService;
import kr.ac.ju.utils.DateUtils;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Notice;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Value("${dir.image.profile}")
	private String profileImageSaveDirectory;

	@Autowired
	private StudentService studentService;

	@Autowired
	private HomeService homeService;

	@RequestMapping("/course/apply")
	public String courseApply(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		List<Course> minusCourses = studentService.getMinusCoursesByStudentNo(student.getNo());
		model.addAttribute("minusCourses", minusCourses);

		List<Course> myCourses = studentService.getAllCoursesWithProfessorAndMajorByStudentNo(student.getNo());
		model.addAttribute("myCourses", myCourses);

		int creditCount = 0;
		int totalCount = 0;

		for (Course course : myCourses) {
			creditCount += course.getCredit();
			totalCount ++;
		}

		model.addAttribute("creditCount", creditCount);
		model.addAttribute("totalCount", totalCount);

		return "student/course/courseapply";
	}

	@RequestMapping("/course/signupCourse")
	public String signupCourse(HttpSession session, int cno) throws Exception {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		CourseAttend courseAttend = new CourseAttend();

		Course course = studentService.getCourseByCourseNo(cno);

		courseAttend.setStudent(student);
		courseAttend.setCourse(course);

		studentService.insertCourseAttendsByStudentNo(courseAttend);

		studentService.updateCourseCount(course.getCount() + 1, cno);

		return "redirect:/student/course/apply";
	}

	@RequestMapping("/course/dropCourse")
	public String dropCourse(HttpSession session, int cno) throws Exception {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		Course course = studentService.getCourseByCourseNo(cno);

		studentService.deleteCourseAttendsByCourseNo(student.getNo(), cno);

		studentService.updateCourseCount(course.getCount() - 1, cno);

		return "redirect:/student/course/apply";
	}

	@RequestMapping("/course/select")
	public String courseSelect(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		List<Course> terms = studentService.getYearTermsByStudentNo(student.getNo());
		model.addAttribute("terms", terms);

		List<CourseAttend> courseAttends = studentService.getAllCoursesByStudentNo(student.getNo());
		model.addAttribute("courseAttends", courseAttends);

		int creditCount = 0;
		double totalScore = 0.0;

		for (CourseAttend ca : courseAttends) {
			creditCount += ca.getCourse().getCredit();
			totalScore += ca.getRecordScore() * ca.getCourse().getCredit();
		}

		model.addAttribute("creditCount", creditCount);
		model.addAttribute("avgScore", String.format("%.2f", (double) totalScore / creditCount));
		model.addAttribute("totalCourses", courseAttends.size());

		return "student/course/courseselect";
	}

	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		StudentForm studentForm = new StudentForm();
		studentForm.setNo(student.getNo());
		studentForm.setName(student.getName());
		studentForm.setBirthday(DateUtils.dateToString(student.getBirth()));
		studentForm.setEmail(student.getEmail());
		studentForm.setPhoneNumber(student.getPhoneNumber());

		model.addAttribute("studentForm", studentForm);
		return "student/mypage";
	}

	@RequestMapping(value = "/updatemypage", method = RequestMethod.POST)
	public String updateMypage(@Valid StudentForm studentForm, BindingResult errors, HttpSession session)
			throws Exception {
		if (errors.hasErrors()) {
			System.out.println(errors);
			return "student/mypage";
		}

		String newAddress = studentForm.getAddress() + " " + studentForm.getDetailaddress();
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.MD5).digestAsHex(studentForm.getPassword());

		Student student = new Student();
		BeanUtils.copyProperties(studentForm, student);

		student.setPassword(digestPwd.toUpperCase());
		student.setBirth(DateUtils.stringToDate(studentForm.getBirthday()));
		student.setAddress(newAddress);

		MultipartFile mf = studentForm.getPhotoFile();
		if (!mf.isEmpty()) {
			final long maxfileSize = 1028 * 1024 * 5;
			long fileSize = mf.getSize();

			if (fileSize > maxfileSize) {
				errors.rejectValue("photoFile", null, "첨부파일의 최대용량을 초과하였습니다.");
				return "student/mypage";
			}

			String filename = new Date().getTime() + "-" + mf.getOriginalFilename();

			FileCopyUtils.copy(mf.getBytes(), new File(profileImageSaveDirectory, filename));
			student.setPhotoName(filename);
		}

		studentService.updateMyPage(student);

		Person person = homeService.getPersonByNo(student.getNo());
		session.setAttribute("LOGIN_STUDENT", person);

		return "redirect:mypage";
	}

	/*
	 * 작성자 : 오찬식
	 * 설명 : courselist 페이지
	 */
	@RequestMapping("/course/courselist")
	public String courselist(HttpSession session, Model model) {
		// 세션에 담겨있는 현재 로그인한 학생 객체로 정의
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		// 학생 번호를 매개변수로 수강중인 현재 수강정보들을 추출
		List<Course> courses = studentService.getAllCoursesWithProfessorAndMajorByStudentNo(student.getNo());
		// 학생 번호를 매개변수로 수강중인 현재 교과목 수를 추출
		Integer countCourses = studentService.countCurrentCoursesByStudentNo(student.getNo());

		// 모델에 수강정보들과 교과목수를 담음
		model.addAttribute("courses", courses);
		model.addAttribute("countCourses", countCourses);
		// courselist 페이지를 반환
		return "student/course/courselist";
	}

	/*
	 * 작성자 : 오찬식
	 * 설명 : coursedetail 페이지
	 */
	@RequestMapping("/course/coursedetail")
	public String coursedetail(HttpSession session, Model model, @RequestParam("courNo") int courseNo) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		// 학생번호와 교과목번호를 매개변수로 coursedetil 페이지에서 필요한 정보를 추출
		Map<String, Object> sources = studentService.getCoursedetailSource(student.getNo(), courseNo);
		// 모델에 정보를 담음
		model.addAttribute("sources", sources);

		// coursedetail 페이지를 반환
		return "student/course/coursedetail";
	}

	/*
	 * 작성자 : 오찬식
	 * 설명 : courseview 페이지
	 */
	@RequestMapping("/course/courseview")
	public String courseview(HttpSession session, Model model, @RequestParam("cno") int courseNo,
			@RequestParam("clno") int classNo) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		// 학생정보와 코스번호, 강의번호를 매개변수로 courseview 페이지에서 필요한 정보를 추출
		Map<String, Object> sources = studentService.getCourseviewSource(student.getNo(), courseNo, classNo);
		// 모델에 정보를 담음
		model.addAttribute("sources", sources);

		// courseview 페이지를 반환 
		return "student/course/courseview";
	}

	@RequestMapping("/course/updateview")
	public String updateview(HttpSession session, @RequestParam("cno") int courseNo, @RequestParam("clno") int classNo,
			@RequestParam("viewno") int viewNo, @RequestParam("current") String currentTime,
			@RequestParam("percent") int percentage) {

		studentService.updateClassView(viewNo, currentTime, percentage);

		return "redirect:courseview?cno=" + courseNo + "&clno=" + classNo;
	}

	@RequestMapping("/course/realtimeupdate")
	@ResponseBody
	public void realtimeupdate(@RequestParam("viewno") int viewNo, @RequestParam("current") String currentTime,
			@RequestParam("percent") int percentage) {
		studentService.updateClassView(viewNo, currentTime, percentage);
	}

	@RequestMapping("/records")
	public String courserecords(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		List<Map<String, Object>> records = studentService.getAllRecordesByStudentNo(student.getNo());

		model.addAttribute("records", records);

		return "student/records";
	}

	@RequestMapping("/course/courseopinions")
	public String courseopinions() {
		return "student/course/courseopinions";
	}

	@RequestMapping("/status/chStatus")
	public String changeStatus(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		Student studentInfo = studentService.getStudentInfoByNo(student.getNo());
		List<StudentStatus> status = studentService.getStudentStatusByNo(student.getNo());
		Student leaveStudent = studentService.getLeaveStudentByNo(student.getNo());

		model.addAttribute("student", studentInfo);
		model.addAttribute("status", status);
		model.addAttribute("leaveStudents", leaveStudent);

		return "student/status/changeStatus";
	}

	@RequestMapping("/status/delete.status")
	public String statusDelete(@RequestParam("no") int statusNo, String sta) {
		studentService.deleteStudentStatus(statusNo);

		return "redirect:chStatus?sta=" + sta;
	}

	@RequestMapping("/status/changeStatus")
	public String changeStatus(StudentStatus studentStatus, String sta, HttpSession session) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("no", student.getNo());
		map.put("division", studentStatus.getDivision());

		StudentStatus queriedStudentStatus = studentService.getStatusCheckByNo(map);
		if (!"복학".equals(studentStatus.getDivision()) && queriedStudentStatus != null) {
			return "redirect:chStatus?sta=" + sta + "&result=fail";
		}

		studentStatus.setStudent(student);
		studentService.insertStudentStatus(studentStatus);

		return "redirect:chStatus?sta=" + sta;
	}

	@RequestMapping("/notice/list")
	public String studentNoticeList(Model model) {
		List<Notice> notices = studentService.getAllNotices();
		model.addAttribute("notices", notices);
		
		return "student/notice/noticelist";
	}
	
	@RequestMapping("/notice/detail")
	public String studentNoticeDetail(int no, Model model) {
		Notice notice = studentService.getNoticeByNoticeNo(no);
		model.addAttribute("notice", notice);
		
		return "student/notice/noticedetail";
	}
	
	@RequestMapping("/course/testlist")
	public String testList(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		List<Course> courses = studentService.getAllCoursesWithProfessorAndMajorByStudentNo(student.getNo());
		Integer countCourses = studentService.countCurrentCoursesByStudentNo(student.getNo());

		model.addAttribute("courses", courses);
		model.addAttribute("countCourses", countCourses);
		
		return "student/course/testlist";
	}
}
