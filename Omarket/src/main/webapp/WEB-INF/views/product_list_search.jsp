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
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product_list.css"/>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/product_list.js"></script>
</head>
<body>
<div class="smallBody">

  <c:if test="${cntNam>0}">
  <div class="product_outer">        
    <div class="product_title_search">
      <span class="product_guide">'${keyword}' in 상품명</span>
      <span class="product_cnt">${cntNam}개의 검색결과</span>
    </div>
    <div class="product_inner">
      <c:forEach var="mdto" items="${listNam}">
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
    </div>
  </div>
  </c:if>
  
  <c:if test="${cntLoc>0}">
  <div class="product_outer">        
    <div class="product_title">
      <span class="product_guide">'${keyword}' in 지역명</span>
      <span class="product_cnt">${cntLoc}개의 검색결과</span>
    </div>
    <div class="product_inner">
      <c:forEach var="mdto" items="${listLoc}">
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
      <a href="#">[맨 위로]</a>
      <p>
    </div>
    </div>
  </div>
  </c:if>   
</div>
</body>
</html>

