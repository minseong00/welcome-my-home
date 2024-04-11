package servlets.room;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	private static final String UPLOAD = "C:/projectMini/mini_project/src/main/webapp/data"; 
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 10*1024*1024;
	
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
		
		roomVO = new RoomVO();
		imgVO = new RoomImgVO();
		roomDAO = new RoomDAO();
		imgDAO = new RoomImgDAO();
		
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		roomDAO = new RoomDAO();
		imgDAO = new RoomImgDAO();
		roomVO = new RoomVO();
		imgVO = new RoomImgVO();
		
		File uploadDir = new File(UPLOAD);
		// 폴더 없으면 정해진 주소에 폴더 생성
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		MultipartRequest multi =  new MultipartRequest(request, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
		
		roomVO.setRoomNo(Integer.parseInt(multi.getParameter("roomNo")));
		roomVO.setRoomName(multi.getParameter("roomName"));
		roomVO.setRoomType(multi.getParameter("roomType"));
		roomVO.setHeadCount(Integer.parseInt(multi.getParameter("headCount")));
		roomVO.setRoomCost(Integer.parseInt(multi.getParameter("roomCost")));
		roomVO.setRoomDetail(multi.getParameter("detailText"));
		
		roomDAO.roomUpdate(roomVO);
		
		imgVO.setInfoImg(multi.getFilesystemName("infoImg"));
		imgVO.setInfoImg(multi.getFilesystemName("file1"));
		imgVO.setInfoImg(multi.getFilesystemName("file2"));
		imgVO.setInfoImg(multi.getFilesystemName("file3"));
		imgVO.setInfoImg(multi.getFilesystemName("file4"));
		imgVO.setInfoImg(multi.getFilesystemName("file5"));
		
		imgDAO.updateImg(imgVO);
		
		
		
		
	}

}
