package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Cla;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.CoursePart;
import kr.ac.ju.vo.CoursePlan;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Professor;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.Test;
import kr.ac.ju.vo.TestResults;

public interface ProfessorDao {

	Professor getProfessorByNo(int professorNo);
	List<Course> getAllClassByProfId(int professorNo);
	int getAllClassCount(int professorNo);
	List<CoursePart>getCoursePartByCourseNo(int courseNo);
	Course getCourseByCourseNo(int courseNo);
	
	List<Course> getYearByProfessorNo(int professorNo);
	List<Course> getMajorByProfessorNo(int professorNo);
	
	List<Course> searchByOptions(Map<String, Object> param);
	int getRows(Map<String, Object> param);
	
	void addTest(Test test);
	void addVideo(Cla cla);
	
	void addCoursePlan(CoursePlan coursePlan);
	void addCoursePart(CoursePart coursePart);
	
	Major getMajor(int profNo);
	void addCourse(Course course);
	void updateCourse(Course course);
	void deleteCourse(int courseNo);
	
	List<Course> getTermClassByProfId(Map<String, Object> param);
	List<Map<String, Object>> getStudentsByCourseNo(int courseNo);
	
	void updateRecordByCourseNoAndStudNo(CourseAttend attend);
}
