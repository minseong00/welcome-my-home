package servlets.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;

/**
 * Servlet implementation class RoomDelete
 */
@WebServlet("/RoomDelete")
public class RoomDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoomDelete() {
        super();
    }

	/**
	 * @see 방 삭제
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoomDAO roomDAO = new RoomDAO();
		RoomImgDAO imgDAO = new RoomImgDAO();
		int result = 0;
		
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		result = roomDAO.deleteRoom(roomNo);
		result += imgDAO.deleteRoomImg(roomNo);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result >= 2) {
			out.print("success");
			imgDAO.deleteRoomImg(roomNo);
		}else {
			System.out.println("RoomDelete ERR : 방 또는 방 이미지 레코드 중 하나가 삭제되지않았습니다. - 결과 값 : " + result);
			out.print("fail");
		}
			
		
	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
