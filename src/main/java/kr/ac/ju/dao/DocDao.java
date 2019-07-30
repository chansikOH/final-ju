package kr.ac.ju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.ju.vo.Doc;

public interface DocDao {

	List<HashMap<String, Object>> getDocEmployeeByNo(int employeeNo);
}
