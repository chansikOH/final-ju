package kr.ac.ju.vo;

import java.util.Date;

import kr.ac.ju.utils.DateUtils;

public class Message {

	private Integer no;
	private Person receiver;
	private String contents;
	private Person caller;
	private Message reply;
	private Date createDate;
	private String readYn;
	private String receiverType;

	public Message() {

	}
	
	public String getReceiverType() {
		return receiverType;
	}

	public void setReceiverType(String receiverType) {
		this.receiverType = receiverType;
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
	
	public String getCreateDateStr() {
		if (createDate == null) {
			return "";
		}
		return DateUtils.dateToString(createDate);
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getReadYn() {
		return readYn;
	}

	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
}
