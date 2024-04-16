package util;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.FullCalendarRevVO;
import model.RoomVO;

public class CreateJSON {

	
	public static String parseFullCalendarRevVOListToJSON(ArrayList<FullCalendarRevVO> list) {
		JSONArray jsonArray = new JSONArray();
		for(FullCalendarRevVO data : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("bookNo", data.getRevNo());
			jsonObject.put("roomNo", data.getRoomNo());
			jsonObject.put("roomName", data.getRoomName());
			jsonObject.put("bookCheck", data.getCheckIn());
			jsonObject.put("bookCheckOut", data.getCheckOut());
			jsonObject.put("backgroundColor", data.getBackgroundColor());
			jsonArray.add(jsonObject);
		}
		return jsonArray.toJSONString();
		
	}
}
