package servlets.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import dao.admin.AdminDAO;
import model.AdminVO;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HttpSession session = null;
	
    public Login() {
        super();
        
    }

	/**
	 * @see 로그아웃
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath() + "");
		
	}

	/**
	 * @see 로그인
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminVO admin = null;
		AdminDAO adminDAO = new AdminDAO();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//admin = new AdminVO(id, pw);
		
		session = request.getSession();
		boolean overlappedLogin = adminDAO.adminLogin(admin);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); 

		if(overlappedLogin) {
			if(session.isNew() || session.getAttribute("id") == null){
				session.setAttribute("id", admin.getAdmin_id());
				out.print("success");
			}
			else
				out.print("already");
		}else
			out.print("fail");
		
		out.close();
	}

}
