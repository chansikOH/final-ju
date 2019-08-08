package kr.ac.ju.view;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import kr.ac.ju.vo.CoursePart;
import kr.ac.ju.vo.CoursePlan;

@Component
public class CoursePlanPdfView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// Model에 저장된 강의계획서 객체를 조회한다.
		CoursePlan coursePlan = (CoursePlan) model.get("coursePlan");
		CoursePart coursePart = (CoursePart) model.get("coursePart");

		// 응답컨텐츠가 PDF로 제공되도록 응답메세지의 헤더를 설정한다.
		response.setContentType("application/pdf");
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setHeader("Content-Disposition", "inline; filename=" + URLEncoder.encode("강의계획서.pdf", "utf-8")); 

		// PDF문서객체를 생성한다.
		Document document = new Document();
		PdfWriter.getInstance(document, response.getOutputStream());
		document.open();
		
		// 폰트를 정의한다.
		// 문서헤더 폰트, 제목 폰트, 데이터 폰트
		Font headerFont = new Font(getBaseFont(), 16);
		headerFont.setStyle(Font.BOLD);
		Font titleFont = new Font(getBaseFont(), 12);
		titleFont.setStyle(Font.BOLD);
		Font dataFont = new Font(getBaseFont(), 12);
		
		// 테이블의 정의한다.
		PdfPTable table = new PdfPTable(new float[] {1, 3, 1, 3});
		table.setWidthPercentage(100);
		
		// 테이블에 헤더제목칸을 추가한다.
		table.addCell(getHeaderCell("강의계획서", headerFont));
		
		// 테이블의 제목칸과 데이터칸(3칸짜리)을 추가한다.
		table.addCell(getTitleCell("과목명", titleFont));
		table.addCell(getDataCell(coursePlan.getCourse().getName(), dataFont, 3));
		
		table.addCell(getTitleCell("학과", titleFont));
		table.addCell(getDataCell(coursePlan.getCourse().getMajor().getName(), dataFont, 1));
		table.addCell(getTitleCell("담당교수", titleFont));
		table.addCell(getDataCell(coursePlan.getProfessor().getName(), dataFont, 1));
		
		table.addCell(getTitleCell("학습목표", titleFont));
		table.addCell(getDataCell(coursePlan.getGoal(), dataFont, 3));
		
		table.addCell(getTitleCell("강의개요", titleFont));
		table.addCell(getDataCell(coursePlan.getSummary(), dataFont, 3));

		document.add(table);
		document.close();
	}
	
	// 테이블의 헤더제목셀을 반환한다.
	private PdfPCell getHeaderCell(String headerTitle, Font font) {
		PdfPCell headerCell = new PdfPCell(new Phrase(headerTitle, font));
		headerCell.setColspan(4);
		headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
		headerCell.setPadding(10.0f);
		headerCell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		
		return headerCell;
	}
	
	// 테이블의 제목칸을 반환한다.
	private PdfPCell getTitleCell(String title, Font font) {
		PdfPCell cell = new PdfPCell(new Phrase(title, font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPadding(5.0f);
		cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
	
		return cell;
	}
	
	// 테이블의 데이터칸을 반환한다.
	private PdfPCell getDataCell(String data, Font font, int colspan) {
		PdfPCell cell = new PdfPCell(new Phrase(data, font));
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setPadding(5.0f);
		cell.setColspan(colspan);
	
		return cell;
	}
	
	// 한글처리를 위한 폰트를 가져온다.
	private BaseFont getBaseFont() throws DocumentException, IOException {
		String fontPath = ResourceUtils.getFile("classpath:/D2Coding.ttf").getAbsolutePath();
		BaseFont baseFont = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		return baseFont;
	}
}
