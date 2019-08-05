package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Notice;
import kr.ac.ju.vo.Student;

public interface EmployeeDao {

	Employee getEmployeeByNo(int employeeNo);
	
	// Controller
	List<Major> getAllMajors(); 
	void insertStudent(Student student); 
	int getStudentNoSeq(int majorNo); 
	Notice getNoticeByNoticeNo(int noticeNo); 
	void addNotice(Notice notice); 
	
	// RestController
	List<Student> searchStudents(Map<String, Object> searchOption ); 
	int searchStudentsCount(Map<String, Object> searchOption); 
	Student getStudentByNo(int studentNo); 
	void updateStudentStatusByNo(Student student); 
	List<Notice> getAllNotices(Map<String, Object> searchOption); 
	int getAllNoticesCount(); 
}
