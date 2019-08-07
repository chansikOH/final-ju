package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Question;
import kr.ac.ju.vo.Test;

public interface TestService {

	Test getTestByCourseNoAndStatus(Map<String, Object> map);
	void insertTestResults(Map<String, Object> map);
	int getTestScore(List<Question> questions, Integer[] answers);
	Map<String, Object> getTestResultYn(Map<String, Object> map);
	Map<String, Object> getTestsByCourseNo(int courseNo);
}
