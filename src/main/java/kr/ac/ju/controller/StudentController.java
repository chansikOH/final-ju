package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.ju.form.StudentForm;
import kr.ac.ju.service.StudentService;
import kr.ac.ju.utils.DateUtils;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
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
		
		model.addAttribute("studentForm",studentForm);
		return "student/mypage";
	}
	
	@RequestMapping(value = "/updatemypage", method = RequestMethod.POST)
	public String updateMypage(@Valid StudentForm studentForm, BindingResult errors) {
		if(errors.hasErrors()) {
			return "mypage";
		}
		
		Student student = new Student();
		BeanUtils.copyProperties(studentForm, student);
		student.setBirth(DateUtils.stringToDate(studentForm.getBirthday()));
		
		if(!(studentForm.getPassword().equals(studentForm.getCheckpassword()))) {
			return "redirect:mypage?result=fail";
		}
		
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
	public String courseview(HttpSession session, Model model, @RequestParam("video") String video) {
		
		model.addAttribute("video", video);
		
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
