<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manner</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/manner.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/mypage.js"></script>
</head>
<body>
	<div class="mannerContainer">
		<form action="manner.do" name="evalTable" method="get">
	    	<input type="hidden" name="p_code" value="${pcod}">
	        <input type="hidden" name="u_code_sender" value="${send}">
	        <input type="hidden" name="u_code_receiver" value="${receive}">
		                
	        <input type="radio" name="tablinks" id="pos" value="eval_pos">
	        <input type="radio" name="tablinks" id="normal" value="eval_normal">
	        <input type="radio" name="tablinks" id="nega" value="eval_nega">
	
	        <label for="pos" class="labelPos">좋아요</label>
	        <label for="normal" class="labelNormal">보통이에요</label>
	        <label for="nega" class="labelNega">별로에요</label>
	        
	        <div class="checkCategory catePos">
	            <table>
	                <tr>
	                    <td> <input type="checkbox" name="eval_pos_con1" value="1"> 즐거운 마음으로 거래해요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_pos_con2" value="1"> 예의에 어긋난 말을 하지 않아요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_pos_con3" value="1"> 상대방을 배려해요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_pos_con4" value="1"> 약속시간을 잘 지켜요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_pos_con5" value="1"> 서로 돕는 협상을 해요 </td>
	                </tr>
	            </table>
	        </div>
	        <div class="checkCategory cateNormal">
	            <table>
	                <tr>
	                    <td> <input type="checkbox" name="eval_normal_con1" value="1"> 많은 얘기를 하지 않아요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_normal_con2" value="1"> 화는 안내지만 재미는 없어요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_normal_con3" value="1"> 정해진 가격만 말해요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_normal_con4" value="1"> 많이 떨어요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_normal_con5" value="1"> 빠르게 거래해요 </td>
	                </tr>
	            </table>
	        </div>
	        <div class="checkCategory cateNega">
	            <table>
	                <tr>
	                    <td> <input type="checkbox" name="eval_nega_con1" value="1"> 온라인에서와 다른 조건을 주장해요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_nega_con2" value="1"> 예의가 없어요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_nega_con3" value="1"> 불쾌한 말이나 행동을 해요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_nega_con4" value="1"> 약속시간을 안지켜요 </td>
	                </tr>
	                <tr>
	                    <td> <input type="checkbox" name="eval_nega_con5" value="1"> 협상을 자기 위주로 해요 </td>
	                </tr>                   
	            </table>
	        </div>
		        <table class="postscriptTable">
	                <tr>
	                    <td class="postscriptLabel" align="center">후기</td>
	                </tr>
	                <tr>
	                    <td align="center">
	                        <textarea name="eval_content" class="postscript" cols="33" rows="5" maxlength="333"></textarea>
	                    </td>
	                </tr>
	                <tr>
	                    <td align="center">
	                        <input type="button" class="submitBtn" value="작성완료" onclick="submitEval()">
	                    </td>
	                </tr>
	            </table>
        </form>
    </div>
</body>
</html>