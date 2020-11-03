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
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
  	document.write_form.submit();
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

    function DaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {

        var fullAddr = ''; 
        var extraAddr = ''; 

        if (data.userSelectedType === 'R') { 
            fullAddr = data.roadAddress;
        } else {fullAddr = data.jibunAddress;}
        
        if(data.userSelectedType === 'R'){
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }
        document.getElementById('p_location1').value = fullAddr;
        document.getElementById('p_location2').focus();
        }         
      }).open();
	}//end	
  </script>
</head>
<body>
<div class="smallBody">
  <div class="product_outer">        
    <div class="product_title">
      <span>상품등록</span>
    </div>
    <div class="product_inner">  <p>      
      <form name="write_form" method="post" enctype="multipart/form-data" action="product_insert.do">
      <input type="hidden" name="u_code_seller" id="u_code_seller" value="${u_code_seller}">
        <ul class="p_list">
          <li>
            상품명:
          </li>
          <li>
          <input type="text" name="p_name" id="p_name" class="text"> 
          </li>
        </ul>
        <ul class="p_list">
          <li>
            판매자:
          </li>
          <li>
            <input type="text" name="u_nick" id="u_nick" value="${u_nick}" readonly class="text">
          </li>
        </ul>
        <ul class="p_list">
          <li>
            판매장소:
          </li>
          <li>
            <input type="text" name="p_location" id="p_location1" class="text">
          </li>
        </ul>        
        <ul class="p_list">
          <li>
            
          </li>
          <li>
            <input type="button" onclick="DaumPostcode()" value="우편번호">
          </li>
        </ul>
        <ul class="p_list">
          <li>
            상세주소:
          </li>
          <li>
            <input type="text" name="p_location" id="p_location2" class="text">
          </li>
        </ul>
        <ul class="p_list">
          <li>
            카테고리:
          </li>
          <li>
            <select name="p_category" class="text">
              <option value="cate1">의류</option>
              <option value="cate2">전자</option>
              <option value="cate3">가구</option>
              <option value="cate4">레저</option>
              <option value="cate5">생활</option>
              <option value="cate6">기타</option>
            </select>
          </li>
        </ul>
        <ul class="p_list">
          <li>
            가격:
          </li>
          <li>
            <input type="text" name="p_price" id="p_price" onkeyup="priceCheck()" class="text"> <label id="price_lable"></label>
          </li>
        </ul>
        <ul class="p_list">
          <li class="p_list_content">
          내 용:
          </li>
          <li>
            <textarea rows="5" cols="20" name="p_content" id="p_content" class="text"></textarea>
          </li>
        </ul>
        <ul class="p_list">
          <li>
            가격제안:
          </li>
          <li>
            <input type="radio" name="p_nego" value="yes" checked> Yes
            <input type="radio" name="p_nego" value="no"> No
          </li>
        </ul>
        <ul class="p_list">
          <li>
            파일:
          </li>
          <li>
            <input multiple="multiple" type="file" name="file" id="file" class="text">
          </li>
        </ul>
        <ul class="p_list">
          <li>
          </li>
          <li>
            <input type="button" value="등록" onclick="dataCheck()" class="btn">
            <input type="reset" value="취소" onclick="cancel()" class="btn"> 
          </li>
        </ul>  
      </form>        
    </div>       
  </div>
</div>
</body>
</html>
