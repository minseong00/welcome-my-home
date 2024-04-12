package servlets.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reservation.RevDAO;

/**
 * Servlet implementation class RevDelete
 */
@WebServlet(description = "예약 삭제 컨트롤러", urlPatterns = {"/RevDelete"})
public class RevDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RevDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see 예약 레코드 삭제
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		RevDAO revDAO = new RevDAO();
		
		int result = revDAO.deleteRev(bookNo);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) 
			out.print("succecss");
		else
			out.print("fail");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
