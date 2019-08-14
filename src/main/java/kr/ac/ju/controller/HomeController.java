package kr.ac.ju.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ju.service.HomeService;
import kr.ac.ju.vo.Department;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Major;
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
	
	/*
	@RequestMapping(value="/message", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> message(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("LOGIN_STUDENT");
		Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		Professor professor = (Professor) session.getAttribute("LOGIN_PROFESSOR");
		
		int no = 0;
		if(student.getNo() != null) {
			no = student.getNo();
		} else if (employee.getNo() != null) {
			no = employee.getNo();
		} else if (professor.getNo() != null) {
			no = professor.getNo();
		}
		
		List<Message> receiveMessage = homeService.getReceiveMessageByNo(no);
		List<Message> callMessage = homeService.getCallMessageByNo(no);

		Map<String, Object> map = new HashMap<String, Object>();
		
		Person p = new Person();
		for (Message rm: receiveMessage) {
			p = homeService.getPersonByNo(rm.getReceiver().getNo());
			rm.setReceiver(p);
		}
		map.put("receiveMessage", receiveMessage);
		
		for (Message cm : callMessage) {
			p = homeService.getPersonByNo(cm.getCaller().getNo());
			cm.setCaller(p);
		}
		map.put("callMessage", callMessage);
		
		return map;
	}
	*/
	
	@RequestMapping(value="/findgubun", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findgubun() {
		List<Major> majors = homeService.getAllMajors();
		List<Department> departments = homeService.getAllDepartments();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("majors", majors);
		map.put("departments", departments);
		
		return map;
	}
	
	@RequestMapping(value="/findperson", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> findperson(int majorNo, String deptId, String checkedType) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if("학생".equals(checkedType)) {
			List<Student> student = homeService.getStudentByMajorNo(majorNo);
			map.put("student", student);
		} else if("교수".equals(checkedType)) {
			List<Professor> professor = homeService.getProfessorByMajorNo(majorNo);
			map.put("professor", professor);			
		} else if("직원".equals(checkedType)) {
			List<Employee> employee = homeService.getEmployeeByDeptNo(deptId);
			map.put("employee", employee);			
		}
		
		return map;
	}
	
	@RequestMapping(value="/sendmessage", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sendMessage(HttpSession session, String contents, String type, int[] receiver) {
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

		for(Integer r : receiver) {
			map.put("receiver", r);
			map.put("contents", contents);
			map.put("receiverType", type);
			map.put("caller", caller);

			homeService.insertMessage(map);
		}
		
		return map;
	}
}
