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
	
	
}
