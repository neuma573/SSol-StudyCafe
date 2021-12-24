package kr.co.studycafe.reserve;

import java.util.Calendar;

public class CalendarUse {
	private Calendar cal = null;
	
	public CalendarDTO calSet(int year, int month) {
		CalendarDTO caldto = null;
		try {
			cal = Calendar.getInstance();
			caldto = new CalendarDTO();
			// 오늘 날짜 
			caldto.setNowYear(cal.get(Calendar.YEAR));
			caldto.setNowMonth(cal.get(Calendar.MONTH));
			caldto.setNowDate(cal.get(Calendar.DATE));
			
			//달력 지정 년, 월 초기 값
			cal.set(year, month-1 , 1);
			caldto.setStart(cal.get(Calendar.DAY_OF_WEEK));
			caldto.setCalTot(cal.getActualMaximum(Calendar.DATE));
			
		}catch(Exception e){
			System.out.println("달력 실패");
		}
		
		return caldto;
	}
	
}
