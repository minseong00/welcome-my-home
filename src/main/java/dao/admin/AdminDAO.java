package dao.admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.connection.MySQLConnector;
import model.AdminVO;
import model.MemVO;

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
				id = rs.getString("adminId");
				pw = rs.getString("adminPw");
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
		boolean result = true;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(adminID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			result = rs.next();	// 결과에서 다음행이 존재하면 ID 중복 존재
			System.out.println("result admin : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		}
		return result;
	}

}
