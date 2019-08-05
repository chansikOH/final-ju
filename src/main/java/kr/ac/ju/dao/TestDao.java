package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Test;
import kr.ac.ju.vo.TestResults;

public interface TestDao {

	Test getTestByCourseNoAndStatus(Map<String, Object> map);
	void insertTestResults(Map<String, Object> map);
	List<TestResults> getTestResultsByStudentNo(int studentNo);
}
