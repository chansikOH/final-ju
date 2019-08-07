package kr.ac.ju.dao;

import java.util.Map;

import kr.ac.ju.vo.Test;

public interface TestDao {

	Test getTestByCourseNoAndStatus(Map<String, Object> map);
	void insertTestResults(Map<String, Object> map);
	Map<String, Object> getTestResultYn(Map<String, Object> map);
	Map<String, Object> getTestsByCourseNo(int courseNo);
}
