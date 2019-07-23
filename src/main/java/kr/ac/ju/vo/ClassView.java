package kr.ac.ju.vo;

import java.util.Date;

public class ClassView {

	private Integer no;
	private Student student;
	private Cla cla;
	private String time;
	private String statusYn;
	private Integer percentage;
	private Date createDate;
	private Course course;

	public ClassView() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Cla getCla() {
		return cla;
	}

	public void setCla(Cla cla) {
		this.cla = cla;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStatusYn() {
		return statusYn;
	}

	public void setStatusYn(String statusYn) {
		this.statusYn = statusYn;
	}

	public Integer getPercentage() {
		return percentage;
	}

	public void setPercentage(Integer percentage) {
		this.percentage = percentage;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
}
