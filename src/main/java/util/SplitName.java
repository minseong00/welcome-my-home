package util;

import javax.servlet.http.Part;

public class SplitName {
	public SplitName(){
		
	}
	
	
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
