package servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginCheck
 */
@WebServlet("/admin/*")
public class AdminLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public AdminLoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		boolean result = false;
		
		if(session == null || session.getAttribute("id") == null) result = false;
			
		String idType = (String) session.getAttribute("idType");
		if(idType == null || !idType.equals("admin")) result = false;
		
		if(idType.equals("admin")) result = true;
		
		if(!result) {
			request.setAttribute("message", "세션이 만료되었습니다. 다시 로그인해주세요.");
			session.invalidate();
			request.getRequestDispatcher("/members/MainForm.jsp").forward(request, response);
			return;
		}

		String reqURI = request.getRequestURI().substring(19);
		System.out.println("temp : " + reqURI);
		request.getRequestDispatcher(reqURI).forward(request, response);
	}
}
