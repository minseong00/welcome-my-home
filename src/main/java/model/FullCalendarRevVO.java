package model;

import java.sql.Date;

public class FullCalendarRevVO {
	private int revNo = 0;
	private int roomNo = 0;
	private Date checkIn = null;
	private Date checkOut = null;
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
	public Date getcheckIn() {
		return checkIn;
	}
	public void setcheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getcheckOut() {
		return checkOut;
	}
	public void setcheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	
}

