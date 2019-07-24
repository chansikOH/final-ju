package kr.ac.ju.vo;

import java.util.Date;

public class Message {

	private Integer no;
	private Person receiver;
	private String contents;
	private Person caller;
	private Message reply;
	private Date createDate;

	public Message() {

	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Person getReceiver() {
		return receiver;
	}

	public void setReceiver(Person receiver) {
		this.receiver = receiver;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Person getCaller() {
		return caller;
	}

	public void setCaller(Person caller) {
		this.caller = caller;
	}

	public Message getReply() {
		return reply;
	}

	public void setReply(Message reply) {
		this.reply = reply;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
