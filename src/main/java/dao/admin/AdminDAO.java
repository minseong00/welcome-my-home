package dao.admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;
import com.sun.jdi.connect.spi.Connection;

import dao.connection.MySQLConnector;
import model.AdminVO;

public class AdminDAO {
	private MySQLConnector DB = null;
	private java.sql.Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public AdminDAO() {
		DB = new MySQLConnector();
	}

	/**
	 * admin 로그인 처리
	 **/
	public boolean adminLogin(AdminVO admin) {
		boolean result = false;
		String id = null;
		String pwd = null;
		
		try {
			conn = DB.dbConnect();
			//pstmt = conn.prepareStatement(adminID);
			pstmt.setString(1, admin.getAdmin_id());
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("admin_id");
				pwd = rs.getString("admin_pw");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		}
		
	return (Boolean) null;	
	}


}
