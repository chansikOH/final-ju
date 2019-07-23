package kr.ac.ju.vo;

import java.util.Date;

public class Major {

	private Integer no;
	private String name;
	private Integer admissionCount;
	private Professor head;
	private Date crateDate;

	public Major() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAdmissionCount() {
		return admissionCount;
	}

	public void setAdmissionCount(Integer admissionCount) {
		this.admissionCount = admissionCount;
	}

	public Professor getHead() {
		return head;
	}

	public void setHead(Professor head) {
		this.head = head;
	}

	public Date getCrateDate() {
		return crateDate;
	}

	public void setCrateDate(Date crateDate) {
		this.crateDate = crateDate;
	}
}
