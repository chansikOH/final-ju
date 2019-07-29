package kr.ac.ju.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.ju.service.ProfessorService;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.Pagination;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Professor;
import kr.ac.ju.vo.Test;
import kr.ac.ju.vo.TestForm;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Value("${dir.file.testfile}")
	private String attachmentFileSaveDirectory;
	
	@Autowired
	private ProfessorService service;
	
	@RequestMapping("/class/list")
	public String classlist(Model model, Integer profNo, HttpSession session,
							@RequestParam(value="pno", required = false, defaultValue = "1")int pageNo) {
		
		Person person = (Person) session.getAttribute("LOGIN_PROFESSOR");
		profNo = person.getNo();
		
		
		model.addAttribute("courses", service.getAllClassByProfId(profNo));
		model.addAttribute("counts", service.getAllClassCount(profNo));
		model.addAttribute("years", service.getYearByProfessorNo(profNo));
		model.addAttribute("majors", service.getMajorByProfessorNo(profNo));
		
		return "professor/class/classlist";
	}
	@RequestMapping("/class/listdetail")
	public @ResponseBody Map<String, Object> listdetail(@RequestParam(value="courseNo", required=false, defaultValue = "")int courseNo){
		Map<String, Object> map = new HashMap<String, Object>();
				
		map.put("courseDetail", service.getCourseByCourseNo(courseNo));
		map.put("courseParts", service.getCoursePartByCourseNo(courseNo));
		
		return map;
	}
	@RequestMapping("/class/searchcourse")
	public @ResponseBody Map<String, Object> searchcourse( @RequestParam(value="pno", required=false, defaultValue = "1") int pageNo,
															@RequestParam(value="year", required = false, defaultValue = "") String year, 
															@RequestParam(value="term", required = false, defaultValue = "") String term,
															@RequestParam(value="credit", required = false, defaultValue = "") String credit,
															@RequestParam(value="part", required = false, defaultValue = "") String part,
															@RequestParam(value="courseNum", required = false, defaultValue = "") String courseNum,
															@RequestParam(value="courseName", required = false, defaultValue = "") String courseName,
															HttpSession session){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Person person = (Person) session.getAttribute("LOGIN_PROFESSOR");
		
		map.put("profId", person.getNo());
		
		if(!year.isEmpty() && !year.equals("") && !year.equals("전체")) {
			map.put("year", year);
		}
		if(!term.isEmpty() && !term.equals("") && !year.equals("전체")) {
			map.put("term", term);
		}
		if(!credit.isEmpty() && !credit.equals("") && !credit.equals("전체")) {
			map.put("credit", credit);
		}
		if(!part.isEmpty() && !part.equals("") && !credit.equals("전체")) {
			map.put("part", part);
		}		
		if(!courseNum.isEmpty() && !courseNum.equals("")) {
			map.put("courseNum", courseNum);
		}
		if(!courseName.isEmpty() && !courseName.equals("")) {
			map.put("courseName", courseName);
		}
		
		map.put("beginIndex", (pageNo-1)*2+1);
		map.put("endIndex", pageNo*2);
		
		int records = service.getRows(map);
		Pagination pagination = new Pagination(pageNo, 2, records);
		
		List<Course> courseDatas = service.searchByOptions(map);
		
		Map<String, Object> courseMap = new HashMap<String, Object>();
		courseMap.put("courseDatas", courseDatas);
		courseMap.put("pagination", pagination);
		courseMap.put("count", records);
		
		return courseMap;
	}
	@RequestMapping("/class/addtest")
	public String addtest(TestForm testForm, Integer courseNo) throws IOException {
		
		Test test = new Test();
		
		test.setNo(courseNo);
		BeanUtils.copyProperties(testForm, test);
		
		System.out.println(test.getNo());
		System.out.println(test.getStatus());
		
		if(!testForm.getTestfile().isEmpty()) {
			MultipartFile mf = testForm.getTestfile();
			String filename = mf.getOriginalFilename();
			
			FileCopyUtils.copy(mf.getBytes(), new File(attachmentFileSaveDirectory, filename));
			test.setFileName(filename);
			System.out.println(filename);
		} else {
			return "redirect:list";
		}
		service.addTest(test);
		
		return "redirect:list";
	}
	
	
	@RequestMapping("/class/form")
	public String classform(){
		return "professor/class/classform";
	}
	@RequestMapping("/class/update")
	public String classupdate() {
		return "professor/class/classupdate";
	}
	@RequestMapping("/grade/grade")
	public String grade() {
		return "professor/grade/grade";
	}
	@RequestMapping("/course/planform")
	public String planform() {
		return "professor/course/planform";
	}
	@RequestMapping("/course/planupdate")
	public String planupdate() {
		return "professor/course/planupdate";
	}
}
