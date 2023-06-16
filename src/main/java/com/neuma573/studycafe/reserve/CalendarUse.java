package com.neuma573.studycafe.reserve;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class CalendarUse {
	private GregorianCalendar cal = null;
	private GregorianCalendar weekCal = null;
	public CalendarDTO calSet(int year, int month) {
		CalendarDTO caldto = null;
		try {
			//cal = Calendar.getInstance();
			cal = new GregorianCalendar();
			caldto = new CalendarDTO();
			// 오늘 날짜 
			caldto.setNowYear(cal.get(Calendar.YEAR));
			caldto.setNowMonth(cal.get(Calendar.MONTH)+1);
			caldto.setNowDate(cal.get(Calendar.DATE));
			
			//달력 지정 년, 월 초기 값
			cal.set(year, month-1 , 1);
			caldto.setStart(cal.get(Calendar.DAY_OF_WEEK));
			caldto.setCalTot(cal.getActualMaximum(Calendar.DATE));
			
		}catch(Exception e){
			System.out.println("달력 실패");
		}
		
		return caldto;
	}// calSet();
	
	public String weekData(int weekNum) {
		String weekTxt = "";
		weekCal = new GregorianCalendar();
		weekCal.add(Calendar.DATE, (7*weekNum));
		weekTxt+=weekCal.get(Calendar.YEAR)+"-";
		if(weekCal.get(Calendar.MONTH)+1 < 10) {
			weekTxt += "0";
		}
		weekTxt+=weekCal.get(Calendar.MONTH)+1 +"-";
		if(weekCal.get(Calendar.DATE)<10) {
			weekTxt+="0";
		}
		weekTxt+= weekCal.get(Calendar.DATE);
		
		return weekTxt;
	}
	
}
