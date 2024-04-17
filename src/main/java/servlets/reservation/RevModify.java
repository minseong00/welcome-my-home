package servlets.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reservation.RevDAO;
import model.RevVO;

@WebServlet("/RevModify")
public class RevModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public RevModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see 관리자 예약 정보 수정 처리
	 */
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RevDAO revDAO = new RevDAO();
		RevVO revVO = new RevVO();
		
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		
		if(checkIn == null && checkIn.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/adminMain");
			return;
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date_CheckIn = null;
		java.util.Date date_CheckOut = null;
		java.sql.Date sqlDate_CheckIn = null;
		java.sql.Date sqlDate_CheckOut = null;
		try {
			date_CheckIn =  dateFormat.parse(checkIn);
			date_CheckOut =  dateFormat.parse(checkOut);
			
			sqlDate_CheckIn = new java.sql.Date(date_CheckIn.getTime());
			sqlDate_CheckOut = new java.sql.Date(date_CheckOut.getTime());
		} catch (java.text.ParseException e) {
			System.out.println("Rev Modify Parse ERR : " + e.getMessage());
		}
		
		revVO.setRevNo(Integer.parseInt(request.getParameter("revNo")));
		revVO.setCheckIn(sqlDate_CheckIn);
		revVO.setCheckOut(sqlDate_CheckOut);
		revVO.setHeadCount(Integer.parseInt(request.getParameter("headCount")));
		revVO.setPrice(Integer.parseInt(request.getParameter("price")));
		
		int result = revDAO.updateRev(revVO);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) 
			out.print("success");
		else
			out.print("fail");
	}
	
}
