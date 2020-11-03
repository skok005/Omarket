<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>openNick.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/signup_write.css"/>
</head>
<body >
 <p>
 <div align="center" class="popup">
  <form name="signup_Subform2" action="nickCheck.do"> 
     <span class="subtitle">닉네임&nbsp;&nbsp;</span><input type="text" name="u_nick" value="${u_nick}" class="text">  
        <input type="submit" value="중복확인"> 
  </form>
 </div> 
</body>
</html>