function deleteJjim(u_code,p_code){
   var result = confirm("정말 찜목록에서 제거하시겠습니까?");
   
   if(result==true){
      location.href="deleteJjim.do?ucod="+u_code+"&pcod="+p_code;
   }//if END
}//deleteJjim END



function openTrade(evt, trade) {
     var i, tabcontent, tablinks;

     tabcontent = document.getElementsByClassName("tabcontent");
     for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
     }//for END

     tablinks = document.getElementsByClassName("tablinks");
     for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className.replace(" active", "");
     }//for END

     document.getElementById(trade).style.display = "block";
     evt.currentTarget.className += " active";
}//openTrade END


function submitEval(){
	var content = document.evalTable.eval_content.value;
	
	if(content===null||content===""){
		alert("후기는 반드시 작성해주시기 바랍니다.");
	}else{
		document.evalTable.submit();
		opener.location.reload();
	}//if END
}//submitEval END


function closeEval(){
   self.close();
   return true;
}//closeEval END


$(function(){
	$('.chattingButton').click(function(){	
		var ucode = $('.chattingButton').attr('data');
		location.href="chatList.do?idx="+ucode;
	});//click END
});//jquery END

