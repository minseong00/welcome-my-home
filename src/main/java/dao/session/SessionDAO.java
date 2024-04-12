package dao.session;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.connection.MySQLConnector;

public class SessionDAO implements SessionQuerys {
	private Connection conn = null;
	private MySQLConnector DB = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public SessionDAO() {
		DB = new MySQLConnector();
	}

	/**
	 * 관리자, 멤버 확인
	 **/
	public String loginCheck(String _id) {
		String result = null;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(adminID);
			pstmt.setString(1, _id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					result = "admin";
			} else {
				pstmt = conn.prepareStatement(memID);
				pstmt.setString(1, _id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = "member";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		}
		return result;
	}
	
}