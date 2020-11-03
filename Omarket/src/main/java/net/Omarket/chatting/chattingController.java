package net.Omarket.chatting;

import java.net.http.HttpRequest;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.handler.TextWebSocketHandler;


import net.Omarket.login.loginDTO;

@Controller
public class chattingController extends TextWebSocketHandler{
   
   private static final Logger logger = LoggerFactory.getLogger(chattingController.class);
   
   @Autowired
   ServletContext application;
   
   @Autowired
   chattingDAO cdao;
      
   
   @RequestMapping(value = "/chatting.do")
   public String chatting(@RequestParam("idx") String p_code, @RequestParam("you") String you,
            chattingDTO cdto, Model model, HttpSession session) {    
    //자기 자신의 정보를 기억할 dto : cdto    
    
    //객체로 설정한 세션값 받아오기
    loginDTO user = (loginDTO)session.getAttribute("daum");
    
    //세션값으로 설정된 닉네임 값, 유저코드 받아오기 
    String id = user.getU_nick();
    String u_code = user.getU_code();
    System.out.println("u코드 : " +  u_code);
     SocketHandler.setNick(id);
     SocketHandler.addNick(id);
     
     //cdto에 p코드, 유저코드 입력(로그인 한 유저. 판매자일수도, 구매자일 수도 있음)
     cdto.setP_code(p_code);
     
     cdto.setU_code(u_code);
//     System.out.println("chatting.do11111111111111111111111111");
//     System.out.println(cdto.getP_code());
//     System.out.println(cdto.getU_code());
     //상품코드를 통해 받아온 판매자와 로그인한 유저가 같은지 아닌지 판단할 dto clone 객체 생성
     chattingDTO cloneDto = new chattingDTO();
     
     
     
     cloneDto.setU_code(cdao.getSelleCode(cdto));
     cloneDto.setP_code(cdto.getP_code());
     //상품코드를 통해 룸코드 받아오기      
     int ch_code_cnt = cdao.selectMsgCnt(cdto);
     
     
     //만약 생성된 채팅룸이 없다면
     if(ch_code_cnt<1) {
        
        //채팅룸 생성
         cdao.createChatroom(cloneDto);
         //채팅하러가기 누른 구매자 정보 입력
         cdao.addChatUser(cdto);
         //System.out.println(cdto.getU_code());
         //판매자 정보도 채팅 테이블에 입력
         cdao.addChatUser(cloneDto);
         //System.out.println(cloneDto.getU_code());
     }
     
     String you_code = cdao.getUserCode(you); 
     cdto.setYou(you_code);
     
     
     //채팅방 참여자 insert 후 다시 룸코드 받아오기
     String ch_code = cdao.getChatroomCode(cdto);
     cdto.setCh_code(ch_code);
     cloneDto.setCh_code(ch_code);
     
     //cdto는 로그인한 유저의 정보. cloneDto는 판매자의 정보가 저장되어있음
     
     List<chattingDTO> msgList = cdao.selectMsg(cdto);
     model.addAttribute("you",you);
     model.addAttribute("ucode",u_code);
     model.addAttribute("userInfo",cdto);
     model.addAttribute("sellerInfo",cloneDto);
     model.addAttribute("msgs",msgList);
     cdto=null;//받아온 값 제거해서 새로고침해도 재입력되지 않게
     
     return "view_chat";      
   }//end
   
   
   @ResponseBody
   @RequestMapping(value = "/insertMsg.do", method = RequestMethod.POST)
   public Map<String,String> insertMsg(Model model, @RequestBody chattingDTO cdto) {
      
    cdao.insertMsg(cdto);
    Map<String,String> result = new HashMap<String, String>();
    System.out.println("aaaaaaaaaaaaaaaaa");
     result.put("status","success");
     System.out.println("bbbbbbbbbbbbbbbbb");
     return result;
   }//end
   
   @RequestMapping(value = "/createChatroom.do")
   public String createChatroom(Model model, HttpSession session) {
      
     String id = (String)session.getAttribute("daum");
     
     SocketHandler.setNick(id);
     SocketHandler.addNick(id);
     
     model.addAttribute("id",id);
     
     return "view_chat";      
   }//end
   
   @RequestMapping(value = "/chatList.do")
   public String getChatlist(Model model, HttpSession session) {
      loginDTO user = (loginDTO)session.getAttribute("daum");
      List<chattingDTO> list =cdao.getChatList(user.getU_code());
      
      model.addAttribute("list",list);
      return "chatroom_list";
   }
   @RequestMapping(value="/chatroomgo.do")
   public String getChatroomGo(Model model,HttpSession session, ServletRequest request,chattingDTO dto) {
	   loginDTO user = (loginDTO)session.getAttribute("daum");
	   dto.setU_code(user.getU_code());
	   String pcode = request.getParameter("idx");
	   String chcode = request.getParameter("chcode");
	   
	   System.out.println("피코드값 " + pcode);
	   System.out.println("ch코드값 " + chcode);
	   dto.setP_code(pcode);
	   dto.setCh_code(chcode);
	   List<chattingDTO> msgList = cdao.getChatRoom(dto);
	   
	   String u_code = dto.getU_code();
	   chattingDTO cdto = dto;
	   
	   
	   chattingDTO cloneDto = new chattingDTO();
	   cloneDto.setU_code(cdao.getSelleCode(cdto));
	   cloneDto.setP_code(pcode);
	   String you = request.getParameter("you");
	   model.addAttribute( "you",you);
	   model.addAttribute("ucode",u_code);
	   model.addAttribute("userInfo",cdto);
	   model.addAttribute("sellerInfo",cloneDto);
	   model.addAttribute("msgs",msgList);
	   return "view_chat";
   }
   
}//class END