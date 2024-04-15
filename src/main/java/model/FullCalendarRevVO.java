package model;

import java.sql.Date;

public class FullCalendarRevVO {
	private int bookNo = 0;
	private int roomNo = 0;
	private Date bookCheck = null;
	private Date bookCheckOut = null;
	private String backgroundColor = null;
	
	public FullCalendarRevVO() {
	}
		
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
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

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	
}

