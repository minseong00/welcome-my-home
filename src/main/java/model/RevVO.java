package model;

import java.sql.Date;
import java.sql.Timestamp;

public class RevVO {
	private int bookNo = 0;
	private Timestamp bookDate = null;
	private int roomNo = 0;
	private Date bookCheck = null;
	private Date bookCheckOut = null;
	private int headCount = 0;
	private int price = 0;
	private String memId = null;
	public RevVO() {
		
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public Timestamp getBookDate() {
		return bookDate;
	}
	public void setBookDate(Timestamp bookDate) {
		this.bookDate = bookDate;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public Date getBookCheck() {
		return bookCheck;
	}
	public void setBookCheck(Date bookCheck) {
		this.bookCheck = bookCheck;
	}
	public Date getBookCheckOut() {
		return bookCheckOut;
	}
	public void setBookCheckOut(Date bookCheckOut) {
		this.bookCheckOut = bookCheckOut;
	}
	public int getHeadCount() {
		return headCount;
	}
	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "RevVO [bookNo=" + bookNo + ", bookDate=" + bookDate + ", roomNo=" + roomNo + ", bookCheck=" + bookCheck
				+ ", bookCheckOut=" + bookCheckOut + ", headCount=" + headCount + ", price=" + price + ", memId="
				+ memId + "]";
	}
	

}
