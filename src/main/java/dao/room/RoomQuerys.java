package dao.room;

public interface RoomQuerys {
	String roomCount = "select count(roomNo) as total from roomNo";
	String selectAll = "select * from roomNo";
	String selectOne = "select from roomNo where roomNo = ?";
	String deleteOne = "delete from roomNo where roomNo = ?";
}
