package servlets.session;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.admin.AdminDAO;
import dao.member.MemDAO;
import dao.session.SessionDAO;
import model.AdminVO;
import model.MemVO;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
    public LoginCheck() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    
	    SessionDAO sessionDAO = new SessionDAO();
	    
	    String checkID = sessionDAO.loginCheck((String)session.getAttribute("id"));
	    
	    if(checkID != null) {
	    if(checkID.equals("admin")) {
	    session.setAttribute("idType", "admin");
	    response.sendRedirect(request.getContextPath() + "/adminMain");
	    } else {
	    session.setAttribute("idType", "member");
	    response.sendRedirect(request.getContextPath() + "/members/MainForm.jsp");
	    }
	    } else
	    response.sendRedirect(request.getContextPath() + "/members/MainForm.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
