package servlets.session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemDAO;
import model.MemVO;

@WebServlet("/Join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemDAO memDAO = null;

	public void init() throws ServletException {
		memDAO = new MemDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 회원가입 */
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String call = request.getParameter("call");
		String email = request.getParameter("email");
		
		MemVO memVO = new MemVO();
		memVO.setMem_id(id);
		memVO.setMem_pw(pw);
		memVO.setMem_name(name);
		memVO.setMem_call(call);
		memVO.setMem_email(email);
		memDAO.insert(memVO);
		
		System.out.println("========> MainForm.jsp doPost()");
		
		
		response.sendRedirect(request.getContextPath()  + "/members/MainForm.jsp");
	}
	

}


