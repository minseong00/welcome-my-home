package model;

import java.sql.Date;
import java.sql.Timestamp;

public class RevVO {
	private int revNo = 0;
	private Timestamp revDate = null;
	private int roomNo = 0;
	private Date checkIn = null;
	private Date checkOut = null;
	private int headCount = 0;
	private int price = 0;
	private String memId = null;
	public RevVO() {
		
	}
	public int getrevNo() {
		return revNo;
	}
	public void setrevNo(int revNo) {
		this.revNo = revNo;
	}
	public Timestamp getrevDate() {
		return revDate;
	}
	public void setrevDate(Timestamp revDate) {
		this.revDate = revDate;
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
		return "RevVO [revNo=" + revNo + ", revDate=" + revDate + ", roomNo=" + roomNo + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", headCount=" + headCount + ", price=" + price + ", memId="
				+ memId + "]";
	}

}
