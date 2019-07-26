package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.EmployeeDao;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Student;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao employeedao;
	
	@Override
	public List<Major> getAllMajors() {
		return employeedao.getAllMajors();
	}
	
	@Override
	public List<Student> searchStudents(Map<String, Object> searchOption) {
		return employeedao.searchStudents(searchOption);
	}
	
	@Override
	public int searchStudentsCount(Map<String, Object> searchOption) {
		return employeedao.searchStudentsCount(searchOption); 
	}
}
