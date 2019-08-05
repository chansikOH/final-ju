package kr.ac.ju.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ju.service.EmployeeService;
import kr.ac.ju.service.HomeService;
import kr.ac.ju.service.ProfessorService;
import kr.ac.ju.service.StudentService;
import kr.ac.ju.vo.Message;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Student;

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
		
		if(person != null) {
			if(("학생").equals(person.getGubun())) {
				if (digestPwd.toUpperCase().equals(person.getPassword())) {
					session.setAttribute("LOGIN_STUDENT", person);
					return "redirect:student/mypage";
				}
			}
			
			if(("교수").equals(person.getGubun())) {
				if (digestPwd.toUpperCase().equals(person.getPassword())) {
					session.setAttribute("LOGIN_PROFESSOR", person);
					return "redirect:professor/class/list";
				}
			}
			
			if(("직원").equals(person.getGubun())) {
				if (digestPwd.toUpperCase().equals(person.getPassword())) {
					session.setAttribute("LOGIN_EMPLOYEE", person);
					return "redirect:employee/stud/register.do";
				}
			}
			return "redirect:/?result=fail";
		}
		return "redirect:/?result=fail";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/sendmessage")
	public @ResponseBody Message sendMessage(HttpSession session, 
											@RequestParam("receiver") int receiver,
											@RequestParam("contents") String contents) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");

		Message message = new Message();
		message.setContents(contents);
		message.setCaller(student);
		
		Person person = homeService.getPersonByNo(receiver);
		if(person != null) {
			message.setReceiver(person);
		}
				
		homeService.insertMessage(message);
		
		return message;
	}
}
