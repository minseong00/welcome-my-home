package dao.reservation;

public interface RevQuerys {
	String revCount = "select count(revNo) as total from reservation";
	String selectAll = "select * from reservation";
	String selectOne = "select * from reservation where revNo = ?";
	String selectRoomRev = "select revDate, checkIn, checkOut from reservation where roomNo = ?";
	String deleteRev = "delete from reservation where revNo = ?";
	String insertRev = "insert into reservation " + 
			"(revDate, roomNo, checkIn, checkOut, headCount, price, memId) " +
			"values (?, ?, ?, ?, ?, ?, ?)";
	String selectTableList = "select r.roomNo, r.roomName, r.roomType, rev.revNo, rev.revDate, " +
			"rev.checkIn, rev.checkOut, rev.headCount, rev.price, rev.memId " +
			"from reservation as rev " +
			"inner join room as r on rev.roomNo = r.roomNo";
	String selectTableOne = "select r.roomNo, r.roomName, rev.revNo, rev.revDate, " +
			"rev.checkIn, rev.checkOut, rev.headCount, rev.price " +
			"from reservation as rev " +
			"inner join room as r on rev.roomNo = r.roomNo " +
			"where rev.memId = ?";
	String updateRev = "update reservation set " +
			"checkIn = ? , checkOut = ? , headCount = ? , price = ? " +
			"where revNo = ?";
}
