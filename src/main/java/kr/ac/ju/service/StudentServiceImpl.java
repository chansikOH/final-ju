package kr.ac.ju.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.StudentDao;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;

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
	
	@Override
	public List<Course> getAllCoursesWithProfessorAndMajorByStudentNo(int studentNo) {
		int year = 0;
		int term = 0;
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat currentYear = new SimpleDateFormat("yyyy");
		SimpleDateFormat currentMonth = new SimpleDateFormat("MM");
		
		year = Integer.parseInt(currentYear.format(new Date(currentTime)));
		
		int nowMonth = Integer.parseInt(currentMonth.format(new Date(currentTime)));
		if(nowMonth >= 3 && nowMonth <= 8) {
			term = 1;
		} else if ((nowMonth >= 1 && nowMonth <= 2) || (nowMonth >= 9 && nowMonth <= 12)) {
			term = 2;
		}
		
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("year", year);
		search.put("term", term);
		
		return studentDao.getAllCoursesWithProfessorAndMajorByStudentNo(search);
	}
	
	@Override
	public Integer countCurrentCoursesByStudentNo(int studentNo) {
		int year = 0;
		int term = 0;
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat currentYear = new SimpleDateFormat("yyyy");
		SimpleDateFormat currentMonth = new SimpleDateFormat("MM");
		
		year = Integer.parseInt(currentYear.format(new Date(currentTime)));
		
		int nowMonth = Integer.parseInt(currentMonth.format(new Date(currentTime)));
		if(nowMonth >= 3 && nowMonth <= 8) {
			term = 1;
		} else if ((nowMonth >= 1 && nowMonth <= 2) || (nowMonth >= 9 && nowMonth <= 12)) {
			term = 2;
		}
		
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("year", year);
		search.put("term", term);
		
		return studentDao.countCurrentCoursesByStudentNo(search);
	}
	
	public List<CourseAttend> getCoursesByStudentNoAndYearTerm(Map<String, Object> maps) {
		List<CourseAttend> courseAttends = studentDao.getCoursesByStudentNoAndYearTerm(maps);
		
		return courseAttends;
	}
	
	public List<Map<String, Object>> getAllRecordesByStudentNo(Map<String, Object> map) {
		List<Map<String, Object>> records = studentDao.getAllRecordesByStudentNo(map);
		
		return records;
	}
	
	@Override
	public Student getStudentInfoByNo(int studentNo) {
		Student studentInfo = studentDao.getStudentInfoByNo(studentNo);
		
		return studentInfo;
	}
	
	@Override
	public List<StudentStatus> getStudentStatusByNo(int studentNo) {
		List<StudentStatus> status = studentDao.getStudentStatusByNo(studentNo);
		
		return status;
	}
}
