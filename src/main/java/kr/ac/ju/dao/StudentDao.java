package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Cla;
import kr.ac.ju.vo.ClassView;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.CourseOpinion;
import kr.ac.ju.vo.CoursePart;
import kr.ac.ju.vo.Department;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Message;
import kr.ac.ju.vo.Notice;
import kr.ac.ju.vo.Professor;
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
	int getAllNoticeCount(Map<String, Object> map);
	List<Notice> getAllNotices(Map<String, Object> map);
	Notice getNoticeByNoticeNo(int noticeNo);
	Map<String, Object> getCoursePlanByNo(int courseNo);
	List<CoursePart> getCoursePartByNo(int courseNo);
	void insertCourseOpinion(CourseOpinion courseOpinion);
	void updateCourseAttend(CourseAttend courseAttend);
	void insertMessage(Map<String, Object> map);
	List<Message> getReceiveMessageByNo(int receiver);
	List<Message> getCallMessageByNo(int caller);
	void updateStatusByNo(Map<String, Object> map);
	void deleteMessage(int no);
	List<Department> getAllDepartments();
	List<Employee> getEmployeeByDeptNo(String id);
	List<Professor> getProfessorByMajorNo(int no);
	List<Student> getStudentByMajorNo(int no);
}
