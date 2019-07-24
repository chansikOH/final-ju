package kr.ac.ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ju.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/stud/register.do")
	public String studentregister() {
		
		return "employee/stud/register";
	}
	
	@GetMapping("/stud/checklist.do")
	public String studentselect(Model model) {
		
		model.addAttribute("majors",employeeService.getAllMajors()); 
		
		return "employee/stud/checklist";
	}

	
	
	
	@GetMapping("/modify.do")
	public String modify() {
		
		return "employee/modify";
	}
}
