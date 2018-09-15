package com.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

//转换时间的工具类
public class DateConvert {
	
	public String toString(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String time = simpleDateFormat.format(date);
		return time;
	}

}
