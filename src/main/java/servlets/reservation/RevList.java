package servlets.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reservation.RevDAO;
import dao.room.RoomDAO;
import model.RevVO;
import model.RoomVO;

/**
 * Servlet implementation class RevList
 */
@WebServlet("/RevList")
public class RevList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RevList() {
        super();
    }

	/**
	 * @see doGet 예약 리스트 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RevDAO revDAO = new RevDAO();
		RoomDAO roomDAO = new RoomDAO();
		List<RevVO> revList = null;
		String type = request.getParameter("type");
		
		RequestDispatcher dispatcher = null;
		
		if(type == null) {
			response.sendRedirect(request.getContextPath() + "/LoginCheck");
			return;
		}
		
		switch (type) {
		case "calendar":
			dispatcher = request.getRequestDispatcher("/members/RevCalendar.jsp");
			break;
		case "admin":
			dispatcher = request.getRequestDispatcher("/admin/AdminRevList.jsp");
			break;
		case "myInfo":
			revList = revDAO.selectMyRev("id");
			request.setAttribute("revList", revList);
			dispatcher = request.getRequestDispatcher("/members/MyRev.jsp");
			break;
		default:
			response.sendRedirect(request.getContextPath() + "/BasicMain");
			return;
		}
		
		if(!type.equals("myInfo")) {
			revList = revDAO.selectAll();
			List<RoomVO> roomList = roomDAO.selectName();

			request.setAttribute("revList", revList);
			request.setAttribute("roomNames", roomList);
		}
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
