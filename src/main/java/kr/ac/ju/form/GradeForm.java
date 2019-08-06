package kr.ac.ju.form;

public class GradeForm {
	
	private Integer courseNo;
	private String[] record;
	private Integer[] studentNo;
	
	public Integer getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(Integer courseNo) {
		this.courseNo = courseNo;
	}
	public Integer[] getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(Integer[] studentNo) {
		this.studentNo = studentNo;
	}

	public String[] getRecord() {
		return record;
	}
	public void setRecord(String[] record) {
		this.record = record;
	}
	
	
}
