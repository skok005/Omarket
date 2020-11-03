<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>openID.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/signup_write.css"/>
</head>
<body>
 <p>
 <div align="center" class="popup">
  <form name="signup_Subform" action="idCheck.do"> 
    <span class="subtitle">아이디&nbsp;&nbsp;</span><input type="text" name="u_id" value="${u_id}" class="text">
         <label id="u_id_label2"></label>   
        <input type="submit" value="중복확인"> 
  </form>
 </div> 
</body>
</html>