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

  <div class="product_outer">        
    <div class="product_inner">
    	검색 결과가 없습니다.<br>
    	'상품명' 또는 '거래장소명'으로 검색 가능합니다.
    </div>
  </div>
  
</div>

</body>
</html>

