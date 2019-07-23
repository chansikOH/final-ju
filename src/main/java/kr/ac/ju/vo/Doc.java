package kr.ac.ju.vo;

import java.util.Date;

public class Doc {

	private String no;
	private Employee employee;
	private String title;
	private Draft draft;
	private Vacation vacation;
	private Retire retire;
	private Date createDate;

	public Doc() {

	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Draft getDraft() {
		return draft;
	}

	public void setDraft(Draft draft) {
		this.draft = draft;
	}

	public Vacation getVacation() {
		return vacation;
	}

	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}

	public Retire getRetire() {
		return retire;
	}

	public void setRetire(Retire retire) {
		this.retire = retire;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
