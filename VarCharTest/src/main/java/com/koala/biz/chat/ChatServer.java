package com.koala.biz.chat;


import java.io.IOException;


import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

// @ServerEndpoint 어노테이션으로 웹소켓 서버의 요청명을 지정.
// 지정한 요청명으로 접속하는 클라이언트를 해당 클래스가 처리하게 되는데 요청명이 "/ChatingServer"이므로
// 이 웹소켓에 접속하기 위한 전체 URL 이와 같다. ==> ws://호스트:포트번호/컨텍스트루트/ChatingServer
@ServerEndpoint("/ChatingServer")
public class ChatServer {
    private static Set<Session> clients
            = Collections.synchronizedSet(new HashSet<Session>()); // 새로 접속한 사용자의 세션을 저장할 컬렉션을 생성해야 한다.
    															   // Collections 클래스의 synchronizedSet()메소드는 멀티 스레드 환경에서도 안전한 Set컬렉션을 생성해준다.
    															   // 이 때문에 여러 사용자가 동시에 접속해도 문제가 생기지 않도록 동기화해주는 것이다.

    // @OnOpen은 사용자가 접속했을 때 실행할 메소드를 정의해준다.
    @OnOpen  // 웹소캣 클라이언트 접속 시 실행
    public void onOpen(Session session) { // 정의해주고자하는 메소드에서는 단순히 사용자 컬렉션에 사용자의 세션을 추가해준다.
        clients.add(session);  // 사용자의 세션을 추가
        System.out.println("웹소켓 연결:" + session.getId());
    }

    // @OnMessage는 사용자로부터 메시지를 받았을 때 실행할 메소드를 정의한다. 사용자가 보낸 메시지와 사용자와 연결된 세션이 매개변수로 넘어온다.
    @OnMessage  // 메시지를 받으면 실행
    public void onMessage(String message, Session session) throws IOException {
        System.out.println("메시지 전송 : " + session.getId() + ":" + message);
        synchronized (clients) {
            for (Session client : clients) {  // 모든 클라이언트에게 메시지를 전달
                if (!client.equals(session)) {  // 단, 메시지를 보낸 클라이언트는 제외하고 전달
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    // @OnClose는 사용자가 접속을 종료했을 때 실행할 메소드를 정의해준다.
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);  // 세션 삭제
        System.out.println("웹소켓 종료 : " + session.getId());
    }

    @OnError  // 에러 발생 시 실행
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }
}
