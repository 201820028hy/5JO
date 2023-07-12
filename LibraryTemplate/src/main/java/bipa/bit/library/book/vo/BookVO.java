package bipa.bit.library.book.vo;

import java.sql.Timestamp;

public class BookVO {
	private int bookSeq;
	private String bookIsbn;
	private String bookTitle;
	private String bookAuthor;
	private Timestamp bookPublishDate;
	private String bookPublisher;
	private String bookContent;
	private String bookCategory;
	private String bookImg;
	
	private int bookLike;
	private int bookDlike;
	private int bookStar;
	private int bookStartCnt;
	
	public BookVO(int bookSeq, String bookIsbn, String bookTitle, String bookAuthor, Timestamp bookPublishDate,
			String bookPublisher, String bookContent, String bookCategory, String bookImg, int bookLike, int bookDlike,
			int bookStar, int bookStartCnt) {
		super();
		this.bookSeq = bookSeq;
		this.bookIsbn = bookIsbn;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;
		this.bookPublishDate = bookPublishDate;
		this.bookPublisher = bookPublisher;
		this.bookContent = bookContent;
		this.bookCategory = bookCategory;
		this.bookImg = bookImg;
		this.bookLike = bookLike;
		this.bookDlike = bookDlike;
		this.bookStar = bookStar;
		this.bookStartCnt = bookStartCnt;
	}
	
	public int getBookSeq() {
		return bookSeq;
	}
	public String getBookIsbn() {
		return bookIsbn;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public Timestamp getBookPublishDate() {
		return bookPublishDate;
	}
	public String getBookContent() {
		return bookContent;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public String getBookImg() {
		return bookImg;
	}
	public int getBookLike() {
		return bookLike;
	}
	public int getBookDlike() {
		return bookDlike;
	}
	public int getBookStar() {
		return bookStar;
	}
	public int getBookStartCnt() {
		return bookStartCnt;
	}
	
	
}
