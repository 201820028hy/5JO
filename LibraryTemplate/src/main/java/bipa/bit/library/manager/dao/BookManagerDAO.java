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

import bipa.bit.library.book.vo.BookVO;

@Repository
public class BookManagerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertBook(BookVO book) {
		boolean flag = false;
		
//		StringBuilder infoSql = new StringBuilder("insert into book_info(book_isbn, book_title, book_author, book_publisher, book_published_date, book_content, book_category, book_img) ")
//				.append("values(?, ?, ?, ?, ?, ?, ?, ?);");
//		StringBuilder copySql = new StringBuilder("insert into book_copy(book_isbn) ")
//				.append("values(?);");
		
		return flag;
	}
	
	public ArrayList<BookVO> adminSelectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
//		StringBuilder infoSql = new StringBuilder("select * from book_info info join book_copy copy on info.book_isbn = copy.book_isbn;");
		
		list = (ArrayList) sqlSession.selectList("mapper.admin.book.adminSelectAllList");
		System.out.println(list);
		return list;
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
