package dao.member;

public interface MemberQuerys {
	String memID="select memId, memPw from member where memId= ?";
	String memCheck="select memid from member where memId=?";
	String insertMem = "insert into member(memid, memcall, memname, mememail, mempw) values(?, ?, ?, ?, ?)";
	String selectAll = "select * from member";
	String selectOne = "select * from member where memId = ?";
	String updateMem = "update member set memPw=?, memName=?, memCall=?, memEmail=? "
			+ "where memid= ?";
	String deleteMem = "delete from member where memId=?";
}
