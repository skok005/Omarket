<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/mypage.js"></script>

</head>
<body>
   <div class="mypageContainer">
        <table class="basicTable">
            <tr>
                <td rowspan="4" width="40%" align="center">
                    <div class="profile">
                        <img src="${pageContext.request.contextPath}/resources/upload/${u_profile}" alt="profile">
                    </div>
                    <div>
                    <h1>${u_dto.getU_nick()}</h1>
                    <p class="premiumSet">
                       <c:choose>
                          <c:when test="${u_dto.getU_premium()==null}">
                             <a href="pay.do" class="premiumChange">[프리미엄 전환하기]</a>                             
                          </c:when>      
                          <c:otherwise>
                             <font class="premium">프리미엄</font>
                             <div>${u_dto.getU_premium_term()} </div>까지
                             <p>
                             <a href="pay.do" class="premiumChange">[프리미엄 연장하기]</a>
                          </c:otherwise>
                       </c:choose>
                    </p>
                    <p class="basic">
                        ${u_dto.getU_phone()}<br>
                        ${u_dto.getU_email()}
                    </p>
                    <input type="submit" value="개인정보수정" class="buttonn" onClick="location.href='signup_preEdit.do?idx=${u_nick}'">
                    </div>
                </td>
                <td colspan="3" align="center">
                    매너온도
                    <h2>
                       ${mannerDeg}℃
                    </h2>
                </td>
            </tr>
            <tr>
                <td  id="positive" class="jbs" style="background-color: green; text-align: center; color: white;">
                    좋아요 <br> ${like} 
                </td>
                <td id="normal" class="jbs" style="background-color: #0000d0; text-align: center; color: white;">
                   그저그래요 <br> ${norm}
                </td>
                <td id="negative" class="jbs" style="background-color: #c10000; text-align: center; color: white;">
                   싫어요 <br> ${dislike}
                </td>
            </tr>
            <tr>
                <td colspan="3" class="sellButton" onclick="location.href='product_write.do'">
                    <input type="button" class="buttonn" value="상품등록"> 
                </td>
            </tr>
            <tr>
                <td colspan="3" class="chattingButton" data="${u_dto.getU_code()}">
                  <button type="button" class="buttonn">채팅관리 </button>
                  <button type="button" class="buttonn">판매채팅:${sellChatCnt} </button>
                  <button type="button" class="buttonn">구매채팅:${buyChatCnt} </button>
                </td>
            </tr>
        </table>
        <div class="jjimTitle">찜목록</div>
        <div class="jjim">
           <table class="basicTable">
                <c:forEach var="jjimDto" items="${jjimList}">
                  <tr>
                      <td align="center">
                          <img src="${pageContext.request.contextPath}/resources/upload/${jjimDto.pic_name}" alt="대표사진" width="120px" height="120px">
                      </td>
                      <td width="50%">
                          <a class="p_title" href="product_detail.do?p_code=${jjimDto.p_code}&u_code_seller=${jjimDto.u_code}">${jjimDto.p_name}</a><br>
                          <div>
                              ${jjimDto.p_price}원
                               <c:if test="${jjimDto.p_nego.equals('yes')}">
                                  [협상가능]
                               </c:if><br>
                              ${jjimDto.p_location}<br>
                              찜${jjimDto.p_jjimcnt} &nbsp; 채팅${jjimDto.p_chatcnt}
                          </div>
                      </td>
                      <td align="center">
                         <c:choose>
                             <c:when test="${jjimDto.p_status.equals('sale')}">
                                <input type="button" class="buttonn" value="판매 중"> <p>
                             </c:when>
                             <c:when test="${jjimDto.p_status.equals('reserve')}">
                                <input type="button" class="buttonn" value="예약 중"> <p>
                             </c:when>
                             <c:otherwise>
                                <input type="button" class="buttonn" value="판매완료"> <br>
                             </c:otherwise>
                          </c:choose>
                          <input type="button" class="buttonn" value="찜목록에서 제거" onclick="deleteJjim(${jjimDto.u_code},${jjimDto.p_code})">
                      </td>
                  </tr>
              </c:forEach>
           </table>
        </div>
        <div class="tradeList">
            <div class="tab">
                <input type="button" value="판매 관리" class="tablinks" onclick="openTrade(event,'sell')" 
                  style="background-color: rgb(204, 170, 170);
                    font-weight: bold; 
                    color: white;
                    border: none;
                    cursor: pointer;
                    border-radius: 10px;
                    width: 497px;
                    height: 30px;">
                <input type="button" value="구매 내역" class="tablinks" onclick="openTrade(event,'buy')" 
                  style="background-color: rgb(204, 170, 170);
                    font-weight: bold; 
                    color: white;
                    border: none;
                    cursor: pointer;
                    border-radius: 10px;
                    width: 497px;
                    height: 30px;">
            </div>
            <div id="sell" class="basicTable tabcontent">
               <table class="basicTable sellTable">
                  <c:forEach var="sellDto" items="${sellList}">
                      <tr>
                          <td align="center">
                              등록일<br>
                              ${sellDto.regDate}
                          </td>
                          <td align="center">
                              <img src="${pageContext.request.contextPath}/resources/upload/${sellDto.pic_name}" alt="대표사진" width="120px" height="120px">
                          </td>
                          <td width="50%">
                               <a class="p_title" href="product_detail.do?p_code=${sellDto.p_code}&u_code_seller=${sellDto.u_code_seller}">${sellDto.p_name}</a><br>
                              <div>
                                  ${sellDto.p_price}원
                                     <c:if test="${sellDto.p_nego.equals('yes')}">
                                        [협상가능]
                                     </c:if><br>
                                  ${sellDto.p_location}<br>
                                  찜${sellDto.p_jjimcnt} &nbsp; 채팅${sellDto.p_chatcnt}
                              </div>
                          </td>
                          <td align="center">
                             <c:choose>
                                <c:when test="${sellDto.p_status.equals('sale')}">
                                    <input type="button" class="buttonn" value="판매 중"> <p>
                                     <input type="button" class="buttonn" value="끌올하기"
                                         onClick="location.href='productRelist.do?idx=${sellDto.p_code}'"> <p>
                                 </c:when>
                                 <c:when test="${sellDto.p_status.equals('reserve')}">
                                    <input type="button" class="buttonn" value="예약 중"> <p>
                                 </c:when>
                                 <c:otherwise>
                                    <input type="button" class="buttonn" value="판매완료"> <p>
                                 </c:otherwise>
                              </c:choose>
                              <c:if test="${sellDto.p_status.equals('sale')||sellDto.p_status.equals('reserve')}">
                                 <div class = "status_con" data-Pcode="${sellDto.p_code}">
                                    <input type="button" id="buttonn" class="chStatus" value="판매상태 변경">
                                 </div>
                              </c:if>
                          </td>
                      </tr>
                   </c:forEach>
               </table>
            </div>
            <div id="buy" class="tabcontent">
               <table class="basicTable buyTable">
                  <c:forEach var="buyDto" items="${buyList}">
                      <tr>
                          <td align="center">
                              구매일<br>
                              ${buyDto.trdDate}
                          </td>
                          <td align="center">
                              <img src="${pageContext.request.contextPath}/resources/upload/${buyDto.pic_name}" alt="대표사진" width="120px" height="120px">
                          </td>
                          <td width="50%">
                               <a class="p_title" href="product_detail.do?p_code=${buyDto.p_code}&u_code_seller=${buyDto.u_code_seller}">${buyDto.p_name}</a><br>
                              <div>
                                  ${buyDto.p_price}원
                                  <c:if test="${buyDto.p_nego.equals('yes')}">
                                     [협상가능]
                                  </c:if><br>
                                  ${buyDto.p_location}<br>
                                  찜${buyDto.p_jjimcnt} &nbsp; 채팅${buyDto.p_chatcnt}
                              </div>
                          </td>
                          <td align="center">
                             <c:choose>
                                <c:when test="${buyDto.eval_cnt>0}">
                                   <input type="button" class="buttonn" value="평가완료">
                                 </c:when>
                                 <c:otherwise>
                                   <input type="button" class="buttonn" value="거래평가" onclick="openEval(${buyDto.p_code},${u_code},${buyDto.u_code_seller})">
                                 </c:otherwise>
                              </c:choose>
                          </td>
                      </tr>
                  </c:forEach>
               </table>
            </div>
        </div>
                
        <div class="posContainer">
          <div class="tri"></div>
          <table class="mannerDetail">
             <tr>
                <td class="sentence">즐거운 마음으로 거래해요</td>
                <td class="count">${dtoPos.getEval_pos_cnt1()}</td>
             </tr>
             <tr>
                <td class="sentence">예의에 어긋난 말을 하지 않아요</td>
                <td class="count">${dtoPos.getEval_pos_cnt2()}</td>
             </tr>
             <tr>
                <td class="sentence">상대방을 배려해요</td>
                <td class="count">${dtoPos.getEval_pos_cnt3()}</td>
             </tr>
             <tr>
                <td class="sentence">약속시간을 잘 지켜요</td>
                <td class="count">${dtoPos.getEval_pos_cnt4()}</td>
             </tr>
             <tr>
                <td class="sentence">서로 돕는 협상을 해요</td>
                <td class="count">${dtoPos.getEval_pos_cnt5()}</td>
             </tr>
          </table>
       </div>
       <div class="normalContainer">
          <div class="tri"></div>
          <table class="mannerDetail">
             <tr>
                <td class="sentence">많은 얘기를 하지 않아요</td>
                <td class="count">${dtoNormal.getEval_normal_cnt1()}</td>
             </tr>
             <tr>
                <td class="sentence">화는 안내지만 재미는 없어요</td>
                <td class="count">${dtoNormal.getEval_normal_cnt2()}</td>
             </tr>
             <tr>
                <td class="sentence">정해진 가격만 말해요</td>
                <td class="count">${dtoNormal.getEval_normal_cnt3()}</td>
             </tr>
             <tr>
                <td class="sentence">많이 떨어요</td>
                <td class="count">${dtoNormal.getEval_normal_cnt4()}</td>
             </tr>
             <tr>
                <td class="sentence">빠르게 거래해요</td>
                <td class="count">${dtoNormal.getEval_normal_cnt5()}</td>
             </tr>
          </table>
       </div>
       <div class="negaContainer">
          <div class="tri"></div>
          <table class="mannerDetail">
             <tr>
                <td class="sentence">온라인에서와 다른 조건을 주장해요</td>
                <td class="count">${dtoNega.getEval_nega_cnt1()}</td>
             </tr>
             <tr>
                <td class="sentence">예의가 없어요</td>
                <td class="count">${dtoNega.getEval_nega_cnt2()}</td>
             </tr>
             <tr>
                <td class="sentence">불쾌한 말이나 행동을 해요</td>
                <td class="count">${dtoNega.getEval_nega_cnt3()}</td>
             </tr>
             <tr>
                <td class="sentence">약속시간을 안지켜요</td>
                <td class="count">${dtoNega.getEval_nega_cnt4()}</td>
             </tr>
             <tr>
                <td class="sentence">협상을 자기 위주로 해요</td>
                <td class="count">${dtoNega.getEval_nega_cnt5()}</td>
             </tr>
          </table>
       </div>
       
    </div>

    <div class="statusList">       
           <input type="radio" name="ckStatus" value="sale">판매중
           <input type="radio" name="ckStatus" class="reserve" value="reserve">예약중
           <input type="radio" name="ckStatus" value="sold"> 판매완료               
    </div>
    
     <script>

        function openEval(p_code,u_code_sender,u_code_receiver){
            var url = "eval.do?pcod=" + p_code + "&send=" + u_code_sender + "&receive=" + u_code_receiver;         
            window.open(url, "Evaluate", "width=310, height=350, left=200, top=200, resizable=no");
       }//openEval END

      $(function(){

         
         $('.chStatus').on("click", function(){
            var $parent =$(this).parent(); 
            var $status = $('.statusList').html();
            $(this).remove();      
            $parent.html($status);
         });
         
         var pcode="";
         var status="";

         
         
         $(document).on("change","input:radio[name='ckStatus']",function(){

            pcode = $(this).parent().attr("data-Pcode");
            status = $(this).val();
            
            if($(this).val() == 'reserve'||$(this).val() == 'sale'){
               
               console.log($(this).parent().attr("class"));
               console.log($(this).parent().attr("data-Pcode"));
               updateStatus(pcode,status);
               pcode=null;
               status=null;
               
            }else{            
                  
               var nickCkBox = "";
                  nickCkBox += "<div>";
                  nickCkBox += "<span>구매자의 닉네임을 입력하세요</span>";
                  nickCkBox += "<input type='text' id='mannerNick'>";
                  nickCkBox += "<input type='button' id='nickSend' value='닉네임 확인'>";
                  nickCkBox += "</div>";
                  
               $(this).parent().append(nickCkBox);
            }         
         })
         
         $(document).on('click','#nickSend',function(){
            
            var uNick = $('#mannerNick').val();
            var ckData= {'u_nick' : uNick};
            
            console.log(ckData);
            
            $.ajax({
               url : "${pageContext.request.contextPath}/mannerNick.do",
                 type: "post",
                 dataType : "json",              
                 data : JSON.stringify(ckData),
                 contentType : "application/json; charset=utf-8",
                 success : function(data){
                    
                        if(data.status=='success'){
                           var uCodeBuyer = data.u_code;

                           var tradeData = {
                                       'p_code' : pcode,
                                       'u_code' : uCodeBuyer
                                       };
                           
                           $.ajax({
                              url : "${pageContext.request.contextPath}/trade_insert.do",
                                type: "post",
                                dataType : "json",              
                                data : JSON.stringify(tradeData),
                                contentType : "application/json; charset=utf-8",
                                async : false,
                                success : function(data){
                                   updateStatus(pcode,status);
//                                  pcode=null;
//                                  status=null;   
                               },//success end                               
                              error : function(request, error){
                                 alert('올바른 닉네임이 아닙니다');
                              }//error end
                           })//ajax end
                           
                           openEval(pcode,${u_code},uCodeBuyer);

                        }else
                           alert('올바른 닉네임이 아닙니다');
                        
                },//successs end
               error : function(request, error){
//                   console.log("실패");
                  alert('올바른 닉네임이 아닙니다');
//                   alert("code:"+request.status+"\n"+"message:"
//                         +request.responseText+"\n"+"error:"+error)
               }//error end
               
            });//ajax end
            
         })
         
         const updateStatus = (pcode, status) => {
            location.href="statusUpdate.do?pcode="+pcode+"&status="+status;
         }//updateStatus

         
         
      })
      
$(function(){
         
         $(".jbs,.posContainer,.normalContainer,.negaContainer").on("mouseenter",function(){
            if($(this).attr('id')=='positive'){
               $('.posContainer').css({"display":"block"});
            }else if($(this).attr('id')=='normal'){
               $('.normalContainer').css({"display":"block"});
            }else{
               $('.negaContainer').css({"display":"block"});
             }
         });
         
         $(".jbs,.posContainer,.normalContainer,.negaContainer").on("mouseleave",function(){
            $('.posContainer').css({"display":"none"});
            $('.normalContainer').css({"display":"none"});
            $('.negaContainer').css({"display":"none"});
         });         
         
      });

      
         
     </script>
</body>
</html>