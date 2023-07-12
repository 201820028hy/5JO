package bipa.bit.library.manager.service;

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
}
