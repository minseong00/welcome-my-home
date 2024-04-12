package servlets.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemDAO;
import model.MemVO;

/**
 * Servlet implementation class MemList
 */
@WebServlet("/MemList")
public class MemList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemDAO memDAO = null;
	
    public MemList() {
        super();
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		memDAO = new MemDAO();

		ArrayList<MemVO> memList = memDAO.selectList();
		//System.out.println("========> AdminMemServlet doGet()");
		request.setAttribute("MemModel", memList);

		request.getRequestDispatcher("/admin/AdminMemList.jsp").forward(request, response);
	}
}
