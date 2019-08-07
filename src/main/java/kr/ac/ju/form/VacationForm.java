package kr.ac.ju.form;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class VacationForm {

	private Integer middlePersonNo;
	private Integer finalPersonNo;
	private String div;
	private Date startDate;
	private Date endDate;
	private String contents;
	private MultipartFile upfile;
	
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
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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
}