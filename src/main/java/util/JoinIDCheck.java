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
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		String id = (String) request.getParameter("id");
		
		AdminDAO adminDAO = new AdminDAO();
		MemDAO memberDAO = new MemDAO();
		boolean overlappedID = adminDAO.overlappedID(id);
		
		if (overlappedID) {	// 관리자 아이디 체크
			System.out.println("관리자 아이디 중복");
			writer.print("not_usable");
		} else {
			overlappedID = memberDAO.overlappedID(id);
			if(overlappedID) {
				// 회원 아이디 체크
				System.out.println("멤버 아이디 중복");
				writer.print("not_usable");
			} else {
				System.out.println("사용가능 아이디");
				writer.print("usable");
			}
				
		}
		

			
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
