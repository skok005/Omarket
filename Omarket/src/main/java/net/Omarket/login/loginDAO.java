package net.Omarket.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class loginDAO {

   @Autowired
   SqlSessionTemplate temp;
   
   public void loginInsert(loginDTO dto) {
       System.out.println("다오 넘어온아이디" + dto.getU_id());
      System.out.println("다오  넘어온비번" + dto.getU_pwd());
      System.out.println("다오 넘어온닉네임" + dto.getU_nick());
      System.out.println("다오  넘어온이메일" + dto.getU_email());
      System.out.println("다오 넘어온전번" + dto.getU_phone());
      System.out.println("다오  넘어온주소1" + dto.getU_addr1());
      System.out.println("다오 넘어온주소2" + dto.getU_addr2());
      System.out.println("다오  넘어온프사" + dto.getU_profile());
       temp.insert("login.singupInsert", dto);
   }//end
   
   public String login(loginDTO dto) {
      String result  =  temp.selectOne("login.selectlogin",dto);
      return  result;
   }//end
   
   public String loginNick (loginDTO dto) {
      String result2 =   temp.selectOne("login.selectNick",dto);
     return result2;
   }
   
   public int signupIdcheck(String u_id) { //아이디중복체크
      int cnt = temp.selectOne("login.signupIdcheck",u_id);
      return cnt;
   }
   
   public int signupNickcheck(String u_nick) { //아이디중복체크
      int cnt = temp.selectOne("login.signupNickcheck",u_nick);
      return cnt;
   }   
   
   public loginDTO loginSelect(loginDTO dto) {
      System.out.println("dao 실행하기전에 아이디값 받는지 확인 " +dto.getU_id());
      loginDTO user = temp.selectOne("login.select",dto);
      if(user==null) {
         return null;
      }
      System.out.println("로긴 id " +user.getU_id());
      System.out.println("로긴 nick " +user.getU_nick());

      return user;
   }
   
   

   public loginDTO singuppreEdit(String u_nick) {
    loginDTO signupData =	temp.selectOne("login.signuppreEdit",u_nick);
  	return signupData;
  }

   public void signupEdit(loginDTO dto) {
  	 temp.insert("login.singupEdit",dto);
   }
   
   public String loginFindID(String u_email) {
  	 String u_id = temp.selectOne("login.loginFindID",u_email);
  	 return u_id;
   }
   
   public String loginFindPwd(loginDTO dto) {
  	 String u_pwd  = temp.selectOne("login.loginFindPwd",dto);
  	 return u_pwd;
   }

}//class END





