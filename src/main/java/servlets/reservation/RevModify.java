package servlets.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reservation.RevDAO;
import model.RevVO;

/**
 * Servlet implementation class RevModify
 */
@WebServlet("/RevModify")
public class RevModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
    public RevModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see doHandle(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see doHandle(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see 관리자 예약 정보 수정 처리
	 */
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RevDAO revDAO = new RevDAO();
		RevVO revVO = new RevVO();
		
		String bookCheck = request.getParameter("bookCheck");
		String bookCheckOut = request.getParameter("bookCheckOut");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		Date date_bookCheck = null;
		Date date_bookCheckOut = null;
		
		try {
			date_bookCheck = (Date) dateFormat.parse(bookCheck);
			date_bookCheck = (Date) dateFormat.parse(bookCheckOut);
		} catch (java.text.ParseException e) {
			System.out.println("Rev Modify Parse ERR : " + e.getMessage());
		}
		
		revVO.setBookNo(Integer.parseInt(request.getParameter("bookNo")));
		revVO.setBookCheck(date_bookCheck);
		revVO.setBookCheckOut(date_bookCheckOut);
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
