<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="./header.jsp" %>
<html>
<head>
   <title>Home</title>
   
</head>
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/chatroom_list.css"/>
 
<body>
<script>
   $(function(){
	      $('.go_chat').click(function(){
	        var p_code = $(this).attr('data');
	        console.log(p_code);
	        var chcode= $(this).attr('data1');
	        console.log(chcode);
	        var you = $(this).attr('data2');
	        console.log(you);
	        var title = 'chat';
	        
	        window.open('chatting.do?idx='+p_code+'&chcode='+chcode+'&you='+you,title,'width=650,height=850');
	      }); 
   });
//    a href="chatroomgo.do?idx=${dto.p_code}&chcode=${dto.ch_code}&you=${dto.you}"
   </script>
   
    <div class="smallBody">
      <div class="product_outer">        
        <div class="product_title">
          <span>상품목록</span> 
        </div>
        <div class="product_inner">
          <div class="page">
            <table width=1000 border=1 cellspacing=0 class="type10">
            	<thead>
	            	<tr>
	            		<th>상대방</th>
	            		<th>거래물품</th>
	            		<th>내용</th>
	            		<th>마지막채팅시간</th>
	            	</tr>
            	</thead>
             <c:forEach var="dto" items="${list}">
                 
                 <tr>                     
                    <td>${dto.you}</td>
                    <td>${dto.p_name}</td>
                    <td><a href="#" class="go_chat" data="${dto.p_code}" data1="${dto.ch_code}" data2="${dto.you}">${dto.msg_content }</a></td>
                    <td>${dto.chat_time }</td>
                  </tr>
              </c:forEach>
           	</table>
            <a href="#">[맨 위로]</a>
            <p>
          </div>   
        </div>
      </div>
    </div>
   </body>
   

</html>