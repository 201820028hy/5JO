package bipa.bit.library.manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bipa.bit.library.book.vo.BookVO;

@Repository
public class BookManagerDAO {
	
	@Autowired
	private DataSource data;
	
	public boolean insertBook(BookVO book) {
		boolean flag = false;
		
		StringBuilder infoSql = new StringBuilder("insert into book_info(book_isbn, book_title, book_author, book_publisher, book_published_date, book_content, book_category, book_img) ")
				.append("values(?, ?, ?, ?, ?, ?, ?, ?);");
		StringBuilder copySql = new StringBuilder("insert into book_copy(book_isbn) ")
				.append("values(?);");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			int insertCnt = 0;
			con = data.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(infoSql.toString());
			pstmt.setString(1, book.getBookIsbn());
			pstmt.setString(2, book.getBookTitle());
			pstmt.setString(3, book.getBookAuthor());
			pstmt.setString(4, book.getBookPublisher());
			pstmt.setTimestamp(5, book.getBookPublishDate());
			pstmt.setString(6, book.getBookContent());
			pstmt.setString(7, book.getBookCategory());
			pstmt.setString(8, book.getBookImg());
			insertCnt += pstmt.executeUpdate();
			
			pstmt = con.prepareStatement(copySql.toString());
			pstmt.setString(1, book.getBookIsbn());
			insertCnt += pstmt.executeUpdate();
			
			if(insertCnt > 2) {
				con.commit();
				flag = true;
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			closeConnection(null, pstmt, con);
		}
		
		return flag;
	}
	
	private void closeConnection(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
