package kr.ac.ju.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ju.service.StudentService;
import kr.ac.ju.test.ExcelRead;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.Question;

@Controller
@RequestMapping("/student")
public class TestController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/course/test")
	public String testMain(int cno, Model model) {
		ExcelRead reader = new ExcelRead();
		
		List<Question> questions = reader.xlsxToQuestionList("C:\\Users\\DAYUN\\git\\final-ju\\src\\main\\webapp\\resources\\files\\tests\\test1.xlsx");
		model.addAttribute("questions", questions);
		
		Course course = studentService.getCourseByCourseNo(cno);
		model.addAttribute("course", course);
		
		return "student/course/testmain";
	}
}
