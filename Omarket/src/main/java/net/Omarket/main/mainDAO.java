package net.Omarket.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.Omarket.login.loginDTO;
import net.Omarket.mypage.mypageDTO;

@Repository
@Component
public class mainDAO {

	@Autowired
	SqlSessionTemplate temp;
	
	public void mainInsert(mainDTO mdto) { 
		temp.insert("main.insert", mdto);
	}//end

	public void mainFileInsert(mainDTO mdto) {
		temp.insert("main.insertFile", mdto);
	}//end
	
	public List<mainDTO> mainSelectAll(String p_category, int start, int end){
		mainDTO mdto = new mainDTO();
		mdto.setP_category(p_category);
		mdto.setStart(start);
		mdto.setEnd(end);
		List<mainDTO> list = temp.selectList("main.selectnormal", mdto);
		return list;
	}//end
	public List<mainDTO> mainSelectPremium(String p_category){
		mainDTO mdto = new mainDTO();
		mdto.setP_category(p_category);
		List<mainDTO> list = temp.selectList("main.selectPremium", mdto);
		return list;
	}//end
	
	public List<mainDTO> mainSelectSearch(String keyfield, String keyword){
		mainDTO dto = new mainDTO();
		dto.setKeyfield(keyfield);
		dto.setKeyword(keyword);
		List<mainDTO> list = temp.selectList("main.selectSearch", dto);
		return list;
	}//end
	
	public int mainSearchCount(String keyfield, String keyword){
		mainDTO dto = new mainDTO();
		dto.setKeyfield(keyfield);
		dto.setKeyword(keyword);
		int cnt = temp.selectOne("main.selectSearchCount", dto);
		return cnt;
	}//end
	
	public mainDTO mainDetail(int p_code) {
		mainDTO mdto = temp.selectOne("main.selectDetail", p_code);
		return mdto;
	}//end
	
	public List<mainDTO> mainFileDetail(int p_code) {
		List<mainDTO> fmdto = temp.selectList("main.selectFileDetail", p_code);
		return fmdto;
	}//end
	
	public void mainHit(int p_code) {
		temp.update("main.updateHit", p_code);
	}//end
	
	public List<mainDTO> mainSelectSellList(int u_code_seller){
		List<mainDTO> slist = temp.selectList("main.selectSellList", u_code_seller);
		return slist;
	}//end
	
	public void mainDelete(int p_code) {
		temp.delete("main.delete", p_code);
	}//end
	
	public void mainDeleteFile(int p_code) {
		temp.delete("main.deleteFile", p_code);
	}//end
	
	public void mainEdit(mainDTO mdto) {
		temp.update("main.update", mdto);
	}//end
	
	public void mainNewInsertFile(mainDTO mdto) {
		temp.insert("main.newInsertFile", mdto);
	}//end	
	
	public void mainFileEdit(String pic_code) {
		temp.delete("main.updateFile", pic_code);
	}//end
	
	public void mainJjim(loginDTO ldto) {
		temp.insert("main.insertJjim", ldto);
	}//end
	
	public void mainJjimCnt(int p_code) {
		temp.update("main.updateJjim", p_code);
	}//end
	
	public List<mainDTO> mainJjimSelect(String u_code) {
		List<mainDTO> jlist = temp.selectList("main.selectJjim", u_code);
		return jlist;
	}//end
	
	public void tradeInsert(mypageDTO dto) {
		System.out.println("tradeInsert");
		System.out.println(dto.getP_code());
		System.out.println(dto.getU_code());
		temp.insert("main.tradeInsert", dto);
		
//		return jlist;
	}//end
	
	public int mainSelectCount(String p_category){
      int cnt = temp.selectOne("main.selectCount", p_category);
      return cnt;
	}//end
	
}//class END






