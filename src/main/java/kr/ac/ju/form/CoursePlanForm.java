package kr.ac.ju.form;

import java.util.Date;

public class CoursePlanForm {

	private Integer no;
	private Integer courseNo;
	private String goal;
	private String summary;
	private String mainBook;
	private String subBook1;
	private String subBook2;
	private String subBook3;
	private String testProcess;
	private Date createDate;
	
	private String[] name;
	private Integer[] week;
	private String[] contents;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(Integer courseNo) {
		this.courseNo = courseNo;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getMainBook() {
		return mainBook;
	}
	public void setMainBook(String mainBook) {
		this.mainBook = mainBook;
	}
	public String getSubBook1() {
		return subBook1;
	}
	public void setSubBook1(String subBook1) {
		this.subBook1 = subBook1;
	}
	public String getSubBook2() {
		return subBook2;
	}
	public void setSubBook2(String subBook2) {
		this.subBook2 = subBook2;
	}
	public String getSubBook3() {
		return subBook3;
	}
	public void setSubBook3(String subBook3) {
		this.subBook3 = subBook3;
	}
	
	
	public String getTestProcess() {
		return testProcess;
	}
	public void setTestProcess(String testProcess) {
		this.testProcess = testProcess;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String[] getName() {
		return name;
	}
	public void setName(String[] name) {
		this.name = name;
	}
	public Integer[] getWeek() {
		return week;
	}
	public void setWeek(Integer[] week) {
		this.week = week;
	}
	public String[] getContents() {
		return contents;
	}
	public void setContents(String[] contents) {
		this.contents = contents;
	}
	
	
}
