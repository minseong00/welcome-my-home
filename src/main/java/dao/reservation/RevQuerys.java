package dao.reservation;

public interface RevQuerys {
	String revCount = "select count(bookNo) as total from reservation";
	String selectAll = "select * from reservation";
	String selectOne = "select * from reservation where bookNo = ?";
	String selectRoomRev = "select bookCheck, bookCheckOut from reservation where roomNo = ?";
	String selectMyRev = "select * from reservation where memId = ?";
	String deleteRev = "delete from reservation where bookNo = ?";
	String insertRev = "insert into reservation " + 
			"(bookDate, roomNo, bookCheck, bookCheckOut, headCount, price, memId) " +
			"values (?, ?, ?, ?, ?, ?, ?)";
	String updateRev = "update reservation set " +
			"bookCheck = ? , bookCheckOut = ? , headCount = ? , price = ? " +
			"where bookNo = ?";
}
