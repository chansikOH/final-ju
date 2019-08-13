package kr.ac.ju.vo;

import java.util.Date;

import kr.ac.ju.utils.DateUtils;

public class Person {

	private Integer no;
	private String name;
	private String password;
	private Date birth;
	private String gender;
	private String email;
	private String gubun;    // 학생,교수,직원

	public Person() {

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getbirthStr() {
		return DateUtils.dateToString(birth);
	}
	
	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	
}
