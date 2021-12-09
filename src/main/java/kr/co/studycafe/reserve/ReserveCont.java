package kr.co.studycafe.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReserveCont {
	public ReserveCont() {
		System.out.println("====================reserveCont()생성");
	}
	@RequestMapping("/reserve/reserve.do")
	ModelAndView reserveView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/reserve/view");
		return mav;
	}
	
}
