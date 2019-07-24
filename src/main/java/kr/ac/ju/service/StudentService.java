package kr.ac.ju.service;

import java.util.List;

import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;

public interface StudentService {

	List<Course> getYearTermsByStudentNo(int studentNo);
	List<CourseAttend> getAllCoursesByStudentNo(int studentNo);
}
