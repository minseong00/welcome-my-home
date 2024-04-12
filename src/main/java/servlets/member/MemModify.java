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

@WebServlet("/MemModify")
public class MemModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemDAO memDAO = null;

	public MemModify() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = null;
		if(session.getAttribute("id").equals("admin")) {
			id = request.getParameter("id");			//관리자
		} else {id=(String)session.getAttribute("id");	// 회원
		
	}
		
		memDAO = new MemDAO();
		MemVO memOne = null;
		memOne = memDAO.selectOne(id);

		request.setAttribute("MemOne", memOne);
		// System.out.println("========> MemModifyServlet doGet()");

		String type = request.getParameter("type");
		RequestDispatcher dispatcher = null;
		if (type.equals("MemUpdate")) {	//마이페이지 정보수정
			dispatcher = request.getRequestDispatcher("/members/MyInfo.jsp");
		} else {						//관리자 회원정보수정
			dispatcher = request.getRequestDispatcher("/admin/MemModify.jsp");
		}
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String n = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String call = request.getParameter("call");
		String email = request.getParameter("email");

		MemVO memModel = new MemVO();
		memModel.setMem_id(n);
		memModel.setMem_pw(pw);
		memModel.setMem_name(name);
		memModel.setMem_call(call);
		memModel.setMem_email(email);

		memDAO = new MemDAO();
		memDAO.update(memModel);

		System.out.println("========> MemListServlet doPost()");

		String sort = request.getParameter("sort");
		if (sort.equals("modMyInfo")) {	//마이페이지 정보수정완료 시
			response.sendRedirect(request.getContextPath() + "/MemModify?type=MemUpdate");
		} else {						//관리자 정보수정완료 시
			response.sendRedirect(request.getContextPath() + "/MemList");

		}
	}

}
