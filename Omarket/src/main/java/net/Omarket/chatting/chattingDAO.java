package net.Omarket.chatting;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class chattingDAO {

	@Autowired
	SqlSessionTemplate temp;
	
	public void chattingInsert(chattingDTO dto) {
		temp.insert("chatting.add", dto);
	}//end
	
	public void createChatroom(chattingDTO dto) {
//		System.out.println("createChatroom �޼ҵ�");
		temp.insert("chatting.createChatroom", dto);
	}//end
	
	
	//ä�ù��� ���ٸ� ä�ù�� ���� ���� �Է�
	public void addChatUser(chattingDTO dto) {
//		System.out.println("addChatUser	 �޼ҵ�");
		temp.insert("chatting.addChatUser", dto);
	}//end
	
	
	//ä�ù� �ڵ� �޾ƿ���
	public String getChatroomCode(chattingDTO dto) {
		System.out.println("ä�ù� �ڵ� --------------------");
		System.out.println(dto.getU_code());
		System.out.println(dto.getP_code());
//		String you = temp.selectOne("chatting.checkSeller",dto);
//		dto.setYou(you);
		System.out.println(dto.getYou());
		//System.out.println(dto.getCh_code());
		String ch_code = temp.selectOne("chatting.getChatroomCode", dto);
		System.out.println(ch_code);
		System.out.println("ä�ù���� �޾ƿ� -------------");
		return ch_code;
	}//end
	
	
	//��ǰ�ڵ带 ���� �Ǹ��� �ڵ� �޾ƿ���
	public String getSelleCode(chattingDTO dto) {
		System.out.println("�Ǹ����ڵ� -----------------");
		String seller_code = temp.selectOne("chatting.getSellerCode",dto);
		return seller_code;
	}
	

	//�� �޽������� insert ��Ű��
	public void insertMsg(chattingDTO dto) {
		System.out.println("insertMsg");
		System.out.println(dto.getU_code());
		System.out.println(dto.getMsg_content());
		System.out.println(dto.getCh_code());
		temp.insert("chatting.insertMsg", dto);
//		return ch_code;
	}//end
	
	
	//ä�ù� ���� �� �޽��� �̾ƿ���
	public List<chattingDTO> selectMsg(chattingDTO dto) {
		List<chattingDTO> list = new ArrayList<chattingDTO>();
		System.out.println("selectMsg �޼ҵ�");
		System.out.println("�����ڵ�"+dto.getU_code());
		System.out.println("ä���ڵ�"+dto.getCh_code());
		list = temp.selectList("chatting.selectMsg", dto);
		return list;
	}//end
	
	
	public int selectMsgCnt(chattingDTO dto) {
		System.out.println("���ڵ�����----------" +dto.getP_code());
		System.out.println("�����ڵ�����---------" +dto.getU_code());
		int count = temp.selectOne("chatting.selectMsgCnt", dto);
		return count;
	}//end
	
	
	public List<chattingDTO> getChatList(String u_code){
		List<chattingDTO> list = new ArrayList<chattingDTO>();
		list = temp.selectList("chatting.chatroomlist",u_code);	
		return list;
		
	}
	
	public List<chattingDTO> getChatRoom(chattingDTO dto){
		List<chattingDTO> list = new ArrayList<chattingDTO>();
		list = temp.selectList("chatting.selectRoomMsg",dto);	
		return list;
		
	}
	
	public String getUserNick(String u_code) {
		String u_nick = temp.selectOne("chatting.getUserNick",u_code);
		
		return u_nick;
	}
	public String getUserCode(String u_nick) {
		String u_code = temp.selectOne("chatting.getUserCode",u_nick);
		return u_code;
	}
}//class END






