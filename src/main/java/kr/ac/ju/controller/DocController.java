package kr.ac.ju.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ju.form.DocForm;
import kr.ac.ju.service.DocService;
import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;
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
	
	
	@RequestMapping("/draft/addform")
	public String draft(DocForm docForm, HttpSession session) {
		
		Doc doc = new Doc();
		Draft draft = new Draft();
		List<DocLine> docLines = new ArrayList<DocLine>();
		DocFile docfile = new DocFile();
		
		Employee person = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
		doc.setEmployee(person);
		doc.setState("결재중");
		doc.setfinalPerson(docForm.getFinalPersonNo());
		if (docForm.getUpfile().isEmpty()) {
			doc.setFileYn("N");			
		} else {
			doc.setFileYn("Y");						
		}
		
		docService.addDraft(doc, draft, docLines, docfile);
		
		return "doc/draft/addform";
	}
	
	@RequestMapping("/draft/detail")
	public String draftform() {
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
