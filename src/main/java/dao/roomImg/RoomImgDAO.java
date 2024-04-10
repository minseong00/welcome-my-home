package dao.roomImg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.connection.MySQLConnector;
import model.RoomImgVO;
import model.RoomVO;

public class RoomImgDAO implements RoomImgQuerys {
MySQLConnector DB = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public RoomImgDAO() {
		DB = new MySQLConnector();
	}
	
	/**
 	룸 이미지 조회
 	@param int
 	@return
	**/
	public RoomImgVO selectOne(int roomNO) {
		RoomImgVO imgVO = null;
		
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(selectOne);
			this.pstmt.setInt(1, roomNO);
			this.rs = this.pstmt.executeQuery();
			
			if (this.rs.next()) {
				imgVO = new RoomImgVO();
				imgVO.setImg1("img1");
				imgVO.setImg2("img2");
				imgVO.setImg3("img3");
				imgVO.setImg4("img4");
				imgVO.setImg5("img5");
				imgVO.setInfoImg("infoImg");
			}
		} catch (SQLException e) {
			System.err.println("RoomImg SelectOne ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return imgVO;
	}
	
	/**
 	룸 이미지 수정
 	@param RoomImgVO
 	@return int
	**/
	public int updateImg(RoomImgVO imgVO) {
		int result = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(updateOne);
			this.pstmt.setString(1, imgVO.getImg1());
			this.pstmt.setString(2, imgVO.getImg2());
			this.pstmt.setString(3, imgVO.getImg3());
			this.pstmt.setString(4, imgVO.getImg4());
			this.pstmt.setString(5, imgVO.getImg5());
			this.pstmt.setInt(6, imgVO.getRoomNo());
			result = this.pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("RoomImg SelectOne ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return result;
	}
	
	/**
	룸 이미지 insert
	@param roomImgVO
	**/
	public void insertRoomImg (RoomImgVO roomImg) {
	try {
		this.conn = DB.dbConnect();
		this.pstmt = this.conn.prepareStatement(insertImg);
		this.pstmt.setString(1, roomImg.getImg1());
		this.pstmt.setString(2, roomImg.getImg2());
		this.pstmt.setString(3, roomImg.getImg3());
		this.pstmt.setString(4, roomImg.getImg4());
		this.pstmt.setString(5, roomImg.getImg5());
		this.pstmt.setString(5, roomImg.getInfoImg());
		int n = this.pstmt.executeUpdate();
		if(n < 0) {
			System.out.println("insert IMG ERR!!!!!");
		}
	} catch (SQLException e) {
		System.err.println("insertRoomImg err : " + e.getMessage());
	}
}
	
}
