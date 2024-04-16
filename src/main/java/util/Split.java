package util;


import javax.servlet.http.Part;


public class Split {
	
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
	
	public static String[] RangeDate(String date) {
		String[] checkDate = date.split(" ~ ");
		return checkDate;
	}
}
