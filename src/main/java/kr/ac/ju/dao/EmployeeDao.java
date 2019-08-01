package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Student;

public interface EmployeeDao {

	Employee getEmployeeByNo(int employeeNo);
	
	// Controller
	List<Major> getAllMajors(); 
	void insertStudent(Student student); 
	
	// RestController
	List<Student> searchStudents(Map<String, Object> searchOption ); 
	int searchStudentsCount(Map<String, Object> searchOption); 
	Student getStudentByNo(int studentNo); 
	void updateStudentStatusByNo(Student student); 
}
