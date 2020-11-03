package net.Omarket.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class loginInterceptor extends HandlerInterceptorAdapter {

   private static final Logger logger = LoggerFactory.getLogger(loginInterceptor.class);
   
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			HttpSession session = request.getSession();
			String u_id = (String)session.getAttribute("u_id");
			String u_nick = (String)session.getAttribute("u_nick");
			boolean adminCheck = false;

			response.setContentType("text/html; charset=UTF-8");
		  PrintWriter out = response.getWriter() ;
			if(u_id!=null){
				adminCheck=true;	
			}else {
				out.println("<div align=center style='margin-top:30px'> <img src='./resources/images/tulips.png' width='500' height='400'>");
				out.println("<br><font color=blue size=7> <b>processing...</b></font> </div> <p>");
				out.append("<script>"
					+ "alert('로그인이필요합니다.');"
				  + "location.href='login.do';"
					+ "</script>").flush();
				adminCheck=false;
			}
			return adminCheck;
	}//end

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3) throws Exception {
		//컨트롤러의 메소드 끝나고 , 화면처리후 처리 
		//afterCompletion(request,response, Object, Exception)
    logger.info("=======================afterCompletion start========================");
		logger.info("=======================afterCompletion end=========================");
	}//end			
	
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)	throws Exception {
		//postHandle(request,response, Object, ModelAndView)
	   logger.info("=======================postHandle start======================");
	   logger.info("=======================postHandle end=========================");	
	}//end

}//class END
