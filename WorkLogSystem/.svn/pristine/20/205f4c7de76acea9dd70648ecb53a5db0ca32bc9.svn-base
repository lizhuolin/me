package com.poobo.core.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTimeUtil {
	public static SimpleDateFormat DateTime24h=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static SimpleDateFormat YearMonth=new SimpleDateFormat("yyyy-MM");
	public static SimpleDateFormat YearMonth6c=new SimpleDateFormat("yyyyMM");
	public static SimpleDateFormat DateSdf=new SimpleDateFormat("yyyy-MM-dd");
	public static SimpleDateFormat DateSdf8c=new SimpleDateFormat("yyyyMMdd");
	public static SimpleDateFormat TimeSdf=new SimpleDateFormat("HH:mm:ss");
	public static SimpleDateFormat DateTime24hMs=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	public static SimpleDateFormat DateTimeChs=new SimpleDateFormat("yyyy年MM月dd日HH时mm分");
	
	public static String newBlackListDateString() {
		String endTime=DateTime24h.format(newBlackListDate());//截止时间
		return endTime;
	}
	
	public static Date newBlackListDate() {
		Calendar calendar=Calendar.getInstance();
		//calendar.setTime(new Date());
		calendar.add(Calendar.YEAR, 99);
		return calendar.getTime();
	}
	
	public static String nowTime() {
		return DateTimeToString(new Date());
	}
	
	public static String nowTimeChs() {
		return DateTimeToStringChs(new Date());
	}
	
	public static String nowTimeMs() {
		return DateTimeToStringMs(new Date());
	}
	
	public static String DateTimeToString(Date date) {
		return DateTime24h.format(date);
	}
	
	public static String DateTimeToStringChs(Date date) {
		return DateTimeChs.format(date);
	}
	
	public static String DateToString(Date date) {
		return DateSdf.format(date);
	}
	
	public static String DateTimeToStringMs(Date date) {
		return DateTime24hMs.format(date);
	}
	
	public static Date parseDateNoTime(String dateString) throws Exception {
		return DateSdf.parse(dateString);
	}
	
	public static Date parseDate(String dateString) throws Exception {
		return DateTime24h.parse(dateString);
	}
	public static Date parseDateToDay(String dateString) throws Exception {
		return DateSdf.parse(dateString);
	}
	public static Timestamp getNowTimestamp(){
		Date date = new Date();       
		return new Timestamp(date.getTime());
	}
}
