package servlets.session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.session.SessionDAO;

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginCheck() {
        super();
    }

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
