package servlets.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reservation.RevDAO;

@WebServlet(description = "예약 삭제 컨트롤러", urlPatterns = {"/RevDelete"})
public class RevDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RevDelete() {
        super();
    }

	/**
	 * @see 예약 레코드 삭제
	 **/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		RevDAO revDAO = new RevDAO();
		
		int result = revDAO.deleteRev(revNo);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) 
			out.print("success");
		else
			out.print("fail");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
