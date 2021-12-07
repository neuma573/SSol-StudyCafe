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
	public ModelAndView placeMap() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/mapview");
		return mav;
	}
	
	@RequestMapping("/placelist.do")
	public ModelAndView placeList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/list");
		return mav;
	}
	
	@RequestMapping("/placeview.do")
	public ModelAndView placeView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/view");
		return mav;
	}
	
	@RequestMapping("/placewrite.do")
	public ModelAndView placeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/write");
		return mav;
	}
	
	@RequestMapping("/placemodify.do")
	public ModelAndView placeModify() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/modify");
		return mav;
	}
}
