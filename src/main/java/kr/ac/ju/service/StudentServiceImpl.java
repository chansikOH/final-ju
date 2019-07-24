package kr.ac.ju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.StudentDao;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao studentDao;
	
	@Override
	public List<Course> getYearTermsByStudentNo(int studentNo) {
		List<Course> courses = studentDao.getYearTermsByStudentNo(studentNo);
		
		return courses;
	}
	
	@Override
	public List<CourseAttend> getAllCoursesByStudentNo(int studentNo) {
		List<CourseAttend> courseAttends = studentDao.getAllCoursesByStudentNo(studentNo);
		
		return courseAttends;
	}
}
