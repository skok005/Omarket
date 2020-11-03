<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<html>
<head>
   <title>view_chat.jsp</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    .chat_cont{
        width: 500px;
        margin-top: 30px;
        margin-left: 20px;
    }
    .chat_send{
        margin-top: 10px;
        width: 500px;
        margin-left: 20px;
        text-align: center;
    }
    /* .chat_send  */
    .chat_cont .msgBox {
     /* border: 1px solid red;    */
     margin: 10px 0;
    }
    .chat_cont .msgBox ul{
        list-style: none;
        margin: 0 0 0 0;
        padding: 0 0 0 0;
        /* border : 1px solid green; */
        width: 220px;
        /* position: absolute; */
        /* height: 30px; */
        
    }
    .chat_cont div .me{
       margin-left: 50%;
    }
    .chat_cont span .you{

    }
    .chat_cont .msgBox ul li{
        display: inline-block;        
    }
    .chat_cont .msgBox ul li:first-child{
        width: 50px;
        /* border: 1px solid red; */
        
    }
    .chat_cont .msgBox ul li:last-child{
        width: 150px;
        /* border: 1px solid blue; */
        background-color: rgb(255, 133, 51);
        color: white;
        border-radius: 5px;
        text-align: center;
    }
</style>

<body>

<script>
   

   $(document).ready(function(){
        $('#sendBtn').on("click",function(){
            sendMessage();
//           console.log("aaaaa");
          //메시지 전송과는 별개로 메시지를 DB에 입력
          var u_code = $('.chat_cont').attr("data-uCode");
          var ch_code = $('.chat_cont').attr("data-chCode");
          console.log(u_code);
          console.log(ch_code);
          var content = {'msg_content' : $("#message").val(),
                         'ch_code' : ch_code,
                         'u_code' : u_code};
          
         $.ajax({
            url : "${pageContext.request.contextPath}/insertMsg.do",
            type: "post",
            dataType : "json",              
            data : JSON.stringify(content),
            contentType : "application/json; charset=utf-8",
            success : function(data){
                     console.log(data.status);
                     console.log("성공");
                       },
            error : function(request, error){
               console.log("실패aaaaaaaaaaaaa");
               console.log("code:"+request.status+"\n"+"message:"
            +request.responseText+"\n"+"error:"+error);
            }   
         })//ajax end
            
            $('#message').val("");
        });

        $("#message").on("keydown",function(event){
         if(event.keyCode==13){
            $("#sendBtn").trigger("click");
//             return false;
         }
        })
        function addClass(){
           console.log(${userInfo.u_code});
          if($('.chat_cont>span>ul').attr("data-uCode")==${userInfo.u_code})
             $(this).addClass("me");
        }
        
    })
    
   var wsocket;
   
   var protocol = "ws:";

   var stx = window.location.origin;
   console.log("주소" + stx);
   var ctx = location.href.replace(stx,"").split("/").slice(0,2).join("/");// 서버에 올릴때 처리 안함
   var aCtx = protocol + stx.replace(window.location.protocol,"") + ctx;
   console.log("aCtx   " + aCtx);

   wsocket = new WebSocket(aCtx+"/ws/websocket");
   console.log(wsocket);
   /* The onmessage property of the WindowEventHandlers is
    the EventHandler called whenever an object receives a message event. */ 
    wsocket.onmessage = onMessage;

   wsocket.onclose = onClose;
 
   function sendMessage() {
      wsocket.send($("#message").val());
    }
   
    function onMessage(evt) {
        var data = evt.data;
        var time = new Date();
        console.log(evt);
        var $msg_ul="<span>";
           $msg_ul+="<ul data-uCode="+${userInfo.u_code}+" class = 'me'>";
           $msg_ul+="<li>" +time.getHours()+":"+time.getMinutes()+"</li>";
           $msg_ul+="<li>"+data+"</li>";
//            $msg_ul+="<li>"+evt+"</li>";
            $msg_ul+="</ul>";
            $msg_ul+="</span>";
        $(".chat_cont").append($msg_ul);
//         con
    }
    $(document).ready(function(){
      $('#exitBtn').click(function(){
         wsocket.close();
         window.close();
      });
   })
      
    function onClose(evt) {
        $("#data").append("연결 끊김");
    }
   
</script>


<h1>
   ${you }님과의 대화
</h1>
<div>
   <div class="chat_cont" data-uCode="${userInfo.u_code}" data-chCode="${userInfo.ch_code}">   
      <c:forEach var="msg" items="${msgs}">
         <div class="msgBox">
            <c:choose>
               <c:when test="${msg.u_code eq ucode}">            
                  <ul class="me">
               </c:when>
               <c:otherwise>
                  <ul>
               </c:otherwise>
            </c:choose>
               
               <li>${ msg.msgdate}</li>
               <li>${ msg.msg_content}</li>
            </ul>
         </div>
       </c:forEach>
    </div>
</div>
<div id="data"></div>
 <div class="chat_send">
        <input type="text" id="message">
        <input type="button" id="sendBtn" value="전송">
        <input type="button" id="exitBtn" value="나가기">
      <c:if test="${ucode eq sellerInfo.u_code}">
         <input type="button" id="sellComBtn" onclick="sellCom()" value="판매완료">
      </c:if>        
</div>
<script>
   function sellCom(){
         alert("판매완료");
   }
</script>
</body>
</html>