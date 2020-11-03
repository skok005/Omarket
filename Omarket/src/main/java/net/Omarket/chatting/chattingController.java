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
    //�ڱ� �ڽ��� ������ ����� dto : cdto    
    
    //��ü�� ������ ���ǰ� �޾ƿ���
    loginDTO user = (loginDTO)session.getAttribute("daum");
    
    //���ǰ����� ������ �г��� ��, �����ڵ� �޾ƿ��� 
    String id = user.getU_nick();
    String u_code = user.getU_code();
    System.out.println("u�ڵ� : " +  u_code);
     SocketHandler.setNick(id);
     SocketHandler.addNick(id);
     
     //cdto�� p�ڵ�, �����ڵ� �Է�(�α��� �� ����. �Ǹ����ϼ���, �������� ���� ����)
     cdto.setP_code(p_code);
     
     cdto.setU_code(u_code);
//     System.out.println("chatting.do11111111111111111111111111");
//     System.out.println(cdto.getP_code());
//     System.out.println(cdto.getU_code());
     //��ǰ�ڵ带 ���� �޾ƿ� �Ǹ��ڿ� �α����� ������ ������ �ƴ��� �Ǵ��� dto clone ��ü ����
     chattingDTO cloneDto = new chattingDTO();
     
     
     
     cloneDto.setU_code(cdao.getSelleCode(cdto));
     cloneDto.setP_code(cdto.getP_code());
     //��ǰ�ڵ带 ���� ���ڵ� �޾ƿ���      
     int ch_code_cnt = cdao.selectMsgCnt(cdto);
     
     
     //���� ������ ä�÷��� ���ٸ�
     if(ch_code_cnt<1) {
        
        //ä�÷� ����
         cdao.createChatroom(cloneDto);
         //ä���Ϸ����� ���� ������ ���� �Է�
         cdao.addChatUser(cdto);
         //System.out.println(cdto.getU_code());
         //�Ǹ��� ������ ä�� ���̺� �Է�
         cdao.addChatUser(cloneDto);
         //System.out.println(cloneDto.getU_code());
     }
     
     String you_code = cdao.getUserCode(you); 
     cdto.setYou(you_code);
     
     
     //ä�ù� ������ insert �� �ٽ� ���ڵ� �޾ƿ���
     String ch_code = cdao.getChatroomCode(cdto);
     cdto.setCh_code(ch_code);
     cloneDto.setCh_code(ch_code);
     
     //cdto�� �α����� ������ ����. cloneDto�� �Ǹ����� ������ ����Ǿ�����
     
     List<chattingDTO> msgList = cdao.selectMsg(cdto);
     model.addAttribute("you",you);
     model.addAttribute("ucode",u_code);
     model.addAttribute("userInfo",cdto);
     model.addAttribute("sellerInfo",cloneDto);
     model.addAttribute("msgs",msgList);
     cdto=null;//�޾ƿ� �� �����ؼ� ���ΰ�ħ�ص� ���Էµ��� �ʰ�
     
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
	   
	   System.out.println("���ڵ尪 " + pcode);
	   System.out.println("ch�ڵ尪 " + chcode);
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