package kr.co.studycafe.question;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuestionCont {
	public QuestionCont() {
		System.out.println("QuestionCont 객체 생성");
	}
	
	@RequestMapping("/question/question.do")
	public ModelAndView questionForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("question/questionForm");
		return mav;
	}
}