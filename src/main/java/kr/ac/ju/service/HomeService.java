package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Department;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Message;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Professor;
import kr.ac.ju.vo.Student;

public interface HomeService {
	
	Person getPersonByNo(int no);

	void insertMessage(Map<String, Object> map);
	List<Message> getReceiveMessageByNo(int receiver);
	List<Message> getCallMessageByNo(int caller);
	void deleteMessage(int no);
	List<Major> getAllMajors();
	List<Department> getAllDepartments();
	List<Employee> getEmployeeByDeptNo(String id);
	List<Professor> getProfessorByMajorNo(int no);
	List<Student> getStudentByMajorNo(int no);
}
