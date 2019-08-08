package kr.ac.ju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ju.service.HomeService;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Message;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Professor;
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
					return "redirect:employee/statistic";
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
	
	@RequestMapping(value="/message", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> message(Model model, int no) {
		

		List<Message> receiveMessage = homeService.getReceiveMessageByNo(no);
		List<Message> callMessage = homeService.getCallMessageByNo(no);
				
		for(Message m : receiveMessage) {
			Person receiverPerson = homeService.getPersonByNo(no);
			
			m.setReceiver(receiverPerson);
		}
		
		for(Message m : callMessage) {
			Person callerPerson = homeService.getPersonByNo(no);
			m.setCaller(callerPerson);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("receiveMessage", receiveMessage);
		map.put("callMessage", callMessage);
				
		return map;
	}
		
	@RequestMapping(value="/sendmessage")
	public @ResponseBody Map<String, Object> sendMessage(HttpSession session, 
											@RequestParam("receiver") int receiver,
											@RequestParam("contents") String contents) {
		
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		Professor professor = (Professor) session.getAttribute("LOGIN_PROFESSOR");
		
		int caller = 0;
		if(student.getNo() != null) {
			caller = student.getNo();
		} else if (employee.getNo() != null) {
			caller = employee.getNo();
		} else if (professor.getNo() != null) {
			caller = professor.getNo();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contents", contents);
		map.put("receiver", receiver);
		map.put("caller", caller);
		
		homeService.insertMessage(map);
		
		return map;
	}
}
