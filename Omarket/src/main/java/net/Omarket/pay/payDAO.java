package net.Omarket.pay;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class payDAO {

	@Autowired
	SqlSessionTemplate temp;
	
	public void payInsert(payDTO dto) {
		temp.insert("pay.add", dto);
	}//end
	
	public void premiumdate(String ucode) {
		System.out.println("넘어옵니다1111111111111111");
		System.out.println(ucode);
		temp.update("pay.premiumupdate",ucode);
		System.out.println("넘어옵니다222222222222222221");
	}
	
	public void premiumTermUpdate(String ucode,String u_premium_term) {
		System.out.println("premiumTermUpdate///////////////////////////");
		payDTO dto = new payDTO();
		dto.setU_premium_term(u_premium_term);
		dto.setU_code(ucode);
		System.out.println(dto.getU_code());
		System.out.println(dto.getU_premium_term());
		temp.update("pay.premium_term_update",dto);
		System.out.println("premiumTermUpdate22222222222222222222222222");
	}
}//class END






