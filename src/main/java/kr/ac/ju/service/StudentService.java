package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;

public interface StudentService {

	List<Course> getYearTermsByStudentNo(int studentNo);
	List<CourseAttend> getAllCoursesByStudentNo(int studentNo);
	List<Course> getAllCoursesWithProfessorAndMajorByStudentNo(int studentNo);
	Integer countCurrentCoursesByStudentNo(int studentNo);
	List<CourseAttend> getCoursesByStudentNoAndYearTerm(Map<String, Object> maps);
	List<Map<String, Object>> getAllRecordesByStudentNo(Map<String, Object> map);
	Map<String, Object> getCoursedetailSource(int studentNo, int courseNo);
	Student getStudentInfoByNo(int studentNo);
	List<StudentStatus> getStudentStatusByNo(int studentNo);
	void updateMyPage(Student student);
}
