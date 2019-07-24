package kr.ac.ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@RequestMapping("/course/apply")
	public String courseApply() {
		return "student/course/courseapply";
	}
	
	@RequestMapping("/course/select")
	public String courseSelect() {
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
	
}
