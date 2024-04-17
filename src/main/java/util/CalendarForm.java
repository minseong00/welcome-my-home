package util;

import java.util.ArrayList;
import java.util.Random;

import model.FullCalendarRevVO;
import model.RevVO;
import model.RoomVO;

public class CalendarForm {
	private final static String[] color = {"#424242", "#8A0868", "#8A0886", "#6A0888",
			"#29088A", "#08298A", "#086A87", "#088A68", "#088A29", "#688A08", "#868A08",
			"#886A08", "#8A2908", "#3B0B0B"};
	
	public static ArrayList<FullCalendarRevVO> FullCalendar(ArrayList<RevVO> revList) {
		ArrayList<FullCalendarRevVO> resultList = new ArrayList<FullCalendarRevVO>();
		Random random = new Random();
		
		for (RevVO revVO : revList) {
			FullCalendarRevVO calendarRevVO = new FullCalendarRevVO();
			int randomIndex = random.nextInt(14);
			calendarRevVO.setRevNo(revVO.getRevNo());
			calendarRevVO.setRoomNo(revVO.getRoomNo());
			calendarRevVO.setRoomName(revVO.getRoomName());
			calendarRevVO.setRoomType(revVO.getRoomType());
			calendarRevVO.setCheckIn(revVO.getCheckIn().toString());
			calendarRevVO.setCheckOut(revVO.getCheckOut().toString());
			calendarRevVO.setBackgroundColor(color[randomIndex]);
			resultList.add(calendarRevVO);
		}
		return resultList;
	}
}
