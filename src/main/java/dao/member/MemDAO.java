package dao.member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.connection.MySQLConnector;
import model.MemVO;

public class MemDAO implements MemberQuerys{
	private java.sql.Connection conn = null;
	private PreparedStatement pstmt = null;
	private MySQLConnector DB = null;
	private ResultSet rs = null;
	
	public MemDAO() {
		DB = new MySQLConnector();
	}
	
	/**
	 * mem 로그인 처리
	 **/
	public boolean memLogin(MemVO member) {
		boolean result = false;
		String id = null;
		String pw = null;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(memLogin);
			pstmt.setString(1, member.getMem_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {				// 사용자 존재여부 확인
				id = rs.getString("memId");
				pw = rs.getString("memPw");
		           if (member.getMem_id().equals(id) && member.getMem_pw().equals(pw))
		                result = true;	// 로그인성공
		           else {
						System.out.println("member 비밀번호 틀림");
		                result = false;	// 비밀번호가 일지하지 않음
		           }
			} else {
				System.out.println("존재하지 않는 member");
				result = false;	// 사용자가 존재하지 않음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		}
		return result;

	}
	
	/**
	 * mem ID 중복 처리
	 **/
	public boolean overlappedID(String id) {
		boolean result = false;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(memIDCheck);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			result = rs.next();	//조회된 id가 있으면 true/없으면 false
		} catch (Exception e) {
			System.err.println("ID SELECT ERR : " + e.getMessage());
		} finally {
			DB.close(rs, pstmt, conn);
		}
		return result;
	}
	

	/**
	 * 회원가입
	 **/
	public void insert(MemVO memModel) {
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(insertMem);
			pstmt.setString(1, memModel.getMem_id());
			pstmt.setString(2, memModel.getMem_call());
			pstmt.setString(3, memModel.getMem_name());
			pstmt.setString(4, memModel.getMem_email());
			pstmt.setString(5, memModel.getMem_pw());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		}
	}
	
	/**
	 * 회원 목록조회
	 **/
	public ArrayList<MemVO> selectList(){
		ArrayList<MemVO> memList = new ArrayList<MemVO>();
		
		   try {
		        conn = DB.dbConnect();
		        pstmt = conn.prepareStatement(selectAll);
		        rs = pstmt.executeQuery();
		        
		        while (rs.next()) {
		            MemVO memModel = new MemVO();
		            memModel.setMem_id(rs.getString("memid"));
		            memModel.setMem_pw(rs.getString("mempw"));
		            memModel.setMem_name(rs.getString("memname"));
		            memModel.setMem_call(rs.getString("memcall"));
		            memModel.setMem_email(rs.getString("mememail"));

		            memList.add(memModel);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        DB.close(rs, pstmt, conn);
		    }
		    
		    return memList;
		}
	
	/**
	 * 회원 상세조회
	 **/
	public MemVO selectOne(String id) {
		MemVO member = null;
		try {
	        conn = DB.dbConnect();
	        pstmt = conn.prepareStatement(selectOne);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemVO();
				member.setMem_no(rs.getInt("memNo"));
				member.setMem_id(rs.getString("memId"));
				member.setMem_pw(rs.getString("memPw"));
				member.setMem_name(rs.getString("memName"));
				member.setMem_call(rs.getString("memCall"));
				member.setMem_email(rs.getString("memEmail"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, conn);
		} 
		return member;
	}
	
	/**
	 * 회원정보 수정
	 **/
	public void update(MemVO memModel) {
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(updateMem);
			pstmt.setString(1, memModel.getMem_pw());
			pstmt.setString(2, memModel.getMem_name());
			pstmt.setString(3, memModel.getMem_call());
			pstmt.setString(4, memModel.getMem_email());
			pstmt.setString(5, memModel.getMem_id());
			
			
			int n = pstmt.executeUpdate();
			if(n>0) {
				System.out.println("UPDATE SUCCESS!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(null, pstmt, conn);
		}
	}
	
	/**
	 * 회원정보 삭제
	 **/
	public void delete(String id) {
		try {
			conn = DB.dbConnect();
			pstmt = this.conn.prepareStatement(deleteMem);
			pstmt.setString(1, id);
			int n = pstmt.executeUpdate();
			if(n>0) {
				System.out.println("=>DELETE SUCCESS!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(null, pstmt, conn);
		}
		
	}

}
