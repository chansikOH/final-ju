package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.ju.service.StudentService;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;

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
	public String mypage() {
		return "student/mypage";
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
		
		return "student/course/coursedetail";
	}
	
	@RequestMapping("/course/courseview")
	public String courseview() {
		return "student/course/courseview";
	}
	
	@RequestMapping("/records")
	public String courserecords(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", student.getNo());
		
		List<Map<String, Object>> records = studentService.getAllRecordesByStudentNo(map);
		
		model.addAttribute("records", records);
		System.out.println(records);
		
		return "student/records";
	}
	
	@RequestMapping("/course/courseopinions")
	public String courseopinions() {
		return "student/course/courseopinions";
	}

	@RequestMapping("/status/drop")
	public String statusdrop() {
		return "student/status/statusdrop";
	}
	
	@RequestMapping("/status/goingback")
	public String statusgoingback() {
		return "student/status/statusgoingback";
	}
	
	@RequestMapping("/status/leave")
	public String statusleave() {
		return "student/status/statusleave";
	}
}
