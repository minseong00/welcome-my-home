package servlets.reservation;

import java.io.IOException;

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
		int revNum = Integer.parseInt(request.getParameter("bookNo"));
		
		RoomDAO roomDAO = new RoomDAO();
		RoomVO roomVO = new RoomVO();
		RevDAO revDAO = new RevDAO();
		RevVO revVO = new RevVO();
		
		revVO = revDAO.selectOne(revNum);
		roomVO = roomDAO.selectOne(revVO.getRoomNo());
		
		request.setAttribute("revVO", revVO);
		request.setAttribute("roomVO", roomVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/RevModify.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
