package kr.co.studycafe.notice;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeCont {
	private NoticeDAO dao = null;

	public NoticeCont() {
		dao = new NoticeDAO();
		System.out.println("NoticeCont 객체 생성");
	}

	@RequestMapping("/notice/notice.do")
	public ModelAndView notice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice");
		return mav;
	}

	@RequestMapping("/notice/notice_view.do")
	public ModelAndView noticeView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice_view");
		return mav;
	}

	@RequestMapping("/notice/notice_write.do")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice_write");
		return mav;
	}

	@RequestMapping(value = "/notice/submit.do", method = RequestMethod.POST)
	public ModelAndView noticePro(@SessionAttribute(name = "uid", required = false) String uid, NoticeDTO dto,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("uid", uid);
		System.out.println(dto);
		int post = dao.post(dto);
		mav.setViewName("notice/notice_write");

		return mav;
	}

	@RequestMapping("/notice/notice_modify.do")
	public ModelAndView noticeModify() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice_modify");
		return mav;
	}

}
