package dao.member;

public interface MemberQuerys {
	String memLogin="select memId, memPw from member where memId= ?";
	String memIDCheck="select memId from member where memId=?";
	String insertMem = "insert into member(memId, memCall, memName, memEmail, memPw) values(?, ?, ?, ?, ?)";
	String selectAll = "select * from member";
	String selectOne = "select * from member where memId = ?";
	String updateMem = "update member set memPw=?, memName=?, memCall=?, memEmail=? "
			+ "where memId= ?";
	String deleteMem = "delete from member where memId=?";
}
