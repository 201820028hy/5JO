package bipa.bit.library.book.vo;

import java.sql.Timestamp;

public class CommentVO {
	private int cmt_seq;
	private int book_seq;
	private String cmt_cntn;
	private String user_id;
	private String pwd;
	private Timestamp input_dt;
	
	public CommentVO(int cmt_seq, int book_seq, String cmt_cntn, String user_id, String pwd, Timestamp input_dt) {
		super();
		this.cmt_seq = cmt_seq;
		this.book_seq = book_seq;
		this.cmt_cntn = cmt_cntn;
		this.user_id = user_id;
		this.pwd = pwd;
		this.input_dt = input_dt;
	}
	
	public int getCmt_seq() {
		return cmt_seq;
	}
	public int getBook_seq() {
		return book_seq;
	}
	public String getCmt_cntn() {
		return cmt_cntn;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getPwd() {
		return pwd;
	}
	public Timestamp getInput_dt() {
		return input_dt;
	}
	
	
}
