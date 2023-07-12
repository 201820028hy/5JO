package bipa.bit.library.book.dao;
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
public class BookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	//private DataSource data;
	
	public ArrayList<BookVO> selectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		StringBuilder infoSql = new StringBuilder("select * from book_info info join book_copy copy on info.book_isbn = copy.book_isbn;");
		
		list = (ArrayList) sqlSession.selectList("mapper.book.selectAllList");
		System.out.println(list);
//		Connection con = null; SqlSession 사용으로 커넥션부터 끝까지 작업이 자동화 됐다
//		PreparedStatement pstmt = null;
//		try {
//			con = data.getConnection();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			try {
//				con.setAutoCommit(true);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			closeConnection(null, pstmt, con);
//		}
		
		return list;
	}
	
//	private void closeConnection(ResultSet rs, PreparedStatement pstmt, Connection con) {
//		if(rs != null) {
//			try {
//				rs.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		
//		if(pstmt != null) {
//			try {
//				pstmt.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		
//		if(con != null) {
//			try {
//				con.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//	}
	
}
