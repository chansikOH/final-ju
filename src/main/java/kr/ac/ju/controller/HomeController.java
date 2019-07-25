package kr.ac.ju.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ju.service.HomeService;
import kr.ac.ju.vo.Person;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;

	@RequestMapping("/")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(int id, String password, HttpSession session) {
		Person person = homeService.getPersonByNo(id);
		
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.MD5).digestAsHex(password);
		
		String path = "redirect:/?result=fail";
		if(person != null) {
			if(("학생").equals(person.getGubun())) {
				if (digestPwd.toUpperCase().equals(person.getPassword())) {
					session.setAttribute("LOGIN_STUDENT", person);
					path = "redirect:student/mypage";
				}
			}
			
			if(("교수").equals(person.getGubun())) {
				if (digestPwd.toUpperCase().equals(person.getPassword())) {
					session.setAttribute("LOGIN_PROFESSOR", person);
					path = "redirect:student/mypage";
				}
			}
			
			if(("직원").equals(person.getGubun())) {
				if (digestPwd.toUpperCase().equals(person.getPassword())) {
					session.setAttribute("LOGIN_EMPLOYEE", person);
					path = "redirect:student/mypage";
				}
			}
		}
		System.out.println(path);
		return path;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}
