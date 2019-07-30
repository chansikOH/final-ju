package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ju.service.DocService;
import kr.ac.ju.vo.Person;

@Controller
@RequestMapping("/doc")
public class DocController {
	
	@Autowired
	private DocService docService;

	@RequestMapping("/list")
	public String list(HttpSession session, Model model) {
		Person person = (Person) session.getAttribute("LOGIN_EMPLOYEE");
		List<HashMap<String, Object>> docs = docService.getDocEmployeeByNo(person.getNo());
		
		model.addAttribute("docs", docs);
		
		return "doc/list";
	}
	
	@RequestMapping("/draft/detail")
	public String draft() {
		return "doc/draft/detail";
	}
	
	@RequestMapping("/draft/update")
	public String draftUpdate() {
		return "doc/draft/update";
	}
	
	@RequestMapping("/retire/detail")
	public String retireDetail() {
		return "doc/retire/detail";
	}
	
	@RequestMapping("/retire/update")
	public String retireuUpdate() {
		return "doc/retire/update";
	}
	
	@RequestMapping("/vacation/detail")
	public String vacationDetail() {
		return "doc/vacation/detail";
	}
	
	@RequestMapping("/vacation/update")
	public String vacationUpdate() {
		return "doc/vacation/update";
	}
}
