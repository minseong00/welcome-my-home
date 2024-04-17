package dao.room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dao.connection.MySQLConnector;
import model.OptionVO;
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
	 	룸 목록 조회
	 	@return
	**/
	public ArrayList<RoomVO> selectAll(){
		ArrayList<RoomVO> roomList = null;
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
				roomVO.setRoomDetail(this.rs.getString("roomDetail"));
				roomVO.setHeadCount(this.rs.getInt("headCount"));
				roomVO.setRoomCost(this.rs.getInt("roomCost"));
				
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
	 	모든 룸 이름 조회
	 	@return
	 **/
	public ArrayList<RoomVO> selectName() {
		ArrayList<RoomVO> roomList = null;
		try {
			conn = DB.dbConnect();
			this.pstmt = conn.prepareStatement(selectNN);
			this.rs = this.pstmt.executeQuery();
			roomList = new ArrayList<RoomVO>();
			
			while (this.rs.next()) {
				RoomVO roomVO = new RoomVO();
				roomVO.setRoomNo(this.rs.getInt("roomNo"));
				roomVO.setRoomName(this.rs.getString("roomName"));
				
				roomList.add(roomVO);
			}
			
		} catch (SQLException e) {
			System.err.println("Room SelectNoName ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		return roomList;
	}
	
	/** 
 	모든 룸 인원수, 
 	@return
	 **/
	public ArrayList<OptionVO> selectCountType(int headCount, String roomType) {
		ArrayList<OptionVO> optionList = null;
		try {
			conn = DB.dbConnect();
			this.pstmt = conn.prepareStatement(selectMainFilter);
			this.pstmt.setInt(1, headCount);
			this.pstmt.setString(2, roomType);
			this.rs = this.pstmt.executeQuery();
			optionList = new ArrayList<OptionVO>();
			
			while (this.rs.next()) {
				OptionVO optionVO = new OptionVO();
				optionVO.setRoomNo(this.rs.getInt("roomNo"));
				optionVO.setRoomType(this.rs.getString("roomType"));
				optionVO.setHeadCount(this.rs.getInt("headCount"));
				optionVO.setRoomCost(this.rs.getInt("roomCost"));
				optionVO.setCheckIn(this.rs.getDate("checkIn"));
				optionVO.setCheckOut(this.rs.getDate("checkOut"));
				optionList.add(optionVO);
			}
			
		} catch (SQLException e) {
			System.err.println("Room SelectNoName ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		return optionList;
	}
	
	/**
 	룸 상세 조회
 	@param int
 	@return
	**/
	public RoomVO selectOne(int roomNo) {
		RoomVO roomVO = null;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(selectOne);
			this.pstmt.setInt(1, roomNo);
			this.rs = this.pstmt.executeQuery();
			
			if (this.rs.next()) {
				roomVO = new RoomVO();
				roomVO.setRoomNo(this.rs.getInt("roomNo"));
				roomVO.setRoomName(this.rs.getString("roomName"));
				roomVO.setRoomDetail(this.rs.getString("roomDetail"));
				roomVO.setRoomType(this.rs.getString("roomType"));
				roomVO.setHeadCount(this.rs.getInt("headCount"));
				roomVO.setRoomCost(this.rs.getInt("roomCost"));
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
			System.err.println("Room Delete ERR : " + e.getMessage());
		} finally {
			DB.close(null, this.pstmt, this.conn);
		}
		
		return result;
	}
	
	/**
		룸 insert
		@param roomVO
	**/
	public int insertRoomData(RoomVO roomVO) {
		int roomNo = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(insertData, Statement.RETURN_GENERATED_KEYS);
			this.pstmt.setString(1, roomVO.getRoomName());
			this.pstmt.setString(2, roomVO.getRoomType());
			this.pstmt.setString(3, roomVO.getRoomDetail());
			this.pstmt.setInt(4, roomVO.getHeadCount());
			this.pstmt.setInt(5, roomVO.getRoomCost());
			int result = this.pstmt.executeUpdate();
			if(result < 0) {
				System.err.println("insert room rs err!! ");
			}
			
			// Img 삽입을 위한 roomNo 추출
			this.rs = this.pstmt.getGeneratedKeys();
			if(this.rs.next())
				roomNo = rs.getInt(1);
			
		}catch (SQLException e) {
			System.err.println("Insert room : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return roomNo;
	}
	/**
	룸 update
	@param roomVO
	**/
	public int roomUpdate(RoomVO roomVO) {
		int roomNo = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(update, Statement.RETURN_GENERATED_KEYS);
			this.pstmt.setString(1, roomVO.getRoomName());
			this.pstmt.setString(2, roomVO.getRoomType());
			this.pstmt.setString(3, roomVO.getRoomDetail());
			this.pstmt.setInt(4, roomVO.getHeadCount());
			this.pstmt.setInt(5, roomVO.getRoomCost());
			this.pstmt.setInt(6, roomVO.getRoomNo());
			int result = this.pstmt.executeUpdate();
			if(result < 0) {
				System.err.println("update room rs err!! ");
			}
			// Img 삽입을 위한 roomNo 추출
//			this.rs = pstmt.getGeneratedKeys();
//			roomNo = this.rs.getInt(1);
			
		}catch (SQLException e) {
			System.err.println("update room : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		return roomNo;
	}
	/**
	룸 Type 검색
	@param roomType
	@return
	**/
	public ArrayList<RoomVO> selectType(String roomType){
		ArrayList<RoomVO> roomList = new ArrayList<RoomVO>();
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(selectType);
			this.pstmt.setString(1, roomType);
			this.rs = this.pstmt.executeQuery();
			while(this.rs.next()){
				RoomVO roomVO = new RoomVO();
				roomVO.setRoomNo(this.rs.getInt("roomNo"));
				roomVO.setRoomName(this.rs.getString("roomName"));
				roomVO.setRoomType(this.rs.getString("roomType"));
				roomVO.setRoomDetail(this.rs.getString("roomDetail"));
				roomVO.setHeadCount(this.rs.getInt("headCount"));
				roomVO.setRoomCost(this.rs.getInt("roomCost"));
				
				roomList.add(roomVO);
			}
		} catch (SQLException e) {
			System.err.println("select Type main ERR : " + e.getMessage());
		}
		return roomList;
	}
	
}
