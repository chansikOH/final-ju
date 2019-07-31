package kr.ac.ju.vo;

import java.util.Date;

public class Student extends Person{

	private Major major;
	private Professor professor;
	private String phoneNumber;
	private String address;
	private Integer grade;
	private String transferYn;
	private StudentStatus studentStatus;
	private Date createDate;
	private String division;      // 재학, 휴학 (현재상태)
	private String photoName;

	public Student() {

	}

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getTransferYn() {
		return transferYn;
	}

	public void setTransferYn(String transferYn) {
		this.transferYn = transferYn;
	}

	public StudentStatus getStudentStatus() {
		return studentStatus;
	}

	public void setStudentStatus(StudentStatus studentStatus) {
		this.studentStatus = studentStatus;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	@Override
	public String toString() {
		return "Student [major=" + major + ", professor=" + professor + ", phoneNumber=" + phoneNumber + ", address="
				+ address + ", grade=" + grade + ", transferYn=" + transferYn + ", studentStatus=" + studentStatus
				+ ", createDate=" + createDate + ", division=" + division + ", photoName=" + photoName + ", getMajor()="
				+ getMajor() + ", getProfessor()=" + getProfessor() + ", getPhoneNumber()=" + getPhoneNumber()
				+ ", getAddress()=" + getAddress() + ", getGrade()=" + getGrade() + ", getTransferYn()="
				+ getTransferYn() + ", getStudentStatus()=" + getStudentStatus() + ", getCreateDate()="
				+ getCreateDate() + ", getDivision()=" + getDivision() + ", getPhotoName()=" + getPhotoName() + ", getNo()="
				+ getNo() + ", getName()=" + getName() + ", getPassword()=" + getPassword() + ", getBirth()="
				+ getBirth() + ", getGender()=" + getGender() + ", getEmail()=" + getEmail() + ", getGubun()="
				+ getGubun() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
}
