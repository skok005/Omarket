package net.Omarket.chatting;

import java.util.*;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//@ServerEndpoint("/admin")
public class SocketHandler extends TextWebSocketHandler {
	private static String nick =null;		
	static ArrayList<Map<WebSocketSession,String>> socketList = new ArrayList<Map<WebSocketSession,String>>();

	//////세션값 저장소///////
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	//////닉네임값 저장소///////
	static ArrayList<String> nickList = new ArrayList<String>();
   public static void setNick(String id) {
	   nick = id;
   }
   
   public static void addNick(String id) {
	   nickList.add(id);
   }
   
    // afterConnectionEstablished : 웹소켓이 연결되면 호출되는 함수
    // 웹소켓이 연결 되는 것 = 프론트에서 웹소켓이 정확한 경로를 잡아 생성 되는 것
    @Override
    public void afterConnectionEstablished(WebSocketSession session) 
            throws Exception {
       sessionList.add(session);
       System.out.println("session값 : "+session);
        
       for (int i = 0; i < sessionList.size(); i++) {
    	   
         WebSocketSession s = sessionList.get(i);
         System.out.println("---------------");
         System.out.println(s);
//         int num = Integer.parseInt(session.getId());
//         s.sendMessage(new TextMessage(nickList.get(num)+ "님이 입장 했습니다."));         
      }
    }

    // 웹소켓 클라이언트가 텍스트 메세지 전송시 호출되는 메소드
    // WebSocketSession session : 전송 주체 정보가 담긴 세션
    // TextMessage message : 전송 받은 메세지 정보
    @Override
    protected void handleTextMessage(
            WebSocketSession session, TextMessage message) throws Exception {;
       for (int i = 0; i < sessionList.size(); i++) {
         WebSocketSession s = sessionList.get(i);
         int num = Integer.parseInt(session.getId());
         s.sendMessage(new TextMessage(nickList.get(num) + " : " + message.getPayload()));
      }
    }

    
    // afterConnectionClosed : 웹소켓이 연결이 종료되면 호출되는 함수
    // 웹소켓이 연결이 종료 = 세션 종료    
    @Override
    public void afterConnectionClosed(
        WebSocketSession session, CloseStatus status) throws Exception {
    	// 채팅방에서 퇴장한 사용자 세션을 리스트에서 제거
        sessionList.remove(session);

        // 모든 세션에 채팅 전달
        for (int i = 0; i < sessionList.size(); i++) {
           WebSocketSession s = sessionList.get(i);
           int num = Integer.parseInt(session.getId());
           s.sendMessage(new TextMessage(nickList.get(num) + "님이 퇴장 했습니다."));
        }
    }
}