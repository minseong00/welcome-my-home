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


@WebServlet("/RoomDetail")
public class RoomDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
    public RoomDetail() {
        super();
    }

	/**
	 * @see 회원 룸 상세정보 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNum = Integer.parseInt(request.getParameter("roomNo"));
	    RoomDAO roomDAO = new RoomDAO();
	    RoomImgDAO imgDAO = new RoomImgDAO();
	    RoomVO roomVO = new RoomVO();
	    RoomImgVO imgVO = new RoomImgVO();
	    
		roomVO = roomDAO.selectOne(roomNum);
		imgVO = imgDAO.selectOne(roomNum);
		
//		System.out.println(imgVO.toString());
//		System.out.println(roomVO.toString());
		
		request.setAttribute("roomVO", roomVO);
		request.setAttribute("imgVO", imgVO);
		
		request.getRequestDispatcher("/members/RoomDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
