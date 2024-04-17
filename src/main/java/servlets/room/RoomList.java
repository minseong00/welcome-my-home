package servlets.room;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.RoomImgVO;
import model.RoomVO;
import util.FilterRoom;

@WebServlet("/RoomList")
public class RoomList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RoomList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    RoomDAO roomDAO = new RoomDAO();
		RoomImgDAO imgDAO = new RoomImgDAO();
		String type = request.getParameter("type");
		ArrayList<RoomVO> roomList = roomDAO.selectAll();
		ArrayList<RoomImgVO> imgList = imgDAO.selectAll();
		ArrayList<OptionVO> optionList = FilterRoom.insertRoomList(imgList, roomList);
		request.setAttribute("roomVO", optionList);
		
		RequestDispatcher dispatcher = null;
		
		if(type == null) {
			response.sendRedirect(request.getContextPath() + "/LoginCheck");
			return;
		} else {
			switch (type) {
			case "member":
				dispatcher = request.getRequestDispatcher("/members/RoomList.jsp");
				break;
			case "admin":
				dispatcher = request.getRequestDispatcher("/admins/AdminRoomList.jsp");
				break;
			default:
				response.sendRedirect(request.getContextPath() + "/LoginCheck");
				return;
			}
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
