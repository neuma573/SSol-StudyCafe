package kr.co.studycafe.notice;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeCont {
	public NoticeCont() {
		System.out.println("NoticeCont 객체 생성");
	}
	
	@RequestMapping("/notice/notice.do")
	public ModelAndView notice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice");
		return mav;
	}

	
	
	
	
	
}
	