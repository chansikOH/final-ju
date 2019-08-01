package kr.ac.ju.vo;

import java.util.Date;

public class CourseAttend {

	private Integer no;
	private Student student;
	private Course course;
	private Integer point;
	private Date createDate;
	private String record;
	private CourseOpinion courseOpinion;
	
	public CourseAttend() {

	}
	
	public CourseOpinion getCourseOpinion() {
		return courseOpinion;
	}

	public void setCourseOpinion(CourseOpinion courseOpinion) {
		this.courseOpinion = courseOpinion;
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

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}
	
	public double getRecordScore() {
		double score = 0;
		
		switch (record) {
			case "A+":
				score = 4.5;
				break;
			case "A":
				score = 4.0;
				break;
			case "B+":
				score = 3.5;
				break;
			case "B":
				score = 3.0;
				break;
			case "C+":
				score = 2.5;
				break;
			case "C":
				score = 2.0;
				break;
			case "D+":
				score = 1.5;
				break;
			case "D":
				score = 1.0;
				break;
			case "F":
				score = 0.0;
				break;
		}
		return score;
	}
}
