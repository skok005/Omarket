<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title> login_Findidpwd.jsp </title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/login_Findpwd.css"/>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/login_Findidpwd.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".tabs" ).tabs();
    
  } );
  </script>
</head>
<body>
<div class="tabs">
  
  <ul>
    <li><a href="#find_Id">아이디 찾기</a></li>
    <li><a href="#find_Pwd">비밀번호 찾기</a></li>
  </ul>
  
  <div id="find_Id" >
   <form name="login_findId" id="login_findId" action="login_FindId.do">
    <table>
      <tr>
        <td>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다 </td>
      </tr>
    
      <tr>
        <td>
          <span class="subtitle">이메일&nbsp;&nbsp;&nbsp;</span>
        </td>
        <td>
          <input type="text" name="u_email" class="text" onblur="emailCheck()"> <span id="email_span"></span>
        </td>
      </tr>
    
     <tr>
       <td>
          <input type="button" value="찾기" id="" class="btn" onClick="check()">
      </td>
    </tr>
   </table>
  </form> 
 </div>
 
  
  
  <div id="find_Pwd" id="find_Pwd">
   <form name="login_findpwd" id="login_findpwd" action="login_Findpwd.do">
    <table>
       <tr>
         <td>비밀번호는 아이디,핸드폰,이메일을 통해 찾을 수 있습니다 </td>
       </tr>
       
       <tr>
         <td>
          <span class="subtitle">아이디&nbsp;&nbsp;&nbsp;</span>
         </td>
         <td>
          <input type="text" name="u_id" class="text" onkeyup="checkID()">
         </td>
      </tr>
      
      <tr>
       <td>
          <span id="u_id_span"></span>  
        </td> 
      </tr>
        
       <tr>
        <td>
          <span class="subtitle">핸드폰&nbsp;&nbsp;&nbsp;</span> 
        </td>
        <td>
          <input type="text" name="u_phone2" class="text_phone"  maxlength="4">- 
          <input type="text" name="u_phone3" class="text_phone"  maxlength="4">-
          <input type="text" name="u_phone4" class="text_phone"  maxlength="4">&nbsp;
        </td>
      </tr>
     
       
      <tr>
        <td>
          <label id="u_phone_label">&nbsp;&nbsp;</label>
        </td>
      </tr>
      
      <tr>
       <td>
         <span class="subtitle">이메일&nbsp;&nbsp;&nbsp;</span> 
       </td>
         <td>
        <input type="text" name="u_email" class="text" onkeyup="emailCheck2()">
      </tr>
      
      <tr>
       <td>
         <span id="email_span2"></span>
       </td>
      </tr>
      
      <tr>
       <td>
          <input type="button" value="찾기" id="" class="btn" onClick="check2()">
       </td>
      </tr>
     </table> 
   </form>
  </div>
</div>     
</body>
</html>