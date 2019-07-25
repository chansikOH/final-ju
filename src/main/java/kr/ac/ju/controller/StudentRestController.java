package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.ju.service.StudentService;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;

@RestController
@RequestMapping("/student")
public class StudentRestController {
	
	@Autowired
	private StudentService studentService;

	@GetMapping("/course.json")
	public List<CourseAttend> courseAttends(@RequestParam(value = "year", required = false, defaultValue = "0") int year,
			@RequestParam(value = "term", required = false, defaultValue = "0") int term, HttpSession session) {
		Map<String, Object> maps = new HashMap<String, Object>();
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		if(year == 0 && term == 0) {
			List<CourseAttend> courseAttends = studentService.getAllCoursesByStudentNo(student.getNo());
			
			return courseAttends;
		} else {
			maps.put("year", year);
			maps.put("term", term);
			maps.put("studentNo", student.getNo());
			
			List<CourseAttend> courseAttends = studentService.getCoursesByStudentNoAndYearTerm(maps);
			
			return courseAttends;
		}
	}
}