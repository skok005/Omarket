<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<html>
<head>
	<title>sub_main.jsp</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script >
	function openChat(){
		var title="view_chat";
		var p_code = 1000;
		window.open("chatting.do?p_code="+p_code, title, "toolbar=yes,width=700,height=500").focus();
	}
		
</script>
<body>
<h1>
	
</h1>
<input type="button" onclick="openChat();" value="채팅하러가기">
<a href="chatroomList.do?u_code=1">채팅보러가기</a>
<a href="login.do">로그인하러가기</a>

<!-- <P>  </P> -->
</body>
</html>
