<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O!market</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css"/>
</head>
<style>
 @charset "UTF-8";
.top{
    width: 1720px;
    height: 100px;
    position: relative;
/*     border: 1px solid blue; */
/*     display: flex; */
/*     justify-content: center; */
/*     align-items: center; */
}
.topContainer{
    width: 1500px;
    height: 100px;
    /* border: 1px solid green; */
    position: absolute;
    left: 193px;
}
.topContainer div{
    position: absolute;
}
.logo{
    left: 100px;
    top: 30px;
    width: 200px;
    padding-bottom : 50px;
}

.search{
    left: 500px;
    top: 30px;
    width: 500px;
}
.keyword{
    width: 400px;
    height: 20px;
    border-radius: 5px;
}
.btn1{
    color: #fff;
    background: rgb(204, 170, 170);
    width: 75px;
    height: 30px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 5px;
  }

.memberMenu{
    left: 1050px;
    top: 30px;
    width: 700px;
}
.nick{
	font-size: 18pt;
	font-weight: 800;
	color: gold;
}
.categorybg{
    width: 1800px;
    height: 50px;
    
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto;
}
.categoryContainer{
    width: 1500px;
    height: 50px;
    position: relative;
    background: rgb(204, 170, 170);
    /* border: 1px solid yellow; */
}
.category{
    position: absolute;
    left: 0px;
    top: 0px;
    width: 1500px;
    border-spacing: 0px;
    color: white;
    font-weight: 800;
    font-size: 18pt;
}
.category td{
/*             border: 1px solid green; */
    width: 200px;
    height: 50px;
            text-align: center;
            transition: 0.2s;
}
.category td:hover{
    color: rgb(204, 170, 170);
    background: white;
}
</style>
<body>
    <div class="top">
        <div class="topContainer">
            <div class="logo" > 
               <a href="product_list.do">
                  <img src="<%=request.getContextPath()%>/resources/images/logo.JPG" alt="O!Market" width="210px" height="80px" margin-bottom ='20px'>
               </a>
            </div>
            <div class="search">
                <form action="product_list_search.do" name="search" method="GET">
                    <input type="text" name="keyword" class="keyword" value="${keyword}" placeholder="상품명 또는 거래장소를 검색하세요">
                    <input type="submit" value=" 검 색 " class="btn1">
                </form>
            </div>
            <div class="memberMenu">
               <c:choose>
                  <c:when test="${sessionScope.daum==null}">
                      <input type="button" onclick="location.href='login.do'" value="로그인" class="btn1">
                      <input type="button" onclick="location.href='signup.do'" value="회원가입" class="btn1">
                   </c:when>
                   <c:otherwise>
                      <font class="nick"> ${sessionScope.u_nick}</font>님 안녕세요
                      <input type="button" onclick="location.href='product_write.do'" value="상품등록" class="btn1">
                      <input type="button" onclick="location.href='mypage.do'" value="마이페이지" class="btn1">
                      <input type="button" onclick="location.href='logout.do'" value="로그아웃" class="btn1">
                  </c:otherwise>
               </c:choose>
            </div>
        </div>
    </div>
    <div class="categorybg">
        <div class="categoryContainer">
            <table class="category">
                <tr>
                    <td onclick="location.href='product_list.do?cate=cate1'">의류</td>
                    <td onclick="location.href='product_list.do?cate=cate2'">전자제품</td>
                    <td onclick="location.href='product_list.do?cate=cate3'">가구</td>
                    <td onclick="location.href='product_list.do?cate=cate4'">레저/스포츠</td>
                    <td onclick="location.href='product_list.do?cate=cate5'">생활용품</td>
                    <td onclick="location.href='product_list.do?cate=cate6'">기타</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>