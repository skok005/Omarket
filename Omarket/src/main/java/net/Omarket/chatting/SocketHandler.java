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

	//////���ǰ� �����///////
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	//////�г��Ӱ� �����///////
	static ArrayList<String> nickList = new ArrayList<String>();
   public static void setNick(String id) {
	   nick = id;
   }
   
   public static void addNick(String id) {
	   nickList.add(id);
   }
   
    // afterConnectionEstablished : �������� ����Ǹ� ȣ��Ǵ� �Լ�
    // �������� ���� �Ǵ� �� = ����Ʈ���� �������� ��Ȯ�� ��θ� ��� ���� �Ǵ� ��
    @Override
    public void afterConnectionEstablished(WebSocketSession session) 
            throws Exception {
       sessionList.add(session);
       System.out.println("session�� : "+session);
        
       for (int i = 0; i < sessionList.size(); i++) {
    	   
         WebSocketSession s = sessionList.get(i);
         System.out.println("---------------");
         System.out.println(s);
//         int num = Integer.parseInt(session.getId());
//         s.sendMessage(new TextMessage(nickList.get(num)+ "���� ���� �߽��ϴ�."));         
      }
    }

    // ������ Ŭ���̾�Ʈ�� �ؽ�Ʈ �޼��� ���۽� ȣ��Ǵ� �޼ҵ�
    // WebSocketSession session : ���� ��ü ������ ��� ����
    // TextMessage message : ���� ���� �޼��� ����
    @Override
    protected void handleTextMessage(
            WebSocketSession session, TextMessage message) throws Exception {;
       for (int i = 0; i < sessionList.size(); i++) {
         WebSocketSession s = sessionList.get(i);
         int num = Integer.parseInt(session.getId());
         s.sendMessage(new TextMessage(nickList.get(num) + " : " + message.getPayload()));
      }
    }

    
    // afterConnectionClosed : �������� ������ ����Ǹ� ȣ��Ǵ� �Լ�
    // �������� ������ ���� = ���� ����    
    @Override
    public void afterConnectionClosed(
        WebSocketSession session, CloseStatus status) throws Exception {
    	// ä�ù濡�� ������ ����� ������ ����Ʈ���� ����
        sessionList.remove(session);

        // ��� ���ǿ� ä�� ����
        for (int i = 0; i < sessionList.size(); i++) {
           WebSocketSession s = sessionList.get(i);
           int num = Integer.parseInt(session.getId());
           s.sendMessage(new TextMessage(nickList.get(num) + "���� ���� �߽��ϴ�."));
        }
    }
}