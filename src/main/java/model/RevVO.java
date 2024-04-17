package model;

import java.sql.Date;
import java.sql.Timestamp;

public class RevVO {
	private int revNo = 0;
	private Timestamp revDate = null;
	private int roomNo = 0;
	private Date checkIn = null;
	private Date checkOut = null;
	private String roomName = null;
	private String roomType = null;
	private int headCount = 0;
	private int price = 0;
	private String memId = null;
	public RevVO() {
		
	}
	public int getRevNo() {
		return revNo;
	}
	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}
	public Timestamp getRevDate() {
		return revDate;
	}
	public void setRevDate(Timestamp revDate) {
		this.revDate = revDate;
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
	@Override
	public String toString() {
		return "RevVO [revNo=" + revNo + ", revDate=" + revDate + ", roomNo=" + roomNo + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", roomName=" + roomName + ", roomType=" + roomType + ", headCount="
				+ headCount + ", price=" + price + ", memId=" + memId + "]";
	}
	
	

	

}
