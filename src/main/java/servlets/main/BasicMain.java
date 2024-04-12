package servlets.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import model.RoomVO;

/**
 * Servlet 메인 화면 출력 폼
 */
@WebServlet("/BasicMain")
public class BasicMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BasicMain() {
        super();
    }

	/**
	 * @see 메인화면 출력 처리
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoomDAO roomDAO = new RoomDAO();
		List<RoomVO> roomList = roomDAO.selectAll();
		
		request.setAttribute("roomList", roomList);
		
		request.getRequestDispatcher("/members/MainForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
