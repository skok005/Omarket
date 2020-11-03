<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    아이디 찾기 
   </div>
   <div class="login_inner">  <p> 
   
     <form method="get">
      <table class="table" >
       <tr>
         <td>
         <span class="subtitle2"> 회원가입시 사용한 아이디는 ${u_id} 입니다 .</span>  
         </td>
       </tr>
      
        <tr>
         <td class="button_container">
         <input type="button" value="로그인" id="login" class="btn" onClick="location.href='login.do'">
         <input type="button" value="ID/PW찾기" id="login" class="btn" onClick="location.href='findIdpwd.do'">
        </td>
       </tr>       
     </table>
    </form>
    
   </div>  
 </div>
</div> 
 
         
</body>
</html>