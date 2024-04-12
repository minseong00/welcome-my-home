package servlets.room;

import java.io.IOException;
import java.util.List;

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

/**
 * Servlet implementation class RoomListController
 */
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
		
		List<RoomVO> roomList = roomDAO.selectAll();
		List<RoomImgVO> imgList = imgDAO.selectAll();
		
		request.setAttribute("roomVO", roomList);
		request.setAttribute("imgList", imgList);
		
		RequestDispatcher dispatcher = null;
		
		if(type == null)
			response.sendRedirect(request.getContextPath() + "/LoginCheck");
		else {
			if(type.equals("member"))
				dispatcher = request.getRequestDispatcher("/members/RoomList.jsp");
			else {
				dispatcher = request.getRequestDispatcher("/admin/AdminRoomList.jsp");
			}
			dispatcher.forward(request, response);
		}

		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
