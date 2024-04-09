package model;

public class RoomImgVO {
	private int roomNo;		// 방 번호
	private String img1;	// 방 사진1
	private String img2;	// 방 사진2
	private String img3;	// 방 사진3
	private String img4;	// 방 사진4
	private String img5;	// 방 사진5
	private String infoImg; // 방 정보 사진
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	public String getInfoImg() {
		return infoImg;
	}
	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}
	
	@Override
	public String toString() {
		return "RoomImgVO [roomNo=" + roomNo + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4
				+ ", img5=" + img5 + ", infoImg=" + infoImg + "]";
	}
	
	
}
