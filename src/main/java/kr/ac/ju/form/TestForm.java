package kr.ac.ju.form;

import org.springframework.web.multipart.MultipartFile;

public class TestForm {
	
	private String status;
	private MultipartFile testfile;
	
	public TestForm() {
		super();
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public MultipartFile getTestfile() {
		return testfile;
	}
	public void setTestfile(MultipartFile testfile) {
		this.testfile = testfile;
	}
	
	
}
