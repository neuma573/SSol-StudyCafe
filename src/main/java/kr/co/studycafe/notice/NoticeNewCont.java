package kr.co.studycafe.notice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.place.PlaceDTO;

@Controller
public class NoticeNewCont {
	private NoticeNewDAO dao = null;
	public NoticeNewCont() {
		dao=new NoticeNewDAO();
		System.out.println("=============NoticeNew 실행");
	}
	
	@RequestMapping("/notice/notice.do")
	public ModelAndView noticeList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/notice");
		mav.addObject("noticeList", dao.list());
		return mav;
	}
	
	@RequestMapping(value="/notice/notice_view.do", method=RequestMethod.GET)
	public ModelAndView noticeView(int n_number) {
		NoticeNewDTO dto = dao.read(n_number);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/notice_view");
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value="/notice/notice_modify.do", method=RequestMethod.GET)
	public ModelAndView placeModify(int n_number) {
		ModelAndView mav = new ModelAndView();
		NoticeNewDTO dto = dao.read(n_number);
		mav.setViewName("/notice/notice_modify");
		mav.addObject("dto", dto);
		
		return mav;
	}
	
}
