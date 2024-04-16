package util;



import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import model.RevVO;


public class Split {
	
	/**
	 * @see FileName Split
	 * @return String
	 */
	public static String FileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String item : items) {
			if(item.trim().startsWith("file")) {
				return item.substring(item.indexOf("=") + 2, item.length() -1);
			}
		}
		return "";
	}
	
	/**
	 * @see split checkIn-checkOut Date
	 * @return String[]
	 */
	public static String[] RangeDate(String date) {
		String[] checkDate = date.split(" ~ ");
		return checkDate;
	}
	
	/**
	 * @see cutting RevDate millis
	 * @return List<RevVO> 
	 */
	public static List<RevVO> cutRevDate(List<RevVO> list) {
		List<RevVO> resultList = new ArrayList<RevVO>();
		for(RevVO data : list) {
			RevVO revVO = new RevVO();
			revVO.setRevNo(data.getRevNo());
			
			long temp1 = data.getRevDate().getTime();
			long temp2 = temp1 - (temp1 % 1000);
			Timestamp result = new Timestamp(temp2);
			
			revVO.setRevDate(result);
			revVO.setRoomNo(data.getRoomNo());
			revVO.setCheckIn(data.getCheckIn());
			revVO.setCheckOut(data.getCheckOut());
			revVO.setRoomName(data.getRoomName());
			revVO.setHeadCount(data.getHeadCount());
			revVO.setPrice(data.getPrice());
			revVO.setMemId(data.getMemId());
			resultList.add(revVO);
		}
		
		return resultList;
	}
}
