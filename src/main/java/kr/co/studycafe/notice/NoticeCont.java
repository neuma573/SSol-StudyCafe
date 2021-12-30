package kr.co.studycafe.notice;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import net.utility.UploadSaveManager;



@Controller
public class NoticeCont {
	private NoticeDAO dao = null;
	
	public NoticeCont() {
		dao = new NoticeDAO();
		
		System.out.println("NoticeCont 객체 생성");
	}
	/*
	@RequestMapping("/notice/notice.do")
	public ModelAndView notice(@SessionAttribute(name = "uid", required = false) String uid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("uid", uid);
		mav.addObject("Notice_list", dao.Notice_list()); 
		mav.setViewName("notice/notice");
		return mav;
	}

	@RequestMapping(value="/notice/notice_view.do",method=RequestMethod.GET)
	public ModelAndView noticeView(@SessionAttribute(name = "uid", required = false) String uid, HttpServletRequest req) {
		int n_number=Integer.parseInt(req.getParameter("n_number"));
		NoticeDTO dto = dao.Notice_read(n_number);
		ModelAndView mav = new ModelAndView();
		mav.addObject("uid", uid);
		mav.setViewName("/notice/notice_view");
		mav.addObject("dto", dto);
		return mav;
	}

	@RequestMapping("/notice/notice_write.do")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice_write");
		return mav;
	}

	@RequestMapping(value = "/notice/submit.do", method = RequestMethod.POST)
	public ModelAndView noticePost(@SessionAttribute(name = "uid", required = false) String uid, NoticeDTO dto,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("en_email", uid);
		dto.setEn_email(uid);
		System.out.println(dto);
		System.out.println(uid);
		int post = dao.notice_post(dto);
		mav.setViewName("notice/notice_write");
		return mav;
	}

	
	@RequestMapping(value="/notice/notice_modify.do", method=RequestMethod.GET)
	public ModelAndView noticeModify(@SessionAttribute(name = "uid", required = false) String uid, HttpServletRequest req) {
		int n_number=Integer.parseInt(req.getParameter("n_number"));
		NoticeDTO dto = dao.Notice_modify(n_number);
		ModelAndView mav = new ModelAndView();
		mav.addObject("uid", uid);
		mav.setViewName("notice/notice_modify");
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value = "/notice/notice_modifySubmit.do", method = RequestMethod.POST)
	public ModelAndView noticeModifyPost(@SessionAttribute(name = "uid", required = false) String uid, NoticeDTO dto,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("en_email", uid);
		dto.setEn_email(uid);
		System.out.println(dto);
		System.out.println(uid);
		int notice_modify_post = dao.notice_modify_post(dto);
		mav.setViewName("notice/notice_modify");
		return mav;
	}
	
	@RequestMapping(value = "/notice/notice_delete.do", method = RequestMethod.POST)
	public ModelAndView noticeDelete(@SessionAttribute(name = "uid", required = false) String uid, NoticeDTO dto,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("en_email", uid);
		dto.setEn_email(uid);
		System.out.println(dto);
		System.out.println(uid);
		System.out.println("삭제완료");
		int notice_delete = dao.notice_delete(dto);
		mav.setViewName("notice/notice_delete");
		return mav;

	}*/

}
