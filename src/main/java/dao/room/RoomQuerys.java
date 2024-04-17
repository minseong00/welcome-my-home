package dao.room;

public interface RoomQuerys {
	String roomCount = "select count(roomNo) as total from room";
	String selectAll = "select * from room";
	String selectOne = "select * from room where roomNo = ?";
	String selectNN = "select roomNo, roomName from room";
	String selectFilterCountType = "select r.roomNo, r.roomName, r.headCount, r.roomCost, rev.checkIn, rev.checkOut " +
					"from room as r left join reservation as rev ON r.roomNo = rev.roomNo " + 
					"where r.headCount >= (? - 2) and r.roomType = ?";
	String selectFilterCount = "select r.roomNo, r.roomName, r.headCount, r.roomCost, rev.checkIn, rev.checkOut " +
			"from room as r left join reservation as rev ON r.roomNo = rev.roomNo " + 
			"where r.headCount >= ? - 2";
	String deleteOne = "delete from room where roomNo = ?";
	String insertData = "insert into room (roomName, roomType, roomDetail, headCount, roomCost) "
			+ "values (?, ?, ?, ?, ?)";
	String update = "update room set roomName = ?, roomType = ?, roomDetail=?, headCount = ?, roomCost = ? where roomNo = ?";
	String selectType = "select * from room where roomType = ? ";
}
