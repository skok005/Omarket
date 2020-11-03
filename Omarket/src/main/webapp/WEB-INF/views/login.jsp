<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/login.css"/>
</head>
<body>
<div class="smallBody">
  <div class="login_outer"> 
   <div class="login_title">
    로그인 
   </div>
   <div class="login_inner">  <p> 
   
     <form  action="loginprocess.do"  method="get">
      <table class="table" >
       <tr>
         <td>
         <span class="subtitle">아이디&nbsp;&nbsp;&nbsp;</span> <input type="text" name="u_id" class="text" > 
         </td>
       </tr>
       
        <tr>
         <td>
          <span class="subtitle">비밀번호</span> <input type="password" name="u_pwd" class="text" > 
         </td>
        </tr>
         
        <tr>
         <td class="button_container">
         <input type="submit" value="로그인" id="login" class="btn" >
         <input type="button" value="ID/PWD 찾기" id="login" class="btn" onClick="location.href='findIdpwd.do'">
         <input type="button" value="회원가입" id="login" class="btn" onClick="location.href='signup.do'">
        </td>
       </tr>       
     </table>
    </form>
    
   </div>  
 </div>
</div> 
 
         
</body>
</html>