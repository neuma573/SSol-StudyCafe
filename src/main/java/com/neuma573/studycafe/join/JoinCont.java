package com.neuma573.studycafe.join;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinCont {
	private JoinDAO dao = null;

	private static final Logger logger = LoggerFactory.getLogger(JoinCont.class);

	@Autowired
	private JavaMailSender mailSender;

	public JoinCont() {
		dao = new JoinDAO();
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
		if (user.equals("in")) {
			mav.setViewName("join/joinForm_detail_in");
		} else {
			mav.setViewName("join/joinForm_detail_en");
		}
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/join/join_detail_in.do", method = RequestMethod.POST)
	public ModelAndView joinProc(Join_inDTO dto,  HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto);
		int join=dao.joinProc_in(dto);
		mav.setViewName("login/loginForm");	
		return mav;
	}
	
	@RequestMapping(value = "/join/join_detail_en.do", method = RequestMethod.POST)
	public ModelAndView joinProc(Join_enDTO dto,  HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto);
		int join=dao.joinProc_en(dto);
		mav.setViewName("login/loginForm");	
		return mav;
	}
	

	/* 이메일 중복 */
	@RequestMapping(value = "/mail_du_Check", method = RequestMethod.GET)
	@ResponseBody
	public int mail_du_CheckGET(String email, String user) throws Exception {
	
		/* 뷰(View)로부터 넘어온 데이터 확인 */
       logger.info("이메일 데이터 전송 확인");
       logger.info("인증번호 : " + email);
       
       int check=dao.emailCheck(email, user);
		return check;
	}
	
	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
       logger.info("이메일 데이터 전송 확인");
       logger.info("인증번호 : " + email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		String setFrom = "dbsdud1025@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다:D";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는" + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요!";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);
		
		return num;
	}

}
