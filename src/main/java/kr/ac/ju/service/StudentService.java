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
	Course getCourseByCourseNo(int courseNo);
	List<Course> getMinusCoursesByStudentNo(int studentNo);
	
	// 작성자 : 오찬식
	List<Course> getAllCoursesWithProfessorAndMajorByStudentNo(int studentNo);
	// 작성자 : 오찬식
	Integer countCurrentCoursesByStudentNo(int studentNo);
	List<CourseAttend> getCoursesByStudentNoAndYearTerm(Map<String, Object> maps);
	List<Map<String, Object>> getAllRecordesByStudentNo(Map<String, Object> map);
	
	// 작성자 : 오찬식
	Map<String, Object> getCoursedetailSource(int studentNo, int courseNo);
	Student getStudentInfoByNo(int studentNo);
	List<StudentStatus> getStudentStatusByNo(int studentNo);
	
	// 작성자 : 오찬식
	Map<String, Object> getCourseviewSource(int studentNo, int courseNo, int classNo);
	void updateMyPage(Student student);
	void deleteStudentStatus(int statusNo);
	void insertStudentStatus(StudentStatus studentStatus);
	StudentStatus getStatusCheckByNo(Map<String, Object> map);
	void insertCourseAttendsByStudentNo(CourseAttend courseAttend);
	void updateCourseCount(int count, int courseNo) throws Exception;
	void deleteCourseAttendsByCourseNo(int studentNo, int courseNo);
	
	// 작성자 : 오찬식
	void updateClassView(int viewNo, String currentTime, int percentage);
	Student getLeaveStudentByNo(int studentNo);
}
