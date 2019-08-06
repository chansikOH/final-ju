package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public Map<String, Object> courseAttends(@RequestParam(value = "year", required = false, defaultValue = "0") int year,
			@RequestParam(value = "term", required = false, defaultValue = "0") int term, HttpSession session) {
		
		Map<String, Object> results = new HashMap<String, Object>();
		Map<String, Object> maps = new HashMap<String, Object>();
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		List<CourseAttend> courseAttends;
		
		int creditCount = 0;
		double totalScore = 0;

		if(year == 0 && term == 0) {
			courseAttends = studentService.getAllCoursesByStudentNo(student.getNo());
		} else {
			maps.put("year", year);
			maps.put("term", term);
			maps.put("studentNo", student.getNo());
			
			courseAttends = studentService.getCoursesByStudentNoAndYearTerm(maps);
		}
		
		for (CourseAttend ca : courseAttends) {
			creditCount += ca.getCourse().getCredit();
			totalScore += ca.getRecordScore() * ca.getCourse().getCredit();
		}
		
		results.put("courseAttends", courseAttends);
		results.put("creditCount", creditCount);
		results.put("avgScore", String.format("%.2f", (double) totalScore/creditCount));
		results.put("totalCourses", courseAttends.size());

		return results;
	}
	
//	@GetMapping("/notice/noticelist.json")
//	@ResponseBody
//	public Map<String, Object> noticelist(@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
//											@RequestParam(value = "option", required = false, defaultValue = "") String option,
//											@RequestParam(value = "search", required = false, defaultValue = "") String search) {
//		Map<String, Object> searchOption = new HashMap<>();
//		
//		if(!option.isEmpty() && !option.equals("")) {
//			if(option.equals("noticeNo")) {
//				searchOption.put("no",search); 
//			} else if (option.equals("title")) {
//				searchOption.put("title",search); 
//			} else if (option.equals("createDate")) {
//				searchOption.put("createDate",search); 
//			}
//		}
//		
//		return null;
//	}
}
