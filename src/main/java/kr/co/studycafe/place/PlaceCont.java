package kr.co.studycafe.place;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.utility.UploadSaveManager;

@Controller
public class PlaceCont {
	private PlaceDAO dao = null;
	public PlaceCont() {
		dao = new PlaceDAO(); //DB연결 
		System.out.println("====================PlaceCont 실행");
	}
	
	@RequestMapping("/place.do")
	public ModelAndView placeMap(String keyword) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/mapview");
		mav.addObject("list", dao.list(keyword));
		return mav;
	}
	
	@RequestMapping("/reviewlist.do")
	public ModelAndView reviewList(int store_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("revlist", dao.revlist(store_no)); 
		return mav; 
	}
	
	@RequestMapping(value="/placelist.do", method = RequestMethod.GET)
	public ModelAndView placeList(int store_no, String store_name){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/list");
		mav.addObject("revlist", dao.revlist(store_no));
		mav.addObject("store_no", store_no);
		mav.addObject("store_name", store_name);
		return mav;
	}
	
	@RequestMapping(value="/placeview.do", method=RequestMethod.GET)
	public ModelAndView placeView(HttpServletRequest req) {
		String store_name=req.getParameter("store_name");
		int rev_number=Integer.parseInt(req.getParameter("rev_number"));
		PlaceDTO dto = dao.read(rev_number);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/view");
		mav.addObject("store_name", store_name);
		mav.addObject("rev_number", rev_number);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value="/placewrite.do", method=RequestMethod.GET)
	public ModelAndView placeWrite(int store_no, String store_name) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/write");
		mav.addObject("store_no", store_no);
		mav.addObject("store_name", store_name);
		return mav;
	}
	
	@RequestMapping(value="/placewrite.do", method=RequestMethod.POST)
	public ModelAndView placeProc(@ModelAttribute PlaceDTO dto, HttpServletRequest req) {
		int store_no=Integer.parseInt(req.getParameter("store_no"));
		String store_name=req.getParameter("store_name");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/place/placeIns");
		mav.addObject("store_no", store_no);
		mav.addObject("store_name", store_name);
		String basePath=req.getRealPath("/storage");
		System.out.println(basePath);
		
		// 파일 가져오기 
		MultipartFile revimgMF = dto.getRevimgMF();
		String rev_image = UploadSaveManager.saveFileSpring30(revimgMF, basePath);
		dto.setRev_image(rev_image);// 리네임된 파일명 dto 객체에 담기 
		
		int cnt=dao.write(dto);
		if(cnt==0) {
			String msg="리뷰 등록에 실패했습니다.";
			mav.addObject("msg", msg);
		}else {
			String msg="리뷰 등록에 성공했습니다.";
			mav.addObject("msg", msg);
		}
		
		return mav;
	}//placeProc()
	
	
	
	@RequestMapping(value="/placemodify.do", method=RequestMethod.GET)
	public ModelAndView placeModify(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String store_name=req.getParameter("store_name");
		int rev_number=Integer.parseInt(req.getParameter("rev_number"));
		PlaceDTO dto = dao.read(rev_number);
		mav.setViewName("/place/modify");
		mav.addObject("store_name", store_name);
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	@RequestMapping(value="/placemodify.do", method=RequestMethod.POST)
	public ModelAndView placeModifyProc(@ModelAttribute PlaceDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String store_name=req.getParameter("store_name");
		int rev_number = Integer.parseInt(req.getParameter("rev_number"));
		mav.addObject("store_name", store_name);
		mav.addObject("store_no", dto.getStore_no());
		
		String basePath=req.getRealPath("/storage");
		PlaceDTO oldDTO=dao.read(dto.getRev_number()); //기존 저장된 정보

		MultipartFile revimgMF = dto.getRevimgMF();
		if(revimgMF.getSize()>0) {//새로운 이미지 파일이 첨부되서 전송됐는지?
			UploadSaveManager.deleteFile(basePath, oldDTO.getRev_image());
			String rev_image=UploadSaveManager.saveFileSpring30(revimgMF, basePath);
			dto.setRev_image(rev_image);
		}else {
			dto.setRev_image(oldDTO.getRev_image()); //기존에 저장된 파일명 
		}// if end
		
		
		mav.setViewName("/place/placeIns");
		int cnt=dao.modify(dto);
		if(cnt==0) {
			String msg="리뷰 수정에 실패했습니다.";
			mav.addObject("msg", msg);
		}else {
			String msg="리뷰 수정에 성공했습니다.";
			mav.addObject("msg", msg);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/placedelete.do", method=RequestMethod.POST)
	public ModelAndView deleteProc(int rev_number, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/place/placeIns");
		String store_name=req.getParameter("store_name");
		int store_no=Integer.parseInt(req.getParameter("store_no"));
		
		mav.addObject("store_name", store_name);
		mav.addObject("store_no", store_no);
		
		PlaceDTO oldDTO = dao.read(rev_number);
		int cnt = dao.delete(rev_number);
		if(cnt==0) {
			String msg="리뷰 삭제에 실패했습니다.";
			mav.addObject("msg", msg);
		}else {
			String msg="리뷰가 삭제되었습니다.";
			mav.addObject("msg", msg);
			
			String basePath = req.getRealPath("/storage");
			UploadSaveManager.deleteFile(basePath, oldDTO.getRev_image());
		}
		
		return mav;
	}
	

	
	
	
	
	
	
}
