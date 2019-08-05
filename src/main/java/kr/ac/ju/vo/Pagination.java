package kr.ac.ju.vo;

public class Pagination {
	private int page;				
	private int size;	
	private int pages;	
	private int records;	

	private int totalPages;			
	private int totalBlocks;			
	private int currentBlock;		

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
	
	public int getIndex() {
		return (getPage() - 1) * size + 1;
	}
      
	//현재 페이지 번호 
	public int getPage() {
		return page;
	}

	// 첫 페이지 여부 
	public boolean isFirst() {
		if (page == 1) {
			return true;
		}
		return false;
	}

	// 마지막 페이지 여부 
	public boolean isLast() {
		if (page == totalPages) {
			return true;
		}
		return false;
	}

	// 시작 페이지 번호 
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