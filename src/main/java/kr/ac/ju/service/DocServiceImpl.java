package kr.ac.ju.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.DocDao;
import kr.ac.ju.vo.Doc;
import kr.ac.ju.vo.DocFile;
import kr.ac.ju.vo.DocLine;
import kr.ac.ju.vo.Draft;

@Service
public class DocServiceImpl implements DocService {

	@Autowired
	DocDao docDao;
	
	@Override
	public List<HashMap<String, Object>> getDocEmployeeByNo(int employeeNo) {
		
		return docDao.getDocEmployeeByNo(employeeNo);
	}


	@Override
	public void addDraft(Doc doc, Draft draft, List<DocLine> docLines, DocFile docfile) {
		int seq = docDao.getDocSeq();
		doc.setNo(String.valueOf(seq));
		docDao.insertDoc(doc);
	}
}
