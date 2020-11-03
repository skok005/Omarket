<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="./header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
  <title>product_wirte</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product_write.css"/>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
    function dataCheck(){
      var name = $('#p_name').val();
      var price = $('#p_price').val();
      var content = $('#p_content').val();
      
  	  if(name == null || name == ""){
        alert("상품명을 입력하세요");
    	return;
  	  }

  	  if(price == null || price == ""){
        alert("가격을 입력하세요");
        return;
      }

  	  if(content == null || content == ""){
        alert("내용을 입력하세요");
        return;
      }
  	document.edit_form.submit();
    }//end

    function priceCheck(){
      var price = $('#p_price').val();
      var regexp = /^[0-9]*$/
      
      if(!regexp.test(price)){
        $('#price_lable').html("<font style='color:red; font-size:10pt;'>숫자를 입력하세요</font>");
        return;
      }else{
    	$('#price_lable').html("");
        return;
      }
    }//end

    function cancel(){
      history.back();
    }//end

    $(function(){      
      $('.remainFile').click(function(){
        var want_remove = $('#pic_code_cont').val();
        var code = $(this).prev().val();

        want_remove = want_remove + " " + code;
  	    $('#pic_code_cont').val(want_remove);

        $(this).prev().remove();
        $(this).remove();      
      })    
    });
        
  </script>
</head>
<body>
<div class="smallBody">
  <div class="product_outer">        
    <div class="product_title">
      <span>상품수정</span>
    </div>
    <div class="product_inner">  <p>      
      <form name="edit_form" method="post" enctype="multipart/form-data" action="product_edit.do">
      <input type="hidden" name="p_code" id="p_code" value="${p_code}">
      <input type="hidden" name="u_code_seller" id="u_code_seller" value="${mdto.u_code_seller}">
        <ul class="p_list">
          <li>
            상품명:
          </li>
          <li>
          <input type="text" name="p_name" id="p_name" value="${mdto.p_name}" class="text"> 
          </li>
        </ul>
        <ul class="p_list">
          <li>
            판매자:
          </li>
          <li>
            <input type="text" name="u_nick" id="u_nick" value="${mdto.u_nick}" readonly class="text">
          </li>
        </ul>
        <ul class="p_list">
          <li>
            판매위치:
          </li>
          <li>
            <input type="text" name="p_location" id="p_location" value="${mdto.p_location}" readonly class="text">
          </li>
        </ul>
        <ul class="p_list">
          <li>
            카테고리:
          </li>
          <li>
            <select name="p_category" class="text">
              <option value="cate1" <c:if test="${fn:contains(mdto.p_category,'cate1')}">selected</c:if>>의류</option>
              <option value="cate2" <c:if test="${fn:contains(mdto.p_category,'cate2')}">selected</c:if>>전자</option>
              <option value="cate3" <c:if test="${fn:contains(mdto.p_category,'cate3')}">selected</c:if>>가구</option>
              <option value="cate4" <c:if test="${fn:contains(mdto.p_category,'cate4')}">selected</c:if>>레저</option>
              <option value="cate5" <c:if test="${fn:contains(mdto.p_category,'cate5')}">selected</c:if>>생활</option>
              <option value="cate6" <c:if test="${fn:contains(mdto.p_category,'cate6')}">selected</c:if>>기타</option>
            </select>
          </li>
        </ul>
        <ul class="p_list">
          <li>
            가격:
          </li>
          <li>
            <input type="text" name="p_price" id="p_price" value="${mdto.p_price}" onkeyup="priceCheck()" class="text"> <label id="price_lable"></label>
          </li>
        </ul>
        <ul class="p_list">
          <li class="p_list_content">
          내 용:
          </li>
          <li>
            <textarea rows="5" cols="20" name="p_content" id="p_content" class="text">${mdto.p_content}</textarea>
          </li>
        </ul>
        <ul class="p_list">
          <li>
            가격제안:
          </li>
          <li>
            <input type="radio" name="p_nego" value="yes" <c:if test="${fn:contains(mdto.p_nego,'yes')}">checked</c:if>> Yes
            <input type="radio" name="p_nego" value="no" <c:if test="${fn:contains(mdto.p_nego,'no')}">checked</c:if>> No
          </li>
        </ul>
        <ul class="p_list">
          <li>
            파일 추가:
          </li>
          <li>
            <input multiple="multiple" type="file" name="file" id="file" class="text">
          </li>
        </ul>
        <ul class="p_list">
          <li>
            기존 파일:
          </li>
          <li>
          <font style="color:red; font-size:10pt;">*삭제하실 사진을 선택해 주세요*</font>
            <c:forEach var="mdto" items="${flist}">
              <input type="hidden" name="pic_code_edit" class="pic_code_edit" value="${mdto.pic_code}">          
              <input type="text" value="${mdto.pic_name}" class="remainFile">
            </c:forEach> 
            <input type="hidden" name="pic_code_cont" id="pic_code_cont">
          </li>
        </ul>        
        <ul class="p_list">
          <li>
          </li>
          <li>
            <input type="button" value="수정" onclick="dataCheck()" class="btn">
            <input type="reset" value="취소" onclick="cancel()" class="btn"> 
          </li>
        </ul>
      </form>        
    </div>       
  </div>
</div>
</body>
</html>
