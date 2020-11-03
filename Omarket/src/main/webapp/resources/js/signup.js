//변수각각 체크여부
    var flag = false;//null체크여부
   var flagID = false;//아이디중복체크여부
   var flagPwd = false;//비번확인체크여부
   var flagNick = false;//닉네임 체크여부
   var flagE = false;//email체크여부
    var flagPhone = false //전번체크여부
//다 체크하고 submit
   function check(){
       var u_id = singup.u_id.value;
      var u_pwd = singup.u_pwd.value;
      var u_pwd2 = singup.u_pwd2.value;
      var u_nick = singup.u_nick.value;
      var u_email = singup.u_email.value;
      var u_phone2 = singup.u_phone2.value;
      var u_phone3 = singup.u_phone3.value;
      var u_phone4 = singup.u_phone4.value;
      var u_addr1 = singup.u_addr1.value;
      var u_addr2 = singup.u_addr2.value;
      
      if (u_id==null||u_id==""){
         alert('아이디를 입력하세요');
         singup.u_id.focus();
         return;
      }
      if (u_pwd==null||u_pwd==""){
         alert('비밀번호를 입력하세요.');
         singup.u_pwd.focus();
         return;
      }
      if (u_pwd2==null||u_pwd2==""){
         alert('비밀번호 확인 하세요.');
         singup.u_pwd2.focus();
         return;
      }
      if (u_nick==null||u_nick==""){
         alert('닉네임을 입력하세요.');
         singup.u_nick.focus();
         return;
      }
      if (u_email==null||u_email==""){
         alert('이메일을 입력하세요.');
         singup.u_email.focus();
         return;
      }
         if (u_phone2==null||u_phone2=="" ||u_phone3==""||u_phone3==""||u_phone4==""||u_phone4==""){
         alert('핸드폰번호를 입력하세요.');
         singup.u_phone2.focus();
         return;
      }
      if (u_addr1==null||u_addr1==""||u_addr2==null||u_addr2==""){
         alert('주소를 입력하세요.');
         singup.u_addr1.focus();
         return;
      }
      
      flag=true;
       phoneCheck();
   
      if(flagID==false){   //아이디중복체크 
         alert('아이디 중복체크 하세요');
         return;
      }
      
      if(flagPwd==false){   //비번 확인 
         alert('비밀번호가 일치하지 않습니다');
         singup.u_pwd.focus();
         return;
      }
      
      if(flagNick==false){   //닉네임 중복체크
          alert('닉네임 중복체크 하세요');
         singup.u_nick.focus();
         return;
      }
      
         
      if(flagPhone==false){   //핸드폰 체크
          alert('핸드폰번호는 숫자만 입력하세요');
         singup.u_phone2.focus();
         return;
      }
      
      
      //위에 다 통과&체크 완료 후 submit
      console.log(flag);
      console.log(flagID);
      console.log(flagPwd);
      console.log(flagNick);
      console.log(flagE);
      console.log(flagPhone);
      if(flag==true&&flagID==true&&flagPwd==true&&flagNick==true&&flagE==true&&flagPhone==true){
         document.getElementById("signup").submit();
         
      } else { return; }
   }//check end
      
      
//아이디 중복확인
function checkID(){
   var u_id = singup.u_id.value;
   var u_id_label = document.getElementById("u_id_label");
   var u_id_reg =  /^[a-zA-Z0-9]{2,11}$/; //2~11자 영문대소문자와 숫자
   if(u_id == "" || u_id == null){
      u_id_label.innerHTML = "<font color='red'>아이디를 입력하세요</font>";
        signup.u_id.focus();
        return;
     } else {
        if (u_id_reg.test(u_id)==false){
       u_id_label.innerHTML = "<font color='red'>영문 대문자,소문자,숫자만 가능(2~11자)";
        signup.u_id.value="";
        signup.u_id.focus();
       return;      
        }
   }
   u_id_label.innerHTML = "";
   flagID_t();
   open('openID.do?idx=' + u_id, 'openID','width=400, height=140, left=100, top=200');
}//end   

function flagID_t(){
      flagID=true;
   }
       
//비밀번호 확인
   function checkPwd(){
      var pwd_label = document.getElementById("pwd_label");
      if(singup.u_pwd.value == singup.u_pwd2.value) {
         pwd_label.innerHTML = "비밀번호가 일치합니다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
         flagPwd_t();   //비번일치플래그 true로 해줌
      } else {
         pwd_label.innerHTML = "<font color='red'>&nbsp;&nbsp;비밀번호가 일치하지 않습니다</font>";
      }
   }
   
function flagPwd_t(){
      flagPwd=true;
   }   
//닉네임 중복확인
function checkNick(){
   var u_nick_value = singup.u_nick.value;
   var u_nick_label = document.getElementById("u_nick_label");
   var u_nick_reg =  /^[a-zA-Z0-9]{2,11}$/; //2-11자 영문대소문자와 숫자가능
   if(u_nick_value == "" || u_nick_value == null){
      u_nick_label.innerHTML = "<font color='red'>닉네임을 입력하세요</font>";
        signup.u_nick.focus();
        return;
     } else {
        if (u_nick_reg.test(u_nick_value)==false){
       u_nick_label.innerHTML = "<font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영문 대문자,소문자,숫자만 가능(2-11자리)";
        signup.u_nick.value="";
        signup.u_nick.focus();
       return;      
        }
   }
   u_nick_label.innerHTML = "";
    flagNick_t();
   open('openNick.do?idx=' +u_nick_value, 'nick','width=400, height=140, left=100, top=200');
}//end   
 
function flagNick_t(){
      flagNick=true;
   }
       
   
//email 형식체크
   function emailCheck( ){
        var u_email = singup.u_email.value;
        var u_email_reg =/^([\S]{2,16})@([a-zA-Z]{2,10})\.([a-zA-Z]{2,10})$/;
        if(u_email_reg.test(u_email)==false){
          msg="<font color=red>이메일 형식 체크하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>"; 
          document.getElementById("email_span").innerHTML=msg;
          singup.u_email.value="";
          return;
        }else{
           flagE = true;
           document.getElementById("email_span").innerHTML="";
        }
      }//end
   
//전화번호 입력확인
   function phoneCheck(){
      var u_phone_value2 = signup.u_phone2.value;
      var u_phone_value3 = signup.u_phone3.value;
      var u_phone_value4 = signup.u_phone4.value;
      
      var u_phone_reg =/[(0-9)]{3,4}/;
       var test2 = u_phone_reg.test(u_phone_value2);
      var test3 = u_phone_reg.test(u_phone_value3);
      var test4 = u_phone_reg.test(u_phone_value4);
      var u_phone_label =document.getElementById("u_phone_label");
      if(test2==false||test3==false||test4==false){
         u_phone_label.innerHTML = "&nbsp;&nbsp;숫자만 입력하세요";
      } else {
         u_phone_label.innerHTML = "";
         flagPhone=true;
      }
   }//end
   
//우편번호
   function DaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = ''; // 최종 주소 변수
        var extraAddr = ''; // 조합형 주소 변수

        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            fullAddr = data.roadAddress;

        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            fullAddr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
        if(data.userSelectedType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        //document.getElementById('code').value = data.zonecode; //5자리 새우편번호 사용
        document.getElementById('u_addr1').value = fullAddr;

        // 커서를 상세주소 필드로 이동한다.
        document.getElementById('u_addr2').focus();
      }
       
      }).open();
   }//end      
   
   //이미지 파일 미리보기
   function profilePrview() {
    var files = document.getElementById('u_profile_upload').files[0]; //파일 객체
    var reader = new FileReader();
    //파일정보 수집        
    reader.onload = (function(theFile) {
      return function(e) {
        //이미지 뷰
        var img_view = ['<img src="', e.target.result, '" name="', escape(theFile.name), '"  width=200 height=300/>'].join('');                
        document.getElementById('preview').innerHTML = img_view;
      };
    })(files);
    reader.readAsDataURL(files);    
  }//end
      