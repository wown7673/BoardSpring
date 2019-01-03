package kr.co.BoardSpring.common.to;

import java.util.List;
import java.util.Map;

public class PageInfo {
	// 기본세팅
	private int page = 1;


	private int perRowSize = 10;
	private int perPageSize = 10;

	 // 총게시글수
	private int totalCnt = 0;
	private int totalPageCnt = 0;
 
	 // 계산된값
	private int startRow = 0;
	private int endRow = 0;
    
	private int startPage = 0;
	private int endPage = 0;
	
	
	private boolean prev;
	private boolean next;
	
	private List<Map<String,Object>> list;
	
	public List<Map<String, Object>> getList() {
		return list;
	}


	public void setList(List<Map<String, Object>> list) {
		this.list = list;
	}

	
	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}

	public int getStartPage() {
		return startPage;
	}


	public int getEndPage() {
		return endPage;
	}
	
	
	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}








	public PageInfo(int page, int totalCnt) {
		this.page = page;
		this.totalCnt = totalCnt;
		totalPageCnt = (totalCnt-1)/perRowSize+1;
		
		startRow = (page-1)*perRowSize+1;
		endRow = startRow + perRowSize -1;
		if(endRow>totalCnt) {
			endRow = totalCnt;
		}
		
		
		randerPage();
		
	}
	
	/*private boolean prev;
	private boolean next;
	
	private boolean first;
	private boolean end;*/
	
	public void randerPage() {
		startPage = page - ((page-1)%perPageSize);
		endPage = startPage + perPageSize -1;
		if(endPage > totalPageCnt) {
			endPage = totalPageCnt;
		}
		
		prev = startPage == 1 ? false:true;
		next = endPage < totalPageCnt ? true : false;	
		
	}
	

	
	
	

	
	
	public int getStartRow() {
		// TODO Auto-generated method stub
		return startRow;
	}

	public int getEndRow() {
		// TODO Auto-generated method stub
		return endRow;
	}
}
