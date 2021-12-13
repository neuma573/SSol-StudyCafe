package kr.co.studycafe.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventCont {
	public EventCont() {
		System.out.println("EventCont");
	}
	
	@RequestMapping("/event.do")
	public ModelAndView eventList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_list");
		return mav;
	}

	
	@RequestMapping("/eventview.do")
	public ModelAndView eventView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_view");
		return mav;
	}
	
	@RequestMapping("/eventwrite.do")
	public ModelAndView eventWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_write");
		return mav;
	}
	
	@RequestMapping("/eventmodify.do")
	public ModelAndView eventModify() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_modify");
		return mav;
	}
}
