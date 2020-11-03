<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="./header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
  <title>product_detail</title>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12655b8c06e0cca5e31de284b4c8b1bf&libraries=services,clusterer,drawing"></script>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product_detail.css"/>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/product_detail.js"></script>
</head>
<body>
<div class="smallBody">
  <div class="product_outer">        
    <div class="product_title">
      <span>상품정보</span>
    </div>
    <div class="product_inner">
        <div class="productList">
        <span class="ed" style="margin-left: 530px;">
          <c:if test="${mdto.u_id eq u_id}">
            <a href="product_preEdit.do?p_code=${mdto.p_code}">[수정]</a> 
            <a href="product_delete.do?p_code=${mdto.p_code}">[삭제]</a>  
          </c:if>
        </span> 
          <div class="innerProduct"> <p> 
            <c:forEach var="mdto" items="${flist}">
              <img src="${pageContext.request.contextPath}/resources/upload/${mdto.pic_name}" class="img">
            </c:forEach>
          </div>
          <div class="productDetail">
            <div class="title">
              <intro class="intro">판매자</intro> : <img src="${pageContext.request.contextPath}/resources/upload/${mdto.u_profile}" class="proimg"> ${mdto.u_nick} &nbsp;&nbsp;
              <intro class="intro">매너온도</intro> : ${mdto.u_manner}˚c &nbsp;&nbsp;   
              <c:if test="${u_id ne '0' && mdto.u_id ne u_id}">
                <input type="button" class="jjim" value="찜" style="width:40px; height:30px;">
              </c:if>
            </div>
            <div class="title">
              <intro class="intro">판매상태</intro> : 
              <c:if test="${mdto.p_status eq 'sale'}">판매중</c:if>
              <c:if test="${mdto.p_status eq 'sold'}">판매완료</c:if>
            </div>
            <div class="title">
              <intro class="intro">상품명</intro> : <span>${mdto.p_name}</span>
            </div>
            <div class="title">
              <intro class="intro">가격</intro> : <span>${mdto.p_price}원</span>
            </div>
            <div class="title">
              <intro class="intro">판매장소</intro> :
              <div id="map" style="width:500px;height:400px;"></div>
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
              <intro class="intro">등록일</intro> : <span>${mdto.p_rdate}</span>
            </div>
            <div class="title">
              <intro class="intro">수정일</intro> : <span>${mdto.p_edate}</span>
            </div>
            <div class="title">
              <intro class="intro">가격제안</intro> : ${mdto.p_nego} &nbsp;&nbsp;
            <c:if test="${u_id ne '0' && mdto.u_id ne u_id}">
              	<input type="button" class="go_chat" value="채팅하러가기" style="width:100px; height: 30px;">
            </c:if>
            </div>    
            <div>
              <intro class="intro">상품설명</intro> : 
            </div>
            <div>
              ${mdto.p_content} <p>
            </div>                

            <div>
              <intro class="intro">${mdto.u_nick}님의 다른 상품</intro> : <span></span>
            </div>            
            <c:forEach var="mdto" items="${slist}">
              <div class="productSList">
                <div class="innerSProduct">
                  <a href="product_detail.do?p_code=${mdto.p_code}&u_code_seller=${mdto.u_code_seller}">
                    <img src="${pageContext.request.contextPath}/resources/upload/${mdto.pic_name}" class="Simg">
                  </a>
                </div>
                <div class="productSDetail">
                  <div class="title">
                    <intro class="Sintro">상품명</intro> : <cont class="Scon">${mdto.p_name}</cont>
                  </div>
                  <div class="title">
                    <intro class="Sintro">가격</intro> : <cont class="Scon">${mdto.p_price}원</cont>
                  </div>
                  <div class="title">
                    <intro class="Sintro">판매장소</intro> :
                  </div>
                  <div class="title">
                    <intro class="Sintro"></intro>  <cont class="Scon">${mdto.p_location}</cont>
                  </div>
                  <div class="title">
                    <intro class="Sintro">찜</intro> : ${mdto.p_jjimcnt} &nbsp;
                    <intro class="Sintro">채팅</intro> : ${mdto.p_chatcnt} &nbsp;
                    <intro class="Sintro">조회</intro> : ${mdto.p_hit}
                  </div>
                </div>            
              </div>   
            </c:forEach>
          </div>  
        </div>           
    </div>
  </div>
  <script>
  $(function(){
      $('.go_chat').click(function(){
        var p_code = ${mdto.p_code};
        console.log(p_code);
        var you = '${mdto.u_nick}';
        console.log(you);
        var title = 'chat';
        window.open('chatting.do?idx='+p_code+'&you='+you,title,'width=650,height=850');
      })      
      
      $('.jjim').click(function(){
        var p_code = ${mdto.p_code};
       var u_code_seller = ${mdto.u_code_seller};
        $('.jjim').css('background-color', '#ccaaaa');
        location.href="product_jjim.do?p_code="+p_code+"&u_code_seller="+u_code_seller;
      })
      
      <c:forEach items="${jlist}" var="jmdto">       
        if(${jmdto.u_code} == ${u_code} && ${jmdto.p_code} == ${mdto.p_code}){
               $('.jjim').ready(function(){
               $('.jjim').css('background-color', '#ccaaaa');
              $('.jjim').val('♥');
              $('.jjim').off('click');
            })         
        }//if end
      </c:forEach>
   })    
   var container = document.getElementById('map'); //지도 표시 div
        var options = {
            center: new kakao.maps.LatLng(36.300442, 127.574917), //지도의 중심좌표
            level: 3 //지도의 확대 레벨
        };
        var map = new kakao.maps.Map(container, options);
        var geocoder = new kakao.maps.services.Geocoder();
        
        var addressArray= ['${mdto.p_location}'];
      
      
        for ( var i =0;i<addressArray.length;i++){
            geocoder.addressSearch(
                addressArray[i],
                function(result,status,data){
                    if (status === kakao.maps.services.Status.OK) {
                        var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
                         var marker = new kakao.maps.Marker({
                            map : map,
                            position : coords
                        });
                        marker.setMap(map);
                        map.setCenter(coords);
                    }
                }
            )
        }   
</script>
</div>
</body>
</html>
