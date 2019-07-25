package kr.ac.ju.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ju.service.ProfessorService;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Professor;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Autowired
	private ProfessorService service;
	
	@RequestMapping("/class/list")
	public String classlist(Model model, Integer profNo, Integer courseNo, HttpSession session) {
		
//		Person person = (Person) session.getAttribute("LOGIN_USER");
//		profNo = person.getNo();
		profNo = 30001;
		courseNo=2018101;
		
		
		model.addAttribute("courses", service.getAllClassByProfId(profNo));
		model.addAttribute("counts", service.getAllClassCount(profNo));
		model.addAttribute("courseByNo", service.getCourseByCourseNo(courseNo));
		model.addAttribute("courseParts", service.getCoursePartByCourseNo(courseNo));
		return "professor/class/classlist";
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
