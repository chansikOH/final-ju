package kr.ac.ju.vo;

import java.util.Date;

public class Draft {

	private Integer no;
	private String title;
	private String contents;
	private Date startDate;
	private String keepingYear;
	private String returnReason;
	private Doc doc;
	
	public Draft() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getKeepingYear() {
		return keepingYear;
	}

	public void setKeepingYear(String keepingYear) {
		this.keepingYear = keepingYear;
	}

	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public Doc getDoc() {
		return doc;
	}

	public void setDoc(Doc doc) {
		this.doc = doc;
	}

	
}
