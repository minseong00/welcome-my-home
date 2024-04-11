package servlets.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemDAO;
import model.MemVO;


@WebServlet("/MemModify")
public class MemModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemDAO memDAO=null;
	
    public MemModify() {
        super();
    }
        
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		 String n = request.getParameter("id");

   		MemVO memList=new MemVO();
   		memList.setMem_id(n);
   		 
   		memDAO = new MemDAO();
   		MemVO memOne = memDAO.selectOne(n);
   		
   		request.setAttribute("MemOne", memOne);
   		//System.out.println(memOne.toString());
   		
   		//System.out.println("========> MemModifyServlet doGet()");
   		RequestDispatcher rd = request.getRequestDispatcher("/admin/MemModify.jsp");
   		rd.forward(request, response);

   	}

   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		request.setCharacterEncoding("utf-8");
   		
   		String n=request.getParameter("id");
   		String pw = request.getParameter("pw");
   		String name = request.getParameter("name");
   		String call = request.getParameter("call");
   		String email = request.getParameter("email");
 
   		MemVO memModel=new MemVO();
   		memModel.setMem_id(n);
   		memModel.setMem_pw(pw);
   		memModel.setMem_name(name);
   		memModel.setMem_call(call);
   		memModel.setMem_email(email);
   	
   		memDAO=new MemDAO();
   		memDAO.update(memModel);
   		
   		System.out.println("========> MemListServlet doPost()");
   		
   		RequestDispatcher rd = request.getRequestDispatcher("MemList");
   		rd.forward(request, response);
   		
   		
   	}

   }
