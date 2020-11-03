//변수각각 체크여부
   var flag = false;//null체크여부
   var flagID = false;//아이디중복체크여부
   var flagNick = false;//닉네임 체크여부
   var flagE = false;//email체크여부
 
//다 체크하고 submit
   function check(){
     var u_email = login_findId.u_email.value;
      if (u_email==null||u_email==""){
         alert('이메일을 입력하세요.');
         login_findId.u_email.focus();
         return;
      }
       flag=true;
  
      //위에 다 통과&체크 완료 후 submit
      console.log(flag);
      console.log(flagE);

      if(flag==true&&flagE==true){
         document.getElementById("login_findId").submit();
         
      } else { return; }
   }//check end
      
      
    function check2(){
      var u_id = login_findpwd.u_id.value;
      var u_email = login_findpwd.u_email.value;
      var u_phone2 = login_findpwd.u_phone2.value;
      var u_phone3 = login_findpwd.u_phone3.value;
      var u_phone4 = login_findpwd.u_phone4.value;
    
      
      if (u_id==null||u_id==""){
         alert('아이디를 입력하세요');
         login_findpwd.u_id.focus();
         return;
      }
      
      if (u_email==null||u_email==""){
         alert('이메일을 입력하세요.');
         login_findpwd.u_email.focus();
         return;
      }
         if (u_phone2==null||u_phone2=="" ||u_phone3==""||u_phone3==""||u_phone4==""||u_phone4==""){
         alert('핸드폰번호를 입력하세요.');
         login_findpwd.u_phone2.focus();
         return;
      }
     
       flag=true;
       phoneCheck();
      
      
      //위에 다 통과&체크 완료 후 submit
      console.log(flag);
      console.log(flagID);
      console.log(flagE);
      console.log(flagPhone);
      if(flag==true&&flagID==true&&flagE==true&&flagPhone==true){
         document.getElementById("login_findpwd").submit();
         
      } else { return; }
   }//check end
      
//아이디체크
function checkID(){
   var u_id = login_findpwd.u_id.value;
   var u_id_reg =  /^[a-zA-Z0-9]{4,10}$/; //4~11자 영문대소문자와 숫자
   if(u_id == "" || u_id == null){
       msg="<font color=red>아이디를 입력하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>"; 
       document.getElementById("u_id_span").innerHTML=msg;
       login_findpwd.u_id.focus();
       return;
     } else {
        if (u_id_reg.test(u_id)==false){
           msg="<font color=red>영문 대문자,소문자,숫자만 가능(4-11자리)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>"; 
           document.getElementById("u_id_span").innerHTML=msg;
           login_findpwd.u_id.focus();
           return;      
        }
   }
    document.getElementById("u_id_span").innerHTML="";
   flagID_t();
  
}//end   

function flagID_t(){
      flagID=true;
   }
         

//email 형식체크
   function emailCheck(){
        var u_email = login_findId.u_email.value;
        var u_email_reg =/^([\S]{2,16})@([a-zA-Z]{2,10})\.([a-zA-Z]{2,10})$/;
        if(u_email_reg.test(u_email)==false){
          msg="<font color=red>이메일 형식 체크하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>"; 
          document.getElementById("email_span").innerHTML=msg;
          login_findId.u_email.value="";
          return;
        }else{
           flagE = true;
           document.getElementById("email_span").innerHTML="";
        }
      }//end
   

//전화번호 입력확인
   function phoneCheck(){
      var u_phone_value2 = login_findpwd.u_phone2.value;
      var u_phone_value3 = login_findpwd.u_phone3.value;
      var u_phone_value4 = login_findpwd.u_phone4.value;
      
      var u_phone_reg =/[(0-9)]{3,4}/;
      var test2 = u_phone_reg.test(u_phone_value2);
      var test3 = u_phone_reg.test(u_phone_value3);
      var test4 = u_phone_reg.test(u_phone_value4);
      var u_phone_label =document.getElementById("u_phone_label");
      if(test2==false||test3==false||test4==false){
         u_phone_label.innerHTML = "&nbsp;&nbsp;숫자만 입력하세요";
      } else {
         flagPhone=true;
         u_phone_label.innerHTML = "";
      }
   }//end   

   
   //email 형식체크
   function emailCheck2(){
        var u_email = login_findpwd.u_email.value;
        var u_email_reg =/^([\S]{2,16})@([a-zA-Z]{2,10})\.([a-zA-Z]{2,10})$/;
        if(u_email_reg.test(u_email)==false){
          msg="<font color=red>이메일 형식 체크하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>"; 
          document.getElementById("email_span2").innerHTML=msg;
          
          return;
        }else{
           flagE = true;
           document.getElementById("email_span2").innerHTML="";
        }
      }//end
   