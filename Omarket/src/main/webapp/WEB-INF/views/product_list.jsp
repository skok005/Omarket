<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="./header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
  <title>product_list</title>
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product_list.css"/>

</head>
<body>

<div class="pre">
 	<div class="premium">프리미엄 상품</div>
</div>
<div class="show">
	   <c:forEach var="mdto2" items="${list2}">
		   <div class="productList">
			     <div class="innerProduct">
			       <a href="product_detail.do?p_code=${mdto2.p_code}&u_code_seller=${mdto2.u_code_seller}">
			         <img src="${pageContext.request.contextPath}/resources/upload/${mdto2.pic_name}" class="img">
			       </a>
			     </div>
			     <div class="productDetail">
			       <div class="title">
			         <intro class="intro">상품명</intro> : ${mdto2.p_name}
			       </div>
			       <div class="title">
			         <intro class="intro">가격</intro> : ${mdto2.p_price}원
			       </div>
			       <div class="title">
			         <intro class="intro">판매장소</intro> :
			       </div>
			       <div class="title">
			         <intro class="intro"></intro> <span>${mdto2.p_location}</span>
			       </div>
			       <div class="title">
			         <intro class="intro">찜</intro> : ${mdto2.p_jjimcnt} &nbsp;
			         <intro class="intro">채팅</intro> : ${mdto2.p_chatcnt} &nbsp;
			         <intro class="intro">조회</intro> : ${mdto2.p_hit}
			       </div>
			       <div class="title">
			         <intro class="intro">등록일</intro> : ${mdto2.p_rdate}
			       </div>
			       <div class="title">
			         <intro class="intro">수정일</intro> : ${mdto2.p_edate}
			       </div>
			     </div>            
		   </div>   
	 </c:forEach>
</div>

<div class="smallBody">
  <div class="product_outer">        
    <div class="product_title">
      <span>상품목록</span> 
    </div>
    <div class="product_inner">
      <c:forEach var="mdto" items="${list}">
        <div class="productList">
          <div class="innerProduct">
            <a href="product_detail.do?p_code=${mdto.p_code}&u_code_seller=${mdto.u_code_seller}">
              <img src="${pageContext.request.contextPath}/resources/upload/${mdto.pic_name}" class="img">
            </a>
          </div>
          <div class="productDetail">
            <div class="title">
              <intro class="intro">상품명</intro> : ${mdto.p_name}
            </div>
            <div class="title">
              <intro class="intro">가격</intro> : ${mdto.p_price}원
            </div>
            <div class="title">
              <intro class="intro">판매장소</intro> :
            </div>
            <div class="title">
              <intro class="intro"></intro> <span>${mdto.p_location}</span>
            </div>
            <div class="title">
              <intro class="intro">찜</intro> : ${mdto.p_jjimcnt} &nbsp;
              <intro class="intro">채팅</intro> : ${mdto.p_chatcnt} &nbsp;
              <intro class="intro">조회</intro> : ${mdto.p_hit}
            </div>
            <div class="title">
              <intro class="intro">등록일</intro> : ${mdto.p_rdate}
            </div>
            <div class="title">
              <intro class="intro">수정일</intro> : ${mdto.p_edate}
            </div>
          </div>            
        </div>   
      </c:forEach>
      
      <div class="page">
      
	        <c:if test="${startpage!=1}">
	     	  	<a href="product_list.do?pageNum=${startpage-1}">[이전]</a>
	     	</c:if>	
	     	
	  	 	<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
		   		  <c:choose>
			   		    <c:when test="${pageNum==i}">
			   			  	<font style="color: red;">[${i}]</font>
			   	        </c:when>
			   		    <c:otherwise>
			   			  	<a href="product_list.do?pageNum=${i}${returnpage}">[${i}]</a>
			   		    </c:otherwise>  	 		
		   		  </c:choose>
	  	 	</c:forEach>
	  	 	  
	  	 	<c:if test="${endpage<pagecount}">
	  	 	  	<a href="product_list.do?pageNum=${endpage+1}">[다음]</a>
	  	 	</c:if>	   
	        <p>
      </div>    
    </div>
  </div>
</div>

 <script>
        $('.show').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
        });
 </script>
 
</body>
</html>

