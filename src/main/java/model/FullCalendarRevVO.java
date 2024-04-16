package model;

import java.sql.Date;

public class FullCalendarRevVO {
	private int bookNo = 0;
	private int roomNo = 0;
	private String roomName = null;
	private String bookCheck = null;
	private String bookCheckOut = null;
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
	
	public String getBookCheck() {
		return bookCheck;
	}

	public void setBookCheck(String bookCheck) {
		this.bookCheck = bookCheck;
	}

	public String getBookCheckOut() {
		return bookCheckOut;
	}

	public void setBookCheckOut(String bookCheckOut) {
		this.bookCheckOut = bookCheckOut;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "[bookNo : " + bookNo + ", roomNo=" + roomNo + ", bookCheck=" + bookCheck
				+ ", bookCheckOut=" + bookCheckOut + ", backgroundColor=" + backgroundColor + "]";
	}
	
}

