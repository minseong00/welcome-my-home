package util;

import java.util.ArrayList;

import javax.servlet.http.Part;

import model.RoomImgVO;
import model.RoomVO;

public class Split {
	public Split(){
		
	}
	
	/**
	 * @see FileName Split
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
	 * @see Room Img list Split to 6 
	 */
	public static ArrayList<RoomImgVO> ImgSplitList(ArrayList<RoomImgVO> list) {
	    ArrayList<RoomImgVO> rsList = new ArrayList<>();
	    
	    if (list.size() > 6) {
	        rsList.addAll(list.subList(0, 6));
	    } else {
	        rsList.addAll(list);
	    }
	    
	    return rsList;
	}
	
	/**
	 * @see Room list Split to 6
	 */
	public static ArrayList<RoomVO> RoomSplitList(ArrayList<RoomVO> list) {
	    ArrayList<RoomVO> rsList = new ArrayList<>();
	    
	    if (list.size() > 6) {
	        rsList.addAll(list.subList(0, 6));
	    } else {
	        rsList.addAll(list);
	    }
	    
	    return rsList;
	}
	
	
}
