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
}
