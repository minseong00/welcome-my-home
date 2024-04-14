package servlets.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.RoomImgVO;
import model.RoomVO;
import util.Split;

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
		RoomImgDAO imgDAO = new RoomImgDAO();
		ArrayList<RoomImgVO> imgList = imgDAO.selectAll();
		ArrayList<RoomVO> roomList = roomDAO.selectAll();
		
        List<RoomImgVO> processedImgList = Split.ImgSplitList(imgList);
        List<RoomVO> processedRoomList = Split.RoomSplitList(roomList);
		
		request.setAttribute("roomList", processedRoomList);
		request.setAttribute("imgList", processedImgList);
		
		request.getRequestDispatcher("/members/MainForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
