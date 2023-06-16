package com.neuma573.studycafe.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuestionCont {
	private StoreDAO dao= null;
	
	public QuestionCont() {
		dao=new StoreDAO();
		System.out.println("QuestionCont 객체 생성");
	}
	
	@RequestMapping("/question/question.do")
	public ModelAndView questionForm(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("question/questionForm");
		
		HttpSession session = req.getSession();
	    if(session.getAttribute("uid")==null) {
	    	//System.out.println("que세션 ㄴ");
	    }else{
	    	//System.out.println("que세션 o"+session.getAttribute("uid"));
	    	mav.addObject("uid", session.getAttribute("uid"));
	    }	
		mav.addObject("list",dao.StoreList());
		
		return mav;
	}
}