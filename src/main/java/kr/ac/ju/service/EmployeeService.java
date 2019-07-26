package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Student;

public interface EmployeeService {

	List<Major> getAllMajors(); 
	List<Student> searchStudents(Map<String, Object> searchOption ); 
}
