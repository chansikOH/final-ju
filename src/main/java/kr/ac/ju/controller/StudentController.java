package kr.ac.ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {

	@RequestMapping("/course/courselist")
	public String courselist() {
		return "student/course/courselist";
	}
}
