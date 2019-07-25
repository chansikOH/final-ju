package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.ju.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeRestController {
	
	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/stud/checklist.json")
	public String studentselect(@RequestParam(value = "pageNo", required = false, defaultValue = "1" ) int pageNo, 
			                    @RequestParam(value = "status", required = false, defaultValue = "") String status,
								@RequestParam(value = "grade", required = false, defaultValue = "") String grade, 
								@RequestParam(value = "major", required = false, defaultValue = "") String major,
								@RequestParam(value = "name", required = false, defaultValue = "") String name,
								@RequestParam(value = "studentNo", required = false, defaultValue = "0") int studentNo,
								@RequestParam(value = "tel", required = false, defaultValue = "") String tel, 
			                    Model model) {
		
		Map<String, Object> searchOption = new HashMap<String, Object>();
		
		if(!status.isEmpty() && !status.equals("") && !status.equals("전체")) {
			searchOption.put("status",status); 
		} 
		if(!grade.isEmpty() && !grade.equals("") && !grade.equals("전체")) {
			searchOption.put("grade",grade); 
		}
		if(!major.isEmpty() && !major.equals("") && !major.equals("전체")) {
			searchOption.put("major",major); 
		}
		if(!name.isEmpty() && !name.equals("")) {
			searchOption.put("name",name);
		}
		if(studentNo != 0) {
			searchOption.put("studentNo",studentNo);
		}
		if(!tel.equals("")) {
			searchOption.put("tel",tel);
		}
		
		model.addAttribute("majors",employeeService.getAllMajors()); 
		model.addAttribute("students",employeeService.searchStudents(searchOption)); 
		
		return "employee/stud/checklist";
	}
}
