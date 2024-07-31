package servlets.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.reservation.RevDAO;
import dao.room.RoomDAO;
import dao.roomImg.RoomImgDAO;
import model.RevVO;
import model.RoomImgVO;
import model.RoomVO;
import util.CreateJSON;
import util.Split;
import util.PricingService;

@WebServlet("/RevInsert")
public class RevInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RevVO revVO = null;
    private RevDAO revDAO = null;
    private PricingService pricingService = new PricingService(); // PricingService 인스턴스 추가

    public RevInsert() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("calculatePrice".equals(action)) {
            doDynamicPricing(request, response);
        } else {
            HttpSession session = request.getSession(false);
            String idType = (String) session.getAttribute("idType");
            if (session.getAttribute("id") == null || idType == null) {
                response.sendRedirect(request.getContextPath() + "/common/Login.jsp");
                return;
            }
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            String tempNum = request.getParameter("roomNo");
            if (tempNum == null || tempNum.equals("")) {
                out.print("nullRoomNo");
                return;
            }
            int roomNum = Integer.parseInt(tempNum);

            revDAO = new RevDAO();
            RoomImgDAO imgDAO = new RoomImgDAO();
            RoomDAO roomDAO = new RoomDAO();
            RoomImgVO imgVO = new RoomImgVO();
            RoomVO roomVO = new RoomVO();
            ArrayList<RevVO> revList = new ArrayList<RevVO>();

            imgVO = imgDAO.selectOne(roomNum);
            roomVO = roomDAO.selectOne(roomNum);
            revList.addAll(revDAO.selectRoomRev(roomNum));
            String json = CreateJSON.parseRevVOListToJSON(revList);

            request.setAttribute("revList", json);
            request.setAttribute("roomVO", roomVO);
            request.setAttribute("imgVO", imgVO);

            request.getRequestDispatcher("/members/RoomRev.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();

        String memId = (String) session.getAttribute("id");

        if (memId == null || memId.equals("")) {
            out.print("null");
            return;
        }

        String checkDate = request.getParameter("checkDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date_CheckIn = null;
        java.util.Date date_CheckOut = null;
        java.sql.Date sqlDate_CheckIn = null;
        java.sql.Date sqlDate_CheckOut = null;
        revVO = new RevVO();
        revDAO = new RevDAO();

        String[] cutDate = Split.RangeDate(checkDate);
        String revCheckIn = cutDate[0];
        String revCheckOut = cutDate[1];

        try {
            date_CheckIn = dateFormat.parse(revCheckIn);
            date_CheckOut = dateFormat.parse(revCheckOut);

            sqlDate_CheckIn = new java.sql.Date(date_CheckIn.getTime());
            sqlDate_CheckOut = new java.sql.Date(date_CheckOut.getTime());
        } catch (java.text.ParseException e) {
            System.out.println("Rev Insert Parse ERR : " + e.getMessage());
        }

        LocalDateTime currentDateTime = LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(currentDateTime);

        revVO.setRevDate(timestamp);
        revVO.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
        revVO.setCheckIn(sqlDate_CheckIn);
        revVO.setCheckOut(sqlDate_CheckOut);
        revVO.setHeadCount(Integer.parseInt(request.getParameter("headCount")));

        // 다이나믹 프라이싱 적용
        RoomDAO roomDAO = new RoomDAO();
        RoomVO room = roomDAO.selectOne(revVO.getRoomNo());
        double basePrice = room.getRoomCost();
        double dynamicPrice = pricingService.calculateDynamicPrice(revVO.getRoomNo(), sqlDate_CheckIn, sqlDate_CheckOut, basePrice);
        revVO.setPrice((int) dynamicPrice); // double을 int로 변환하여 설정

        revVO.setMemId(memId);

        int result = revDAO.insertRev(revVO);

        if (result == 1)
            out.print("success");
        else
            out.print("fail");
    }

    private void doDynamicPricing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();

        int roomNo = Integer.parseInt(request.getParameter("roomNo"));
        int headCount = Integer.parseInt(request.getParameter("headCount"));
        String checkInStr = request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date_CheckIn = null;
        java.util.Date date_CheckOut = null;
        java.sql.Date sqlDate_CheckIn = null;
        java.sql.Date sqlDate_CheckOut = null;

        try {
            date_CheckIn = dateFormat.parse(checkInStr);
            date_CheckOut = dateFormat.parse(checkOutStr);

            sqlDate_CheckIn = new java.sql.Date(date_CheckIn.getTime());
            sqlDate_CheckOut = new java.sql.Date(date_CheckOut.getTime());
        } catch (java.text.ParseException e) {
            System.out.println("Rev Dynamic Pricing Parse ERR : " + e.getMessage());
        }

        RoomDAO roomDAO = new RoomDAO();
        RoomVO room = roomDAO.selectOne(roomNo);
        double basePrice = room.getRoomCost();
        double dynamicPrice = pricingService.calculateDynamicPrice(roomNo, sqlDate_CheckIn, sqlDate_CheckOut, basePrice);
        
        // 인원 수에 따른 가격 증가
        dynamicPrice += (headCount - 1) * (basePrice * 0.1);

        out.print((int) dynamicPrice); // double을 int로 변환하여 반환
    }
}
