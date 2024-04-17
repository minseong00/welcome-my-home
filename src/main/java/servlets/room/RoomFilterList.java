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
import model.OptionVO;
import model.RoomImgVO;
import util.FilterRoom;

/**
 * Servlet implementation class RoomFilterList
 */
@WebServlet("/RoomFilterList")
public class RoomFilterList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RoomDAO roomDAO = null;
	private RoomImgDAO imgDAO = null;
	private ArrayList<RoomImgVO> imgList = null;
	
    public RoomFilterList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		roomDAO = new RoomDAO();
		imgDAO = new RoomImgDAO();
		imgList = imgDAO.selectAll();
		String type = request.getParameter("type");
		String roomType = request.getParameter("roomType");;
		ArrayList<OptionVO> optionList = null;
	
		RequestDispatcher dispatcher = null;
		if(type == null) {
			response.sendRedirect(request.getContextPath() + "/LoginCheck");
			return;
		} else {
			switch (type) {
			case "main":
				String checkIn = request.getParameter("checkIn");
				String checkOut = request.getParameter("checkOut");
				int headCount = Integer.parseInt(request.getParameter("headCount"));
				
				optionList = (roomType.equals("default")) ? roomDAO.selectCount(headCount) : roomDAO.selectCountType(headCount, roomType);
				
				request.setAttribute("checkInDate", checkIn);
	            request.setAttribute("checkOutDate", checkOut);
	            request.setAttribute("headCount", headCount);
				dispatcher = request.getRequestDispatcher("/members/RoomList.jsp");
				break;
			case "mainImg":
				optionList = roomDAO.selectType(roomType);
				dispatcher = request.getRequestDispatcher("/members/RoomList.jsp");
				break;
			default:
				response.sendRedirect(request.getContextPath() + "/LoginCheck");
				return;
			}
			optionList = FilterRoom.insertOptionList(imgList, optionList);
			request.setAttribute("roomType", roomType);
			request.setAttribute("roomVO", optionList);
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		roomDAO = new RoomDAO();
		imgDAO = new RoomImgDAO();
		imgList = imgDAO.selectAll();
		
		String checkInDate = request.getParameter("checkIn");
		String checkOutDate = request.getParameter("checkOut");
		String roomType = request.getParameter("roomType");
		int headCount = Integer.parseInt(request.getParameter("headCount"));
		int priceMin = Integer.parseInt(request.getParameter("priceMin"));
		int priceMax = Integer.parseInt(request.getParameter("priceMax"));
		ArrayList<OptionVO> optionList = null;
		optionList = (roomType.equals("default")) ? roomDAO.selectCount(headCount) : roomDAO.selectCountType(headCount, roomType);
		
		optionList = FilterRoom.resultFilterRoom(imgList, optionList, checkInDate, checkOutDate, priceMin, priceMax);
		
		request.setAttribute("roomVO", optionList);
		request.setAttribute("checkInDate", checkInDate);
        request.setAttribute("checkOutDate", checkOutDate);
        request.setAttribute("priceMin", priceMin);
        request.setAttribute("priceMax", priceMax);
        request.setAttribute("roomType", roomType);
        request.setAttribute("headCount", headCount);
        
        request.getRequestDispatcher("/members/RoomList.jsp").forward(request, response);
	}

}
