package servlets.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.reservation.RevDAO;
import dao.room.RoomDAO;
import model.RevVO;
import model.RoomVO;

/**
 * Servlet implementation class RevInsert
 */
@WebServlet("/RevInsert")
public class RevInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RevInsert() {
        super();
    }

	/**
	 * @see 예약 화면으로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNum = Integer.parseInt(request.getParameter("roomNo"));
		
		RoomDAO roomDAO = new RoomDAO();
		RoomVO roomVO = new RoomVO();
		
		roomVO = roomDAO.selectOne(roomNum);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/members/RoomRev.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see 예약 처리
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RevVO revVO = new RevVO();
		RevDAO revDAO = new RevDAO();
		
		String memId = (String)session.getAttribute("id");
		String bookCheck = request.getParameter("bookCheck");
		String bookCheckOut = request.getParameter("bookCheckOut");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		Date date_bookCheck = null;
		Date date_bookCheckOut = null;
		
		try {
			date_bookCheck = (Date) dateFormat.parse(bookCheck);
			date_bookCheck = (Date) dateFormat.parse(bookCheckOut);
		} catch (java.text.ParseException e) {
			System.out.println("Rev Insert Parse ERR : " + e.getMessage());
		}
		
		LocalDateTime currentDateTime = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(currentDateTime);
		
		revVO.setBookDate(timestamp);
		revVO.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		revVO.setBookCheck(date_bookCheck);
		revVO.setBookCheckOut(date_bookCheckOut);
		revVO.setHeadCount(Integer.parseInt(request.getParameter("headCount")));
		revVO.setPrice(Integer.parseInt(request.getParameter("price")));
		revVO.setMemId(memId);
		
		int result = revDAO.insertRev(revVO);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) 
			out.print("success");
		else
			out.print("fail");
		
	}

}
