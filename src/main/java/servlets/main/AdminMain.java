package servlets.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemDAO;
import dao.reservation.RevDAO;
import model.MemVO;
import model.RevVO;

/**
 * Servlet implementation class adminMain
 */
@WebServlet("/adminMain")
public class AdminMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminMain() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemDAO memDAO = new MemDAO();
		RevDAO revDAO = new RevDAO();
		
		List<MemVO> memList = memDAO.selectList();
		List<RevVO> revList = revDAO.selectAll();
		
		request.setAttribute("memList", memList);
		request.setAttribute("revList", revList);
		
		request.getRequestDispatcher("/admins/AdminMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
