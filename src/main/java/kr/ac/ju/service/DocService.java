package kr.ac.ju.service;

import java.util.HashMap;
import java.util.List;

public interface DocService {
	List<HashMap<String, Object>> getDocEmployeeByNo(int employeeNo);
}
