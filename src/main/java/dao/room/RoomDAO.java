package dao.room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.connection.MySQLConnector;
import model.RoomImgVO;
import model.RoomVO;

public class RoomDAO implements RoomQuerys {
	MySQLConnector DB = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public RoomDAO() {
		DB = new MySQLConnector();
	}
	
	/**
		룸 총 갯수 조회
		@return
	**/
	public int RoomCount() {
		int totalCount = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(roomCount);
			this.rs = this.pstmt.executeQuery();
			if (this.rs.next()) {
				totalCount = this.rs.getInt("total");
			}
		} catch (SQLException e) {
			System.err.println("roomCount ERR : " + e.getMessage());
		}
		return totalCount;
	}
	
	/**
	 	룸 목록 조회
	 	@return
	**/
	public List<RoomVO> selectAll(){
		List<RoomVO> roomList = null;
		try {
			conn = DB.dbConnect();
			this.pstmt = conn.prepareStatement(selectAll);
			this.rs = this.pstmt.executeQuery();
			roomList = new ArrayList<RoomVO>();
			
			while (this.rs.next()) {
				RoomVO roomVO = new RoomVO();
				roomVO.setRoomNo(this.rs.getInt("roomNo"));
				roomVO.setRoomName(this.rs.getString("roomName"));
				roomVO.setRoomType(this.rs.getString("roomType"));
				roomVO.setHeadCount(this.rs.getInt("headCount"));
				roomVO.setRoomNo(this.rs.getInt("roomCost"));
				
				roomList.add(roomVO);
			}
			
		} catch (SQLException e) {
			System.err.println("Room SelectAll ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		return roomList;
	}
	
	/**
 	룸 상세 조회
 	@param int
 	@return
	**/
	public RoomVO selectOne(int roomNO) {
		RoomVO roomVO = null;
		
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(selectOne);
			this.pstmt.setInt(1, roomNO);
			this.rs = this.pstmt.executeQuery();
			
			if (this.rs.next()) {
				roomVO = new RoomVO();
				roomVO.setRoomNo(this.rs.getInt("roomNo"));
				roomVO.setRoomName(this.rs.getString("roomName"));
				roomVO.setRoomType(this.rs.getString("roomType"));
				roomVO.setHeadCount(this.rs.getInt("headCount"));
				roomVO.setRoomNo(this.rs.getInt("roomCost"));
			}
		} catch (SQLException e) {
			System.err.println("Room SelectOne ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return roomVO;
	}
	
	public int deleteRoom(int roomNo) {
		int result = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(deleteOne);
			this.pstmt.setInt(1, roomNo);
			result = this.pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("RoomImg SelectOne ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return result;
	}
	
	/**
		룸 insert
		@param roomVO
	**/
	public void insertRoomData(RoomVO roomVO) {
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(insertData);
			this.pstmt.setString(1, roomVO.getRoomName());
			this.pstmt.setString(2, roomVO.getRoomType());
			this.pstmt.setString(3, roomVO.getRoomDetail());
			this.pstmt.setInt(4, roomVO.getHeadCount());
			this.pstmt.setInt(4, roomVO.getRoomCost());
			int rs = this.pstmt.executeUpdate();
			if(rs < 0) {
				System.err.println("insert room rs err!! ");
			}
			
		}catch (SQLException e) {
			System.err.println("Insert room : " + e.getMessage());
		} finally {
			DB.close(null, this.pstmt, this.conn);
		}
	}
	
	/**
		룸 이미지 insert
		@param roomImgVO
	**/
	public void insertRoomImg (RoomImgVO roomImg) {
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(insertImg);
		} catch (SQLException e) {
			System.err.println("insertRoomImg err : " + e.getMessage());
		}
	}
}
