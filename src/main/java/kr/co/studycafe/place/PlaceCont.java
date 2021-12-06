package kr.co.studycafe.place;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlaceCont {
	public PlaceCont() {
		System.out.println("====================PlaceCont 실행");
	}
	
	@RequestMapping("/place.do")
	public ModelAndView placeView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/view");
		return mav;
	}
}
