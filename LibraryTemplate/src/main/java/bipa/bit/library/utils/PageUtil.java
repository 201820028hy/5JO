package bipa.bit.library.utils;

import java.util.ArrayList;

import bipa.bit.library.book.vo.BookVO;

public class PageUtil {
	private static PageUtil page;
	private int pageNo;
	private int pageSize;
	private int[] viewPages;
	private int totalCount;
	private int totalPage;
	private ArrayList<BookVO> list = new ArrayList<BookVO>();
	private ArrayList<BookVO> returnList = new ArrayList<BookVO>();
	
	private PageUtil(int pageNo, int pageSize, ArrayList<BookVO> list) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = list.size();
		this.list = list;
	}

	public static PageUtil getInstance(int pageNo, int pageSize, ArrayList<BookVO> list) {
		page = new PageUtil(pageNo, pageSize, list);
		return page;
	}
	
	public ArrayList<BookVO> calculatorPage() {
		Double totalCountDouble = (double) totalCount;
		Double pageSizeDouble = (double) pageSize;
		totalPage = (int) Math.ceil(totalCountDouble / pageSizeDouble);
		int startIndex = pageNo-1;
		
		for(int i = 0; i < pageSize; i++) {
			if(((startIndex*pageSize) + i) == totalCount) {
				break;
			}
			returnList.add(list.get((startIndex*pageSize) + i));
		}
		
		
		int slicePage = (int) Math.ceil(totalPage / pageSizeDouble);
		viewPages = new int[pageSize];
		int[][] pages = new int[slicePage][pageSize];
		int forCnt = 1;
		int index = 0;
		for(int i = 1; i <= pages.length; i++) {
			for(int j = 1; j <= pages[i-1].length; j++) {
				if(forCnt > totalPage) break;
				pages[i-1][j-1] = forCnt;
				if(forCnt == pageNo) {
					index = i-1;
				}
				forCnt++;
			}
		}
		
		viewPages = pages[index];
		
		return returnList;
	}
	
	public ArrayList<BookVO> getReturnList() {
		return returnList;
	}

	public int[] getViewPages() {
		return viewPages;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}
}
