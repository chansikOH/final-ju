package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Question;
import kr.ac.ju.vo.Test;
import kr.ac.ju.vo.TestResults;

public interface TestService {

	Test getTestByCourseNoAndStatus(Map<String, Object> map);
	void insertTestResults(Map<String, Object> map);
	int getTestScore(List<Question> questions, int[] answers);
	List<TestResults> getTestResultsByStudentNo(int studentNo);
}
