package servlets.session;

import java.io.IOException;
import java.io.PrintWriter;

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
	 *  @see 아이디 중복 확인
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = (String)request.getParameter("id");
		memDAO = new MemDAO();
		
		boolean overlappedID = memDAO.overlappedID(id);
		
		if(overlappedID) {
			out.print("not_usable");
			System.out.println("mem 값 있음");
		}
		else {
			MemDAO memDAO = new MemDAO();
			overlappedID = memDAO.overlappedID(id);
			
			if(overlappedID) {
				out.print("not_usable");
				System.out.println("admin 값 있음");
			}
			else
				out.print("usable");
		}
	}
	

	/**
	 * @see 회원가입
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

		System.out.println("" + request.getParameter(""));
	}

}
