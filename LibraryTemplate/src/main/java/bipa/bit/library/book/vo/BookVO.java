package bipa.bit.library.book.vo;

import java.sql.Date;

public class BookVO {
	private int bookSeq;
	private String bookIsbn;
	private String bookTitle;
	private String bookAuthor;
	private Date bookPublishDate;
	private String bookPublisher;
	private String bookContent;
	private String bookCategory;
	private String bookImg;
	
	private int bookLike;
	private int bookDlike;
	private double bookStar;
	private int bookStartCnt;
	
	public BookVO(int bookSeq, String bookIsbn, String bookTitle, String bookAuthor, Date bookPublishDate,
			String bookPublisher, String bookContent, String bookCategory, String bookImg, int bookLike, int bookDlike,
			double bookStar, int bookStartCnt) {
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
	public BookVO() {}
	
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
	public Date getBookPublishDate() {
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
	public double getBookStar() {
		return bookStar;
	}
	public int getBookStartCnt() {
		return bookStartCnt;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public void setBookIsbn(String bookIsbn) {
		this.bookIsbn = bookIsbn;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public void setBookPublishDate(Date bookPublishDate) {
		this.bookPublishDate = bookPublishDate;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}
	public void setBookLike(int bookLike) {
		this.bookLike = bookLike;
	}
	public void setBookDlike(int bookDlike) {
		this.bookDlike = bookDlike;
	}
	public void setBookStar(double bookStar) {
		this.bookStar = bookStar;
	}
	public void setBookStartCnt(int bookStartCnt) {
		this.bookStartCnt = bookStartCnt;
	}
	@Override
	public String toString() {
		return "BookVO [bookSeq=" + bookSeq + ", bookIsbn=" + bookIsbn + ", bookTitle=" + bookTitle + ", bookAuthor="
				+ bookAuthor + ", bookPublishDate=" + bookPublishDate + ", bookPublisher=" + bookPublisher
				+ ", bookContent=" + bookContent + ", bookCategory=" + bookCategory + ", bookImg=" + bookImg
				+ ", bookLike=" + bookLike + ", bookDlike=" + bookDlike + ", bookStar=" + bookStar + ", bookStartCnt="
				+ bookStartCnt + "]";
	}
	
	
}
