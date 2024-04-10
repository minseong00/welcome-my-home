package dao.member;

public interface MemberQuerys {
	String memID="select * from member where memId=?";
	String memCheck="select id from member where memId=?";
	String insertMem = "insert into member values(?, ?, ?, ?, ?)";
	String selectAll = "select * from member";
	String selectOne = "select memNo, memId, memPw, memName, memCall, memEmail from member where memId=?";
	String updateMem = "update member set memPw=?, memName=?, memCall=?, memEmail=?,"
			+ "where id= ?";
	String deleteMem = "delete from member where memId=?";
}
