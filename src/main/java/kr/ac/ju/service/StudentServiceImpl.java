package kr.ac.ju.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.StudentDao;
import kr.ac.ju.vo.Cla;
import kr.ac.ju.vo.ClassView;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;
import kr.ac.ju.websockethandler.CourseApplicantWebSocketHandler;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private CourseApplicantWebSocketHandler handler;
	
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
	public List<Course> getMinusCoursesByStudentNo(int studentNo) {
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("term", term);
		map.put("studentNo", studentNo);
		
		return studentDao.getMinusCoursesByStudentNo(map);
	}
	
	@Override
	public Course getCourseByCourseNo(int courseNo) {
		
		return studentDao.getCourseByCourseNo(courseNo);
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

	public Map<String, Object> getCoursedetailSource(int studentNo, int courseNo) {
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("courseNo", courseNo);
		
		List<Map<String, Object>> classInfos = studentDao.getCoursedetailSource(search);
		String courseName = (String) classInfos.get(0).get("COURSENAME");
		Integer courseAvg = studentDao.getAvgCourseView(search);
		List<Map<String, Object>> partInfos = studentDao.getPartInfos(search);
		
		Map<String, Object> sources = new HashMap<String, Object>();
		sources.put("classInfos", classInfos);
		sources.put("courseName", courseName);
		sources.put("courseAvg", courseAvg);
		sources.put("partInfos", partInfos);
		
		return sources;
	}
	
	public Student getStudentInfoByNo(int studentNo) {
		Student studentInfo = studentDao.getStudentInfoByNo(studentNo);
		
		return studentInfo;
	}
	
	@Override
	public List<StudentStatus> getStudentStatusByNo(int studentNo) {
		List<StudentStatus> status = studentDao.getStudentStatusByNo(studentNo);
		
		return status;
	}
	
	@Override
	public Map<String, Object> getCourseviewSource(int studentNo, int courseNo, int classNo) {
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("courseNo", courseNo);
		
		Map<String, Object> viewSearch = new HashMap<String, Object>();
		viewSearch.put("studentNo", studentNo);
		viewSearch.put("classNo", classNo);
		
		List<Map<String, Object>> classInfos = studentDao.getCoursedetailSource(search);
		String courseName = (String) classInfos.get(0).get("COURSENAME");
		Cla cla = studentDao.getClassByClassNo(classNo);
		ClassView classView = studentDao.getClassViewByStudentNoAndClassNo(viewSearch);
		
		Map<String, Object> sources = new HashMap<String, Object>();
		sources.put("classInfos", classInfos);
		sources.put("courseName", courseName);
		sources.put("cla", cla);
		sources.put("classView", classView);
		
		return sources;
	}

	public void updateMyPage(Student student) {
		studentDao.updateMyPage(student);
	}
		
	public void deleteStudentStatus(int statusNo) {
		studentDao.deleteStudentStatus(statusNo);
	}
	
	@Override
	public void insertStudentStatus(StudentStatus studentStatus) {
		studentDao.insertStudentStatus(studentStatus);
	}
	
	@Override
	public StudentStatus getStatusCheckByNo(Map<String, Object> map) {
		StudentStatus alreadyStatus = studentDao.getStatusCheckByNo(map);
		
		return alreadyStatus;
	}
	
	@Override
	public void insertCourseAttendsByStudentNo(CourseAttend courseAttend) {
		studentDao.insertCourseAttendsByStudentNo(courseAttend);
	}
	
	@Override
	public void updateCourseCount(int count, int courseNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("count", count);
		map.put("courseNo", courseNo);
		
		studentDao.updateCourseCount(map);
		System.out.println("service - count 증가!");
		
		Course course = studentDao.getCourseByCourseNo(courseNo);
		System.out.println("service - 전체 Course 반환");
		handler.noticeCourseApplicant(course);
		System.out.println("service - handler로 course 전달");
	}
	
	@Override
	public void deleteCourseAttendsByCourseNo(int studentNo, int courseNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("studentNo", studentNo);
		map.put("courseNo", courseNo);
		
		studentDao.deleteCourseAttendsByCourseNo(map);
	}
}
