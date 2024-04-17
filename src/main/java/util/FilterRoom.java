package util;

import java.util.ArrayList;

import model.OptionVO;
import model.RoomImgVO;
import model.RoomVO;

public class FilterRoom {
	/** 
	 * 필터 조건에 맞는 룸 리스트 객체 배열 반환
	 * @param ArrayList<RoomImgVO> imgList, ArrayList<OptionVO> optionList, String checkIn, String checkOut, int priceMin, int priceMax
	 * @return ArrayList<OptionVO>
	 * **/
	public static ArrayList<OptionVO> resultFilterRoom(ArrayList<RoomImgVO> imgList, ArrayList<OptionVO> optionList, String checkIn, String checkOut, int priceMin, int priceMax) {
		ArrayList<OptionVO> resultList = new ArrayList<OptionVO>();
		OptionVO optionVO = null;
		java.sql.Date checkInDate = null;
		java.sql.Date checkOutDate = null;
		for (OptionVO data : optionList) {
			if(data.getRoomCost() >= priceMin && data.getRoomCost() <= priceMax) {
				if((checkIn == null && checkIn.isEmpty()) && (checkOut == null && checkOut.isEmpty()) || data.getCheckIn() == null) {
					optionVO = insertOptionVO(imgList, data);
					resultList.add(optionVO);
					continue;
				}
				try {
					
					if((checkIn != null && !checkIn.isEmpty()) && (checkOut != null && !checkOut.isEmpty())) {
						System.out.println("checkIn : " + checkIn + "\ncheckOut : " + checkOut);
						checkInDate = java.sql.Date.valueOf(checkIn);
						checkOutDate = java.sql.Date.valueOf(checkOut);
						if(checkInDate.before(data.getCheckIn()) || checkOutDate.after(data.getCheckOut())) {
							optionVO = insertOptionVO(imgList, data);
							resultList.add(optionVO);
							continue;
						}
					} 


					if ((checkOut != null) || !checkOut.equals("") || !checkOut.equals(" ")) {
						checkOutDate = java.sql.Date.valueOf(checkOut);
						if(checkOutDate.after(data.getCheckOut())) {
							optionVO = insertOptionVO(imgList, data);
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
	
	/** 
	 * OptionVO 객체 리스트 데이터 삽입
	 * @param imgList, data
	 * @return OptionVO
	 * **/
	private static OptionVO insertOptionVO(ArrayList<RoomImgVO> imgList, OptionVO data) {
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
	
	/** 
	 * roomNo가 일치하는 이미지 삽입
	 * @param imgList, optionList
	 * @return ArrayList<OptionVO>
	 * **/
	public static ArrayList<OptionVO> insertOptionList(ArrayList<RoomImgVO> imgList, ArrayList<OptionVO> optionList) {
		ArrayList<OptionVO> resultList = new ArrayList<OptionVO>();
		for (OptionVO optionVO : optionList) {
			OptionVO resultVO = new OptionVO();
			resultVO.setRoomNo(optionVO.getRoomNo());
			resultVO.setRoomName(optionVO.getRoomName());
			resultVO.setRoomCost(optionVO.getRoomCost());
			resultVO.setHeadCount(optionVO.getHeadCount());
			for (RoomImgVO imgVO : imgList) {
				if(optionVO.getRoomNo() == imgVO.getRoomNo())
					resultVO.setImg1(imgVO.getImg1());
			}
			resultList.add(resultVO);
		}
		return resultList;
	}
	
	/** 
	 * roomNo가 일치하는 이미지 삽입
	 * @param imgList, roomList
	 * @return ArrayList<OptionVO>
	 * **/
	public static ArrayList<OptionVO> insertRoomList(ArrayList<RoomImgVO> imgList, ArrayList<RoomVO> roomList) {
		ArrayList<OptionVO> resultList = new ArrayList<OptionVO>();
		for (RoomVO room : roomList) {
			OptionVO resultVO = new OptionVO();
			resultVO.setRoomNo(room.getRoomNo());
			resultVO.setRoomName(room.getRoomName());
			resultVO.setRoomCost(room.getRoomCost());
			resultVO.setHeadCount(room.getHeadCount());
			for (RoomImgVO imgVO : imgList) {
				if(room.getRoomNo() == imgVO.getRoomNo())
					resultVO.setImg1(imgVO.getImg1());
			}
			resultList.add(resultVO);
		}
		return resultList;
	}
	
}