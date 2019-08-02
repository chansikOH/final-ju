package kr.ac.ju.vo;

import java.util.Date;

public class CourseOpinion {

	private Integer no;
	private Date createDate;
	private Course course;
	private Integer q01;
	private Integer q02;
	private Integer q03;
	private Integer q04;
	private Integer q05;
	private Integer q06;
	private Integer q07;
	private Integer q08;
	private Integer q09;
	private Integer q10;
	private String q11;

	public CourseOpinion() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
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

	public Integer getQ01() {
		return q01;
	}

	public void setQ01(Integer q01) {
		this.q01 = q01;
	}

	public Integer getQ02() {
		return q02;
	}

	public void setQ02(Integer q02) {
		this.q02 = q02;
	}

	public Integer getQ03() {
		return q03;
	}

	public void setQ03(Integer q03) {
		this.q03 = q03;
	}

	public Integer getQ04() {
		return q04;
	}

	public void setQ04(Integer q04) {
		this.q04 = q04;
	}

	public Integer getQ05() {
		return q05;
	}

	public void setQ05(Integer q05) {
		this.q05 = q05;
	}

	public Integer getQ06() {
		return q06;
	}

	public void setQ06(Integer q06) {
		this.q06 = q06;
	}

	public Integer getQ07() {
		return q07;
	}

	public void setQ07(Integer q07) {
		this.q07 = q07;
	}

	public Integer getQ08() {
		return q08;
	}

	public void setQ08(Integer q08) {
		this.q08 = q08;
	}

	public Integer getQ09() {
		return q09;
	}

	public void setQ09(Integer q09) {
		this.q09 = q09;
	}

	public Integer getQ10() {
		return q10;
	}

	public void setQ10(Integer q10) {
		this.q10 = q10;
	}

	public String getQ11() {
		return q11;
	}

	public void setQ11(String q11) {
		this.q11 = q11;
	}

	@Override
	public String toString() {
		return "CourseOpinion [no=" + no + ", createDate=" + createDate + ", course=" + course + ", q01=" + q01
				+ ", q02=" + q02 + ", q03=" + q03 + ", q04=" + q04 + ", q05=" + q05 + ", q06=" + q06 + ", q07=" + q07
				+ ", q08=" + q08 + ", q09=" + q09 + ", q10=" + q10 + ", q11=" + q11 + "]";
	}
}
