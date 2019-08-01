package kr.ac.ju.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.DocDao;
import kr.ac.ju.form.DocForm;
import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Person;

@Service
public class DocServiceImpl implements DocService {

	@Autowired
	DocDao docDao;
	
	@Override
	public List<HashMap<String, Object>> getDocEmployeeByNo(int employeeNo) {
		
		return docDao.getDocEmployeeByNo(employeeNo);
	}

	@Override
	public void addDraft(Doc doc, Draft draft, List<Integer> nos, DocFile docfile) {
		int seq = docDao.getDocSeq();
		doc.setNo(String.valueOf(seq));
		docDao.insertDoc(doc);
		
		Doc d = docDao.getdocs(seq);
		
		draft.setDoc(d);
		
		docDao.insertDraft(draft);
		for(Integer no  :nos) {
			
			DocLine docLine = new DocLine();
			Person person = new Person();
			
			docLine.setDoc(d);
			person.setNo(no);
			docLine.setPerson(person);
			
			System.out.println("ddddddd" + d.getNo());
			System.out.println("no" + no);
			docDao.insertDocLine(docLine);
		}
			
		/*
		 * for(DocFile name : docfile) {
		 * 
		 * docDao.insertDocfiles(docfile); }
		 */
	}

	@Override
	public List<Employee> getAllEmployees() {
		List<Employee> employees = docDao.getAllEmployees();
		return employees; 
	}
}
