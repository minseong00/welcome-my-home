package util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.admin.AdminDAO;
import dao.member.MemDAO;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/JoinIDCheck")
public class JoinIDCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinIDCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		String id = (String) request.getParameter("id");
		
			AdminDAO adminDAO = new AdminDAO();
			MemDAO memberDAO = new MemDAO();
			boolean overlappedID = memberDAO.overlappedID(id);
			System.out.println("overlappedID = " + overlappedID);
			
			if (overlappedID) // 회원 아이디 체크
				overlappedID = adminDAO.overlappedID(id);
			else
				writer.print("usable"); // 사용가능한 아이디
			
			if(overlappedID) // 관리자 아이디 체크
				writer.print("not_usable");
			else
				writer.print("usable");
			
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
