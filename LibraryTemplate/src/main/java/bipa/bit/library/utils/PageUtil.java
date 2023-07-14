package bipa.bit.library.utils;

import java.util.ArrayList;
import java.util.Arrays;

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
	    int startIndex = (pageNo - 1) * pageSize;

	    for (int i = 0; i < pageSize; i++) {
	        if (startIndex + i >= totalCount) {
	            break;
	        }
	        returnList.add(list.get(startIndex + i));
	    }

	    int slicePage = (int) Math.ceil(totalPage / pageSizeDouble);
	    viewPages = new int[pageSize];
	    int[][] pages = new int[slicePage][pageSize];
	    int forCnt = 1;
	    int index = 0;
	    int pageIdx = 0;
	    for (int i = 0; i < pages.length; i++) {
	        for (int j = 0; j < pages[i].length; j++) {
	            if (forCnt > totalPage) {
	                break;
	            }
	            pages[i][j] = forCnt;
	            if (forCnt == pageNo) {
	                index = i;
	                pageIdx = j;
	            }
	            forCnt++;
	        }
	    }

	    viewPages = Arrays.copyOfRange(pages[index], 0, pageIdx + 1);

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
