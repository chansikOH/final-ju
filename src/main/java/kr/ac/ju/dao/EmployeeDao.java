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
	
	// RestController
	List<Student> searchStudents(Map<String, Object> searchOption ); 
	int searchStudentsCount(Map<String, Object> searchOption); 
}
