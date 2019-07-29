package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;

public interface StudentDao {

	Student getStudentByNo(int studentNo);
	List<Course> getYearTermsByStudentNo(int studentNo);
	List<CourseAttend> getAllCoursesByStudentNo(int studentNo);
	List<Course> getAllCoursesWithProfessorAndMajorByStudentNo(Map<String, Object> search);
	Integer countCurrentCoursesByStudentNo(Map<String, Object> search);
	List<CourseAttend> getCoursesByStudentNoAndYearTerm(Map<String, Object> maps);
	List<Map<String, Object>> getAllRecordesByStudentNo(Map<String, Object> map);
	List<Map<String, Object>> getCoursedetailSource(Map<String, Object> search);
	Integer getAvgCourseView(Map<String, Object> search);
	List<Map<String, Object>> getPartInfos(Map<String, Object> search);
	Student getStudentInfoByNo(int studentNo);
	List<StudentStatus> getStudentStatusByNo(int studentNo);
	void deleteStudentStatus(int statusNo);
	void insertStudentStatus(StudentStatus studentStatus);
	StudentStatus getStatusCheckByNo(Map<String, Object> map);
}
