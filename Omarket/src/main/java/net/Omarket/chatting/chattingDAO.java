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
//		System.out.println("createChatroom 메소드");
		temp.insert("chatting.createChatroom", dto);
	}//end
	
	
	//채팅방이 없다면 채팅방과 유저 정보 입력
	public void addChatUser(chattingDTO dto) {
//		System.out.println("addChatUser	 메소드");
		temp.insert("chatting.addChatUser", dto);
	}//end
	
	
	//채팅방 코드 받아오기
	public String getChatroomCode(chattingDTO dto) {
		System.out.println("채팅방 코드 --------------------");
		System.out.println(dto.getU_code());
		System.out.println(dto.getP_code());
//		String you = temp.selectOne("chatting.checkSeller",dto);
//		dto.setYou(you);
		System.out.println(dto.getYou());
		//System.out.println(dto.getCh_code());
		String ch_code = temp.selectOne("chatting.getChatroomCode", dto);
		System.out.println(ch_code);
		System.out.println("채팅방까진 받아옴 -------------");
		return ch_code;
	}//end
	
	
	//상품코드를 통해 판매자 코드 받아오기
	public String getSelleCode(chattingDTO dto) {
		System.out.println("판매자코드 -----------------");
		String seller_code = temp.selectOne("chatting.getSellerCode",dto);
		return seller_code;
	}
	

	//각 메시지마다 insert 시키기
	public void insertMsg(chattingDTO dto) {
		System.out.println("insertMsg");
		System.out.println(dto.getU_code());
		System.out.println(dto.getMsg_content());
		System.out.println(dto.getCh_code());
		temp.insert("chatting.insertMsg", dto);
//		return ch_code;
	}//end
	
	
	//채팅방 실행 시 메시지 뽑아오기
	public List<chattingDTO> selectMsg(chattingDTO dto) {
		List<chattingDTO> list = new ArrayList<chattingDTO>();
		System.out.println("selectMsg 메소드");
		System.out.println("유저코드"+dto.getU_code());
		System.out.println("채널코드"+dto.getCh_code());
		list = temp.selectList("chatting.selectMsg", dto);
		return list;
	}//end
	
	
	public int selectMsgCnt(chattingDTO dto) {
		System.out.println("피코드정보----------" +dto.getP_code());
		System.out.println("유저코드정보---------" +dto.getU_code());
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






