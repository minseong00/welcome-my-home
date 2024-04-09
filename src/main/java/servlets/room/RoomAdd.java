package servlets.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.room.RoomDAO;
import model.RoomVO;

/**
 * Servlet implementation class RoomAdd
 */
@WebServlet("/RoomAdd")
public class RoomAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	RoomDAO roomDAO = null;
    
    public RoomAdd() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
