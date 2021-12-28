package kr.co.studycafe.mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.join.JoinDAO;
import kr.co.studycafe.join.Join_enDTO;
import kr.co.studycafe.question.StoreDAO;
import kr.co.studycafe.question.StoreDTO;

@Controller
public class MypageCont {

	public MypageCont() {
		System.out.println("-----MypageCont()객체 생성됨");
	}

	@RequestMapping("/mypage.do")
	public ModelAndView mypageList(@SessionAttribute(name="uid", required=false) String uid) {
		ModelAndView mav = new ModelAndView();
			
		JoinDAO joindao= new JoinDAO();
		String userType=joindao.userType(uid);
		if(userType.equals("en")) {
			mav.setViewName("/mypage/mypage_en");
			mav.addObject("userInfo", joindao.userInfo_en(uid));
		}else {
			System.out.println(userType);
			mav.setViewName("/mypage/mypage_list");
			mav.addObject("userInfo", joindao.userInfo_in(uid));
		}	
		return mav;
	}
	
	@RequestMapping("/mypage/place_add.do")
	public String placeAdd() {
		return "/mypage/placeForm";
	}
	
	@RequestMapping(value = "/mypage/place_add.do", method = RequestMethod.POST)
	public ModelAndView placeAddProc(@SessionAttribute(name="uid", required=false) String uid,StoreDTO dto,  HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		StoreDAO storedao=new StoreDAO();
		dto.setEn_email(uid);
		
		//임시
		dto.setLatitude(1560.154626455);
		dto.setLongitude(164651.044564152356);
		dto.setStore_img("image1.png");
		
		System.out.println(dto);
		System.out.println("결과 : "+storedao.write(dto));
		mav.setViewName("/mypage/mypage_en");
		return mav;
	}
}