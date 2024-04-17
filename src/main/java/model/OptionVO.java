package model;

import java.sql.Date;

public class OptionVO {
	private int roomNo = 0;
	private String roomName = null;
	private int headCount = 0;
	private int roomCost = 0;
	private Date checkIn = null;
	private Date checkOut = null;
	private String img1 = null;
	
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getHeadCount() {
		return headCount;
	}
	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}
	public int getRoomCost() {
		return roomCost;
	}
	public void setRoomCost(int roomCost) {
		this.roomCost = roomCost;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
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
	
	
	@Override
	public String toString() {
		return "OptionVO [roomNo=" + roomNo + ", roomName=" + roomName + ", headCount=" + headCount + ", roomCost="
				+ roomCost + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", img1=" + img1 + "]";
	}
	
	
	
	
	
	
}
