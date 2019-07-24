package kr.ac.ju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.EmployeeDao;
import kr.ac.ju.dao.ProfessorDao;
import kr.ac.ju.dao.StudentDao;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Person;
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
	
	@Override
	public Person getPersonByNo(int no) {
		Student student = studentDao.getStudentByNo(no);
		if(student != null) {
			student.setGubun("학생");
			
			return student;
		}
		
		Professor professor = professorDao.getProfessorByNo(no);
		if(professor != null) {
			professor.setGubun("교수");
			
			return professor;
		}
		
		Employee employee = employeeDao.getEmployeeByNo(no);
		if(employee != null) {
			employee.setGubun("직원");
			
			return employee;
		}
		
		return null;
	}
}
