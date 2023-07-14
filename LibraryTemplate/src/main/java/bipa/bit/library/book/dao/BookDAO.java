package bipa.bit.library.book.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.book.vo.CommentVO;

@Repository
public class BookDAO {

	@Autowired
	private SqlSession sqlSession;
	// private DataSource data;

	public ArrayList<BookVO> selectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();

		list = (ArrayList) sqlSession.selectList("mapper.book.selectAllList");
		System.out.println(list);

		return list;
	}

	public ArrayList<CommentVO> selectBookComment(int parseInt) {
		ArrayList<CommentVO> list = null;
		list = (ArrayList) sqlSession.selectList("mapper.comment.selectCommentBySeq", parseInt);
		return list;
	}

	public boolean insertComment(CommentVO comment) {
		boolean flag = false;

		int result = sqlSession.insert("mapper.comment.insertComment", comment);
		if (result > 0) {
			flag = true;
		}

		return flag;
	}

	public CommentVO getPassword(String userId) {
		CommentVO result = null;
		System.out.println(userId);
		result = sqlSession.selectOne("mapper.comment.userPassword", userId);
		System.out.println(result);
		return result;
	}

	public void deleteComment(String cmtSeq) {
		
		sqlSession.delete("mapper.comment.delete", cmtSeq);
	}

	public void updateComment(String userId, String comment_intro_new) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("item2", userId);
		map.put("item3", comment_intro_new);
		System.out.println(map);

		sqlSession.update("mapper.comment.update", map);
	}

}
