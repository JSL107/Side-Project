<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/header.jspf" %>
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" href="/resources/css/join.css"/>
<div id="bodyWrap" class="input_infomation" style="margin-left: 80px; margin-right: 80px; margin-bottom: 80px;">
    <h3 class="cnts_title"><span>회원가입</span></h3>

    <div class="sub_container2">
        <div id="handsomeCust" class="login_wrap box_type_1 renewal1904">
            <h3 class="t_tit1"> 개인정보입력 <em class="nec">(* 필수입력)</em></h3>
            <!-- 회원가입 제출 form -->
            <form method="post" action="/kakao/signup" id="mFrm" onsubmit="return joinCheck();">
                <!-- 아이디  비밀번호 -->
                <fieldset class="divider">
                    <legend>개인정보입력</legend>

                    <!-- 아이디 -->
                    <div class="wrap_inp">
                        <%--                        <label for="id" class="inp_tit">아이디<span class="nec">*</span></label>--%>
                        <!-- input에 값을 잘 못 입력하면 .inp_bundle에 클래스 "error" 추가해주세요. (포커스되고 값이 입력되면 "focus" 클래스가 붙음) -->
                        <div class="inp_bundle registerCustId">
                            <input type="hidden" title="아이디 입력" id="registerCustId" name="custId" maxlength="20"
                                   class="inp flex" value="${kakao_id}" readonly>
                        </div>
                    </div>
                    <!--// 아이디 -->
                </fieldset>
                <!--// 아이디, 비밀번호 -->

                <!-- 이름, 이메일, 연락처  -->
                <div class="group divider">
                    <!-- 이름 -->
                    <div class="wrap_inp">
                        <label for="name" class="inp_tit">이름<span class="nec">*</span></label>
                        <div class="inp_bundle registerPwd1">
                            <input type="text" title="이름 입력" id="registerName" name="custName" maxlength="30"
                                   class="inp flex" value="${nickname}" readonly>
                        </div>
                    </div>
                    <!--// 이름 -->

                    <!-- 이메일 -->
                    <div class="wrap_inp">
                        <label for="email" class="inp_tit">이메일<span class="nec">*</span></label>
                        <div class="inp_bundle email_bundle emailCheckMsg">
                            <input type="text" title="이메일 아이디 입력" id="registerEmail" name="registerEmail"
                                   value="${emailId}"
                                   maxlength="80" class="inp flex" readonly>
                            <span id="middle">@</span>

                            <!-- 이메일 직접 입력 칸 -->
                            <input type="text" id="directEmail" name="directEmail" value="${emailDot}"
                                   style="height: 40px !important; width:180px; font-size:14px;" readonly>
                            <!-- 이메일 값 합치기 -->
                            <input type="hidden" id="emailtotal" name="emailtotal" value="${email}">
                        </div>
                    </div>
                    <!--// 이메일 -->

                    <!-- 연락처 -->
                    <div class="wrap_inp">
                        <label for="tel" class="inp_tit">연락처<span class="nec">*</span></label>
                        <!-- input에 값을 잘 못 입력하면 .inp_bundle에 클래스 "error" 추가해주세요. (포커스되고 값이 입력되면 "focus" 클래스가 붙음) -->
                        <div class="inp_bundle registerCustTel">
                            <input type="text" title="연락처 입력" id="registerCustTel" name="custTel" maxlength="20"
                                   class="inp flex" placeholder="연락처">
                            <button type="button" class="btn_right btn_typeC2" id="tel_check_btn">
                                <span>중복 확인</span>
                            </button>
                        </div>
                        <!--   승인 메시지 : t_success 에러 메시지 : t_error -->
                        <p class="t_success" id="telCheckSpan"></p>
                        <ul class="bullet_type1 mark1 inp_mt">
                            <li>연락처는 11자리 숫자로만 입력 바랍니다.</li>
                            <li>ex) 01012341234</li>
                        </ul>
                        <br><br>
                    </div>
                    <!--// 연락처 -->
                </div>
                <!--//이름, 이메일, 연락처 -->

                <!-- 성별, 나이  -->
                <div class="group divider">
                    <div class="wrap_inp">
                        <label for="gender" class="inp_tit">성별<span class="nec">*</span></label>
                        <div>
                            <fieldset>
                                <input type="radio" name="gender" value="man" checked="checked"
                                       style="position: initial; border: 1em; appearance: auto;"/>
                                <label style="font-size: 18px; line-height: 2rem; padding: 0.2em 0.4em;">남</label>
                                <input type="radio" name="gender" value="woman"
                                       style="position: initial; border: 1em; appearance: auto;"/>
                                <label style="font-size: 18px; line-height: 2rem; padding: 0.2em 0.4em;">여</label>
                            </fieldset>
                        </div>
                        <br>
                        <label for="age" class="inp_tit">생년월일<span class="nec">*</span></label>
                        <div>
                            <input id="format-date" type="text" name="age" style="border:none; font-size: 24px;"
                                   onKeyup="inputYMDNumber(this);" value="" placeholder="YYYY-MM-DD" maxlength="8"/>
                        </div>
                        <br>
                    </div>
                </div>
                <!--//성별, 나이  -->

                <!-- 주소 -->
                <div class="group divider">
                    <!-- 주소 -->
                    <div class="wrap_inp">
                        <label for="userAddress" class="inp_tit">주소<span class="nec">*</span></label>
                        <div class="addr_bundle">
                            <div class="inp_bundle">
                                <input type="hidden" id="addressType" name="partner.addrType" value="01">
                                <input type="text" title="주소 입력" id="regPostNo" name="partner.postNo" class="inp flex"
                                       placeholder="주소입력" readonly="" value="">
                                <button type="button" class="btn_typeC2 numSrchBt" id="adress_btn">
                                    <span>주소검색</span>
                                </button>
                            </div>
                            <div class="inp_bundle">
                                <input type="hidden" id="zonecode" name="zonecode" value="">
                                <input type="text" title="주소 입력" name="partner.addr1"
                                       id="regAddr1" class="inp flex" placeholder="상세주소">
                            </div>
                        </div>
                    </div>
                    <br><br>
                </div>
                <!--// 주소 -->

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <!-- 확인, 취소 -->
                <div class="btn_area btn_ac" style="margin-bottom: 60px;">
                    <a class="btn_typeB1" href="/member/loginForm"><span>취소</span></a>
                    <button type="submit" class="btn_typeB2">확인</button>
                </div>
                <!--// 확인, 취소 -->
            </form>
        </div>
        <!--//--------------------------------- 회원가입 끝 -------------------------------------->
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    // 주소 api
    window.onload = function () {
        document.getElementById("adress_btn").addEventListener("click", function () { //주소입력칸을 클릭하면
            //카카오 지도 발생
            new daum.Postcode({
                oncomplete: function (data) { //선택시 입력값 세팅
                    document.getElementById("zonecode").value = data.zonecode;
                    document.getElementById("regPostNo").value = data.address; // 주소 넣기
                    document.querySelector("input[name='partner.addr1']").focus(); //상세입력 포커싱
                    self.close();
                }
            }).open();
        });
    }
    // 주소 api끝

    // 필수 값 입력 (null 방지)
    var telPass = false;	//연락처 중복 체크 방지

    // 회원가입 버튼 submit하면 오는 함수
    function joinCheck() {
        // 아이디 확인
        var member_name = $('#registerName').val();		//이름 입력값
        var member_email = $('#registerEmail').val();	//이메일 입력값
        var member_tel = $('#registerCustTel').val();	//연락처 입력값
        var tel_check = /^[0-9]{8,13}$/;				//연락처 유효성 검사
        var address1 = $('#regPostNo').val();			//주소 입력값
        var address2 = $('#regAddr1').val();        	//주소 입력값
        var gender = $('input[name=gender]').val();
        var age = $('input[name=age]').val()

        // 이름 확인
        if (member_name === '' || member_name === null) {
            Swal.fire({
                icon: 'warning',
                text: '아이디를 입력해주세요',
            });
            return false;
        }

        // 연락처 확인
        if (member_tel === '' || member_tel === null) {
            Swal.fire({
                icon: 'warning',
                text: '연락처를 입력하세요',
            });
            return false;
        }// 연락처 유효성
        if (!tel_check.test(member_tel)) {
            Swal.fire({
                icon: 'warning',
                text: '연락처는 11 자리만 가능하며 숫자로만 입력해주세요',
            });
            return false;
        }
        // 전화번호 중복 확인
        if (telPass === false) {
            Swal.fire({
                icon: 'warning',
                text: '전화번호 중복을 확인해 주세요',
            });
            return false;
        }

        // 나이확인
        if(age===''||age===null){
            Swal.fire({
                icon: 'warning',
                text: '생년월일을 입력해주세요',
            });
            return false;
        }

        // 주소 확인
        if (address1 === '' || address1 == null) {
            Swal.fire({
                icon: 'warning',
                text: '주소를 확인해주세요',
            });
            return false;
        }// 주소 확인

        // 상세 주소 확인
        if (address2 === '' || address2 === null) {
            Swal.fire({
                icon: 'warning',
                text: '상세 주소를 확인해주세요',
            });
            return false;
        }//상세  주소 확인

        // 모든 조건 통과 시, 통과!
        return true;
    }//-- 회원가입 체크 끝

    // 연락처 중복 확인
    $('#tel_check_btn').click(function () {
        console.log("tel눌렀잖아!");
        var tel = $('#registerCustTel').val();	// jsp의 값 tel에 넣기
        var data = {memberTel: tel}			// memberTel=컨트롤러에 넘길 데이터 이름, 데이터 값
        console.log(data);

        let csrfHeaderName = "${_csrf.headerName}";
        let csrfTokenValue = "${_csrf.token}";

        $.ajax({
            url: '/member/mtelCheck',			// controller URL
            type: 'post',						// post 타입
            data: data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            success: function (result) {			// result는 controller에서 넘어 온 결과 값
                if (result !== 'fail') {
                    $('#telCheckSpan').text("사용가능한 연락처입니다");
                    $("#telCheckSpan").css("color", "green");
                    telPass = true;				// 사용 가능 할 때, tel중복검사 true
                } else {
                    $('#telCheckSpan').text("이미 사용중인 연락처입니다");
                    $("#telCheckSpan").css("color", "red");
                    telPass = false;			// 사용이 불가능하면 tel중복검사 false
                }
            },
            error: function () {
                console.log(data);
                console.log(result);
                console.log("ajax 에러 발생!!");
                // alert("ajax 에러 발생!!");
                Swal.fire({
                    icon: 'error',
                    title: '재시도 바랍니다.',
                });
            }
        });

        if(tel.length!==11){
            $('#telCheckSpan').text("11자리로 입력해주시길 바랍니다");
            $("#telCheckSpan").css("color", "red");
            telPass = false;
        }
    });

    $("#registerWrite3_3").change(function () {	// change() : value 값에 변화가 생길 경우 이를 감지하여 callback함수 동작
        //직접 입력 누를 때 나타남
        if ($("#registerWrite3_3").val() == "01") {
            $("#directEmail").attr("readonly", false);
            $("#directEmail").val("");			// select=06 직접 입력인 경우, 입력란 보이기
        } else {
            $("#directEmail").attr("readonly", true);
            $("#directEmail").val($(this).val());
        }//-- 이메일 직접 입력
        email();
    });
</script>

</body>
</html>