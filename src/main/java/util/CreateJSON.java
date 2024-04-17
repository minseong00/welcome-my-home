package util;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.FullCalendarRevVO;
import model.RevVO;

public class CreateJSON {

	
	public static String parseFullCalendarRevVOListToJSON(ArrayList<FullCalendarRevVO> list) {
		JSONArray jsonArray = new JSONArray();
		for(FullCalendarRevVO data : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("revNo", data.getRevNo());
			jsonObject.put("roomNo", data.getRoomNo());
			jsonObject.put("roomName", data.getRoomName());
			jsonObject.put("roomType", data.getRoomType());
			jsonObject.put("checkIn", data.getCheckIn());
			jsonObject.put("checkOut", data.getCheckOut());
			jsonObject.put("backgroundColor", data.getBackgroundColor());
			jsonArray.add(jsonObject);
		}
		return jsonArray.toJSONString();
		
	}
	
	public static String parseRevVOListToJSON(ArrayList<RevVO> list) {
		JSONArray jsonArray = new JSONArray();
		for(RevVO data : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("revNo", data.getRevNo());
			jsonObject.put("revDate", data.getRevDate().toString());
			jsonObject.put("roomNo", data.getRoomNo());
			jsonObject.put("checkIn", data.getCheckIn().toString());
			jsonObject.put("checkOut", data.getCheckOut().toString());
			jsonObject.put("roomName", data.getRoomName());
			jsonObject.put("headCount", data.getHeadCount());
			jsonObject.put("price", data.getPrice());
			jsonObject.put("memId", data.getMemId());
			jsonArray.add(jsonObject);
		}
		return jsonArray.toJSONString();
		
	}
}
