package kr.ac.ju.dao;

import java.util.List;

import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CoursePart;
import kr.ac.ju.vo.Professor;

public interface ProfessorDao {

	Professor getProfessorByNo(int professorNo);
	List<Course> getAllClassByProfId(int professorNo);
	int getAllClassCount(int professorNo);
	List<CoursePart>getCoursePartByCourseNo(int courseNo);
	Course getCourseByCourseNo(int courseNo);
	
	List<Course> getYearByProfessorNo(int professorNo);
	List<Course> getMajorByProfessorNo(int professorNo);
}
