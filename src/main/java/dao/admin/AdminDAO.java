package dao.admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;
import com.sun.jdi.connect.spi.Connection;

import dao.connection.MySQLConnector;
import model.AdminVO;

public class AdminDAO implements AdminQuerys  {
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
		String pw = null;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(adminID);
			pstmt.setString(1, admin.getAdmin_id());
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("admin_id");
				pw = rs.getString("admin_pw");
				if(admin.getAdmin_id().equals(id) && admin.getAdmin_pwd().equals(pw)) 
					result = true;
				else
					result = false;
			}else {
				result = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		}
		
	return result;	
	}
	
	/**
	 * admin ID 중복 처리
	 **/
	public boolean overlappedID(String id) {
		boolean result = false;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(adminID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			result = rs.next();	// 결과에서 다음행이 존재하면 ID 중복 존재
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		}
		return result;
	}

}
