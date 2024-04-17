package servlets.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.MemDAO;
import model.MemVO;

@WebServlet("/MemDelete")
public class MemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemDAO memDAO=null;
	
    public MemDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String idType = (String) session.getAttribute("idType");
		String n=request.getParameter("id");
		
		memDAO=new MemDAO();
		memDAO.delete(n);
		
		RequestDispatcher dispatcher = null;
			if (idType.equals("member")) {
				session.invalidate();
			}
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
