package kr.co.studycafe.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.event.EventDAO;

@Controller
public class MypageCont {
	
	private MypageDAO dao = null;
	public MypageCont() {
		dao = new MypageDAO();
		System.out.println("-----MypageCont()객체 생성됨");
	}// end

	@RequestMapping("/mypage.do")
	public ModelAndView mypageList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/mypage_list");
		return mav;
	}// mypage_list() end

}