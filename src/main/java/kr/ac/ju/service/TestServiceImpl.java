package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.ju.dao.TestDao;
import kr.ac.ju.vo.Question;
import kr.ac.ju.vo.Test;

@Repository
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDao testDao;
	
	@Override
	public Test getTestByCourseNoAndStatus(Map<String, Object> map) {
		
		return testDao.getTestByCourseNoAndStatus(map);
	}
	
	@Override
	public void insertTestResults(Map<String, Object> map) {
		testDao.insertTestResults(map);
	}
	
	@Override
	public int getTestScore(List<Question> questions, Integer[] answers) {
		int score = 0;
		
		for (int i=0; i<questions.size(); i++) {
			if (answers[i] != null) {
				Question question = questions.get(i);
				int answer = question.getAnswer();
				int checkAnswer = answers[i];
				if (answer == checkAnswer) {
					score ++;
				}
			}
		}
		
		return score;
	}
	
	@Override
	public Map<String, Object> getTestResultYn(Map<String, Object> map) {
		return testDao.getTestResultYn(map);
	}
	
	@Override
	public Map<String, Object> getTestsByCourseNo(int courseNo) {
		return testDao.getTestsByCourseNo(courseNo);
	}
}
