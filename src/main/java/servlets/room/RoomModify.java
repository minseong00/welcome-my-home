package servlets.room;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.RoomImgVO;
import model.RoomVO;
import util.Split;

/**
 * Servlet implementation class RoomModifyController
 */
@WebServlet("/RoomModify")
@MultipartConfig
public class RoomModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD = "C:/java_project/mini_project/src/main/webapp/data"; 

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
		
		request.getRequestDispatcher("/admins/RoomModify.jsp").forward(request, response);
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
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			if(part.getContentType() != null) {
				String fileName = Split.FileName(part);
				System.out.println(fileName);
				String savePath = UPLOAD + File.separator + fileName;
				try {
					InputStream inputStream = part.getInputStream();
					OutputStream outputStream = new FileOutputStream(savePath);
					
					byte[] buffer = new byte[1024];
					
					int bytesRead;
					if ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					System.out.println("파일이 저장 되었습니다." + savePath);
					
					outputStream.close();
					inputStream.close();
				} catch (IOException e) {
					System.err.println("IOException ERR : " + e.getMessage());
				}
			}
		}

		roomVO.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		roomVO.setRoomName(request.getParameter("roomName"));
		roomVO.setRoomType(request.getParameter("roomType"));
		roomVO.setHeadCount(Integer.parseInt(request.getParameter("headCount")));
		roomVO.setRoomCost(Integer.parseInt(request.getParameter("roomCost")));
		roomVO.setRoomDetail(request.getParameter("detailText"));
		
		roomDAO.roomUpdate(roomVO);
		
		imgVO.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));

		imgVO.setInfoImg(request.getParameter("infoImg_name"));
		imgVO.setImg1(request.getParameter("file1_name"));
		imgVO.setImg2(request.getParameter("file2_name"));
		imgVO.setImg3(request.getParameter("file3_name"));
		imgVO.setImg4(request.getParameter("file4_name"));
		imgVO.setImg5(request.getParameter("file5_name"));
	
		imgDAO.updateImg(imgVO);
		System.out.println(imgVO.toString());
		
		
		
	}
}
