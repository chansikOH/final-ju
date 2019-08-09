package kr.ac.ju.vo;

public class Pagination {
	private int page;		// 현재 페이지번호				
	private int size;		// 한 화면에 표시할 데이터 갯수
	private int pages;		// 한 화면에 표시할 페이지 번호 갯수
	private int records;	// 검색결과와 일치하는 총 데이터 건수

	private int totalPages;			// 총 데이터 건수로 계산한 총 페이지 개수
	private int totalBlocks;		// 총 페이지 갯수로 계산한 총 블록 갯수
	private int currentBlock;		// 현재 페이지번호에 해당하는 블록번호 -> 페이지번호들 표시에 사용

	public Pagination(int page, int records) {   
		this.page = page;
		this.size = 10;
		this.pages = 10;
		this.records = records;
		init();
	}

	public Pagination(int page, int size, int records) {   
		this.page = page;
		this.size = size;
		this.pages = 10;
		this.records = records;
		init();
	}

	public Pagination(int page, int size, int pages, int records) {   
		this.page = page;
		this.size = size;
		this.pages = pages;
		this.records = records;
		init();
	}
	
	// 현재 페이지에서 페이지되는 항목의 시작번호를 제공한다.
	public int getIndex() {
		return (getPage() - 1) * size + 1;
	}
      
	//현재 페이지 번호 
	public int getPage() {
		return page;
	}

	// 첫 페이지 여부  page 1이면 true
	public boolean isFirst() {
		if (page == 1) {
			return true;
		}
		return false;
	}

	// 마지막 페이지 여부  page == totalPages true
	public boolean isLast() {
		if (page == totalPages) {
			return true;
		}
		return false;
	}

	// 시작 페이지 번호 -> 현재 페이지 블록의 시작페이지 번호
	public int getBegin() {
		if (records <= 0) {
			return 0;
		}

		if (currentBlock >= totalBlocks) {
			currentBlock = totalBlocks;
		}
		return (currentBlock - 1) * pages + 1;
	}

	// 끝 페이지 번호 
	public int getEnd() {
		if (records <= 0) {
			return 0;
		}
		if (currentBlock >= totalBlocks) {
			return totalPages;
		}
		return currentBlock*pages;
	}

	private void init() {
		if (page <= 0) {
			page = 1;
		}
		totalPages = (int) (Math.ceil((double) records/size));
		if (page >= totalPages) {
			page = totalPages;
		}
		totalBlocks = (int) (Math.ceil((double) totalPages/pages));
		currentBlock = (int) (Math.ceil((double) page/pages));
	}
}