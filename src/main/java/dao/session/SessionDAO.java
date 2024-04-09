package dao.session;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.connection.MySQLConnector;
import model.SessionVO;

public class SessionDAO implements SessionQuerys {
	private Connection conn = null;
	private MySQLConnector DB = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public SessionDAO() {
		DB = new MySQLConnector();
	}

	/**
	 * session 처리
	 **/
	public String loginCheck(SessionVO session) {
		String result = null;
		String id = null;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(adminID);
			pstmt.setString(1, session.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("admin_id");
				if(session.getId().equals(id)) 
					result = "admin";
			}
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(memID);
			pstmt.setString(1, session.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				if(session.getId().equals(id)) 
					result = "mem";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		DB.close(rs, pstmt, conn);
		}
		return result;
	}

}