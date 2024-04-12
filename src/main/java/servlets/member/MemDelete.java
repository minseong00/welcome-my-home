package servlets.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String n=request.getParameter("id");
		
		MemVO memModel=new MemVO();
   		memModel.setMem_id(n);
		
		memDAO=new MemDAO();
		memDAO.delete(n);
		
		String sort = request.getParameter("sort");
		RequestDispatcher dispatcher = null;
		if (sort.equals("delMyInfo")) {
			response.sendRedirect("Login");
		}else
			response.sendRedirect(request.getContextPath() + "/MemList");
		
		//String contextPath = request.getContextPath();
		//response.sendRedirect(contextPath+"/MemList");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
