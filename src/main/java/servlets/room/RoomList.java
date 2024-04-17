package servlets.room;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.OptionVO;
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
		String roomType = null;
		
		request.setAttribute("imgList", imgList);
	
		
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
				System.out.println("진입 admin");
				dispatcher = request.getRequestDispatcher("/admins/AdminRoomList.jsp");
				break;
			case "main":
				String checkInDate = request.getParameter("checkIn");
				String checkOutDate = request.getParameter("checkOut");
				roomType = request.getParameter("roomType");
				int headCount = Integer.parseInt(request.getParameter("headCount"));
				
				System.out.println("checkin : " + checkInDate);
				System.out.println("checkOut : " + checkOutDate);
				System.out.println("roomType : " + roomType);
				System.out.println("headCount : " + headCount);
				ArrayList<OptionVO> optionList = roomDAO.selectCountType(headCount, roomType);
				request.setAttribute("checkInDate", checkInDate);
                request.setAttribute("checkOutDate", checkOutDate);
                request.setAttribute("roomType", roomType);
                request.setAttribute("headCount", headCount);
				request.setAttribute("roomVO", optionList);
				dispatcher = request.getRequestDispatcher("/members/RoomList.jsp");
				break;
			case "mainImg":
				roomType = request.getParameter("roomType");
				System.out.println("roomType : " + roomType);
				
				ArrayList<RoomVO> roomTypeList = roomDAO.selectType(roomType);
				request.setAttribute("roomVO", roomTypeList);
				request.setAttribute("roomType", roomType);
				dispatcher = request.getRequestDispatcher("/members/RoomList.jsp");
				break;
				
			default:
				break;
			}
			if(!type.equals("main") && (!type.equals("mainImg")))
				request.setAttribute("roomVO", roomList);
			
			dispatcher.forward(request, response);
		}

		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
