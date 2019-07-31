package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Cla;
import kr.ac.ju.vo.ClassView;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;

public interface StudentDao {

	Student getStudentByNo(int studentNo);
	List<Course> getYearTermsByStudentNo(int studentNo);
	List<CourseAttend> getAllCoursesByStudentNo(int studentNo);
	Course getCourseByCourseNo(int courseNo);
	List<Course> getMinusCoursesByStudentNo(Map<String, Object> map);
	
	// 작성자 : 오찬식
	List<Course> getAllCoursesWithProfessorAndMajorByStudentNo(Map<String, Object> search);
	// 작성자 : 오찬식
	Integer countCurrentCoursesByStudentNo(Map<String, Object> search);
	List<CourseAttend> getCoursesByStudentNoAndYearTerm(Map<String, Object> maps);
	List<Map<String, Object>> getAllRecordesByStudentNo(Map<String, Object> map);
	
	// 작성자 : 오찬식
	List<Map<String, Object>> getCoursedetailSource(Map<String, Object> search);
	
	// 작성자 : 오찬식
	Integer getAvgCourseView(Map<String, Object> search);
	
	// 작성자 : 오찬식
	List<Map<String, Object>> getPartInfos(Map<String, Object> search);
	Student getStudentInfoByNo(int studentNo);
	List<StudentStatus> getStudentStatusByNo(int studentNo);
	
	// 작성자 : 오찬식
	Cla getClassByClassNo(int classNo);
	
	// 작성자 : 오찬식 
	ClassView getClassViewByStudentNoAndClassNo(Map<String, Object> viewSearch);
	
	void updateMyPage(Student student);
	void deleteStudentStatus(int statusNo);
	void insertStudentStatus(StudentStatus studentStatus);
	StudentStatus getStatusCheckByNo(Map<String, Object> map);
	void insertCourseAttendsByStudentNo(CourseAttend courseAttend);
	void updateCourseCount(Map<String, Object> map);
	void deleteCourseAttendsByCourseNo(Map<String, Object> map);
	
	// 작성자 : 오찬식 
	void updateClassView(ClassView classView);
	
	// 작성자 : 오찬식
	ClassView getClassViewByClassViewNo(int viewNo);
	Student getLeaveStudentByNo(int studentNo);
}
