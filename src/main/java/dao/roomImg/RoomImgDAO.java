package dao.roomImg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<RoomImgVO> selectAll() {
		List<RoomImgVO> imgList = null;
		try {
			conn = DB.dbConnect();
			this.pstmt = conn.prepareStatement(selectAll);
			this.rs = this.pstmt.executeQuery();
			imgList = new ArrayList<RoomImgVO>();
			
			while (this.rs.next()) {
				RoomImgVO imgVO = new RoomImgVO();
				imgVO.setRoomNo(rs.getInt("roomNo"));
				imgVO.setImg1(rs.getString("img1"));
				imgVO.setImg2(rs.getString("img2"));
				imgVO.setImg3(rs.getString("img3"));
				imgVO.setImg4(rs.getString("img4"));
				imgVO.setImg5(rs.getString("img5"));
				imgVO.setInfoImg("infoImg");
				
				imgList.add(imgVO);
			}
			
		} catch (SQLException e) {
			System.err.println("Room SelectAll ERR : " + e.getMessage());
		} finally {
			DB.close(this.rs, this.pstmt, this.conn);
		}
		
		return imgList;
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
			this.pstmt = this.conn.prepareStatement(selectImg);
			this.pstmt.setInt(1, roomNO);
			this.rs = this.pstmt.executeQuery();
			
			if (this.rs.next()) {
				imgVO = new RoomImgVO();
				imgVO.setRoomNo(this.rs.getInt("roomNo"));
				imgVO.setImg1(this.rs.getString("img1"));
				imgVO.setImg2(this.rs.getString("img2"));
				imgVO.setImg3(this.rs.getString("img3"));
				imgVO.setImg4(this.rs.getString("img4"));
				imgVO.setImg5(this.rs.getString("img5"));
				imgVO.setInfoImg(this.rs.getString("infoImg"));
				
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
			this.pstmt = this.conn.prepareStatement(updateImg);
			this.pstmt.setString(1, imgVO.getImg1());
			this.pstmt.setString(2, imgVO.getImg2());
			this.pstmt.setString(3, imgVO.getImg3());
			this.pstmt.setString(4, imgVO.getImg4());
			this.pstmt.setString(5, imgVO.getImg5());
			this.pstmt.setString(6, imgVO.getInfoImg());
			this.pstmt.setInt(7, imgVO.getRoomNo());
			result = this.pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("RoomImg SelectOne ERR : " + e.getMessage());
		} finally {
			DB.close(null, this.pstmt, this.conn);
		}
		
		return result;
	}
	
	/**
	룸 이미지 insert
	@param roomImgVO
	**/
	public void insertRoomImg (RoomImgVO roomImg) {
		try {
			if(roomImg.getRoomNo() == 0) {
				System.out.println("insertRoomImg() ERR : 방의 번호가 일치하지 않습니다.");
				return;
			}
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(insertImg);
			this.pstmt.setInt(1, roomImg.getRoomNo());
			this.pstmt.setString(2, roomImg.getImg1());
			this.pstmt.setString(3, roomImg.getImg2());
			this.pstmt.setString(4, roomImg.getImg3());
			this.pstmt.setString(5, roomImg.getImg4());
			this.pstmt.setString(6, roomImg.getImg5());
			this.pstmt.setString(7, roomImg.getInfoImg());
			int n = this.pstmt.executeUpdate();
			if(n < 0) {
				System.out.println("insert IMG ERR!!!!!");
			}
		} catch (SQLException e) {
			System.err.println("insertRoomImg err : " + e.getMessage());
		} finally {
			DB.close(null, this.pstmt, this.conn);
		}
	}
	/**
	룸 이미지 delete
	@param int
	**/
	public int deleteRoomImg (int roomNo) {
		int result = 0;
		try {
			this.conn = DB.dbConnect();
			this.pstmt = this.conn.prepareStatement(deleteImg);
			this.pstmt.setInt(1, roomNo);
			result = this.pstmt.executeUpdate();
			if(result < 0) {
				System.out.println("delete IMG ERR!!!!!");
			}
		} catch (SQLException e) {
			System.err.println("deleteRoom IMG ERR : " + e.getMessage());
		} finally {
			DB.close(null, this.pstmt, this.conn);
		}
		return result;
	}
}
