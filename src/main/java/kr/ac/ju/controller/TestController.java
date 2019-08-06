package kr.ac.ju.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.ju.service.StudentService;
import kr.ac.ju.service.TestService;
import kr.ac.ju.test.ExcelRead;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.Question;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.Test;

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

		model.addAttribute("courses", courses);
		model.addAttribute("countCourses", countCourses);
		
		return "student/course/testlist";
	}

	@RequestMapping("/course/test")
	public String testMain(int cno, String term, Model model, HttpSession session)  throws IOException {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		ExcelRead reader = new ExcelRead();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", cno);
		map.put("term", term);
		
		Test test = testService.getTestByCourseNoAndStatus(map);

		List<Question> questions = reader.xlsxToQuestionList(ResourceUtils.getFile("classpath:/META-INF/tests/" + test.getFileName()).getAbsolutePath());
		model.addAttribute("questions", questions);

		Course course = studentService.getCourseByCourseNo(cno);
		model.addAttribute("course", course);
		
		map.put("studentNo", student.getNo());
		Map<String, Object> resultMap = testService.getTestResultYn(map);
		model.addAttribute("resultMap", resultMap);

		return "student/course/testmain";
	}

	@RequestMapping(value = "/course/checkanswers", method = RequestMethod.POST)
	public String checkAnswers(Integer[] answers, String term, int cno, HttpSession session) {
		ExcelRead reader = new ExcelRead();
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", cno);
		map.put("term", term);
		
		Test test = testService.getTestByCourseNoAndStatus(map);

		List<Question> questions = reader.xlsxToQuestionList("C:\\Users\\DAYUN\\git\\final-ju\\src\\main\\webapp\\resources\\files\\tests\\" + test.getFileName());

		int score = testService.getTestScore(questions, answers);
		map.put("testNo", test.getNo());
		map.put("studentNo", student.getNo());
		map.put("score", score * 3);
		
		testService.insertTestResults(map);
		
		return "redirect:coursedetail?courNo=" + cno;
	}
}
