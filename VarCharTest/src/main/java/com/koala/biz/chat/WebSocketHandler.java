//package com.koala.biz.chat;
//
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//public class WebSocketHandler extends TextWebSocketHandler{
//
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		for(int i=0; i<10;i++) {
//			session.sendMessage(new TextMessage(message.getPayload()));
//			Thread.sleep(1000);
//			
//		}
//	}
//	
//}
