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
	
	public boolean registBook(BookVO book) {
		boolean flag = false;
		flag = dao.insertBook(book);
		
		return flag;
	}
	
	public ArrayList<BookVO> asdminSelectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		
		list = dao.adminSelectAllList();
		
		return list;
	}
	
    public boolean removeBook(String bookSeq, String bookIsbn) {
        boolean flag = false;
        flag = dao.deleteBook(Integer.parseInt(bookSeq), bookIsbn);
        return flag;
    }
}
