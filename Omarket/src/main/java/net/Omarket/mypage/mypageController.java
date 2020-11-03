package net.Omarket.mypage;

import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.Omarket.chatting.chattingDTO;
import net.Omarket.login.loginDTO;

@Controller
public class mypageController {
	
	
	@Autowired
	mypageDAO dao;
	
	@Autowired
    public DataSource dataSource;
	
	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);
	
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		loginDTO u_dto = (loginDTO) session.getAttribute("daum");
		
		Map<String, Object> manners = procedure(u_dto);
		String like=String.valueOf(manners.get("POS_CNT"));
		String norm=String.valueOf(manners.get("NORMAL_CNT"));
		String dislike=String.valueOf(manners.get("NEGA_CNT"));
		
		double mannerDeg = (Integer.parseInt(like)-Integer.parseInt(dislike))*0.5;
		
		//----------------------------------유저정보
		String u_code = u_dto.getU_code();
		String u_profile = u_dto.getU_profile();
		String u_nick = u_dto.getU_nick();

		if(u_profile==null||u_profile.equals("")) {
			u_profile = "nothing.png";
		}//if END
		//--------------------------------------
		
		//--------------------------------매너 좋보실 수
		mypageDTO dtoPos = new mypageDTO();
		dtoPos.setU_code_receiver(u_code);
		dtoPos.setJbsClm("eval_pos");
		mypageDTO dtoNormal = new mypageDTO();
		dtoNormal.setU_code_receiver(u_code);
		dtoNormal.setJbsClm("eval_normal");
		mypageDTO dtoNega = new mypageDTO();
		dtoNega.setU_code_receiver(u_code);
		dtoNega.setJbsClm("eval_nega");
		
		dtoPos = dao.jbsCnt(dtoPos);
		dtoNormal = dao.jbsCnt(dtoNormal);
		dtoNega = dao.jbsCnt(dtoNega);
		//--------------------------------------
		
		//-----------------------------------채팅수
		int sellChatCnt = dao.sellChatCnt(u_code);
		int buyChatCnt = dao.buyChatCnt(u_code);
		//--------------------------------------
		
		List<mypageDTO> jjimList = dao.jjimList(u_code);	//찜 리스트
		List<mypageDTO> sellList = dao.sellList(u_code);	//판매 리스트
		List<mypageDTO> buyList = dao.buyList(u_code);		//구매 리스트
		
		model.addAttribute("u_code", u_code);
		model.addAttribute("u_nick", u_nick);
		model.addAttribute("u_profile", u_profile);
		model.addAttribute("dtoPos", dtoPos);
		model.addAttribute("dtoNormal", dtoNormal);
		model.addAttribute("dtoNega", dtoNega);
		model.addAttribute("jjimList", jjimList);
		model.addAttribute("sellList", sellList);
		model.addAttribute("buyList", buyList);
		model.addAttribute("sellChatCnt", sellChatCnt);
		model.addAttribute("buyChatCnt", buyChatCnt);
		
		model.addAttribute("like", like);
		model.addAttribute("norm", norm);
		model.addAttribute("dislike", dislike);
		model.addAttribute("mannerDeg", 36.5+mannerDeg);
		
		model.addAttribute("u_dto", u_dto);
		
		return "mypage";
	}//-----------------------------------------------------리스트 END
	
	
	
	@RequestMapping(value = "/deleteJjim.do")
	public String deleteJjim(HttpServletRequest request) {
		String u_code = request.getParameter("ucod");
		String p_code = request.getParameter("pcod");
		
		mypageDTO dto = new mypageDTO();
		
		dto.setU_code(u_code);
		dto.setP_code(p_code);
		dao.deleteJjim(dto);
		
		return "redirect:/mypage.do";
	}//-----------------------------------------------------찜삭제 END	
	
	
	@RequestMapping(value = "/eval.do")
	public String eval(Model model, HttpServletRequest request) {
		System.out.println("eval.do 메소드 도착");
		String p_code = request.getParameter("pcod");
		String u_code_sender = request.getParameter("send");
		String u_code_receiver = request.getParameter("receive");
//		System.out.println(p_code);
		model.addAttribute("pcod", p_code);
		model.addAttribute("send", u_code_sender);
		model.addAttribute("receive", u_code_receiver);
		
		return "manner";
	}//-----------------------------------------------------평가창 END
	
	
	@RequestMapping(value = "/statusUpdate.do")
	public String statusUpdate(@RequestParam("pcode") String pcode,
			@RequestParam("status") String status, Model model, HttpServletRequest request) {
			System.out.println("statusUpdate 메소드");
			dao.updateReserve(pcode, status);
			System.out.println("statusUpdate 메소드 나가기");
		return "redirect:/mypage.do";
	}//-----------------------------------------------------리스트 END
	

	@RequestMapping(value = "/manner.do")
	public String manner(mypageDTO dto) {
		dao.evalManner(dto);		
		return "mannerClose";
	}//-----------------------------------------------------평가적용 END
		
	
	@ResponseBody
	@RequestMapping(value = "/mannerNick.do", method = RequestMethod.POST)	
	public Map<String, String> mannerNick(Model model, @RequestBody mypageDTO dto) {
		System.out.println("mannerNick.do");
		System.out.println(dto.getU_nick());
		mypageDTO nickCheck = dao.getMannerNick(dto);
		
		String status="false";
		
		if(nickCheck.getCnt()==1)
			status="success";
//		String result = "{\"status\" : "+nick+"}";
		Map<String, String> result = new HashMap<String, String>();
		result.put("status", status);
		result.put("u_code", nickCheck.getU_code());
		
		return  result;
	}//-----------------------------------------------------매너온도 닉네임 체크 END
	
	
	
	
	@RequestMapping(value = "/procedure.do")
	public Map<String, Object> procedure(loginDTO dto) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("u_code",dto.getU_code());
		
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource);
		 jdbcCall.withProcedureName("eval_proc");
		 
		 Map<String, Object> result = null;
		 
	        try {
	            result = jdbcCall.execute(paramMap);
	        } catch (UncategorizedSQLException e) {
	            System.out.println(e.getMessage());
	        }	
		
		return result;
	}//-----------------------------------------------------프로시저 END
	
	
	
	@RequestMapping(value="/productRelist.do")
	   public String productRelist (HttpServletRequest request) {
	    String p_code =   request.getParameter("idx");
	    System.out.println(" 넘어온피코드" +p_code);
	    dao.productRelist(p_code);
	    return "redirect:/mypage.do";
	   }

	
	
}//class END
