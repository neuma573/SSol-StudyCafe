package kr.co.studycafe.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginCont {
	public LoginCont() {
		System.out.println("LoginCont 객체 생성");
	}
	
	@RequestMapping("/login/login.do")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/loginForm");
		return mav;
	}// list() end
}
	