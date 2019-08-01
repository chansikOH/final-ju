package kr.ac.ju.vo;

import java.util.Date;

public class TestResults {

	private Integer no;
	private Test test;
	private Student student;
	private Integer score;	// 시험보는것을 완료하면 웹에서 정답 체크
	private Date createDate;

	public TestResults() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
