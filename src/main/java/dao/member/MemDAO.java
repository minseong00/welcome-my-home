package dao.member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.mindrot.jbcrypt.BCrypt;

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
			pstmt.setString(1, member.getMemId());
			rs = pstmt.executeQuery();
			if(rs.next()) {				// 사용자 존재여부 확인
				id = rs.getString("memId");
				pw = rs.getString("memPw");
		           if (member.getMemId().equals(id) && BCrypt.checkpw(member.getMemPw(), pw))
		        	   //member.getMemPw().equals(pw)
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
		boolean result = true;
		
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(memIDCheck);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			result = rs.next();	//조회된 id가 있으면 true/없으면 false
			
			System.out.println("result mem : " + result);
		} catch (Exception e) {
			System.err.println("ID SELECT ERR : " + e.getMessage());
		} finally {
			DB.close(rs, pstmt, conn);
		}
		return result;
	}
	

	/**
	 * 회원가입
	 * @return 
	 **/
	public int insert(MemVO memModel) {
		int result = 0;
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(insertMem);
			pstmt.setString(1, memModel.getMemId());
			pstmt.setString(2, memModel.getMemCall());
			pstmt.setString(3, memModel.getMemName());
			pstmt.setString(4, memModel.getMemEmail());
			pstmt.setString(5, memModel.getMemPw());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(null, pstmt, conn);
		}
		return result;
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
		            memModel.setMemId(rs.getString("memid"));
		            memModel.setMemPw(rs.getString("mempw"));
		            memModel.setMemName(rs.getString("memname"));
		            memModel.setMemCall(rs.getString("memcall"));
		            memModel.setMemEmail(rs.getString("mememail"));

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
				member.setMemNo(rs.getInt("memNo"));
				member.setMemId(rs.getString("memId"));
				member.setMemPw(rs.getString("memPw"));
				member.setMemName(rs.getString("memName"));
				member.setMemCall(rs.getString("memCall"));
				member.setMemEmail(rs.getString("memEmail"));
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
	public int update(MemVO memModel) {
		int result = 0;
		try {
			conn = DB.dbConnect();
			pstmt = conn.prepareStatement(updateMem);
			pstmt.setString(1, memModel.getMemPw());
			pstmt.setString(2, memModel.getMemName());
			pstmt.setString(3, memModel.getMemCall());
			pstmt.setString(4, memModel.getMemEmail());
			pstmt.setString(5, memModel.getMemId());
			result = pstmt.executeUpdate();
			
			if(result>0) {
				System.out.println("UPDATE SUCCESS!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(null, pstmt, conn);
		}
		return result;
	}
	
	/**
	 * 회원정보 삭제
	 **/
	public int delete(String id) {
		int result = 0;
		try {
			conn = DB.dbConnect();
			pstmt = this.conn.prepareStatement(deleteMem);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
			if(result>0) {
				System.out.println("=>DELETE SUCCESS!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(null, pstmt, conn);
		}
		return result;
	}

}
