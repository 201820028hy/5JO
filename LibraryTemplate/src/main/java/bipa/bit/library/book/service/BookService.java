package bipa.bit.library.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bipa.bit.library.book.dao.BookDAO;
import bipa.bit.library.book.vo.BookVO;

@Service
public class BookService {
	@Autowired
	private BookDAO dao;
	
	public ArrayList<BookVO> selectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		
		list = dao.selectAllList();
		
		return list;
	}
}
