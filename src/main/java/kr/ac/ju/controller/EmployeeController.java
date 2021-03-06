package kr.ac.ju.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.util.BeanUtil;

import kr.ac.ju.form.StudentRegisterForm;
import kr.ac.ju.service.EmployeeService;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Notice;
import kr.ac.ju.vo.Pagination;
import kr.ac.ju.vo.Student;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@Value("${dir.image.profile}")
	private String profileImageSaveDirectory;
	
	@GetMapping("/stud/register")
	public String studentregister(Model model) {
		
		model.addAttribute("majors",employeeService.getAllMajors()); 
		model.addAttribute("studentRegisterForm", new StudentRegisterForm());
		return "employee/stud/register";
	}
	
	@RequestMapping(value = "/stud/studentRegister", method = RequestMethod.POST)
	public String studentRegister(@Valid StudentRegisterForm studentRegisterForm, BindingResult errors,
								  Model model) throws Exception {
		if(errors.hasErrors()) { 
			model.addAttribute("majors",employeeService.getAllMajors()); 
			System.out.println(errors);
			return "employee/stud/register";
		}
		
		Student student = new Student();

		String realAddress = studentRegisterForm.getAddress() + " " + studentRegisterForm.getDetailaddress();
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.MD5).digestAsHex(studentRegisterForm.getName());
		
		BeanUtils.copyProperties(studentRegisterForm, student);
		student.setAddress(realAddress);
		student.setPassword(digestPwd); 
		Major major = new Major();
		
		major.setNo(studentRegisterForm.getMajorNo());
		student.setMajor(major);
		MultipartFile mf = studentRegisterForm.getPhotoFile(); 
		
		if(!mf.isEmpty()) {
			final long maxfileSize = 1028 * 1024 * 5 ;
			long fileSize = mf.getSize();
			
			if (fileSize > maxfileSize) {
				errors.rejectValue("photoFile", null, "첨부파일이 최대 용량을 초과하였습니다.");
				model.addAttribute("majors",employeeService.getAllMajors()); 
				return "employee/stud/register";
			}
			String filename = new Date().getTime() + "-" + mf.getOriginalFilename();

			FileCopyUtils.copy(mf.getBytes(), new File(profileImageSaveDirectory, filename));
			student.setPhotoName(filename);    
		}
		employeeService.insertStudent(student);
		
		return "redirect:/employee/stud/checklist";
	}
	
	@GetMapping("/stud/checklist")
	public String studentselect(Model model) {
		
		model.addAttribute("majors",employeeService.getAllMajors()); 
		
		return "employee/stud/checklist";
	}
	
	@GetMapping("/stud/noticelist")
	public String noticelist(Model model){
		return "employee/stud/noticelist";
	}
	
	@GetMapping("/stud/noticedetail")
	public String noticedetail(int noticeNo, Model model) {
		Notice notice = employeeService.getNoticeByNoticeNo(noticeNo);
		model.addAttribute("notice", notice);
		
		return "employee/stud/noticedetail";
	}
	
	@GetMapping("/stud/noticeform")
	public String noticeform(Model model) {
		
		return "employee/stud/noticeform";
	}
	
	@GetMapping("/stud/addnotice")
	public String addnotice(String title, String writer, String contents) {
		Notice notice = new Notice(); 
		notice.setTitle(title);
		notice.setContents(contents);
		notice.setWriter(writer);
		
		employeeService.addNotice(notice);
		
		return "redirect:noticelist";  
	}
	
	@GetMapping("/stud/changestatus")
	public String changestatus(Model model) {
		model.addAttribute("majors",employeeService.getAllMajors()); 
		return "employee/stud/changestatus"; 
	}
	
	@GetMapping("/statistic")
	public String lectureevaluaiton(Model model) {
		
		
		return "employee/statistic"; 
	}
	

	
	@InitBinder // 한국식 날짜 변환 
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	
	
}
