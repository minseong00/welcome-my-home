package servlets.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.MemDAO;

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
		
		RequestDispatcher dispatcher = null;
			if (idType.equals("member")) {
				session.invalidate();
			}
			
		int result = memDAO.delete(n);
			
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
			
		if(result >= 1) 
				out.print("success");
		else
				out.print("fail");	
	
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
