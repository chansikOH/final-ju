package kr.ac.ju.vo;

import java.util.Date;

import kr.ac.ju.utils.DateUtils;

public class StudentStatus {

	private Integer no;
	private String division;     //  휴학신청여부, 자퇴신청여부 (진행중)
	private Integer startTerm;
	private String termCount;
	private String passYn;
	private Date createDate;
	private String contents;
	private Student student;

	public StudentStatus() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
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

	public String getCreateDateStr() {
		return DateUtils.dateToString(createDate);
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

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
}
