package servlets.room;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.RoomImgVO;
import model.RoomVO;

/**
 * Servlet implementation class RoomModifyController
 */
@WebServlet("/RoomModify")
public class RoomModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RoomDAO roomDAO = null;
    RoomImgDAO imgDAO = null;
    RoomVO roomVO = null;
    RoomImgVO imgVO = null;
  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see 관리자 룸 상세 정보(수정) 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNum = Integer.parseInt(request.getParameter("roomNo"));
		
		roomDAO = new RoomDAO();
		roomVO = roomDAO.selectOne(roomNum);
		imgVO = imgDAO.selectOne(roomNum);
		
		request.setAttribute("roomVO", roomVO);
		request.setAttribute("imgVO", imgVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/RoomModify.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see 관리자 룸 수정
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 은정님이 넣으셔야할 코드 insert file
	}

}
