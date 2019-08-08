package kr.ac.ju.service;

import java.util.Map;
import java.util.List;

import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Retire;
import kr.ac.ju.vo.Vacation;

public interface DocService {
	List<Map<String, Object>> getDocEmployeeByNo(int employeeNo);

	void addDraft(Doc doc, Draft draft, List<Integer> nos, DocFile docfile);
	void addRetire(Doc doc, Draft draft, Retire retire, List<Integer> nons , DocFile docfile );
	void addVacation(Doc doc, Vacation vacation, List<Integer> non, DocFile docfile);
	
	void updateDraft(Draft draft);
	void updateVacation(Vacation vacation);
	void updateRetire(Retire retire);
	
	Map<String, Object> getDraftByNo(Integer draftNo);
	Map<String, Object> getRetireByNo(Integer retireNo);
	Map<String, Object> getVacationByNo(Integer vacationNo);
	
	List<Employee> getAllEmployees();


}
