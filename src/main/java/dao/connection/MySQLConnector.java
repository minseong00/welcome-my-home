package dao.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQLConnector {
	private Connection connector = null;
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://127.0.0.1:3306/";
	private final String DB_TABLE = "simple_shop";
	private final String DB_ID = "root";
	private final String DB_PWD = "1234";
	
	
	public MySQLConnector() {
		
	} 
	
	/** MemberDAO의 각 메서드 내에서 호출 **/ 
	public Connection dbConnect() {
		if(connector == null) {
			try {
				Class.forName(JDBC_DRIVER);
				connector = DriverManager.getConnection(DB_URL + DB_TABLE, DB_ID, DB_PWD);
			} catch (Exception e) {
				System.err.println("CONNECT ERR : " + e.getMessage());
			}
		}
		return connector;
	}
	
	/** CLOSE **/
	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.err.println("CLOSE ERR : " + e.getMessage());
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.err.println("CLOSE ERR : " + e.getMessage());
			}
		}
		if(conn != null) {
			try {
				this.connector.close();
				this.connector = null;
			} catch (SQLException e) {
				System.err.println("CLOSE ERR : " + e.getMessage());
			}
		}
	}	//close(rs, pstmt) END
}	//class MySQLConnector END
