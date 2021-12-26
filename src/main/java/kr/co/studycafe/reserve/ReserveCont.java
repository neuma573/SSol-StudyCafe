package kr.co.studycafe.reserve;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ReserveCont {
	private ReserveDAO dao = null;
	private CalendarUse cal = null;
	
	public ReserveCont() {
		dao = new ReserveDAO();
		System.out.println("====================reserveCont()생성");
	}
	
	@RequestMapping("/reserve/reserve.do")
	ModelAndView reserveView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/reserve/view");
		mav.addObject("storeList", dao.storeList());
		return mav;
	}
	
	@RequestMapping(value = "/calendarUse", method = RequestMethod.GET)
	@ResponseBody
	public Object calStart() throws Exception {
		cal = new CalendarUse();
		Map<String, String> map = new HashMap<String, String>();
		try {
			GregorianCalendar calS = new GregorianCalendar();
			
			//달력 지정 년, 월 초기 값
			map.put("nowYear", Integer.toString(calS.get(Calendar.YEAR)));
			map.put("nowMonth", Integer.toString(calS.get(Calendar.MONTH)+1));
			map.put("nowDate", Integer.toString(calS.get(Calendar.DATE)));
			
			calS.set(calS.get(Calendar.YEAR), calS.get(Calendar.MONTH), 1);
			map.put("start", Integer.toString(calS.get(Calendar.DAY_OF_WEEK)));
			map.put("calTot", Integer.toString(calS.getActualMaximum(Calendar.DATE)));
			
			map.put("week4", cal.weekData(4));
			map.put("week8", cal.weekData(8));
			map.put("week12", cal.weekData(12));
		} catch (Exception e) {
			System.out.println("calStart 실패 : "+e);
		}
		
		return map;
	}
	
	@RequestMapping(value = "/calendarUse", method = RequestMethod.POST)
	@ResponseBody
	public Object calView(int year, int month) throws Exception {
		cal = new CalendarUse();
		CalendarDTO caldto = null;
		Map<String, String> map = new HashMap<String, String>();
		try {
			GregorianCalendar calU = new GregorianCalendar();
			map.put("nowYear", Integer.toString(calU.get(Calendar.YEAR)));
			map.put("nowMonth", Integer.toString(calU.get(Calendar.MONTH)+1));
			map.put("nowDate", Integer.toString(calU.get(Calendar.DATE)));
			caldto = cal.calSet(year, month);
			map.put("start", Integer.toString(caldto.getStart()));
			map.put("calTot", Integer.toString(caldto.getCalTot()));
		} catch (Exception e) {
			System.out.println("calview 실패 : "+e);
		}
		
		return map;
	}
	
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<ReserveDTO> resAjax() throws Exception {
		//store_no, store_name, store_address, room_count, desk_count, box_count
		ArrayList<ReserveDTO> storeList = null;
		try {
			storeList = dao.storeList(); //매장정보
		} catch (Exception e) {
			System.out.println("resAjax 실패 : "+e);
		}
		
		return storeList;
	}
	
	@RequestMapping(value = "/reserveState", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<ReserveDTO> resListAjax(int store_no, String res_date) throws Exception{
		ArrayList<ReserveDTO> resList = null;
		try {
			resList = dao.resList(store_no, res_date);
		}catch (Exception e) {
			System.out.println("resListAjax 실패 : "+e);
		}
		
		return resList;
	}
	
}
