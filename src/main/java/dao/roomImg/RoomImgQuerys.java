package dao.roomImg;

public interface RoomImgQuerys {
	String selectOne = "select * from roomImg where roomNo = ?";
	String updateOne = "update roomImg set img1 = ? img2 = ? img3 = ? img4 = ? img5 = ? infoImg = ? where roomNo = ?";
}
