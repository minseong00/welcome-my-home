package model;

import java.sql.Date;

public class OptionVO {
	private int roomNo;
	private String roomType;
	private int headCount;
	private int roomCost;
	private Date checkIn;
	private Date checkOut;
	private String img1;
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
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
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	@Override
	public String toString() {
		return "OptionVO [roomNo=" + roomNo + ", roomType=" + roomType + ", headCount=" + headCount + ", roomCost="
				+ roomCost + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", img1=" + img1 + "]";
	}
	
	
}
