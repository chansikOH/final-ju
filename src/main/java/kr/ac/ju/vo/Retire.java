package kr.ac.ju.vo;

import java.util.Date;

public class Retire {

	private Integer no;
	private String retireDiv;
	private String contents;
	private Date retireDate;
	private Doc doc;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getRetireDiv() {
		return retireDiv;
	}
	public void setRetireDiv(String retireDiv) {
		this.retireDiv = retireDiv;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRetireDate() {
		return retireDate;
	}
	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}
	public Doc getDoc() {
		return doc;
	}
	public void setDoc(Doc doc) {
		this.doc = doc;
	}
}