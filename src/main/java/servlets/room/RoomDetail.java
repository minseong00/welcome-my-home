package servlets.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import model.RoomVO;


@WebServlet("/RoomDetail")
public class RoomDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RoomDAO roomDAO = null;
    
  
    public RoomDetail() {
        super();
    }

	/**
	 * 회원 룸 상세정보 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * 관리자 룸 수정 요청
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
