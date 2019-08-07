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
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.ju.form.DocForm;
import kr.ac.ju.form.RetireForm;
import kr.ac.ju.form.VacationForm;
import kr.ac.ju.service.DocService;
import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Retire;
import kr.ac.ju.vo.Vacation;

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
	// 기안서 등록
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
	public String draftform(HttpSession session, Model model, @RequestParam("draftNo") int draftNo) {
		Employee person = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
		model.addAttribute("drafts", docService.getDraftByNo(draftNo));
		return "doc/draft/detail";
	}
	
	@RequestMapping("/draft/update")
	public String draftUpdate(Draft draft) {
		docService.updateDraft(draft);
		System.out.println("변경실행");
		return "redirect:../list";
	}
	
	// 퇴직서
	@RequestMapping("/retire/addform")
	public String retireaddform(Model model) {
		List<Employee> employees = docService.getAllEmployees();
		
		model.addAttribute("employees", employees);
		return "doc/retire/addform";
	}
	//퇴직서 등록
	@RequestMapping("/retire/insertRetire")
	public String retire(RetireForm retireForm, HttpSession session) throws IOException {
		
		Doc doc = new Doc();
		Draft draft = new Draft();
		Retire retire = new Retire();
		DocFile docfile = null;
		List<Integer> nons = new ArrayList<Integer>();
		Employee person = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
		doc.setEmployee(person);
		doc.setState("결재중");
		retireForm.setMiddlePersonNo(retireForm.getMiddlePersonNo());
		doc.setMiddlePerson(retireForm.getMiddlePersonNo());
		doc.setFinalPerson(retireForm.getFinalPersonNo());
		retire.setDiv(retireForm.getDiv());
		retire.setRetireDate(retireForm.getRetireDate());
		retire.setContents(retireForm.getContents());
		nons.add(retireForm.getMiddlePersonNo());
		nons.add(retireForm.getFinalPersonNo());
		
		if (retireForm.getUpfile().isEmpty()) {
			doc.setFileYn("N");			
		} else {
			doc.setFileYn("Y");						
		}
		
		if (!retireForm.getUpfile().isEmpty()) {
			docfile = new DocFile();
			MultipartFile mf = retireForm.getUpfile();
			String filename = mf.getOriginalFilename();
			
			FileCopyUtils.copy(mf.getBytes(),new File(attachmentFileSaveDirectory, filename));
			docfile.setFileName(filename);
			System.out.println(filename);
		} 
		docService.addRetire(doc, draft, retire, nons, docfile);
		
		return "redirect:../list";
	}
	
	@RequestMapping("/retire/detail")
	public String retireDetail() {
		return "";
	}
	
	@RequestMapping("/retire/update")
	public String retireuUpdate(Retire retire) {
		docService.updateRetire(retire);
		
		return "redirect:../list";
	}
	
	//휴가
	@RequestMapping("/vacation/addform")
	public String vacationaddform(Model model) {
		List<Employee> employees = docService.getAllEmployees();
		
		model.addAttribute("employees", employees);
		return "doc/vacation/addform";
	}
	
	// 휴가 등록
	@RequestMapping("/vacation/insertVacation")
	public String vacation(VacationForm vacationForm, HttpSession session) throws IOException {
		
		Doc doc = new Doc();
		Vacation vacation = new Vacation();
		DocFile docfile = null;
		List<Integer> non = new ArrayList<Integer>();
		Employee person = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
		doc.setEmployee(person);
		doc.setState("결재중");
		vacationForm.setMiddlePersonNo(vacationForm.getMiddlePersonNo());
		doc.setMiddlePerson(vacationForm.getMiddlePersonNo());
		doc.setFinalPerson(vacationForm.getFinalPersonNo());
		vacation.setDiv(vacationForm.getDiv());
		vacation.setStartDate(vacationForm.getStartDate());
		vacation.setEndDate(vacationForm.getEndDate());
		vacation.setContents(vacationForm.getContents());
		non.add(vacationForm.getMiddlePersonNo());
		non.add(vacationForm.getFinalPersonNo());
		
		System.out.println("div" + vacationForm.getDiv());
		System.out.println("contents" + vacationForm.getContents());
		System.out.println("start" + vacationForm.getStartDate());
		System.out.println("end" + vacationForm.getEndDate());
		System.out.println("file: "+vacationForm.getUpfile());
		
		if (vacationForm.getUpfile().isEmpty()) {
			doc.setFileYn("N");			
		} else {
			doc.setFileYn("Y");						
		}
		
		if (!vacationForm.getUpfile().isEmpty()) {
			docfile = new DocFile();
			MultipartFile mf = vacationForm.getUpfile();
			String filename = mf.getOriginalFilename();
			
			FileCopyUtils.copy(mf.getBytes(),new File(attachmentFileSaveDirectory, filename));
			docfile.setFileName(filename);
			System.out.println(filename);
		} 
		docService.addVacation(doc, vacation, non, docfile);
		return "redirect:../list";
	}
	
	@RequestMapping("/vacation/detail")
	public String vacationDetail(Model model, int vacationNo) {
		model.addAttribute("", docService.getVacationByNo(vacationNo));
		return "doc/vacation/detail";
	}
	
	@RequestMapping("/vacation/update")
	public String vacationUpdate(Vacation vacation) {
		
		docService.updateVacation(vacation);
		return "redirect:../list";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
}
