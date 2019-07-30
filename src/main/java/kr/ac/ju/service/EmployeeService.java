package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Student;

public interface EmployeeService {

	// Controller
	List<Major> getAllMajors(); 
	
	// RestController
	List<Student> searchStudents(Map<String, Object> searchOption ); 
	int searchStudentsCount(Map<String, Object> searchOption); 
	Student getStudentByNo(int studentNo); 
	void updateStudentStatusByNo(Student student); 
}
