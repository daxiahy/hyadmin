package com.bd.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTool {
	public static SimpleDateFormat getSdf(String fmt){
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern(fmt);
		return sdf;
	}
	
	public static String getNow(String fmt){
		return getSdf(fmt).format(new Date());
	}
	
	public static String getNow(){
		return getNow("yyyyMMddhhmmss");
	}

	/**
	 * 功能描述：将日期字符串格式化为新的格式
	 * @param strDate 待格式化日期字符串
	 * @param oldFmt 日期原有的格式
	 * @param newFmt 新格式
	 * @return
	 */
	public static String fmtDate(String strDate,String oldFmt,String newFmt){
		try {
			Date date = getSdf(oldFmt).parse(strDate);
			return getSdf(newFmt).format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strDate;
	}
	
}
