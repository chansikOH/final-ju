package kr.ac.ju.vo;

import java.util.Date;

public class CourseQna {

	private Integer no;
	private Student student;
	private Professor professor;
	private Course course;
	private String title;
	private String contents;
	private String secretYn;
	private String password;
	private String answerYn;
	private CourseQna courseQna;
	private Date createDate;

	public CourseQna() {

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

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getSecretYn() {
		return secretYn;
	}

	public void setSecretYn(String secretYn) {
		this.secretYn = secretYn;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAnswerYn() {
		return answerYn;
	}

	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}

	public CourseQna getCourseQna() {
		return courseQna;
	}

	public void setCourseQna(CourseQna courseQna) {
		this.courseQna = courseQna;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
