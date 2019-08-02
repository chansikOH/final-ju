package kr.ac.ju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;

public interface DocDao {

	List<HashMap<String, Object>> getDocEmployeeByNo(int employeeNo);
	
	Doc getdocs(int no);
	
	void insertDoc(Doc doc);
	void insertDraft(Draft draft);
	void insertDocLine(DocLine docLine);
	void insertDocfiles(DocFile docFile);
	
	int getDocSeq();
	List<Employee> getAllEmployees();

}
