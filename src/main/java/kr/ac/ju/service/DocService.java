package kr.ac.ju.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;

public interface DocService {
	List<HashMap<String, Object>> getDocEmployeeByNo(int employeeNo);

	void addDraft(Doc doc, Draft draft, List<Integer> nos, DocFile docfile);
	
	List<Employee> getAllEmployees();
}
