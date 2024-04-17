package model;

import java.sql.Date;

public class FullCalendarRevVO {
	private int revNo = 0;
	private int roomNo = 0;
	private String checkIn = null;
	private String checkOut = null;
	private String roomName = null;
	private String roomType = null;
	private String backgroundColor = null;
	
	public FullCalendarRevVO() {
	}
		
	public int getRevNo() {
		return revNo;
	}
	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
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

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	
}

