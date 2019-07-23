package kr.ac.ju.vo;

import java.util.Date;

public class Cla {

	private Integer no;
	private CoursePart coursePart;
	private String name;
	private String videoName;
	private Date createDate;

	public Cla() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public CoursePart getCoursePart() {
		return coursePart;
	}

	public void setCoursePart(CoursePart coursePart) {
		this.coursePart = coursePart;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
