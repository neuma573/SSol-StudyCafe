package kr.co.studycafe.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.join.JoinDAO;
import kr.co.studycafe.question.StoreDAO;

@Controller
public class ChatCont {
	
	public ChatCont() {
		System.out.println("ChatCont 객체 생성");
	}
	
	@GetMapping("/chat")
    public ModelAndView chatGET(String roomId, String uid){
		ModelAndView mav = new ModelAndView();
      
    	StoreDAO storedao = new StoreDAO();
    	JoinDAO joindao = new JoinDAO();
    	mav.setViewName("chat/chat");
   
    	mav.addObject("userName", joindao.userName(uid));
    	mav.addObject("roomId",roomId);
    	mav.addObject("roomName", storedao.storeName(roomId));
    	//System.out.println(storedao.storeName(roomId));
       return mav;
    }
	
	 @RequestMapping(value = "/chat/room", method = RequestMethod.GET)
	    public ModelAndView getRoom(String roomId, String uid){
	    	System.out.println("?????");
	    	StoreDAO storedao = new StoreDAO();
	    	JoinDAO joindao = new JoinDAO();
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("chat/room");
	    	mav.addObject("userName", joindao.userName(uid));
	    	mav.addObject("roomId",roomId);
	    	mav.addObject("roomName", storedao.storeName(roomId));
	       return mav;
	    }

}
