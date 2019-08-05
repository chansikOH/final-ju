package kr.ac.ju.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	@Value("${dir.files.docfile}")
	private String attachmentFileSaveDirectory; 
	
	@Autowired
	private DocService docService;

	@RequestMapping("/list")
	public String list(HttpSession session, Model model) {
		Person person = (Person) session.getAttribute("LOGIN_EMPLOYEE");
		List<Map<String, Object>> docs = docService.getDocEmployeeByNo(person.getNo());
		
		model.addAttribute("docs", docs);
		
		return "doc/list";
	}
	
	@RequestMapping("/draft/addform")
	public String addform(Model model) {
		List<Employee> employees = docService.getAllEmployees();
		
		model.addAttribute("employees", employees);
		
		return "doc/draft/addform";
	}
	
	@RequestMapping("/draft/insertDoc")
	public String draft(DocForm docForm, HttpSession session) throws IOException {
		
		Doc doc = new Doc();
		Draft draft = new Draft();
		DocFile docfile = null;
		List<Integer> nos = new ArrayList<Integer>();
		Employee person = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
		doc.setEmployee(person);
		doc.setState("결재중");
		docForm.setMiddlePersonNo(docForm.getMiddlePersonNo());
		doc.setMiddlePerson(docForm.getMiddlePersonNo());
		doc.setFinalPerson(docForm.getFinalPersonNo());
		draft.setTitle(docForm.getTitle());
		draft.setContents(docForm.getContents());
		draft.setKeepingYear(docForm.getKeepingYear());
		draft.setStartDate(docForm.getStartDate());
		nos.add(docForm.getMiddlePersonNo());
		nos.add(docForm.getFinalPersonNo());	
		
		System.out.println("title: "+docForm.getTitle());
		System.out.println("keepingyear" + docForm.getKeepingYear() );
		System.out.println("file: "+docForm.getUpfile());
		
		if (docForm.getUpfile().isEmpty()) {
			doc.setFileYn("N");			
		} else {
			doc.setFileYn("Y");						
		}
		
		if (!docForm.getUpfile().isEmpty()) {
			docfile = new DocFile();
			MultipartFile mf = docForm.getUpfile();
			String filename = mf.getOriginalFilename();
			
			FileCopyUtils.copy(mf.getBytes(),new File(attachmentFileSaveDirectory, filename));
			docfile.setFileName(filename);
			System.out.println(filename);
		} 
		docService.addDraft(doc, draft, nos, docfile);
		
		return "redirect:../list";
	}
	
	@RequestMapping("/draft/detail")
	public String draftform() {
		
		return "doc/draft/detail";
	}
	
	@RequestMapping("/draft/update")
	public String draftUpdate() {
		return "doc/draft/update";
	}
	
	// 퇴직서
	@RequestMapping("/retire/addform")
	public String retireaddform() {
		return "doc/retire/addform";
	}
	
	@RequestMapping("/retire/detail")
	public String retireDetail() {
		return "doc/retire/detail";
	}
	
	@RequestMapping("/retire/update")
	public String retireuUpdate() {
		return "doc/retire/update";
	}
	
	//휴가
	@RequestMapping("/vacation/addform")
	public String vacationaddform() {
		return "doc/vacation/addform";
	}
	
	@RequestMapping("/vacation/detail")
	public String vacationDetail() {
		return "doc/vacation/detail";
	}
	
	@RequestMapping("/vacation/update")
	public String vacationUpdate() {
		return "doc/vacation/update";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
}
