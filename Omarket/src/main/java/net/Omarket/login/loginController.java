package net.Omarket.login;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class loginController {
   
   private static final Logger logger = LoggerFactory.getLogger(loginController.class);
   
   @Inject
   @Autowired
   ServletContext application;
   
   @Inject
   @Autowired
   loginDAO dao;
   
   
   @RequestMapping(value = "/signup.do", method = RequestMethod.GET)
   public String signup(Model model) {
      return "signup_write";
   }//end
      
   @RequestMapping(value = "/signupInsert.do" )
   public void signup_Insert(loginDTO dto,HttpServletResponse response) throws IOException {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter() ;
      String u_phone2 = dto.getU_phone2();
      String u_phone3 = dto.getU_phone3();
      String u_phone4 = dto.getU_phone4();
      dto.setU_phone(u_phone2+"-"+u_phone3+"-"+u_phone4);
      
      String path = application.getRealPath("/resources/upload");
      String img = dto.getU_profile_upload().getOriginalFilename();
    
      File file = new File(path,img);
     
      try { dto.getU_profile_upload().transferTo(file); }catch(Exception ex) {}
       dto.setU_profile(img);
       dao.loginInsert(dto);
       
      out.append("<script>");
      out.append("alert('회원가입 되었습니다');");
      out.append("location.href='login.do';"); 
      out.append("</script>");
      out.flush();
      
   }//end 
   
   @RequestMapping(value="/login.do")
   public String login() {
      return "login";
   }//end
   
   @RequestMapping(value="/findIdpwd.do")
   public String find_Idpwd() {
      return "login_FindIdpwd";
   }//end
   
   @RequestMapping(value="/login_FindId.do")
   public String find_Id(String u_email, Model model,HttpServletResponse response) throws IOException {
      response.setContentType("text/html; charset=UTF-8");
     PrintWriter out = response.getWriter() ;
      
     String u_id  = dao.loginFindID(u_email);
     
    if(u_id==null||u_id=="") {
       out.append("<script>");
       out.append("alert('일치하는 정보가 없습니다.');");
        out.append("location.href='findIdpwd.do';"); 
        out.append("</script>");
        out.flush();
    }
    
     model.addAttribute("u_id",u_id);
    return "login_FindId";
   }//end
   
   @RequestMapping(value="/login_Findpwd.do")
   public String find_Findpwd(loginDTO dto, Model model,HttpServletResponse response) throws IOException {
      response.setContentType("text/html; charset=UTF-8");
     PrintWriter out = response.getWriter() ;
      
     String u_phone2 = dto.getU_phone2();
     String u_phone3 = dto.getU_phone3();
     String u_phone4 = dto.getU_phone4();
     dto.setU_phone(u_phone2+"-"+u_phone3+"-"+u_phone4);
     String u_pwd  = dao.loginFindPwd(dto);
     
      if(u_pwd==null||u_pwd=="") {
         out.append("<script>");
         out.append("alert('일치하는 정보가 없습니다.');");
         out.append("location.href='findIdpwd.do';"); 
         out.append("</script>");
         out.flush();
      }
     model.addAttribute("u_pwd",u_pwd);
    return "login_FindPwd";
   }//end

   
   @RequestMapping(value = "/openID.do", method = RequestMethod.GET)
   public String signup_openID( HttpServletRequest request, Model model) {
    
      String u_id  =   request.getParameter("idx");
      model.addAttribute("u_id",u_id);
      
      return "openID";
   }//end
   
   
   @RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
   public void signup_idcheck(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException {
    String u_id = request.getParameter("u_id");
    int cnt = dao.signupIdcheck(u_id);
    
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter() ;
    if(cnt != 0) {
         out.append("<script>");
         out.append("alert('사용중인 아이디 입니다');");
         out.append("location.href='openID.do';"); 
         out.append("</script>");
         out.flush();
    }else {
        out.append("<script>");
        //subform.userid.value=window.opener.iform.sabun.value;
        out.append("window.opener.document.getElementById(\"u_id\").value = '"+u_id+"';");
        out.append("self.close();");
        out.append("</script>");
        out.flush();
    }
    //return "redirect:/signup.do";
   }//end
   
   
   
   @RequestMapping(value = "/openNick.do", method = RequestMethod.GET)
   public String signup_openNick( HttpServletRequest request, Model model) {
    
      String u_nick  =   request.getParameter("idx");    
      model.addAttribute("u_nick",u_nick);
    
      return "openNick";
   }//end
   
   @RequestMapping(value = "/nickCheck.do", method = RequestMethod.GET)
   public void signup_nickCheck(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException {
       String u_nick = request.getParameter("u_nick");
       int cnt = dao.signupNickcheck(u_nick);    
       
       response.setContentType("text/html; charset=UTF-8");
       PrintWriter out = response.getWriter() ;
       
       if(cnt != 0) {
          
            out.append("<script>");
            out.append("alert('사용중인 닉네임 입니다');");
            out.append("location.href='openNick.do';"); 
            out.append("</script>");
            out.flush();
           
       }else {
          
           out.append("<script>");
           out.append("window.opener.document.getElementById(\"u_nick\").value = '"+u_nick+"';");
           out.append("self.close();");
           out.append("</script>");
           out.flush();
        
       }
       //return "redirect:/signup.do";
   }//end
   
   
   @RequestMapping(value="/signup_preEdit.do")
   public String signup_edit(HttpServletRequest request,Model model) {
     String   u_nick  = request.getParameter("idx");
     loginDTO dto =  dao.singuppreEdit(u_nick);
     String[] u_phone = dto.getU_phone().split("-");
     dto.setU_phone2(u_phone[0]);
     dto.setU_phone3(u_phone[1]);
     dto.setU_phone4(u_phone[2]);
     model.addAttribute("dto",dto);
    
      return "signup_edit";
   }//end
   
   
   @RequestMapping(value="/signupEdit.do")
   public void signup_Edit(loginDTO dto,HttpServletResponse response,HttpSession session)throws IOException { 
       String u_phone2 = dto.getU_phone2();
      String u_phone3 = dto.getU_phone3();
      String u_phone4 = dto.getU_phone4();
      dto.setU_phone(u_phone2+"-"+u_phone3+"-"+u_phone4);
      String path = application.getRealPath("/resources/upload");
      String img = dto.getU_profile_upload().getOriginalFilename();
      
      File file = new File(path,img);
      
      try { dto.getU_profile_upload().transferTo(file); }catch(Exception ex) {}
      
      dto.setU_profile(img);
       dao.signupEdit(dto);
       response.setContentType("text/html; charset=UTF-8");
       PrintWriter out = response.getWriter() ;
       
       session.invalidate();
       
       out.append("<script>");
      out.append("alert('회원수정이 완료되었습니다. 다시 로그인하세요.');");
      out.append("location.href='login.do';"); 
      out.append("</script>");
      out.flush();
     
   }
   

   
   @RequestMapping(value="/loginprocess.do")
   public String loginprocess(loginDTO dto,  HttpServletRequest request, HttpServletResponse response,   HttpSession session)   throws Exception {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter() ;      
      String u_id = dao.login(dto);
      
      if(u_id==null || u_id==""||u_id=="null"||u_id.equals("null")){
           out.append("<script>");
           out.append("alert('아이디 비밀번호가 일치하지않습니다');");
           out.append("location.href='login.do';"); 
           out.append("</script>");
           out.flush();
           return null;
         }      
     
      String u_nick = dao.loginNick(dto);
      loginDTO user = dao.loginSelect(dto);
      String u_code = user.getU_code();
      
      session.setAttribute("daum",user );
      session.setAttribute("u_code", u_code );
      session.setAttribute("u_id", u_id );
      session.setAttribute("u_nick", u_nick );
         
      return "redirect:/product_list.do";
   }   
   
   @RequestMapping(value="logout.do", method=RequestMethod.GET)
   public String logout(HttpSession session){
      session.invalidate(); 
      return "redirect:/product_list.do";
   }//end



}//class END