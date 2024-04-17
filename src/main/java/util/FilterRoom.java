package util;

import java.util.ArrayList;

import model.OptionVO;
import model.RoomImgVO;

public class FilterRoom {
	
	public static ArrayList<OptionVO> resultFilterRoom(ArrayList<RoomImgVO> imgList, ArrayList<OptionVO> optionList, String checkIn, String checkOut, int priceMin, int priceMax) {
		ArrayList<OptionVO> resultList = new ArrayList<OptionVO>();
		OptionVO optionVO = null;
		java.sql.Date checkInDate = null;
		java.sql.Date checkOutDate = null;
		for (OptionVO data : optionList) {
			if(data.getRoomCost() >= priceMin && data.getRoomCost() <= priceMax) {
				if((checkIn == null && checkOut == null) || (checkIn.equals("") && checkOut.equals("")) || data.getCheckIn() == null) {
					optionVO = insertVOList(imgList, data);
					resultList.add(optionVO);
					continue;
				}
				try {
					
					if((checkIn != null && !checkIn.isEmpty()) && (checkOut != null && !checkOut.isEmpty())) {
						System.out.println("checkIn : " + checkIn + "\ncheckOut : " + checkOut);
						checkInDate = java.sql.Date.valueOf(checkIn);
						checkOutDate = java.sql.Date.valueOf(checkOut);
						if(checkInDate.before(data.getCheckIn()) || checkOutDate.after(data.getCheckOut())) {
							optionVO = insertVOList(imgList, data);
							resultList.add(optionVO);
							continue;
						}
					} 


					if ((checkOut != null) || !checkOut.equals("") || !checkOut.equals(" ")) {
						checkOutDate = java.sql.Date.valueOf(checkOut);
						if(checkOutDate.after(data.getCheckOut())) {
							optionVO = insertVOList(imgList, data);
							resultList.add(optionVO);
							continue;
						}
					}
				} catch (Exception e) {
					System.out.println("resultFilterRoom() ERR : " + e.getMessage());
				}
			}
		}
		return resultList;
	}
	
	private static OptionVO insertVOList(ArrayList<RoomImgVO> imgList, OptionVO data) {
		OptionVO resultVO = new OptionVO();
		resultVO.setRoomNo(data.getRoomNo());
		resultVO.setRoomName(data.getRoomName());
		resultVO.setRoomCost(data.getRoomCost());
		resultVO.setHeadCount(data.getHeadCount());
		for (RoomImgVO imgVO : imgList) {
			if(data.getRoomNo() == imgVO.getRoomNo())
				resultVO.setImg1(imgVO.getImg1());
		}
		return resultVO;
	}
	
}