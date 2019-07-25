package kr.ac.ju.controller;

import java.util.List;

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
		
		int count = 0;
		for (CourseAttend ca : courseAttends) {
			count++;
		}
		
		model.addAttribute("count", count);
		
		return "student/course/courseselect";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "student/mypage";
	}
	
	@RequestMapping("/course/courselist")
	public String courselist() {
		return "student/course/courselist";
	}
	
	@RequestMapping("/course/coursedetail")
	public String coursedetail() {
		return "student/course/coursedetail";
	}
	
	@RequestMapping("/course/courseview")
	public String courseview() {
		return "student/course/courseview";
	}
	
}
