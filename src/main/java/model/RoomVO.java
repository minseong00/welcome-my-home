package model;

public class RoomVO {
	/* 방 번호 */
	private int roomNo;
	/* 방 이름 */
	private String roomName;
	/* 방 타입 */
	private String roomType;
	/* 방 가격 */
	private int roomCost;
	
	public RoomVO() {
	}

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

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoomCost() {
		return roomCost;
	}

	public void setRoomCost(int roomCost) {
		this.roomCost = roomCost;
	}

	@Override
	public String toString() {
		return "RoomVO [roomNo=" + roomNo + ", roomName=" + roomName + ", roomType=" + roomType + ", roomCost="
				+ roomCost + "]";
	}

	
}
