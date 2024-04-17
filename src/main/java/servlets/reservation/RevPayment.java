package servlets.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.MemDAO;
import model.MemVO;

@WebServlet("/RevPayment")
public class RevPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RevPayment() {
        super();
    }

	/**
	 * @see 페이지 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see Payment 페이지로 이동
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String tempNum = request.getParameter("roomNo");
		
		if(tempNum == null || tempNum.equals("")) {
			out.print("nullRoomNo");
			return;
		}
		
		int roomNo = Integer.parseInt(tempNum);
		String roomName = request.getParameter("roomName");
		String revDate = request.getParameter("checkDate");
		int headCount = Integer.parseInt(request.getParameter("headCount"));
		int price = Integer.parseInt(request.getParameter("price"));
		String id = (String) session.getAttribute("id");
		
		MemVO memVO = new MemVO();
		MemDAO memDAO = new MemDAO();
		memVO = memDAO.selectOne(id);
		
		request.setAttribute("memVO", memVO);
		request.setAttribute("roomNo", roomNo);
		request.setAttribute("roomName", roomName);
		request.setAttribute("revDate", revDate);
		request.setAttribute("headCount", headCount);
		request.setAttribute("totalPrice", price);
		
		request.getRequestDispatcher("/members/Payment.jsp").forward(request, response);
	}

}
