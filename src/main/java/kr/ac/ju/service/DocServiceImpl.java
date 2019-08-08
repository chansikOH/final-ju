package kr.ac.ju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.DocDao;
import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;
import kr.ac.ju.vo.Employee;
import kr.ac.ju.vo.Person;
import kr.ac.ju.vo.Retire;
import kr.ac.ju.vo.Vacation;

@Service
public class DocServiceImpl implements DocService {

	@Autowired
	DocDao docDao;
	
	@Override
	public List<Map<String, Object>> getDocEmployeeByNo(int employeeNo) {
		
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
			
			Person person = new Person();
			DocLine docLine = new DocLine();
			
			docLine.setDoc(d);
			person.setNo(no);
			docLine.setPerson(person);
			
			docDao.insertDocLine(docLine);
			
		}
		
		System.out.println(docfile);
		if(docfile != null) {
			docfile.setDoc(d);
			docDao.insertDocfile(docfile);
		}
	}
		@Override
		public List<Employee> getAllEmployees() {
			List<Employee> employees = docDao.getAllEmployees();
			return employees; 
	}

		@Override
		public void addRetire(Doc doc, Draft draft, Retire retire, List<Integer> nons, DocFile docfile) {
			int seq = docDao.getDocSeq();
			doc.setNo(String.valueOf(seq));
			docDao.insertDoc(doc);
			
			Doc o = docDao.getdocs(seq);
			
			retire.setDoc(o);
			
			docDao.insertRetire(retire);
			for(Integer no : nons) {
				
				Person person = new Person();
				DocLine docLine = new DocLine();
				
				docLine.setDoc(o);
				person.setNo(no);
				docLine.setPerson(person);
				
				docDao.insertDocLine(docLine);
			}
			
			if(docfile != null) {
				
				docfile.setDoc(o);
				docDao.insertDocfile(docfile);
			}
		}

		@Override
		public void addVacation(Doc doc, Vacation vacation, List<Integer> non, DocFile docfile) {
			int seq = docDao.getDocSeq();
			doc.setNo(String.valueOf(seq));
			docDao.insertDoc(doc);
			Doc c = docDao.getdocs(seq);
			
			vacation.setDoc(c);
			docDao.insertVacation(vacation);
			for(Integer no : non) {
				
				Person person = new Person();
				DocLine docLine = new DocLine();
				
				docLine.setDoc(c);
				person.setNo(no);
				docLine.setPerson(person);

				docDao.insertDocLine(docLine);
			}
			
			if(docfile != null) {
				
				docfile.setDoc(c);
				docDao.insertDocfile(docfile);
			}
		}
		
		@Override
		public Map<String, Object> getDraftByNo(Integer draftNo) {
			
			return docDao.getDraftByNo(draftNo);
		}

		@Override
		public Map<String, Object> getRetireByNo(Integer retireNo) {
			
			return docDao.getRetireByNo(retireNo);
		}

		@Override
		public Map<String, Object> getVacationByNo(Integer vacationNo) {
			
			return docDao.getVacationByNo(vacationNo);
		}
	
		@Override
		public void updateDraft(Draft draft) {
			docDao.updateDraft(draft);
		}

		@Override
		public void updateVacation(Vacation vacation) {
			docDao.updateVacation(vacation);
		}

		@Override
		public void updateRetire(Retire retire) {
			docDao.updateRetire(retire);
		}


		
}