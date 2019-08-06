package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Notice;
import kr.ac.ju.vo.Student;

public interface EmployeeService {

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
	int getAllNoticesCount(Map<String, Object> searchOption); 
	List<Student> getStudentStatus(Map<String, Object> searchOption);
	int getStudentStatusCount(Map<String, Object> searchOption);
}
