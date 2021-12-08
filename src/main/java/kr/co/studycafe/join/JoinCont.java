package kr.co.studycafe.join;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinCont {
	public JoinCont() {
		System.out.println("JoinCont 객체 생성");
	}
	
	@RequestMapping("/join/join.do")
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join/joinForm");
		return mav;
	}
	
	@RequestMapping("/join/join_detail.do")
	public ModelAndView joinForm(String user) {
		ModelAndView mav = new ModelAndView();
		if(user.equals("in")) {
			mav.setViewName("join/joinForm_detail_in");	
		}else {
			mav.setViewName("join/joinForm_detail_en");
		}
		mav.addObject("user", user);
		return mav;
	}
	
	
	
	
}
	