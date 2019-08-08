package kr.ac.ju.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import kr.ac.ju.vo.Question;

public class ExcelRead {
	
	public List<Question> xlsToQuestionList(String filePath) {
		List<Question> questions = new ArrayList<Question>();

		FileInputStream fis = null;
		HSSFWorkbook workbook = null;

		try {
			fis = new FileInputStream(filePath);
			// 엑세파일 전체 내용을 담고 있는 객체
			workbook = new HSSFWorkbook(fis);

			// 탐색에 사용한 Sheet, Row, Cell 객체
			HSSFSheet curSheet;
			HSSFRow curRow;

			// Sheet 검색
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 Sheet
				curSheet = workbook.getSheetAt(sheetIndex);
				int rowSize = curSheet.getLastRowNum();
				for (int i=1; i<=rowSize; i++) {
					curRow = curSheet.getRow(i);
					
					int qno = (int)curRow.getCell(0).getNumericCellValue();
					String question = curRow.getCell(1).getStringCellValue();
					String ex1 = curRow.getCell(2).getStringCellValue();
					String ex2 = curRow.getCell(3).getStringCellValue();
					String ex3 = curRow.getCell(4).getStringCellValue();
					String ex4 = curRow.getCell(5).getStringCellValue();
					int answer = (int)curRow.getCell(6).getNumericCellValue();
					
					Question q = new Question();
					q.setNo(qno);
					q.setQuestion(question);
					q.setExample1(ex1);
					q.setExample2(ex2);
					q.setExample3(ex3);
					q.setExample4(ex4);
					q.setAnswer(answer);
					
					questions.add(q);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				// 사용한 자원 해제
				if(workbook != null) {
					workbook.close();
				}
				
				if(fis != null) {
					fis.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}

		return questions;
	}
	
	public List<Question> xlsxToQuestionList(String filePath) {
		List<Question> questions = new ArrayList<Question>();
		
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try {
			fis = new FileInputStream(filePath);
			// 엑세파일 전체 내용을 담고 있는 객체
			workbook = new XSSFWorkbook(fis);
			
			// 탐색에 사용한 Sheet, Row, Cell 객체
			XSSFSheet curSheet;
			XSSFRow curRow;
			
			// Sheet 검색
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 Sheet
				curSheet = workbook.getSheetAt(sheetIndex);
				int rowSize = curSheet.getLastRowNum();
				for (int i=1; i<=rowSize; i++) {
					curRow = curSheet.getRow(i);
					
					int qno = (int)curRow.getCell(0).getNumericCellValue();
					String question = curRow.getCell(1).getStringCellValue();
					String ex1 = curRow.getCell(2).getStringCellValue();
					String ex2 = curRow.getCell(3).getStringCellValue();
					String ex3 = curRow.getCell(4).getStringCellValue();
					String ex4 = curRow.getCell(5).getStringCellValue();
					int answer = (int)curRow.getCell(6).getNumericCellValue();
					
					Question q = new Question();
					q.setNo(qno);
					q.setQuestion(question);
					q.setExample1(ex1);
					q.setExample2(ex2);
					q.setExample3(ex3);
					q.setExample4(ex4);
					q.setAnswer(answer);
					
					questions.add(q);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				// 사용한 자원 해제
				if(workbook != null) {
					workbook.close();
				}
				
				if(fis != null) {
					fis.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return questions;
	}
}
