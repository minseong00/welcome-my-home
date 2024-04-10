package servlets.room;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.room.RoomDAO;
import model.RoomImgVO;
import model.RoomVO;

@WebServlet("/RoomAdd")
public class RoomAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD = "C:/projectMini/mini_project/src/main/webapp/data/"; 
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 10*1024*1024;
	
	RoomDAO roomDAO = null;
	RoomImgVO roomImg = null;
    
    public RoomAdd() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		File file = new File(UPLOAD);
		if (!file.exists()) {
			file.mkdirs();
		}
		
		MultipartRequest multi =  new MultipartRequest(request, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
		RoomVO roomVO = new RoomVO();
		
		roomVO.setRoomName(multi.getParameter("roomName"));
		roomVO.setRoomType(multi.getParameter("roomType"));
		roomVO.setRoomDetail(multi.getParameter("detailText"));
		roomVO.setHeadCount(Integer.parseInt(multi.getParameter("headCount")));
		roomVO.setRoomCost(Integer.parseInt(multi.getParameter("roomCost")));
		roomDAO = new RoomDAO();
		roomDAO.insertRoomData(roomVO);
		
		roomImg.setImg1(multi.getFilesystemName("file1"));
		roomImg.setImg2(multi.getFilesystemName("file2"));
		roomImg.setImg3(multi.getFilesystemName("file3"));
		roomImg.setImg4(multi.getFilesystemName("file4"));
		roomImg.setImg5(multi.getFilesystemName("file5"));
		roomImg.setInfoImg(multi.getFilesystemName("infoImg"));
		
		
	}	
}
