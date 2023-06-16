package com.neuma573.studycafe.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatCont {
	
	@Autowired
	  private SimpMessagingTemplate template;

	    //Client가 SEND할 수 있는 경로
	    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
	    //"/pub/chat/enter"
	    @MessageMapping(value = "/chat/enter")
	    public void enter(ChatMessageDTO message){
	    	System.out.println("입장?1");
	        message.setMessage(message.getWriter() + "님이 채팅방에 참여하였습니다.");
	        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
	    }

	    @MessageMapping(value = "/chat/message")
	    public void message(ChatMessageDTO message){
	    	System.out.println("입장?2");
	        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
	    }
}
