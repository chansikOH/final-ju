package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ju.service.EmployeeService;
import kr.ac.ju.vo.Pagination;
import kr.ac.ju.vo.Student;

@Controller
@RequestMapping("/employee")
public class EmployeeRestController {
	
	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/stud/checklist.json")
	@ResponseBody
	public Map<String, Object> studentselect(@RequestParam(value = "pageNo", required = false, defaultValue = "1" ) int pageNo, 
			                    @RequestParam(value = "status", required = false, defaultValue = "") String status,
								@RequestParam(value = "grade", required = false, defaultValue = "") String grade, 
								@RequestParam(value = "major", required = false, defaultValue = "") String major,
								@RequestParam(value = "name", required = false, defaultValue = "") String name,
								@RequestParam(value = "studentNo", required = false, defaultValue = "0") int studentNo,
								@RequestParam(value = "tel", required = false, defaultValue = "") String tel, 
			                    Model model) {
		
		Map<String, Object> searchOption = new HashMap<String, Object>();
			
		// search 관련
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
		if(!tel.isEmpty() && !name.equals("")) {
			searchOption.put("tel",tel);
		}
		
		// pagination 관련
		int size = 5;									
		int beginIndex  = (pageNo - 1)*size + 1 ;		
		int endIndex   = pageNo*size ; 					
		
		searchOption.put("pageNo", pageNo); 	
		searchOption.put("beginIndex",beginIndex);
		searchOption.put("endIndex",endIndex);
		
		List<Student> serarchStudents = employeeService.searchStudents(searchOption);
		int count = employeeService.searchStudentsCount(searchOption); 
		Pagination pagination = new Pagination(pageNo, size, count); 
		
		
		// 값 담기
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("searchStudents", serarchStudents); 
		result.put("pagination", pagination); 
		result.put("count", count); 
		return result; 
	}
	
	@GetMapping("/stud/studentdetail.json")
	@ResponseBody
	public Student detailStudent(@RequestParam(value = "studentNo", required = true) int studentNo) {
		Student student = employeeService.getStudentByNo(studentNo);
		return student; 
	}
	
	@GetMapping("/stud/statuschange.json")
	@ResponseBody
	public Student statuschange(@RequestParam(value = "studentNo", required = true) int studentNo) {
		Student student = employeeService.getStudentByNo(studentNo);
		return student; 
	}
	
	
}
