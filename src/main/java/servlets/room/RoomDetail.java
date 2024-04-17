package servlets.room;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reservation.RevDAO;
import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.FullCalendarRevVO;
import model.RevVO;
import model.RoomImgVO;
import model.RoomVO;
import util.CalendarForm;
import util.CreateJSON;

@WebServlet("/RoomDetail")
public class RoomDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RoomDetail() {
        super();
    }

	/**
	 * @see 회원 룸 상세정보 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNum = Integer.parseInt(request.getParameter("roomNo"));
	    RoomDAO roomDAO = new RoomDAO();
	    RoomImgDAO imgDAO = new RoomImgDAO();
	    RoomVO roomVO = new RoomVO();
	    RoomImgVO imgVO = new RoomImgVO();
	    RevDAO revDAO = new RevDAO();
	    
		roomVO = roomDAO.selectOne(roomNum);
		imgVO = imgDAO.selectOne(roomNum);
		
		ArrayList<RevVO> revList  = revDAO.selectRoomRev(roomNum);
		ArrayList<FullCalendarRevVO> fullCalRevList = CalendarForm.FullCalendar(revList);
		String json = CreateJSON.parseFullCalendarRevVOListToJSON(fullCalRevList);
		request.setAttribute("revList", json);
		
		request.setAttribute("roomVO", roomVO);
		request.setAttribute("imgVO", imgVO);
		
		request.getRequestDispatcher("/members/RoomDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
