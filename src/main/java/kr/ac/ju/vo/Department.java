package kr.ac.ju.vo;

import java.util.Date;

public class Department {

	private String id;
	private String name;
	private Employee head;  // 부서장 번호 
	private Date createDate; 
	
	public Department() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Employee getHead() {
		return head;
	}

	public void setHead(Employee head) {
		this.head = head;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
