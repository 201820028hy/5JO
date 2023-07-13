package bipa.bit.library.book.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentVO {
	private int cmt_seq;
	private int book_seq;
	private String cmt_cntn;
	private String user_id;
	private String pwd;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
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
	
	public CommentVO() {}
	
	
	
	
	
	public int getCmt_seq() {
		return cmt_seq;
	}

	public void setCmt_seq(int cmt_seq) {
		this.cmt_seq = cmt_seq;
	}

	public int getBook_seq() {
		return book_seq;
	}

	public void setBook_seq(int book_seq) {
		this.book_seq = book_seq;
	}

	public String getCmt_cntn() {
		return cmt_cntn;
	}

	public void setCmt_cntn(String cmt_cntn) {
		this.cmt_cntn = cmt_cntn;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Timestamp getInput_dt() {
		return input_dt;
	}

	public void setInput_dt(Timestamp input_dt) {
		this.input_dt = input_dt;
	}

	@Override
	public String toString() {
		return "CommentVO [cmt_seq=" + cmt_seq + ", book_seq=" + book_seq + ", cmt_cntn=" + cmt_cntn + ", user_id="
				+ user_id + ", pwd=" + pwd + ", input_dt=" + input_dt + "]";
	}
	
	
	
}
