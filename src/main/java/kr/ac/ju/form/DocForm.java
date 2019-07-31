package kr.ac.ju.form;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class DocForm {
	
	private Integer middlePersonNo;
	private Integer finalPersonNo;
	private String title;
	private String contents;
	private MultipartFile upfile;
	private String keepingYear;
	private Date startDate;
	
	public Integer getMiddlePersonNo() {
		return middlePersonNo;
	}
	public void setMiddlePersonNo(Integer middlePersonNo) {
		this.middlePersonNo = middlePersonNo;
	}
	public Integer getFinalPersonNo() {
		return finalPersonNo;
	}
	public void setFinalPersonNo(Integer finalPersonNo) {
		this.finalPersonNo = finalPersonNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public MultipartFile getUpfile() {
		return upfile;
	}
	public void setUpfile(MultipartFile upfile) {
		this.upfile = upfile;
	}
	public String getKeepingYear() {
		return keepingYear;
	}
	public void setKeepingYear(String keepingYear) {
		this.keepingYear = keepingYear;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	
	
}
