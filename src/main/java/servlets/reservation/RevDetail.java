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
		
		if(temp == null || temp.equals("")) {
			response.sendRedirect(request.getContextPath() + "/LoginCheck");
			return;
		}
		
		revNum = Integer.parseInt(temp);
		RevDAO revDAO = new RevDAO();
		RevVO revVO = new RevVO();
		RoomDAO roomDAO = new RoomDAO();
		RoomVO roomVO = new RoomVO();
		
		revVO = revDAO.selectOne(revNum);
		roomVO = roomDAO.selectOne(revVO.getRoomNo());
		
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
