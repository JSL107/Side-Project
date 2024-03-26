<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/WEB-INF/views/common/header.jspf"%> 
<title>더한섬닷컴 | THE HANDSOME.COM</title>
  <style>
  
           #pwChangeForm{
               background-color:white;
           
           }
         .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: white;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

    </style>

<link rel="stylesheet" href="/resources/css/layout.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />

<!-- 제이쿼리 cdn -->   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- ui 공통 스크립트 -->
<script type="text/javascript" src="/resources/js/ui.js"></script>




<body>
   

   <!-- bodyWrap -->
   <div id="bodyWrap">
      <h3 class="cnts_title">
         <span id="menuTitle">개인정보 변경</span>
      </h3>
      <div class="sub_container">
         <!-- lnb -->
         <div class="lnb_wrap">
            <h4>
               <a href="/member/mypage">마이페이지<!-- 마이페이지 --></a>
            </h4>
             <div class="lnb">
				<dl>
					<dt>주문조회</dt>
					<dd>
						<a href="/member/orderlist">주문/배송/반품/취소</a>
						<form id="orderlist" action="/member/orderlist" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
                  </dd>
               </dl>
				<dl>
					<dt>혜택 관리</dt>
						<dd>
							<a href="/member/myGradeInfo">나의 회원 등급<!-- 나의 회원 등급 --></a>
						</dd>
					</dl>
 				<dl>
                  <dt>나의 상품관리</dt>
                  <dd>
                     <a href="/member/wishList">위시리스트<!-- 위시리스트 --></a>
                  </dd>
               </dl>
               <dl>
                  <dt>나의 정보관리</dt>
                  <dd>
                     <a href="/member/pwcheck">개인정보 변경/탈퇴</a>
                  </dd>
               </dl>
               <dl>
                  <dt>나의 활동관리</dt>
                  <dd>
                     <a href="/member/reviewList">내 상품평</a>
                  </dd>
               </dl>
            </div>
            <!-- ph_guide -->
            <div class="ph_guide">
               <p class="tlt">고객센터 운영 안내</p>
               <p class="phone">
                  1800-5700 <span style="color: #c69c6d;" class="txt">(유료)</span>
               </p>
               <p class="txt">
                  평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
               </p>
               <a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
               </a>
            </div>
            <!-- //ph_guide -->
         </div>

         <!-- //lnb -->
         <!-- cnts -->
         <div class="sub_cnts">
         
         
         
<form id="updateuser" action="/member/updateuserpro" method="GET"><input type="hidden" name="prk" id="prk" value="8945550360580">
        <input type="hidden" name="emailDuplChk" id="emailDuplChk" value="Y" title="이메일 중복">
        <input type="hidden" id="emailAddress" name="emailAddress" value="">
        <input type="hidden" id="sBirthday" name="sBirthday" value="">
        
    <!-- //lnbWrap -->
    <div>
        <div class="title_wrap mt30">
            <h4 class="float_left">개인정보 변경</h4>
            <p class="txt_line">회원정보를 확인하고, 변경할 수 있습니다. </p>
            <p class="reqd_txt"><strong class="reqd">*</strong> 표시는 필수항목입니다.</p>
        </div>
   
            <fieldset>
                <legend>회원정보입력</legend>
                <div class="tblwrap">
                    <table class="tbl_wtype1">
                        <caption>회원가입 입력항목</caption>
                        <colgroup>
                            <col style="width:140px">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="th_space">아이디</th>
                                <td><%=session.getAttribute("member")%></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"><label for="pwChangeBtn">비밀번호</label></th>
                                
                                <td>
                                    <input type="button" value="비밀번호 변경" class="btn add_s" id="pwChangeBtn">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"> <label for="inforcvemail">E-mail(정보수신용)</label></th>
                                <td>
                                    <input type="text" style="width:120px" title="이메일아이디" id="email" name="email" value=""> 
                                    <span class="andmail" id="middle">@</span>
                                    <select id="emailDomainSel" style="width:120px" title="이메일계정">
                                        <option value="06">직접입력</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        <option value="lycos.co.kr">lycos.co.kr</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="empas.com">empas.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="msn.com">msn.com</option>
                                        <option value="hanmir.com">hanmir.com</option>
                                        <option value="chol.net">chol.net</option>
                                        <option value="korea.com">korea.com</option>
                                        <option value="netsgo.com">netsgo.com</option>
                                        <option value="dreamwiz.com">dreamwiz.com</option>
                                        <option value="hanafos.com">hanafos.com</option>
                                        <option value="freechal.com">freechal.com</option>
                                        <option value="hitel.net">hitel.net</option>
                                    </select>
                                    <input type="text" id="emailDomain" style="width:120px" value="" title="이메일 도메인" style="disply:none;">
                                    <input type="button" class="btn add_s" id="emailDubChkBtn" value="검사">
                                    <span class="guide_comment" id="emailMsg"></span>
                                   
                                     <input id="emailtotal" name="emailtotal" style="display:none;"value="${member.memail}">
                                    
                                 
                                 
                                    <div class="wtype_comment pt10">
                                        <span>정확한 이메일 정보를 입력하셔야 주문/배송 및 서비스정보를 받아 보실 수 있습니다.</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"> 이름</th>
                                <td><input type="text" style="width:120px" id="name" name="name" value="${member.mname}"> 
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"> 전화번호</th>
                                 <td><input type="text" style="width:120px" id="tel" name="tel" value="${member.mtel}"> 
                            <input type="button" class="btn add_s" id="tel_check_btn" value="중복확인">
                                <font id="telCheckSpan"></font>
                            </tr>
                             
                           
                        </tbody>
                    </table>
                </div>
            </fieldset>
            
        <!-- btn_btwrap -->
        <div class="btn_btwrap"style="margin-top: 73px;">
        <a href="/member/deleteuser">
            <input type="button" class="btn wt_ss" value="회원탈퇴" id="memberSecessionBtn">
            </a>
        </div>
        <div class="btnwrap mypage2" style="margin-top: 92px;">
            <input type="button" class="btn wt" value="취소" id="cancleBtn">
            <input type="button" class="btn gray" value="변경사항 저장" id="saveBtn" onclick="updatepw();">
        </div>
        <!-- //btn_btwrap -->
    </div>
<div>
<input type="hidden" name="CSRFToken" value="fc127eba-ad30-478a-bf51-97938804861f">
</div>

<!-- 여기부터 비밀번호 모달 -->
 <div class="popwrap w_type_5" id="pwSearchPop" style="top: 346px; position: absolute; z-index: 101; display: block;" tabindex="-1">
        <div id="myModal" class="modal" style="display:none">
         <div class="modal-content">
        <span class="close" id="modal_close">&times;</span>   
         <input type="hidden" id="passWordConfirmCheck" name="passWordConfirmCheck" value="N">
         <!-- Title1 -->
         <div class="pop_tltwrap2">
            <h3>비밀번호 변경</h3>
         </div>
         <!-- //Title1 -->
         <div class="pop_cnt">
            
               <fieldset>
                  <legend>비밀번호 변경 입력항목</legend>
                  <div class="tblwrap">
                     <table class="tbl_wtype1">
                        <caption>비밀번호 입력항목</caption>
                        <colgroup>
                           <col style="width:160px">
                           <col>
                        </colgroup>
                        <tbody>
                           
                           <tr>
                              <th scope="row"><strong class="reqd">*</strong> <label for="newPassword">새 비밀번호 입력</label></th>
                              <td>
                                 <input type="password" name="newpwd" id="newPassword" style="width:187px" title="새 비밀번호 입력">
                                 
                                 
                           
                                 <!-- <span class="guide_comment">비밀번호는 8~15자리 이하로 영문/숫자/특수문자를 혼합해주세요.</span> -->
                              </td>
                           </tr>
                           <tr>
                              <th scope="row"><strong class="reqd">*</strong> <label for="newPasswordConfirm">새 비밀번호 확인</label></th>
                              
                              <td>
                                 <input type="password" id="newPasswordConfirm" style="width:187px" title="새 비밀번호 확인">
                                 <button type="button" class="btn_right btn_typeC2" id="pw_check_btn">
                                 
                                 <!-- tlqkf -->
                           <span>비밀번호 확인</span>
                        </button>
                        <input type="text" id="resultpw" name="resultpw" value="${member.mpassword}" style="display:none;">
                        <input type="text" id="resultpw1" name="resultpw1" value="" style="display:none;">
                                 
                              </td>
                           </tr>
                           
                        </tbody>
                     </table>
                  </div>
                       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                              <font id="check_pw"> </font>
                  <div class="btnwrap">
                     <input type="button" class="btn wt_s" id="cancelBtn" value="취소">
                     <input type="button" class="btn gray_s" id="confirmBtn" value="확인" >
                  </div>
               </fieldset>
            
         </div>
         
      </div>   
      </div>
          </div>
          <!-- 여기까지 -->



</form><!-- 다국어 한국 이외의 언어에서 사용 -->
</div>
         <!-- //cnts -->
         
         
                                                     
        <!--모달  -->
        
        
       
          
         
            <!-- 모달끝 -->
         
      </div>
   </div>
   <script>
    var modal = document.getElementById('myModal');
   
 
    // Get the button that opens the modal
    var btn = document.getElementById("pwChangeBtn"); //비밀번호 변경버튼 

    // Get the <span> element that closes the modal
    var span = document.getElementById("modal_close"); //닫기버튼     
    
    var cl = document.getElementById("cancelBtn");    //취소버튼
    var pwcheckbtn = 0;
    var pass1 = $("#newPassword").val();          // id 값이 pw1인값을 변수에 넣어준다
   var pass2 = $("#newPasswordConfirm").val(); //비밀번호 확인
   
    var pwPass = false;   //비밀번호 체크
 
    var telcheck = false; //전화번호창을 눌렀는지 체크
    var telPass = false; //중복체크

    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";
        
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    
    cl.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    
    //모달안에 새비밀번호 같은지 체크  
   $('#pw_check_btn').click(function() {            // pw의 이름을 가지는 모든클래스를 잡아준다
      console.log("pw눌림");
       pass1 = $("#newPassword").val();          // id 값이 pw1인값을 변수에 넣어준다
       pass2 = $("#newPasswordConfirm").val();

      if (pass1 != "" || pass2 != "") {            // 하나라도 입력이 되면 작동
         if (pass1 == pass2) {                   // 두개의 값이 같으면
            $("#check_pw").html('비밀번호가 일치합니다'); // 출력
            $("#check_pw").attr('color', 'green');    // 색변경
            pwPass= true;
                           
         } else {
            $("#check_pw").html('비밀번호가 다릅니다');
            $("#check_pw").attr('color', 'red');
            pwPass=false;               
         }
      }
   });
   
   
   //모달 비밀번호체크
   
   $('#confirmBtn').click(function(){
      pwcheckbtn =1;
       pass1 = $("#newPassword").val();          // id 값이 pw1인값을 변수에 넣어준다
       pass2 = $("#newPasswordConfirm").val();
       resultpass = $("#resultpw1").val();

   
       if(pass1 == '' || pass1 == null || pass2 == '' || pass2 == null) { //비밀번호 예외처리
           Swal.fire({
               icon: 'warning',
               text: '비밀번호를 입력하세요',
           });
            pwPass = false;
         }// 비밀번호 유호성 (비밀번호는 자리만)
         else if(pass1.length<3 || pass2.length<3){
            console.log("이거 되기는 하는거임?");
           Swal.fire({
               icon: 'warning',
               text: '비밀번호는 3자리 이상으로 입력해주세요',
           });
            pwPass = false;
         }
      
      if(pwPass==true){ //비밀번호가 정상적으로 저장 
         $("#check_pw").html('비밀번호 변경완료');
         $("#check_pw").attr('color', 'green');
          Swal.fire({
              icon: 'success',
              text: '비밀번호가 저장되었습니다.',
          });
         $("#resultpw1").val(pass1);
         console.log($("#resultpw1").val());
          modal.style.display = "none";
            
          
      }else if(pwPass==false){
         $("#check_pw").html('비밀번호를 확인해주세요');
         $("#check_pw").attr('color', 'red');
         console.log("비밀번호 저장에 실패했습니다");
         console.log("실패");
         
      }
      
      
      
   }); 
   
     // 연락처 중복 확인
    $('#tel_check_btn').click(function() {
       console.log("tel눌림");
       var tel = $('#tel').val();   // jsp의 값 tel에 넣기
       var data = {memberTel : tel}         // memberTel=컨트롤러에 넘길 데이터 이름, 데이터 값
       console.log(data);
       
       let csrfHeaderName ="${_csrf.headerName}";
         let csrfTokenValue="${_csrf.token}";
       
      $.ajax({
         url: '/member/mtelCheck',         // controller URL
         type: 'post',                  // post 타입
         data: data,
         beforeSend: function(xhr) {
                 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
             },
         success: function(result){         // result는 controller에서 넘어 온 결과 값
            if(result != 'fail'){
               $('#telCheckSpan').text("사용가능한 연락처입니다");
               $("#telCheckSpan").css("color", "green");
               telPass = true;            // 사용 가능 할 때, tel중복검사 true
            }else {
               $('#telCheckSpan').text("이미 사용중인 연락처입니다");
               $("#telCheckSpan").css("color", "red");
               telPass = false;         // 사용이 불가능하면 tel중복검사 false
            }
         },
         error:function() {
            console.log(data);
            console.log(result);
            console.log('ajax에러');
            Swal.fire({
                icon: 'error',
                text: 'ajax 에러 발생!!',
            });
         }
      });
    });
   //-- 연락처 중복 확인 끝복 확인 끝

   
   $("#tel").keydown(function(){ //전화번호 입력창누를시에 체크 
      
      telcheck = true;
      
      
   });
   
   //보내기
   function updatepw(){ //모든 조건이 맞을때 컨트롤러에 보냄
      if(telcheck==true){
         if(telPass==true){
            Swal.fire({
                icon:'success',
                text:'변경되었습니다.',
            });
             $("#updateuser").attr("action","/member/updateuserpro");
               $("#updateuser").submit();
         }else{
             Swal.fire({
                 icon:'warning',
                 text:'전화번호 입력시 중복확인이 필요합니다',
             });
         }
         
      }
      
      else {
      Swal.fire({
          icon:'success',
          text:'변경되었습니다.',
      });
       $("#updateuser").attr("action","/member/updateuserpro");
         $("#updateuser").submit();
      
      }
      
      
   };
   

    // 연락처 중복 확인
   
   
   
   
   
   
   //뒤로가기 
   $("#cancleBtn").click(function(){

      window.history.go(-1);

   })
   
   
   
   
   
   
   // 클릭시 email함수 호출
   $("#emailDubChkBtn").click(function(){      
      email();                        
   });
   
   
   //직접입력을 눌러야만 입력창이 나오는 함수
   $("#emailDomainSel").click(function(){
      
      if($("#emailDomainSel").val()=="06"){
         
         $("#emailDomain").show();
         console.log("토글중?");
         console.log($("#emailDomain").val());
      }else{
         
         $("#emailDomain").hide();
         
      }
      
      })
   
   
   
   // email() 함수 동작
   function email() {      
      var member_email = $('#email').val();         //이메일 입력값
      var email_check = /^[a-zA-z0-9]{4,13}$/;      //이메일 유효성 검사
      var emailpass = false;
      var email = $("#email").val();            // email 입력 값
      var middle = $("#middle").text();          // @
      var address = $("#emailDomain").val();                     // eamil 주소(도메인) 값
      var emailpass=null;
      
       if(member_email == '' || member_email == null) {
         Swal.fire({
             icon:'warning',
             text:'이메일을 입력해주세요',
         });

      
      }// 이메일 주소 확인/* tlqkf */
      else if($("#emailDomainSel").val()==null){
           Swal.fire({
               icon:'error',
               text:'오류',
           });
         
      }
      // 이메일 유효성
      else if(!email_check.test(member_email)){
            Swal.fire({
               icon:'warning',
               text:'이메일은 영어와 숫자만 사용 가능하며, 4~13자 사이로 입력해주세요',
            });
      }
      else{

      if($("#emailDomainSel").val()=="06"&&$("#emailDomain").val() == ''){
          Swal.fire({
              icon:'warning',
              text:'이메일의 뒷 부분이 없습니다.',
          });
      }else if($("#emailDomainSel").val()=="06"&&$("#emailDomain").val() != ''){
         address = $("#emailDomain").val();   // 직접 입력인 경우, 입력한 값을 address에 저장
      }
         else {
         address = $("#emailDomainSel").val();   // 아닌 경우 select에 저장된 값을 address에 저장
      } 
      // email과 middle에 값이 있다면 합쳐주기  
      if(email != "" && middle != ""&&address!=''){         
         console.log(address);
         $("#emailtotal").val(email+middle+address);
          Swal.fire({
              icon:'success',
              text:$("#emailtotal").val()+"으로 저장되었습니다",
          });
      }   
      
      }
  

   }
 </script>
   
</body>
<%@include file="/WEB-INF/views/common/footer.jspf"%>