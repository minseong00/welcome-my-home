package dao.reservation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.connection.MySQLConnector;
import model.RevVO;

public class RevDAO implements RevQuerys {
	private java.sql.Connection conn = null;
	private PreparedStatement pstmt = null;
	private MySQLConnector DB = null;
	private ResultSet rs = null;

	public RevDAO() {
		DB = new MySQLConnector();
	}
	
	/**
	 	예약 목록 조회
	 	@return
	**/
	public ArrayList<RevVO> selectAll(){
		ArrayList<RevVO> revList = null;
		try {
			conn = DB.dbConnect();
			this.pstmt = conn.prepareStatement(selectAll);
			this.rs = this.pstmt.executeQuery();
			revList = new ArrayList<RevVO>();
			
			while (this.rs.next()) {
				RevVO revVO = new RevVO();
				revVO.setBookNo(this.rs.getInt("bookNo"));
				revVO.setBookDate(this.rs.getTimestamp("bookDate"));
				revVO.setRoomNo(this.rs.getInt("roomNo"));
				revVO.setBookCheck(this.rs.getDate("bookCheck"));
				revVO.setBookCheckOut(this.rs.getDate("bookCheckOut"));
				revVO.setHeadCount(this.rs.getInt("headCount"));
				revVO.setPrice(this.rs.getInt("price"));
				revVO.setMemId(this.rs.getString("memId"));
				
				revList.add(revVO);
			}
			
		} catch (SQLException e) {
			System.err.println("Rev SelectAll ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		return revList;
	}
	
	/**
 	자신의 예약 목록 조회
 	@return
**/
public ArrayList<RevVO> selectMyRev(String _id) {
	ArrayList<RevVO> revList = null;
	try {
		conn = DB.dbConnect();
		this.pstmt = conn.prepareStatement(selectMyRev);
		this.pstmt.setString(1, _id);
		this.rs = this.pstmt.executeQuery();
		revList = new ArrayList<RevVO>();
		
		while (this.rs.next()) {
			RevVO revVO = new RevVO();
			revVO.setBookNo(this.rs.getInt("bookNo"));
			revVO.setBookDate(this.rs.getTimestamp("bookDate"));
			revVO.setRoomNo(this.rs.getInt("roomNo"));
			revVO.setBookCheck(this.rs.getDate("bookCheck"));
			revVO.setBookCheckOut(this.rs.getDate("bookCheckOut"));
			revVO.setHeadCount(this.rs.getInt("headCount"));
			revVO.setPrice(this.rs.getInt("price"));
			revVO.setMemId(this.rs.getString("memId"));
			
			revList.add(revVO);
		}
		
	} catch (SQLException e) {
		System.err.println("Rev SelectAll ERR : " + e.getMessage());
	} finally {
		DB.close(this.rs, this.pstmt, this.conn);
	}
	return revList;
}
	
	/**
		예약 상세 조회
		@param int
		@return
	**/
	public RevVO selectOne(int bookNo) {
		RevVO revVO = null;
		
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(selectOne);
			this.pstmt.setInt(1, bookNo);
			this.rs = this.pstmt.executeQuery();
			
			if (this.rs.next()) {
				revVO = new RevVO();
				revVO.setBookNo(this.rs.getInt("bookNo"));
				revVO.setBookDate(this.rs.getTimestamp("bookDate"));
				revVO.setRoomNo(this.rs.getInt("roomNo"));
				revVO.setBookCheck(this.rs.getDate("bookCheck"));
				revVO.setBookCheckOut(this.rs.getDate("bookCheckOut"));
				revVO.setHeadCount(this.rs.getInt("headCount"));
				revVO.setPrice(this.rs.getInt("price"));
				revVO.setMemId(this.rs.getString("memId"));
			}
		} catch (SQLException e) {
			System.err.println("Rev SelectOne ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return revVO;
	}
	
	/**
	예약 delete
	@param RevVO
	@return
	**/
	public int deleteRev(int bookNo) {
		int result = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(deleteRev);
			this.pstmt.setInt(1, bookNo);
			result = this.pstmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("Rev Delete ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return result;
	}
	
	/**
		예약 insert
		@param RevVO
	**/
	public int insertRev(RevVO revVO) {
		int result = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(insertRev);
			this.pstmt.setTimestamp(1, revVO.getBookDate());
			this.pstmt.setInt(2, revVO.getRoomNo());
			this.pstmt.setDate(3, revVO.getBookCheck());
			this.pstmt.setDate(4, revVO.getBookCheckOut());
			this.pstmt.setInt(5, revVO.getHeadCount());
			this.pstmt.setInt(6, revVO.getPrice());
			this.pstmt.setString(7, revVO.getMemId());
			result = this.pstmt.executeUpdate();

		}catch (SQLException e) {
			System.err.println("Insert Rev : " + e.getMessage());
		} finally {
			DB.close(null, this.pstmt, this.conn);
		}
		return result;
	}
		
	/**
	Rev update
	@param RevVO
	**/
	public int updateRev(RevVO revVO) {
		int result = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(updateRev);
			this.pstmt.setDate(1, revVO.getBookCheck());
			this.pstmt.setDate(2, revVO.getBookCheckOut());
			this.pstmt.setInt(3, revVO.getHeadCount());
			this.pstmt.setInt(4, revVO.getPrice());
			this.pstmt.setInt(5, revVO.getBookNo());
			
			result = this.pstmt.executeUpdate();
			
		}catch (SQLException e) {
			System.err.println("update Rev : " + e.getMessage());
		} finally {
			DB.close(null, this.pstmt, this.conn);
		}
		return result;
	}
}
