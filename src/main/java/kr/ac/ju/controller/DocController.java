package kr.ac.ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/doc")
public class DocController {

	@RequestMapping("/list")
	public String list() {
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
