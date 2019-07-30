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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.ju.form.StudentForm;
import kr.ac.ju.service.HomeService;
import kr.ac.ju.service.StudentService;
import kr.ac.ju.utils.DateUtils;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
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
	public String courseApply() {
		return "student/course/courseapply";
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
			totalScore += ca.getRecordScore();
		}
		
		model.addAttribute("creditCount", creditCount);
		model.addAttribute("avgScore", String.format("%.2f", (double) totalScore/courseAttends.size()));
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
		
		model.addAttribute("studentForm",studentForm);
		return "student/mypage";
	}
	
	@RequestMapping(value = "/updatemypage", method = RequestMethod.POST)
	public String updateMypage(@Valid StudentForm studentForm, BindingResult errors, HttpSession session) throws Exception {
		if(errors.hasErrors()) {
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
		if(!mf.isEmpty()) {
			final long maxfileSize = 1028 * 1024 * 5;
			long fileSize = mf.getSize();
			
			if(fileSize > maxfileSize) {
				errors.rejectValue("photoFile", null, "첨부파일의 최대용량을 초과하였습니다.");
				return "student/mypage";
			}
			
			String filename = mf.getOriginalFilename() + new Date().getTime();
			
			FileCopyUtils.copy(mf.getBytes(), new File(profileImageSaveDirectory, filename));
			student.setPhotoName(filename);
		}
		
		studentService.updateMyPage(student);
		
		Person person = homeService.getPersonByNo(student.getNo());
		session.setAttribute("LOGIN_STUDENT", person);
		
		return "redirect:mypage";
	}
	
	@RequestMapping("/course/courselist")
	public String courselist(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		
		List<Course> courses = studentService.getAllCoursesWithProfessorAndMajorByStudentNo(student.getNo());
		Integer countCourses = studentService.countCurrentCoursesByStudentNo(student.getNo());
		
		model.addAttribute("courses", courses);
		model.addAttribute("countCourses", countCourses);
		return "student/course/courselist";
	}
	
	@RequestMapping("/course/coursedetail")
	public String coursedetail(HttpSession session, Model model, @RequestParam("courNo") int courseNo) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		
		Map<String, Object> sources = studentService.getCoursedetailSource(student.getNo(), courseNo);
		model.addAttribute("sources", sources);
		
		return "student/course/coursedetail";
	}
	
	@RequestMapping("/course/courseview")
	public String courseview(HttpSession session, Model model, @RequestParam("cno") int courseNo, @RequestParam("clno") int classNo) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		
		Map<String, Object> sources = studentService.getCourseviewSource(student.getNo(), courseNo, classNo);
		model.addAttribute("sources", sources);
		
		return "student/course/courseview";
	}
	
	@RequestMapping("/records")
	public String courserecords(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", student.getNo());
		
		List<Map<String, Object>> records = studentService.getAllRecordesByStudentNo(map);
				
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
		
		model.addAttribute("student", studentInfo);
		model.addAttribute("status", status);
		
		return "student/status/changeStatus";
	}
	
	@RequestMapping("/status/delete.status") 
	public String statusDelete(@RequestParam("no")int statusNo, String sta) {
		studentService.deleteStudentStatus(statusNo);
		
		return "redirect:chStatus?sta="+sta;
	}
	
	@RequestMapping("/status/changeStatus")
	public String changeStatus(StudentStatus studentStatus, String sta) {
		/*
		 * System.out.println("dddddddd"+studentStatus.getStudent().getNo());
		 * 
		 * Map<String, Object> map = new HashMap<String, Object>();
		 * 
		 * map.put("no", studentStatus.getStudent().getNo()); map.put("division",
		 * studentStatus.getDivision());
		 * 
		 * if(studentService.getStatusCheckByNo(map) != null) { return
		 * "redirect:chStatus?sta="+sta+"&result=false"; }
		 */
		
		studentService.insertStudentStatus(studentStatus);
		
		return "redirect:chStatus?sta="+sta;
	}
}
