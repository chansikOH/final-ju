package kr.ac.ju.vo;

import java.util.Date;

public class Course {

	private Integer no;
	private Professor professor;
	private Major major;
	private String name;
	private Integer credit;
	private Integer year;
	private Integer term;
	private String mustYn;
	private String passYn;
	private Date createDate;
	private Integer quota;
	private Integer count;

	public Course() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getTerm() {
		return term;
	}

	public void setTerm(Integer term) {
		this.term = term;
	}

	public String getMustYn() {
		return mustYn;
	}

	public void setMustYn(String mustYn) {
		this.mustYn = mustYn;
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

	public Integer getQuota() {
		return quota;
	}

	public void setQuota(Integer quota) {
		this.quota = quota;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
}
