package servlets.reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reservation.RevDAO;
import dao.room.RoomDAO;
import model.FullCalendarRevVO;
import model.RevVO;
import model.RoomVO;
import util.CalendarForm;
import util.CreateJSON;

/**
 * Servlet implementation class RevDetail
 */
@WebServlet("/RevDetail")
public class RevDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
    public RevDetail() {
        super();
        
    }

	/**
	 * @see 예약 상세 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int revNum = 0;
		String temp = request.getParameter("revNo");
		
		if(temp == null || temp.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/LoginCheck");
			return;
		}
		revNum = Integer.parseInt(temp);
		
		RevDAO revDAO = new RevDAO();
		RoomDAO roomDAO = new RoomDAO();
		RevVO revVO = new RevVO();
		RoomVO roomVO = new RoomVO();
		ArrayList<RevVO> revList = new ArrayList<RevVO>();
		
		revVO = revDAO.selectOne(revNum);
		roomVO = roomDAO.selectOne(revNum);
		revList = revDAO.selectRoomRev(revNum);
		
		ArrayList<FullCalendarRevVO> fullCalRevList = CalendarForm.FullCalendar(revList);
		String json = CreateJSON.parseFullCalendarRevVOListToJSON(fullCalRevList);
		request.setAttribute("revList", json);
		request.setAttribute("revVO", revVO);
		request.setAttribute("roomVO", roomVO);
		
		request.getRequestDispatcher("/admins/RevModify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
