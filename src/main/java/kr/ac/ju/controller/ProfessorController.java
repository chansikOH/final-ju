package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ju.service.ProfessorService;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Professor;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Autowired
	private ProfessorService service;
	
	@RequestMapping("/class/list")
	public String classlist(Model model, Integer profNo, HttpSession session) {
		
		Person person = (Person) session.getAttribute("LOGIN_PROFESSOR");
		profNo = person.getNo();
		
		
		model.addAttribute("courses", service.getAllClassByProfId(profNo));
		model.addAttribute("counts", service.getAllClassCount(profNo));
		model.addAttribute("years", service.getYearByProfessorNo(profNo));
		model.addAttribute("majors", service.getMajorByProfessorNo(profNo));

		return "professor/class/classlist";
	}
	@RequestMapping("/class/listdetail")
	public @ResponseBody Map<String, Object> listdetail(@RequestParam("no")int no){
		
		Map<String, Object> map = new HashMap<String, Object>();
				
		map.put("courseDetail", service.getCourseByCourseNo(no));
		map.put("courseParts", service.getCoursePartByCourseNo(no));
		
		return map;
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
