package com.poobo.core.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
	public static String byteToHex(byte[] data) {
		StringBuilder strBuilder=new StringBuilder();
		for(byte b:data) {
			strBuilder.append(String.format("%02x", b));
		}
		return strBuilder.toString();
	}
	
	public static String UrlEncode(String url) {
		String result=url;
		try {
			result=URLEncoder.encode(url, "utf8");
		} catch (UnsupportedEncodingException e) {
		}
		return result;
	}
	
	public static String boolToChinese(boolean b) {
		if(b) return "是";
		else return "否";
	}
	
	/**
	 * 判断字符是否为数字
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str){ 
		   Pattern pattern = Pattern.compile("[0-9]*"); 
		   Matcher isNum = pattern.matcher(str);
		   if( !isNum.matches() ){
		       return false; 
		   } 
		   return true; 
	}
}
