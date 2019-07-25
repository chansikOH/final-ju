package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;

public interface StudentDao {

	Student getStudentByNo(int studentNo);
	List<Course> getYearTermsByStudentNo(int studentNo);
	List<CourseAttend> getAllCoursesByStudentNo(int studentNo);
	List<CourseAttend> getCoursesByStudentNoAndYearTerm(Map<String, Object> maps);
}