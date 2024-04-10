package servlets.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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

    public Join() {
        super();
        
    }

	/**
	 *  아이디 중복 확인
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		MemDAO member = new MemDAO();
		boolean result = member.overlappedID(id);
		
		if(result == true) {	// result 가 true면 기존 id
			out.write("이미 사용 중 입니다.");
		}else {
			out.write("사용 가능한 ID 입니다.");
			
		}
		
	}
	

	/**
	 * 회원가입
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemVO memVO = new MemVO();
		memVO.setMem_id(request.getParameter("id"));
		memVO.setMem_pw(request.getParameter("pw"));
		memVO.setMem_name(request.getParameter("name"));
		memVO.setMem_call(request.getParameter("call"));
		memVO.setMem_email(request.getParameter("email"));
		
		memDAO = new MemDAO();
		memDAO.insertMember(memVO);

		System.out.println("========> .jsp doPost()");
   		
		response.sendRedirect("/admin/AdminMain.jsp");
	}

}
