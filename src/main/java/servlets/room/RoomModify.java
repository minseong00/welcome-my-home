package servlets.room;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.RoomImgVO;
import model.RoomVO;
import util.SplitName;

/**
 * Servlet implementation class RoomModifyController
 */
@WebServlet("/RoomModify")
public class RoomModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD = "C:/projectMini/mini_project/src/main/webapp/data"; 
	
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		File uploadDir = new File(UPLOAD);
		// 폴더 없으면 정해진 주소에 폴더 생성
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		ArrayList<String> list = new ArrayList<String>();
		
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			if(part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
				String fileName = SplitName.FileName(part);
				String filePath = UPLOAD + File.separator + fileName;
				list.add(fileName);
				try {
					InputStream inputStream = part.getInputStream();
					OutputStream outputStream = new FileOutputStream(filePath);
					
					byte[] buffer = new byte[1024];
					int bytesRead;
					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					outputStream.close();
					inputStream.close();
					System.out.println("파일이 저장 되었습니다. " + filePath);
				} catch (IOException e) {
					System.err.println("파일 저장 중 오류 발생 : " + e.getMessage());
				}
			}
		}
		// System.out.println(list.get(0)+ list.get(1) + list.get(2));
		this.roomDAO = new RoomDAO();
		this.imgDAO = new RoomImgDAO();
		this.roomVO = new RoomVO();
		this.imgVO = new RoomImgVO();
		
		roomVO.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		roomVO.setRoomName(request.getParameter("roomName"));
		roomVO.setRoomType(request.getParameter("roomType"));
		roomVO.setHeadCount(Integer.parseInt(request.getParameter("headCount")));
		roomVO.setRoomCost(Integer.parseInt(request.getParameter("roomCost")));
		roomVO.setRoomDetail(request.getParameter("detailText"));
		
		roomDAO.roomUpdate(roomVO);
		
		imgVO.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		imgVO.setInfoImg(list.size() > 0 ? list.get(0) : null);
		imgVO.setImg1(list.size() > 1 ? list.get(1) : null);
		imgVO.setImg2(list.size() > 2 ? list.get(2) : null);
		imgVO.setImg3(list.size() > 3 ? list.get(3) : null);
		imgVO.setImg4(list.size() > 4 ? list.get(4) : null);
		imgVO.setImg5(list.size() > 5 ? list.get(5) : null);
		
		imgDAO.updateImg(imgVO);
		
	}

}
