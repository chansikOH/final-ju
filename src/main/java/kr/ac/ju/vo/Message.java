package kr.ac.ju.vo;

import java.util.Date;

public class Message {

	private Integer no;
	private Member receiver;
	private String contents;
	private Member caller;
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

	public Member getReceiver() {
		return receiver;
	}

	public void setReceiver(Member receiver) {
		this.receiver = receiver;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Member getCaller() {
		return caller;
	}

	public void setCaller(Member caller) {
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
