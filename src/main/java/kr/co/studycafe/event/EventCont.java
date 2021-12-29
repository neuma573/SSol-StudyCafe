package kr.co.studycafe.event;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.place.PlaceDTO;
import net.utility.UploadSaveManager;

@Controller
public class EventCont {

	private EventDAO dao = null;

	public EventCont() {
		dao = new EventDAO(); // DB연결 객체 생성
		System.out.println("-----EventCont()객체 생성됨");
	}// end

	@RequestMapping("/event.do")
	public ModelAndView eventList( ) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_list");
		mav.addObject("event_list", dao.event_list()); 
		return mav;
	}

	@RequestMapping(value="/eventview.do",method=RequestMethod.GET)
	public ModelAndView eventView(HttpServletRequest req) {
		String en_email=req.getParameter("en_email");
		int e_number=Integer.parseInt(req.getParameter("e_number"));
		EventDTO dto = dao.event_read(e_number);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_view");
		mav.addObject("en_email", en_email);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value="/eventwrite.do", method=RequestMethod.GET)
	public ModelAndView eventWrite(@SessionAttribute(name="uid", required=false) String uid) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_write");
		mav.addObject("uid", uid);
		return mav;
	}

	@RequestMapping(value="/eventwrite.do", method = RequestMethod.POST)
	public ModelAndView eventWrite(@ModelAttribute EventDTO dto, HttpServletRequest req) {
		String en_email=req.getParameter("en_email");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/event/event_r");
		mav.addObject("en_email", en_email);
		String basePath = req.getRealPath("/storage");
		System.out.println(basePath);

			MultipartFile eimgMF = dto.getEimgMF();
			String e_image = UploadSaveManager.saveFileSpring30(eimgMF, basePath);
			dto.setE_image(e_image);
	
			int cnt = dao.event_write(dto);
			
			if (cnt == 0) {
				String msg = "이벤트 등록에 실패했습니다.";
				mav.addObject("msg", msg);
			} else {
				String msg = "이벤트 등록에 성공했습니다.";
				mav.addObject("msg", msg);
			}
			return mav;
	}
	
	@RequestMapping(value="/eventmodify.do", method=RequestMethod.GET)
	public ModelAndView eventModify(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String en_email=req.getParameter("en_email");
		mav.setViewName("/event/event_modify");
		mav.addObject("en_email", en_email);
		
		return mav;
	}

	@RequestMapping(value="/eventmodify.do", method=RequestMethod.POST)
	public ModelAndView eventModifyProc(@ModelAttribute EventDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String en_email=req.getParameter("en_email");
		mav.addObject("en_email", en_email);
		
		String basePath=req.getRealPath("/storage");
		EventDTO oldDTO=dao.event_read(dto.getE_number());

		MultipartFile eimgMF = dto.getEimgMF();
		if(eimgMF.getSize()>0) {
			UploadSaveManager.deleteFile(basePath, oldDTO.getE_image());
			String e_image=UploadSaveManager.saveFileSpring30(eimgMF, basePath);
			dto.setE_image(e_image);
		}else {
			dto.setE_image(oldDTO.getE_image());
		}// if end
		
		
		mav.setViewName("/event/event_r");
		int cnt=dao.event_modify(dto);
		if(cnt==0) {
			String msg="이벤트 수정에 실패했습니다.";
			mav.addObject("msg", msg);
		}else {
			String msg="이벤트 수정에 성공했습니다.";
			mav.addObject("msg", msg);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/eventdelete.do", method=RequestMethod.POST)
	public ModelAndView eventdelete(int e_number, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/event/event_r");
		String en_email=req.getParameter("en_email");
		mav.addObject("en_email", en_email);
		
		EventDTO oldDTO = dao.event_read(e_number);
		int cnt = dao.event_delete(e_number);
		if(cnt==0) {
			String msg="이벤트 삭제에 실패했습니다.";
			mav.addObject("msg", msg);
		}else {
			String msg="이벤트가 삭제되었습니다.";
			mav.addObject("msg", msg);
			
			String basePath = req.getRealPath("/storage");
			UploadSaveManager.deleteFile(basePath, oldDTO.getE_image());
		}
		
		return mav;
	}

}
