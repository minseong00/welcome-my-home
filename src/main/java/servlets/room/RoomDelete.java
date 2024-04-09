package servlets.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;

/**
 * Servlet implementation class RoomDelete
 */
@WebServlet("/RoomDelete")
public class RoomDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoomDelete() {
        super();
    }

	/**
	 * @see 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoomDAO roomDAO = new RoomDAO();
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		int result = roomDAO.deleteRoom(roomNo);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result >= 1)
			out.print("success");
		else
			out.print("fail");
		
	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
