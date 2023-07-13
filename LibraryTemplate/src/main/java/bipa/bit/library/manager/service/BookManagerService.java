package bipa.bit.library.manager.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.manager.dao.BookManagerDAO;

@Service
public class BookManagerService {
	@Autowired
	private BookManagerDAO dao;
	
	public ArrayList<BookVO> asdminSelectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		
		list = dao.adminSelectAllList();
		
		return list;
	}
	
	/* 혜윤 개발 시작 */
	public ArrayList<String> selectAllCategorys() {
		ArrayList<String> list = new ArrayList<String>();
		
		list = dao.selectAllCategorys();
		
		return list;
	}
	
	public BookVO detailBook(int bookSeq, String bookIsbn) {
		BookVO book = new BookVO();
		
		book = dao.selectBookByBookSeq(bookSeq, bookIsbn);
		
		return book;
	}
	
	public boolean registBook(BookVO book) {
		boolean flag = false;
		int cnt = dao.insertBook(book);
		
		flag = cnt >= 2 ? true : false;
		
		return flag;
	}
	
	public boolean updateBook(BookVO book) {
		boolean flag = false;
		int cnt = dao.updateBook(book);
		
		flag = cnt >= 1 ? true : false;
		
		return flag;
	}
}
