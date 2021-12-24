package kr.co.studycafe;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.login.LoginDTO;

@Controller
public class HomeController {
	public HomeController() {
		System.out.println("HomeController 객체 생성");
	}
	
	@RequestMapping("/home.do")
	public ModelAndView home(@SessionAttribute(name="uid", required=false) String uid) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "/index");
		if(uid==null) {
			System.out.println("세션 비었음");
		}else {
			System.out.println("세션 존재"+uid);
			mav.addObject("uid",uid);	
		}
		return mav;
		
		
		
	}
	
	@RequestMapping("/popupguide.do")
	public ModelAndView popupguide() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/popup_guide");
		return mav;
	}
	
}
