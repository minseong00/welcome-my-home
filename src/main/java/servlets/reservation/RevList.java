package servlets.reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.reservation.RevDAO;
import dao.room.RoomDAO;
import model.FullCalendarRevVO;
import model.RevVO;
import util.CalendarForm;
import util.CreateJSON;

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
		ArrayList<RevVO> revList = null;
		String type = request.getParameter("type");
		
		RequestDispatcher dispatcher = null;
		
		if(type == null) {
			response.sendRedirect(request.getContextPath() + "/LoginCheck");
			return;
		}
		
		if(!type.equals("myInfo"))
			revList = revDAO.selectTableList();
		
		switch (type) {
		case "calendar":
			dispatcher = request.getRequestDispatcher("/members/RevCalendar.jsp");
			ArrayList<FullCalendarRevVO> fullCalRevList = null;
			fullCalRevList = CalendarForm.FullCalendar(revList);
			String json = CreateJSON.parseFullCalendarRevVOListToJSON(fullCalRevList);
			request.setAttribute("revList", json);
			break;
		case "admin":
			dispatcher = request.getRequestDispatcher("/admins/AdminRevList.jsp");
			break;
		case "myInfo": // roomNames, revMyRev
			HttpSession session = request.getSession();
			String _id = (String) session.getAttribute("id");
			revList = revDAO.selectMyRev(_id);
			dispatcher = request.getRequestDispatcher("/members/MyRev.jsp");
			break;
		default:
			response.sendRedirect(request.getContextPath() + "/BasicMain");
			return;
		}
		
		if(!type.equals("calendar"))
			request.setAttribute("revList", revList);

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
