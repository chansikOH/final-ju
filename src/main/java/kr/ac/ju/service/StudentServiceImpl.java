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
import kr.ac.ju.vo.Notice;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.StudentStatus;
import kr.ac.ju.websockethandler.CourseApplicantWebSocketHandler;

@Service
public class StudentServiceImpl implements StudentService {

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
		if (nowMonth >= 3 && nowMonth <= 8) {
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

	/*
	 * 작성자 : 오찬식
	 * 설명 : 현재 연도 및 학기에 특정 학생이 수강하는 모든 교과목들을 제공하는 메소드
	 */
	@Override
	public List<Course> getAllCoursesWithProfessorAndMajorByStudentNo(int studentNo) {
		int year = 0;
		int term = 0;

		// 현재 시간의 연도와 월을 따로 추출
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat currentYear = new SimpleDateFormat("yyyy");
		SimpleDateFormat currentMonth = new SimpleDateFormat("MM");

		// 현재 연도를 정의
		year = Integer.parseInt(currentYear.format(new Date(currentTime)));

		// 현재 월이 3~8월이면 1학기, 1,2,9~12월이면 2학기로 정의 
		int nowMonth = Integer.parseInt(currentMonth.format(new Date(currentTime)));
		if (nowMonth >= 3 && nowMonth <= 8) {
			term = 1;
		} else if ((nowMonth >= 1 && nowMonth <= 2) || (nowMonth >= 9 && nowMonth <= 12)) {
			term = 2;
		}

		// 쿼리문에 parameterType으로 보낼 맵을 정의하고 특정 학생번호, 연도, 학기를 맵에 주입
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("year", year);
		search.put("term", term);

		// 생성된 맵을 매개변수로 하여 뽑은 교과목들을 반환
		return studentDao.getAllCoursesWithProfessorAndMajorByStudentNo(search);
	}

	/*
	 * 작성자 : 오찬식
	 * 설명 : 현재 연도 및 학기에 특정 학생이 수강하는 모든 교과목의 수를 제공하는 메소드
	 */
	@Override
	public Integer countCurrentCoursesByStudentNo(int studentNo) {
		int year = 0;
		int term = 0;

		// 현재 시간의 연도와 월을 따로 추출
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat currentYear = new SimpleDateFormat("yyyy");
		SimpleDateFormat currentMonth = new SimpleDateFormat("MM");

		// 현재 연도를 정의
		year = Integer.parseInt(currentYear.format(new Date(currentTime)));

		// 현재 월이 3~8월이면 1학기, 1,2,9~12월이면 2학기로 정의
		int nowMonth = Integer.parseInt(currentMonth.format(new Date(currentTime)));
		if (nowMonth >= 3 && nowMonth <= 8) {
			term = 1;
		} else if ((nowMonth >= 1 && nowMonth <= 2) || (nowMonth >= 9 && nowMonth <= 12)) {
			term = 2;
		}

		// 쿼리문에 parameterType으로 보낼 맵을 정의하고 특정 학생번호, 연도, 학기를 맵에 주입
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("year", year);
		search.put("term", term);

		// 생성된 맵을 매개변수로 하여 뽑은 숫자를 반환
		return studentDao.countCurrentCoursesByStudentNo(search);
	}

	public List<CourseAttend> getCoursesByStudentNoAndYearTerm(Map<String, Object> maps) {
		List<CourseAttend> courseAttends = studentDao.getCoursesByStudentNoAndYearTerm(maps);

		return courseAttends;
	}

	public List<Map<String, Object>> getAllRecordesByStudentNo(int studentNo) {
		int year = 0;
		int term = 0;

		long currentTime = System.currentTimeMillis();
		SimpleDateFormat currentYear = new SimpleDateFormat("yyyy");
		SimpleDateFormat currentMonth = new SimpleDateFormat("MM");

		year = Integer.parseInt(currentYear.format(new Date(currentTime)));

		int nowMonth = Integer.parseInt(currentMonth.format(new Date(currentTime)));
		if (nowMonth >= 3 && nowMonth <= 8) {
			term = 1;
		} else if ((nowMonth >= 1 && nowMonth <= 2) || (nowMonth >= 9 && nowMonth <= 12)) {
			term = 2;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studentNo", studentNo);
		map.put("year", year);
		map.put("term", term);
				
		return studentDao.getAllRecordesByStudentNo(map);
	}

	/*
	 * 작성자 : 오찬식
	 * 설명 : coursedetail 페이지에 제공될 정보들(교과정보들, 교과목이름, 평균 진행도, 단원정보들)을 제공하는 메소드
	 */
	@Override
	public Map<String, Object> getCoursedetailSource(int studentNo, int courseNo) {
		// parameterType으로 보낼 맵을 정의하고 특정학생과 특정교과목번호를 주입
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("courseNo", courseNo);

		// 위에 정의된 맵을 매개변수로 하여 뽑힌 교과목정보 맵객체를 자료형으로 삼는 리스트 객체 정의
		List<Map<String, Object>> classInfos = studentDao.getCoursedetailSource(search);
		// 교과목 이름 정의
		String courseName = studentDao.getCourseByCourseNo(courseNo).getName();
		// 교과목의 평균 진행도를 담는 변수 정의 
		Integer courseAvg = studentDao.getAvgCourseView(search);
		if(courseAvg == null) {
			courseAvg = 0;
		}
		// 단원 정보가 담긴 맵객체를 자료형으로 삼는 리스트 객체 정의
		List<Map<String, Object>> partInfos = studentDao.getPartInfos(search);

		// 위에 정의된 정보들을 모두 담을 하나의 맵객체를 정의하고 주입
		Map<String, Object> sources = new HashMap<String, Object>();
		sources.put("classInfos", classInfos);
		sources.put("courseName", courseName);
		sources.put("courseAvg", courseAvg);
		sources.put("partInfos", partInfos);

		// 위에 정의된 맵객체 반환
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

	/*
	 * 작성자 : 오찬식
	 * 설명 : courseview 페이지에 제공될 정보들(교과목정보들, 교과목이름, 강의정보, 강의시청정보)을 제공하는 메소드
	 */
	@Override
	public Map<String, Object> getCourseviewSource(int studentNo, int courseNo, int classNo) {
		// 강의정보들을 뽑는 쿼리문에 parameterType으로 보낼 맵을 정의하고 특정학생과 특정교과목번호를 주입
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("studentNo", studentNo);
		search.put("courseNo", courseNo);
		
		// 강의시청정보를 뽑는 쿼리문에 parameterType으로 보낼 맵을 정의하고 특정학생과 특정강의번호를 주입
		Map<String, Object> viewSearch = new HashMap<String, Object>();
		viewSearch.put("studentNo", studentNo);
		viewSearch.put("classNo", classNo);

		// 교과목정보들이 담긴 맵객체를 자료형으로 삼는 리스트 객체 정의
		List<Map<String, Object>> classInfos = studentDao.getCoursedetailSource(search);
		// 교과목 이름 정의
		String courseName = studentDao.getCourseByCourseNo(courseNo).getName();
		// 특정 강의번호로 뽑힌 강의정보를 정의
		Cla cla = studentDao.getClassByClassNo(classNo);
		// 특정 학생번호와 교과목번호로 뽑힌 강의시청정보를 정의
		ClassView classView = studentDao.getClassViewByStudentNoAndClassNo(viewSearch);

		// 위에 정의된 정보들을 모두 담을 하나의 맵객체를 정의하고 주입
		Map<String, Object> sources = new HashMap<String, Object>();
		sources.put("classInfos", classInfos);
		sources.put("courseName", courseName);
		sources.put("cla", cla);
		sources.put("classView", classView);

		// 위에 정의된 맵객체 반환
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

		Course course = studentDao.getCourseByCourseNo(courseNo);
		handler.noticeCourseApplicant(course);
	}

	@Override
	public void deleteCourseAttendsByCourseNo(int studentNo, int courseNo) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("studentNo", studentNo);
		map.put("courseNo", courseNo);

		studentDao.deleteCourseAttendsByCourseNo(map);
	}

	/*
	 * 작성자 : 오찬식
	 * 설명 : 강의시청정보를 수정하는 메소드
	 */
	@Override
	public void updateClassView(int viewNo, String currentTime, int percentage) {
		// 강의시청번호로 뽑힌 강의시청정보를 정의
		ClassView classView = studentDao.getClassViewByClassViewNo(viewNo);
		// 변경할 컬럼 변경
		classView.setTime(currentTime);
		classView.setStatusYn("Y");
		classView.setPercentage(percentage);

		// 강의시청정보를 수정
		studentDao.updateClassView(classView);
	}

	@Override
	public Student getLeaveStudentByNo(int studentNo) {
		Student leaveStudent = studentDao.getLeaveStudentByNo(studentNo);

		return leaveStudent;
	}
	
	@Override
	public List<Notice> getAllNotices() {
		return studentDao.getAllNotices();
	}
	
	@Override
	public Notice getNoticeByNoticeNo(int noticeNo) {
		return studentDao.getNoticeByNoticeNo(noticeNo);
	}
	
}
