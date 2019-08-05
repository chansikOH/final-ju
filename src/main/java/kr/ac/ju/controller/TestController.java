package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.ju.service.StudentService;
import kr.ac.ju.service.TestService;
import kr.ac.ju.test.ExcelRead;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.Question;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.Test;
import kr.ac.ju.vo.TestResults;

@Controller
@RequestMapping("/student")
public class TestController {

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TestService testService;

	@RequestMapping("/course/testlist")
	public String testList(HttpSession session, Model model) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		List<Course> courses = studentService.getAllCoursesWithProfessorAndMajorByStudentNo(student.getNo());
		Integer countCourses = studentService.countCurrentCoursesByStudentNo(student.getNo());
		List<TestResults> results = testService.getTestResultsByStudentNo(student.getNo());

		model.addAttribute("courses", courses);
		model.addAttribute("countCourses", countCourses);
		
		return "student/course/testlist";
	}

	@RequestMapping("/course/test")
	public String testMain(int cno, Model model) {
		ExcelRead reader = new ExcelRead();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", cno);
		
		Test test = testService.getTestByCourseNoAndStatus(map);

		List<Question> questions = reader.xlsxToQuestionList("C:\\Users\\DAYUN\\git\\final-ju\\src\\main\\webapp\\resources\\files\\tests\\" + test.getFileName());
		model.addAttribute("questions", questions);

		Course course = studentService.getCourseByCourseNo(cno);
		model.addAttribute("course", course);

		return "student/course/testmain";
	}

	@RequestMapping(value = "/course/checkanswers", method = RequestMethod.POST)
	public String checkAnswers(int[] answers, int cno, HttpSession session) {
		ExcelRead reader = new ExcelRead();
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", cno);
		
		Test test = testService.getTestByCourseNoAndStatus(map);

		List<Question> questions = reader.xlsxToQuestionList("C:\\Users\\DAYUN\\git\\final-ju\\src\\main\\webapp\\resources\\files\\tests\\" + test.getFileName());

		int score = testService.getTestScore(questions, answers);
		map.put("testNo", test.getNo());
		map.put("studentNo", student.getNo());
		map.put("score", score*3);
		
		testService.insertTestResults(map);
		
		return "redirect:testlist";
	}
}
