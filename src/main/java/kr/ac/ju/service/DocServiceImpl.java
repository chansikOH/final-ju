package kr.ac.ju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ju.dao.DocDao;

@Service
public class DocServiceImpl implements DocService {

	@Autowired
	private DocDao docDao;

}
