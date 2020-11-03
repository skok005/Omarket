package net.Omarket.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class mypageDAO {

	@Autowired
	SqlSessionTemplate temp;
	
	
	public List<mypageDTO> jjimList(String u_code) {
		List<mypageDTO> list = temp.selectList("mypage.selectJjim", u_code);
		return list;
	}//jjimList END
	
	
	
	public List<mypageDTO> sellList(String u_code) {
		List<mypageDTO> list = temp.selectList("mypage.selectProduct", u_code);
		
		for(mypageDTO dto : list) {
			String date = String.valueOf(dto.getP_rdate());
			String regDate = date.substring(0, 10);
			dto.setRegDate(regDate);
		}//forEach END
		
		return list;
	}//sellList END
	
	
	
	public List<mypageDTO> buyList(String u_code) {
		List<mypageDTO> list = temp.selectList("mypage.selectTrade", u_code);
		
		for(mypageDTO dto : list) {
			String date = String.valueOf(dto.getTrade_date());
			String trdDate = date.substring(0, 10);
			dto.setTrdDate(trdDate);
		}//forEach END
		
		return list;
	}//buyList END
	
	

	public void deleteJjim(mypageDTO dto) {
		temp.delete("mypage.deleteJjim", dto);
	}//jjimDelete END



	public int sellChatCnt(String u_code) {
		mypageDTO dto = new mypageDTO();
		
		dto.setSign("=");
		dto.setU_code(u_code);;
		int chatCnt = temp.selectOne("mypage.chatCnt", dto);
		
		return chatCnt;
	}//sellChatCnt END
	
	
	
	public int buyChatCnt(String u_code) {
		mypageDTO dto = new mypageDTO();
		
		dto.setSign("<>");
		dto.setU_code(u_code);;
		int chatCnt = temp.selectOne("mypage.chatCnt", dto);
		
		return chatCnt;
	}//buyChatCnt END



	public int sellNewmCnt(String u_code) {
		mypageDTO dto = new mypageDTO();
		
		dto.setSign("=");
		dto.setU_code(u_code);;
		int newmCnt = temp.selectOne("mypage.newmCnt", dto);
		
		return newmCnt;
	}//sellNewmCnt END
	
	
	
	public int buyNewmCnt(String u_code) {
		mypageDTO dto = new mypageDTO();
		
		dto.setSign("<>");
		dto.setU_code(u_code);;
		int newmCnt = temp.selectOne("mypage.newmCnt", dto);
		
		return newmCnt;
	}//sellNewmCnt END
	
	
	public void updateReserve(String pcode, String status) {
		mypageDTO dto = new mypageDTO();
		dto.setP_status(status);
		dto.setP_code(pcode);
		
		temp.update("mypage.updateReserve", dto);
	}
	
	public void evalManner(mypageDTO dto) {
		
		if(dto.getTablinks().equals("eval_pos")) 
			temp.insert("mypage.evalPosManner", dto);
		else if(dto.getTablinks().equals("eval_normal")) 
			temp.insert("mypage.evalNormalManner", dto);
		else
			temp.insert("mypage.evalNegaManner", dto);
		//if END
		
	}//evalManner END
	
	public mypageDTO jbsCnt(mypageDTO dto) {
		mypageDTO jbsDto = temp.selectOne("mypage.jbsCnt", dto);
		return jbsDto;
	}
	
	public mypageDTO getMannerNick(mypageDTO dto) {
		mypageDTO userNick = temp.selectOne("mypage.mannerNick",dto);
		return userNick;
	}
	
	public void productRelist(String p_code) {
	      temp.update("mypage.productRelist", p_code);
   }

	
}//class END






