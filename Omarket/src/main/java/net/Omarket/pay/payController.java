package net.Omarket.pay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.Omarket.login.loginDTO;

@Controller
public class payController {
	@Autowired
	
	payDAO pdao;
	private static final Logger logger = LoggerFactory.getLogger(payController.class);
	
	@RequestMapping(value = "/pay.do", method = RequestMethod.GET)
	public String pay(Model model,HttpServletRequest request ,HttpSession session) {
		loginDTO user = (loginDTO)session.getAttribute("daum");
		model.addAttribute("user",user);
		return "paySuccess";
	}//end
	
	
	@RequestMapping(value = "/paySuccess.do", method = {RequestMethod.POST})
	@ResponseBody
	
	public String paySuccess(Model model ,HttpSession session,@RequestBody payDTO dto) {
		System.out.println("paySuccess.do/////////////////////////");

		
		System.out.println(dto.getU_code());
		String u_code = dto.getU_code();
		String u_premium_term = dto.getU_premium_term();
		if(u_premium_term=="") {
			u_premium_term =null;
		}
		System.out.println(u_premium_term);
		pdao.premiumdate(u_code);
		pdao.premiumTermUpdate(u_code,u_premium_term);
		System.out.println("실행했습니다");
		model.addAttribute("u_code",u_code);	
		return "{\"u_code\" :"+u_code+"}";
	}//end
	
	
}//class END
