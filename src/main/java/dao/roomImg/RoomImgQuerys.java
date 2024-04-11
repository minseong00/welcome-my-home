package dao.roomImg;

public interface RoomImgQuerys {
	String selectAll = "select * from roomImg";
	String selectImg = "select * from roomImg where roomNo = ?";
	String updateImg = "update roomImg set img1 = ? img2 = ? img3 = ? img4 = ? img5 = ? infoImg = ? where roomNo = ?";
	String insertImg = "insert into roomImg values (?, ?, ?, ?, ?, ?, ?)";
	String deleteImg = "delete from roomImg where roomNo = ?";
}
