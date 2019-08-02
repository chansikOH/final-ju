package kr.ac.ju.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.ju.test.ExcelRead;
import kr.ac.ju.vo.Question;

@Controller
@RequestMapping("/student")
public class TestController {

	@RequestMapping("/course/test")
	public String testMain() {
		ExcelRead reader = new ExcelRead();
		
		List<Question> questions = reader.xlsxToQuestionList("C:\\Users\\DAYUN\\git\\final-ju\\src\\main\\webapp\\resources\\files\\tests\\test1.xlsx");
		for(Question q : questions) {
			System.out.println("--------------------");
			System.out.println(q.getNo());
			System.out.println(q.getQuestion());
			System.out.println(q.getExample1());
			System.out.println(q.getExample2());
			System.out.println(q.getExample3());
			System.out.println(q.getExample4());
			System.out.println(q.getAnswer());
		}
		
		return "student/course/testmain";
	}
}
