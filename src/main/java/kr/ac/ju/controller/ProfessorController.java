package kr.ac.ju.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import kr.ac.ju.form.ClaForm;
import kr.ac.ju.form.CoursePlanForm;
import kr.ac.ju.form.TestForm;
import kr.ac.ju.service.ProfessorService;
import kr.ac.ju.vo.Cla;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CoursePart;
import kr.ac.ju.vo.CoursePlan;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Pagination;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Professor;
import kr.ac.ju.vo.Test;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Value("${dir.file.testfile}")
	private String attachmentFileSaveDirectory;
	
	@Value("${dir.file.videofile}")
	private String attachmentVideoFileSaveDirectory;
	
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
	@RequestMapping("/class/classvideo")
	public String classvideo(int courseNo, Model model) {
		
		model.addAttribute("course", service.getCourseByCourseNo(courseNo));
		model.addAttribute("courseParts", service.getCoursePartByCourseNo(courseNo));
		return "professor/class/classvideo";
	}
	
	@RequestMapping("/class/addvideo")
	public String addvideo(ClaForm claForm, Integer coursePartNo) throws IOException {
		Cla cla = new Cla();
		cla.setNo(coursePartNo);
		System.out.println(claForm.getName());
		System.out.println(claForm.getVideoFile());
		BeanUtils.copyProperties(claForm, cla);
		if(!claForm.getVideoFile().isEmpty()) {
			MultipartFile mf = claForm.getVideoFile();
			String filename = mf.getOriginalFilename();
			
			FileCopyUtils.copy(mf.getBytes(), new File(attachmentVideoFileSaveDirectory, filename));
			cla.setVideoName(filename);
			System.out.println(filename);
			
		} else {
			return "redirect:list";
		}
		service.addVideo(cla);
		
		return "redirect:list";
	}
	
	
	@RequestMapping("/class/form")
	public String classform(Model model, HttpSession session){
		
		Professor professor= (Professor) session.getAttribute("LOGIN_PROFESSOR");
		
		
		
		model.addAttribute("major", service.getMajor(professor.getNo()));
		
		return "professor/class/classform";
	}
	@RequestMapping("/class/addcourse")
	public String addcourse(Course course, HttpSession session, int mno){
		
		Professor professor= (Professor) session.getAttribute("LOGIN_PROFESSOR");
		Major major = (Major)service.getMajor(professor.getNo());
		course.setProfessor(professor);
		course.setMajor(major);

		service.addCourse(course);
		
		return "redirect:list";
	}
	
	@RequestMapping("/class/updateform")
	public String classupdateform(HttpSession session, int cno, Model model) {
		
		model.addAttribute("course", service.getCourseByCourseNo(cno));
		
		return "professor/class/classupdate";
	}
	@RequestMapping("/class/update")
	public String classupdate(Course course) {
				
		service.updateCourse(course);
		System.out.println("실행완료");
		return "redirect:list";
	}
	@RequestMapping("/class/delete")
	public String classdelete(int no) {
		
		service.deleteCourse(no);
		
		return "redirect:list";
	}
	
	@RequestMapping("/grade/grade")
	public String grade() {
		return "professor/grade/grade";
	}
	@RequestMapping("/course/plandetail")
	public String plandetail() {
		
		return "professor/course/plandetail";
	}
	@RequestMapping("/course/planform")
	public String planform(HttpSession session, Model model) {
		
		Person person = (Person) session.getAttribute("LOGIN_PROFESSOR");
		model.addAttribute("courses", service.getAllClassByProfId(person.getNo()));
		
		return "professor/course/planform";
	}
	
	@RequestMapping("/course/addplanform")
	public String addplanform(CoursePlanForm form, HttpSession session) {
		
		CoursePlan coursePlan = new CoursePlan();
		
		Course course = service.getCourseByCourseNo(form.getCourseNo());
		
		BeanUtils.copyProperties(form, coursePlan);
		Professor pro = (Professor) session.getAttribute("LOGIN_PROFESSOR");
		
		coursePlan.setProfessor(pro);
		coursePlan.setCourse(course);
		
		List<CoursePart> parts = new ArrayList<CoursePart>();
		for(int i = 0; i<form.getName().length; i++ ) {
			CoursePart coursePart = new CoursePart();
			BeanUtils.copyProperties(form, coursePart);
			coursePart.setCourse(course);
			
			
			coursePart.setName(form.getName()[i]);
			coursePart.setWeek(form.getWeek()[i]);
			coursePart.setContents(form.getContents()[i]);
			
			parts.add(coursePart);
		}
		
		service.addCoursePlanAndParts(coursePlan, parts);
		
		System.out.println(form.getWeek());
		
		return "redirect: ../class/list";
	}
	
	@RequestMapping("/course/planupdate")
	public String planupdate() {
		return "professor/course/planupdate";
	}
}
