package util;

import javax.servlet.http.HttpServletRequest;

public class MainSearchRoom {
    public static String buildRedirectURL(HttpServletRequest request) {
        String contextPath = request.getContextPath();
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String roomType = request.getParameter("roomType");
        String headCount = request.getParameter("headCount");

        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append(contextPath)
                  .append("/RoomList?type=main"); // 공통 부분 추가

        // 선택한 옵션이 있다면 해당 파라미터들을 추가
        if (checkIn != null && !checkIn.isEmpty()) {
            urlBuilder.append("&checkIn=").append(checkIn);
        }
        if (checkOut != null && !checkOut.isEmpty()) {
            urlBuilder.append("&checkOut=").append(checkOut);
        }
        if (roomType != null && !roomType.isEmpty()) {
            urlBuilder.append("&roomType=").append(roomType);
        }
        if (headCount != null && !headCount.isEmpty()) {
            urlBuilder.append("&headCount=").append(headCount);
        }

        return urlBuilder.toString();
    }
}