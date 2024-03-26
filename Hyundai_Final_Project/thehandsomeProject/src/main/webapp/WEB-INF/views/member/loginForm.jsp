<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>더한섬닷컴 | THE HANDSOME.COM</title>
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/layout.css"/>
    <link rel="stylesheet" href="/resources/css/content.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<%@include file="/WEB-INF/views/common/header.jspf" %>
<body>
<!-- Loading -->
<div class="loading_bar" id="loadingBarDiv" style="display: none;">
    <img src="/_ui/desktop/common/images/common/loading.gif" alt="loading">
    <span> 로딩중</span>
</div>
<!-- //Loading -->

<form id="CSRFForm" action="http://www.thehandsome.com/ko/member/loginForm" method="post">
    <div>
        <input type="hidden" name="CSRFToken"
               value="a9879b57-eec1-4402-9460-0a3f9e2b0681">
    </div>
</form>

<form id="dormMcustForm" action="http://www.thehandsome.com/ko/member/login" method="post">
    <input type="hidden" name="mcustNo" id="mcustNoD" value=""> <input
        type="hidden" name="otpId" id="otpIdD" value="">
    <div>
        <input type="hidden" name="CSRFToken"
               value="a9879b57-eec1-4402-9460-0a3f9e2b0681">
    </div>
</form>

<!-- 다국어 한국에서만 사용 -->
<input type="hidden" name="loginLayer" id="loginLayer" value="E">
<div id="bodyWrap" class="login">
    <h3 class="cnts_title">
        <span>로그인</span>
    </h3>

    <div class="sub_container">
        <div id="handsomeCust" class="login_wrap box_type_1 renewal1904">
            <div class="border_box1" style="height: 350px;">
                <!-- 추가 190417 -->
                <div class="inner_box">
                    <div class="title_wrap">
                        <h4>회원</h4>
                    </div>
                    <div id="hpIPLogin">
                        <form id="loginForm" name="loginForm" method="post">
                            <input type="hidden" name="inputId" id="inputId" value="">
                            <fieldset>
                                <legend>로그인 입력항목</legend>
                                <div class="login_section">
                                    <p class="login_err_txt" id="hpErrMsg"
                                       style="margin-left: 0px;"></p>
                                    <div>
                                        <div>
                                            <input type="text" id="j_username" name="username"
                                                   placeholder="아이디 입력하세요." title="아이디" value="">
                                        </div>
                                        <div>
                                            <input type="password" id="j_password" name="password"
                                                   placeholder="비밀번호를 입력하세요." title="비밀번호"
                                                   onkeypress="if( event.keyCode == 13 ){btn_click();}">
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>
                                    </div>
                                    <a href="javascript:void(0);" class="btn_login" id="login_btn"
                                       onclick="btn_click();">로그인</a>

                                    <input type="text" id="referer" name="referer" style="display: none;" value=" ">
                                    <div class="id_save">
                                        <input type="checkbox" id="id_save" name="id_save"><label
                                            for="id_save">아이디 저장</label>
                                    </div>
                                </div>
                            </fieldset>


                            <div style="display:none;text-align: center">
                                <a class="p-2"
                                   href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=802bad4b3958d38bc51c84ffe710f400&redirect_uri=http://localhost:8080/kakao/login&prompt=login">
                                    <img src="../../../resources/kakao_login_medium_wide.png"
                                         style="height: 35px;">
                                </a>

                            </div>

                        </form>

                    </div>
                </div>
            </div>
            <div class="border_box2" style="height: 270px;">
                <!-- 추가 190417 -->
                <div class="inner_box step2" style="margin-top: 39px;">
                    <div class="title_wrap">
                        <h4 class="tlt_typ1">회원 가입</h4>
                        <p class="txt">현대백화점 그룹의 모든 서비스를 모두 이용할 수 있는 ID를 만듭니다.</p>
                        <p class="join_txt2 mt10">
                            한섬 온라인/오프라인 매장에서 모두 사용하실 수 있으며, 구매 시 <br>한섬마일리지가 적립됩니다.<br>한섬
                            온라인 멤버십 ‘THE 클럽’의 혜택을 받으실 수 있습니다
                        </p>
                    </div>
                    <a href="/member/joinForm/" id="hpoinJoinBtn"
                       class="btn add_ss join" style="margin-bottom: 40px">통합회원 가입</a>

                </div>
            </div>
        </div>
        <!--//login wrap-->
    </div>
    <!--//sub_container-->
</div>
</div>
<script>
    /* 로그인버튼을눌렀을때 referer가 id인 값의 val을 url정보로 바꿔주고 request로 보내줌 */
    function btn_click() {
        var referer = document.referrer;
        console.log(referer);
        $("#referer").val(referer);
        $("#loginForm").attr("action", "/login");
        $("#loginForm").submit();
    };

    
    
</script>
</body>
<%@include file="/WEB-INF/views/common/footer.jspf" %>