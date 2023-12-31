package bipa.bit.library.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bipa.bit.library.book.dao.BookDAO;
import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.book.vo.CommentVO;

@Service
public class BookService {
	@Autowired
	private BookDAO dao;

	public ArrayList<BookVO> selectAllList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();

		list = dao.selectAllList();

		return list;
	}

	public ArrayList<CommentVO> searchBookComment(String parseInt) {
		ArrayList<CommentVO> list = null;

		list = dao.selectBookComment(Integer.parseInt(parseInt));

		return list;
	}

	public boolean registComment(CommentVO comment) {
		boolean flag = false;

		flag = dao.insertComment(comment);

		return flag;

	}

	public CommentVO getPW(String userId) {
		CommentVO pw = null;

		pw = dao.getPassword(userId);

		return pw;
	}

	public void delete(String cmtSeq) {
		dao.deleteComment(cmtSeq);
	}

	public void update(String userId, String comment_intro_new) {
		dao.updateComment(userId, comment_intro_new);
	}

}
