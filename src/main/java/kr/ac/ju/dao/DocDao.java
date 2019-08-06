package kr.ac.ju.dao;

import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Retire;
import kr.ac.ju.vo.Vacation;

public interface DocDao {

	List<Map<String, Object>> getDocEmployeeByNo(int employeeNo);
	Doc getdocs(int no);
	
	void insertDoc(Doc doc);
	void insertDraft(Draft draft);
	void insertDocLine(DocLine docLine);
	void insertDocfile(DocFile docFile);
	void insertRetire(Retire retire);
	void insertVacation(Vacation vacation);
	
	void updateDraft(Draft draft);
	void updateVacation(Vacation vacation);
	void updateRetire(Retire retire);
	
	Draft getDraftByNo(int draftNo);
	Retire getRetireByNo(int retireNo);
	Vacation getVacationByNo(int vacationNo);
	
	int getDocSeq();
	List<Employee> getAllEmployees();
	
}