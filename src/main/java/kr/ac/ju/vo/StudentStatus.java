package kr.ac.ju.vo;

import java.util.Date;

public class StudentStatus {

	private Integer no;
	private String div;
	private Integer startTerm;
	private String termCount;
	private String passYn;
	private Date createDate;
	private String contents;

	public StudentStatus() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getDiv() {
		return div;
	}

	public void setDiv(String div) {
		this.div = div;
	}

	public Integer getStartTerm() {
		return startTerm;
	}

	public void setStartTerm(Integer startTerm) {
		this.startTerm = startTerm;
	}

	public String getTermCount() {
		return termCount;
	}

	public void setTermCount(String termCount) {
		this.termCount = termCount;
	}

	public String getPassYn() {
		return passYn;
	}

	public void setPassYn(String passYn) {
		this.passYn = passYn;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
}