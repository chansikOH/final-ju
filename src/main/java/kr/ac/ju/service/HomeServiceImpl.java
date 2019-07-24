package kr.ac.ju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.EmployeeDao;
import kr.ac.ju.dao.ProfessorDao;
import kr.ac.ju.dao.StudentDao;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Professor;
import kr.ac.ju.vo.Student;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private ProfessorDao professorDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
}
