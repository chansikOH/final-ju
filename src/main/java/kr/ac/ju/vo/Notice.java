package kr.ac.ju.vo;

import java.util.Date;

import kr.ac.ju.utils.DateUtils;

public class Notice {

	private Integer no;
	private String writer;
	private String title;
	private String contents;
	private String fileName;
	private Date createDate;

	public Notice() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getExtension() {
		if (fileName == null) {
			return null;
		}
		return fileName.substring(fileName.lastIndexOf(".") + 1);
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public String getCreateDateStr() {
		return DateUtils.dateToString(createDate);
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
