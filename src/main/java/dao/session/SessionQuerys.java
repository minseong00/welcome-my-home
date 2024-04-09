package dao.session;

public interface SessionQuerys {
	String adminID="select adminid from admin where session adminid=?";
	String memID="select memid from member where session memid=?";
}
