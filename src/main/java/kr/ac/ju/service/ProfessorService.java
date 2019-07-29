package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CoursePart;
import kr.ac.ju.vo.Professor;

public interface ProfessorService {

	Professor getProfessorByNo(int professorNo);
	List<Course> getAllClassByProfId(int professorNo);
	int getAllClassCount(int professorNo);
	List<CoursePart>getCoursePartByCourseNo(int courseNo);
	Course getCourseByCourseNo(int courseNo);
	
	List<Course> getYearByProfessorNo(int professorNo);
	List<Course> getMajorByProfessorNo(int professorNo);
	
	List<Course> searchByOptions(Map<String, Object> param);
	int getRows(Map<String, Object> param);
}
