package dao.member;

public interface MemberQuerys {
	String selectAll = "select * from myhome";
	String memID="select * from myhome where mem_id=?";
	String insertMem = "insert into myhome values(?, ?, ?, ?, ?)";
	String updateMem = "update myhome set pwd=?, name=?, phone=?, email=?,"
			+ "where id= ?";
}
