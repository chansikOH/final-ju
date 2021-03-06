package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.EmployeeDao;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Notice;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;

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
	
	@Override
	public Student getStudentByNo(int studentNo) {
		return employeedao.getStudentByNo(studentNo); 
	}
	
	@Override
	public void updateStudentStatusByNo(Student student) {
		employeedao.updateStudentStatusByNo(student); 
	}
	
	@Override
	public void insertStudent(Student student) {
		int studentNo = employeedao.getStudentNoSeq(student.getMajor().getNo());
		student.setNo(studentNo);
		
		employeedao.insertStudent(student);
	}
	
	@Override
	public int getStudentNoSeq(int majorNo) {
		return employeedao.getStudentNoSeq(majorNo);
	}
	
	@Override
	public List<Notice> getAllNotices(Map<String, Object> searchOption) {
		return employeedao.getAllNotices(searchOption); 
	}
	
	@Override
	public Notice getNoticeByNoticeNo(int noticeNo) {
		return employeedao.getNoticeByNoticeNo(noticeNo); 
	}
	
	@Override
	public int getAllNoticesCount(Map<String, Object> searchOption) {
		return employeedao.getAllNoticesCount(searchOption); 
	}
	
	@Override
	public void addNotice(Notice notice) {
		employeedao.addNotice(notice); 
	}
	
	@Override
	public List<Student> getStudentStatus(Map<String, Object> searchOption) {
		return employeedao.getStudentStatus(searchOption);
	}
	
	@Override
	public int getStudentStatusCount(Map<String, Object> searchOption) {
		return employeedao.getStudentStatusCount(searchOption); 
	}
	
	@Override
	public String getStatusChangeReaseon(int statusNo) {
		return employeedao.getStatusChangeReaseon(statusNo); 
	}
	
	@Override
	public void chanageStudentStatusPassyn(int statusNo) {
		employeedao.chanageStudentStatusPassyn(statusNo);
	}
	
	@Override
	public List<Student> getStudentsStatistic(int year) {
		return employeedao.getStudentsStatistic(year); 
	}
	
	
}
