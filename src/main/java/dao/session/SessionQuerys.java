package dao.session;

public interface SessionQuerys {
	String adminID="select adminId from admin where adminId = ?";
	String memID="select memId from member where memId = ?";
}
