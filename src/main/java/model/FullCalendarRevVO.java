package model;

import java.sql.Date;

public class FullCalendarRevVO {
	private int revNo = 0;
	private int roomNo = 0;
	private Date checkIn = null;
	private Date checkOut = null;
	private String roomName = null;
	private String backgroundColor = null;
	
	public FullCalendarRevVO() {
	}
		
	public int getrevNo() {
		return revNo;
	}
	public void setrevNo(int revNo) {
		this.revNo = revNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
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

