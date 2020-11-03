<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> signup_edit.jsp </title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/signup_write.css"/>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 다음 우편번호 서비스 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/signup_edit.js"></script>
<body>
<div class="smallBody">
  <div class="signup_outer"> 
   <div class="signup_title">
    개인정보 수정 
   </div>
    <div class="signup_inner">  <p>
     <form name="signupEdit" id="signupEdit" method="post" enctype="multipart/form-data" action="signupEdit.do">
     <table class="table">
      <tr>
        <td class="table_left">
           <span class="subtitle">아이디</span>
         </td>
         <td class="table_right">
           <input type="text" name="u_id" id="u_id" class="text" value="${dto.u_id}" readonly>
         </td>
      </tr>
      
       <tr>
        <td class="table_left">
          <span class="subtitle">비밀번호</span>
        </td>
        <td class="table_right">
         <input type="password" name="u_pwd" class="text"> 
        </td>
       </tr>
       
       <tr>
        <td class="table_left">
         <span class="subtitle">비밀번호 확인</span>
        </td>
        <td class="table_right">
         <input type="password" name="u_pwd2" class="text" onkeyup="checkPwd()"> 
        </td>
       </tr>
       
       <tr>
        <td colspan="2" class="table_label" >
         <label id="pwd_label">&nbsp;&nbsp;</label>
        </td>
       </tr>
       
       <tr>
        <td class="table_left">
         <span class="subtitle">닉네임</span>
        </td>
         <td class="table_right">
         <input type="text" name="u_nick" id="u_nick" class="text" value="${dto.u_nick}" readonly> 
        </td>
       </tr> 
      
       <tr>
        <td class="table_left">
         <span class="subtitle">프로필 사진</span>
        </td>
        <td class="table_right">
        <input type="file" name="u_profile_upload" id="u_profile_upload" onchange="profilePrview()"><span class="subtitle">원본사진 ${dto.u_profile}</span>
        </td>
    
        <td>
         <td rowspan="9">
          <div id="preview" ></div>
        </td>
       </tr> 
      
       <tr>
        <td class="table_left">
         <span class="subtitle">이메일</span>
        </td>
        <td class="table_right">
         <input type="text" name="u_email" class="text" value="${dto.u_email}"> 
        </td>
      </tr>
      
       <tr>
        <td class="table_left">
         <span class="subtitle">이메일 재확인</span>
        </td>
        <td class="table_right">
         <input type="text" name="u_email2" class="text"  onkeyup="emailCheck()"> 
        </td>
      </tr>
      
      <tr>
        <td colspan="2" class="table_label" >
         <span id="email_span"></span>
        </td>
      </tr>
       <tr>
        <td class="table_left">
          <span class="subtitle">핸드폰</span>
        </td>  
        <td class="table_right">
          <input type="text" name="u_phone2" class="text_phone" value="${dto.u_phone2}" maxlength="4">- 
          <input type="text" name="u_phone3" class="text_phone" value="${dto.u_phone3}" maxlength="4">-
          <input type="text" name="u_phone4" class="text_phone" value="${dto.u_phone4}" maxlength="4" >&nbsp;
        </td>
      </tr>
      
      <tr>
        <td colspan="2" class="table_label" >
          <label id="u_phone_label">&nbsp;&nbsp;</label>
        </td>
      </tr>
       <tr>
        <td class="table_left">
         <span class="subtitle">주소</span>
         </td>
         <td class="table_right">
         <input type="text" name="u_addr1" id="u_addr1" class="text_addr"  value="${dto.u_addr1}" readonly>
         <input type="button"  onclick="DaumPostcode()" value="우편번호"> 
        </td>
      </tr>
      
      <tr>
        <td class="table_left">
         <span class="subtitle">상세 주소</span>
        </td>
        <td class="table_right">
        <input type="text" name="u_addr2" id="u_addr2" class="text_addr" value="${dto.u_addr2}" > 
        </td>
      </tr>
     
      <tr>
       <td colspan="2" class="button_container">
        <input type="reset" class="btn" value="입력취소">
        <input type="button" class="btn" value="확인" onclick="check()">
       </td>
      </tr>
      
     </table>
  </form>
  </div> 
 </div>  
</div>
</body>
</html>

<!-- private int u_code;
  private String u_id; 아디
  private String u_pw; 비번
  private String u_nick; 닉네임
  private String u_email; 이메일
  private int u_phone; 전화번호
  private String u_addr1; 주소
  private String u_addr2; 주소2
  private String u_premium; 프리미엄 여부
  private String u_profile; 사진
  private String u_key; 유저키
  private String u_status; 유저상태

 -->