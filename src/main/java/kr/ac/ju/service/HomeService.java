package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Message;
import kr.ac.ju.vo.Person;

public interface HomeService {
	
	Person getPersonByNo(int no);

	void insertMessage(Map<String, Object> map);
	List<Message> getReceiveMessageByNo(int receiver);
	List<Message> getCallMessageByNo(int caller);
	
}
