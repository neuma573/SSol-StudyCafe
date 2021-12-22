package kr.co.studycafe.reserve;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ReserveCont {
	private ReserveDAO dao = null;
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
	
}
