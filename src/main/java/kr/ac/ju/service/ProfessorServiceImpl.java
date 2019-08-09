package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.ProfessorDao;
import kr.ac.ju.vo.Cla;
import kr.ac.ju.vo.Course;
import kr.ac.ju.vo.CourseAttend;
import kr.ac.ju.vo.CourseOpinion;
import kr.ac.ju.vo.CoursePart;
import kr.ac.ju.vo.CoursePlan;
import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Professor;
import kr.ac.ju.vo.Student;
import kr.ac.ju.vo.Test;
import kr.ac.ju.vo.TestResults;

@Service
public class ProfessorServiceImpl implements ProfessorService{

	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public Professor getProfessorByNo(int professorNo) {
		
		return professorDao.getProfessorByNo(professorNo);
	}

	@Override
	public List<Course> getAllClassByProfId(int professorNo) {
		
		return professorDao.getAllClassByProfId(professorNo);
	}

	@Override
	public int getAllClassCount(int professorNo) {
		
		return professorDao.getAllClassCount(professorNo);
	}

	@Override
	public List<CoursePart> getCoursePartByCourseNo(int courseNo) {

		return professorDao.getCoursePartByCourseNo(courseNo);
	}

	@Override
	public Course getCourseByCourseNo(int courseNo) {
		
		return professorDao.getCourseByCourseNo(courseNo);
	}
	@Override
	public List<Course> getYearByProfessorNo(int professorNo) {
		return professorDao.getYearByProfessorNo(professorNo);
	}

	@Override
	public List<Course> getMajorByProfessorNo(int professorNo) {
		return professorDao.getMajorByProfessorNo(professorNo);
	}

	@Override
	public List<Course> searchByOptions(Map<String, Object> param) {
		return professorDao.searchByOptions(param);
	}
	@Override
	public int getRows(Map<String, Object> param) {
		return professorDao.getRows(param);
	}

	@Override
	public void addTest(Test test) {
		professorDao.addTest(test);
	}
	
	@Override
	public void addVideo(Cla cla) {
		professorDao.addVideo(cla);
	}

	@Override
	public void addCoursePlanAndParts(CoursePlan coursePlan, List<CoursePart> parts) {
		professorDao.addCoursePlan(coursePlan);
		
		for(CoursePart part : parts) {
			professorDao.addCoursePart(part);
		}
	}
	@Override
	public Major getMajor(int profNo) {
		return professorDao.getMajor(profNo);
	}
	@Override
	public void addCourse(Course course) {
		professorDao.addCourse(course);
	}
	
	@Override
	public void updateCourse(Course course) {
		professorDao.updateCourse(course);
	}
	@Override
	public void deleteCourse(int courseNo) {
		professorDao.deleteCourse(courseNo);
	}
	
	@Override
	public List<Course> getTermClassByProfId(Map<String, Object> param) {
		return professorDao.getTermClassByProfId(param);
	}
	
	@Override
	public List<Map<String, Object>> getStudentsByCourseNo(int courseNo) {
		return professorDao.getStudentsByCourseNo(courseNo);
	}
	
	@Override
	public void updateRecordByCourseNoAndStudNo(List<CourseAttend> attends) {
		for(CourseAttend attend:attends) {
			professorDao.updateRecordByCourseNoAndStudNo(attend);
		}
	}
	@Override
	public List<CourseOpinion> getOpinionByProfId(Map<String, Object> param) {
		return professorDao.getOpinionByProfId(param);
	}
	@Override
	public List<Course> getOpCourseByProfId(Map<String, Object> param) {
		return professorDao.getOpCourseByProfId(param);
	}
}
