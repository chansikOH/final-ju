package kr.ac.ju.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.ac.ju.test.ExcelRead;
import kr.ac.ju.test.ReadOption;

public class BoardServiceImpl implements BoardService {
	@Override
	public void insertMassiveArticleInBoard(File destFile) {

		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A", "B", "C", "D");
		readOption.setStartRow(2);

		List<Map<String, String>> excelContent = ExcelRead.read(readOption);

//		BoardVO boardVO = null;
//		for (Map<String, String> article : excelContent) {
//
//			boardVO = new BoardVO();
//			boardVO.setSubject(article.get("A"));
//			boardVO.setContent(article.get("B"));
//			boardVO.setUserId(article.get("C"));
//			boardVO.setFileName(article.get("D"));
//
//			this.insertArticleInBoard(boardVO);
//		}
	}
}
