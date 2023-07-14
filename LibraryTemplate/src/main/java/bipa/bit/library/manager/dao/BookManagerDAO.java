package bipa.bit.library.manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import bipa.bit.library.book.vo.BookVO;

@Repository
public class BookManagerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<BookVO> adminSelectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		
		list = (ArrayList) sqlSession.selectList("mapper.admin.book.adminSelectAllList");
		
		return list;
	}
	
	/*혜윤 개발 시작*/
	public ArrayList<String> selectAllCategorys() {
		ArrayList<String> list = new ArrayList<String>();

		list = (ArrayList) sqlSession.selectList("mapper.admin.book.selectAllCategorys");

		return list;
	}
	
	public BookVO selectBookByBookSeq(int bookSeq) {
		BookVO book = new BookVO();
		
		book = sqlSession.selectOne("mapper.admin.book.selectBookByBookSeq", bookSeq);
		
		return book;
	}
	
	public BookVO selectBookByBookIsbn(String bookIsbn) {
		BookVO book = new BookVO();
		
		book = sqlSession.selectOne("mapper.admin.book.selectBookByBookIsbn", bookIsbn);
		
		return book;
	}
	
	@Transactional
	public int insertBook(BookVO book) {
		int cnt = 0;
		
		cnt += sqlSession.insert("mapper.admin.book.insertBookInfo", book);
		cnt += sqlSession.insert("mapper.admin.book.insertBookCopy", book);
		
		return cnt;
	}
	
	@Transactional
	public int updateBook(BookVO book) {
		int cnt = 0;
		
		cnt += sqlSession.update("mapper.admin.book.updateBookInfo", book);
		
		return cnt;
	}
	
	public int updateBookStar(BookVO book) {
		int cnt = 0;
		
		cnt += sqlSession.update("mapper.admin.book.updateBookStar", book);
		
		return cnt;
	}
	

	
	public int updateBookLike(int bookSeq) {
		int cnt = 0;
		
		cnt += sqlSession.update("mapper.admin.book.updateBookLike", bookSeq);
		
		return cnt;
	}
	
	public int updateBookDlike(int bookSeq) {
		int cnt = 0;
		
		cnt += sqlSession.update("mapper.admin.book.updateBookDlike", bookSeq);
		
		return cnt;
	}
	
	public boolean deleteBook(int parseInt, String parseString) {
	    boolean flag = false;
	    
	    int affectedCount1 = sqlSession.delete("mapper.admin.book.adminDeleteCopy", parseInt);
	    
	    if (affectedCount1 > 0) { // affectedCount1이 실행되었는지 확인
	        int affectedCount2 = sqlSession.delete("mapper.admin.book.adminDeleteInfo", parseString);
	        
	        if (affectedCount2 > 0) { // affectedCount2가 실행되었는지 확인
	            flag = true;
	        }
	    }
	    
	    return flag;
	}

}
