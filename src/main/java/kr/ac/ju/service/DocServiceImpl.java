package kr.ac.ju.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.DocDao;

@Service
public class DocServiceImpl implements DocService {

	@Autowired
	DocDao docDao;
	
	@Override
	public List<HashMap<String, Object>> getDocEmployeeByNo(int employeeNo) {
		
		return docDao.getDocEmployeeByNo(employeeNo);
	}


}
