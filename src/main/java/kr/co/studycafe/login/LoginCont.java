package kr.co.studycafe.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.join.JoinCont;

@Controller
public class LoginCont {
	private LoginDAO dao = null;

	private static final Logger logger = LoggerFactory.getLogger(JoinCont.class);

	public LoginCont() {
		dao = new LoginDAO();
		System.out.println("LoginCont 객체 생성");
	}

	@RequestMapping(value = "/login/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}

	@RequestMapping(value = "/login/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(LoginDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		LoginDTO Dto=null;
		Dto = dao.loginProc(dto);
		System.out.println(Dto);
		if (Dto == null) {
			mav.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.addObject("url", "/login/login.do");
		} else {
			//체크했다면
			 /* 세션 생성 */
		    HttpSession session = req.getSession();
		    if(session.getAttribute("member")!=null){
				session.removeAttribute("member");
			}
		    session.setAttribute("member", Dto);
		    
			mav.addObject("msg", "로그인 성공하셨습니다.");
			mav.addObject("url", "/home.do?user="+Dto.getUser()+"&email=" + Dto.getEmail());
		}
		mav.setViewName("redirect");
		return mav;
	}

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {
		logger.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/home.do";
	}

}
