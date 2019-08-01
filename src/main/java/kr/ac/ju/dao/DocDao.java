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
	void insertDoc(Doc doc);
	void docs(Doc docs);
	void insertDraft(Draft draft);
	void insertDocLine(List<DocLine> docLines);
	void insertDocfiles(DocFile docFile);
	int getDocSeq();
	List<Employee> getAllEmployees();

}
