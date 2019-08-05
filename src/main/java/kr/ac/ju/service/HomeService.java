package kr.ac.ju.service;

import kr.ac.ju.vo.Message;
import kr.ac.ju.vo.Person;

public interface HomeService {
	
	Person getPersonByNo(int no);

	void insertMessage(Message message);
	Message getReceiveMessageByNo(int messageNo);
	
}
