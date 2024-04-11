package servlets.room;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
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
import util.SplitName;

@WebServlet("/RoomAdd")
@MultipartConfig
public class RoomAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD = "C:/projectMini/mini_project/src/main/webapp/data"; 

	
	RoomDAO roomDAO = null;
	RoomImgDAO imgDAO = null;
	RoomImgVO imgVO = null;
	RoomVO roomVO = null;
    
    public RoomAdd() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		SplitName splitName = new SplitName();
		
		File uploadDir = new File(UPLOAD);
		// 폴더 없으면 정해진 주소에 폴더 생성
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		ArrayList<String> list = new ArrayList<String>();
		
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			if(part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
				String fileName = splitName.FileName(part);
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
		
		roomVO.setRoomName(request.getParameter("roomName"));
		roomVO.setRoomType(request.getParameter("roomType"));
		roomVO.setHeadCount(Integer.parseInt(request.getParameter("headCount")));
		roomVO.setRoomCost(Integer.parseInt(request.getParameter("roomCost")));
		roomVO.setRoomDetail(request.getParameter("detailText"));
		
		roomDAO.insertRoomData(roomVO);
		
		imgVO.setImg1(list.get(1));
		imgVO.setImg2(list.get(2));
		imgVO.setImg3(list.get(3));
		imgVO.setImg4(list.get(4));
		imgVO.setImg5(list.get(5));
		imgVO.setInfoImg(list.get(0));
		
		imgDAO.insertRoomImg(imgVO);
		
		
//		System.out.println(roomImg.toString());
		
		response.sendRedirect("RoomList");
	
	}	
}
