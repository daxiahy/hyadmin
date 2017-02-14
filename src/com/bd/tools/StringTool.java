package com.bd.tools;

public class StringTool {
	public static boolean isEmpty(String str){
		if(null == str){
			return true;
		}
		if(str.trim().equals("")){
			return true;
		}
		return false;
	}
	
	public static boolean isNotEmpty(String str){
		return !isEmpty(str);
	}
}
