<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="/WEB-INF/views/common/header.jspf"%>
<!-- headerWrap -->
<div id="headerWrap">
  <div class="header header_fixed header_main1903">


    <form id="autologinForm" name="autologinForm" action="http://www.thehandsome.com/ko/hp/autologin" method="get">
      <input type="hidden" name="hcid" id="hcid" value="e2gaf@naver.com" />
    </form>
    <div class="top_nav topnav1903">
      <div class="top_nav_wrap clearfix">
        <div class="brand_menu brand_menu1903">
          <ul class="clearfix">
            <!-- 선호 브랜드 있음 -->
            <li><span class="on"><a href="/" onclick="GA_Event('공통','탑_네비게이션','HOME')">HOME</a></span></li>
            <li><span><a href="http://www.thehandsome.com/ko/c/br44/br44" onclick="GA_Common('topNav',$(this))">CLUB MONACO</a></span></li>
            <!-- 공간 상 들어가지 못한 나머지 브랜드-->
          </ul>
        </div>
        <div class="gnb_sh_wrap" style="display: none;">
          <!-- search box -->
          <div class="gnb_sh_box">
            <input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value=""
                   onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}" />
            <a href="javascript:void(0);" id="gnbsearch">검색</a>
          </div>
          <!-- //search box -->
          <!-- search result -->
          <div class="gnb_sh_result">
            <div class="tab">
              <a href="javascript:void(0);" class="menu on">최근검색어</a>
              <div class="result_list on">
                <div class="searchWord1" style="display: none;">
                  <a href="javascript:void(0);" class="ml newlyBtn" id="searchWord1"></a><a href="javascript:void(0);"
                                                                                            class="close" onclick="deletecookie('HS_Seachwords1')">닫기</a>
                </div>
                <div class="searchWord2" style="display: none;">
                  <a href="javascript:void(0);" class="ml newlyBtn" id="searchWord2"></a><a href="javascript:void(0);"
                                                                                            class="close" onclick="deletecookie('HS_Seachwords2')">닫기</a>
                </div>
                <div class="searchWord3" style="display: none;">
                  <a href="javascript:void(0);" class="ml newlyBtn" id="searchWord3"></a><a href="javascript:void(0);"
                                                                                            class="close" onclick="deletecookie('HS_Seachwords3')">닫기</a>
                </div>
                <div class="searchWord4" style="display: none;">
                  <a href="javascript:void(0);" class="ml newlyBtn" id="searchWord4"></a><a href="javascript:void(0);"
                                                                                            class="close" onclick="deletecookie('HS_Seachwords4')">닫기</a>
                </div>
                <div class="searchWord5" style="display: none;">
                  <a href="javascript:void(0);" class="ml newlyBtn" id="searchWord5"></a><a href="javascript:void(0);"
                                                                                            class="close" onclick="deletecookie('HS_Seachwords5')">닫기</a>
                </div>
                <a href="javascript:void(0);" class="btn_svclose">검색어 <span id="searchSaveYN" save="on">끄기</span></a>
                <a href="javascript:void(0);" class="btn_allclose on" onclick="searchOff()">닫기</a>
              </div>
              <a href="javascript:void(0);" class="menu">인기검색어</a>
              <div class="result_list">
                <div>
                  <a href="javascript:void(0);" class="ml favBtn">jacket</a>
                  <!-- <a href="javascript:void(0);" class="close">닫기</a> -->
                </div>
                <div>
                  <a href="javascript:void(0);" class="ml favBtn">blouse</a>
                  <!-- <a href="javascript:void(0);" class="close">닫기</a> -->
                </div>
                <div>
                  <a href="javascript:void(0);" class="ml favBtn">stripe</a>
                  <!-- <a href="javascript:void(0);" class="close">닫기</a> -->
                </div>
                <div>
                  <a href="javascript:void(0);" class="ml favBtn">ribbon</a>
                  <!-- <a href="javascript:void(0);" class="close">닫기</a> -->
                </div>
                <div>
                  <a href="javascript:void(0);" class="ml favBtn">blouson</a>
                  <!-- <a href="javascript:void(0);" class="close">닫기</a> -->
                </div>
                <a href="javascript:void(0);" class="btn_svclose">검색어 <span id="searchSaveYNfame" save="on">끄기</span></a>
                <a href="javascript:void(0);" class="btn_allclose" onclick="searchOff()">닫기</a>
              </div>
            </div>
          </div>
          <!-- //search result -->
        </div>
        <!-- 201705 search_box_wrap -->
        <div class="search_box_wrap sbw1803" id="searchBox">
          <form name="search" id="search" action="http://www.thehandsome.com/ko/hssearch/searchCount" method="post" onsubmit="return false;">
            <input type="hidden" name="CSRFToken" value="c8672c9d-757d-4ec1-812e-9368ce782426" />
            <input type="hidden" name="searchwords" value="" />
            <input type="hidden" name="startCount" value="">
            <input type="hidden" name="mode" value="">
            <input type="hidden" name="sort" value="">
            <input type="hidden" name="collection" value="">
            <input type="hidden" name="range" value="">
            <input type="hidden" name="startDate" value="">
            <input type="hidden" name="endDate" value="">
            <input type="hidden" name="searchField" value="">
            <input type="hidden" name="reQuery" />
            <input type="hidden" id="prefixQuery" value="" />
            <input type="hidden" id="identity" name="identity" value="">
            <input type="hidden" id="realQuery" name="realQuery" value="" />
            <input type="hidden" id="loginState" value="loginOn" />
            <input type="hidden" id="athomeInfo" value="" />
            <input type="hidden" id="selectedLang" name="selectedLang" value="product_ko" />
            <input type="hidden" id="lang" name="lang" value="ko" />
            <input type="hidden" id="brandPageGubun" name="brandPageGubun" value="off">
            <!-- 브랜드 페이지 여부 -->
            <input type="hidden" id="brand_img" name="brand_img" value="">
            <input type="hidden" id="brand_url" name="brand_url" value="">
            <div class="search_box">
              <label for="query" class="hidden">search</label>
              <input type="search" id="query" name="query" value="" 	onKeypress="javascript:pressCheck((event),this);"
                     style="margin-top: 0.2px;" autocomplete="off">
              <span class="placeholder"></span>
              <a href="javascript:void(0);">
                <span class="btn_close">닫기</span>
              </a>
              <a href="javascript:GA_search();doSearch();" class="search">
                <span class="ico">검색</span>
              </a>
            </div>
          </form>
          <!--검색박스 활성화 data_react -->
          <div class="data_react">
            <!-- tab 검색어 입력 전 -->
            <div class="search_tab">
              <div class="btn_search_tab" style="display: none;">
                <a href="javascript:void(0);" rel="recent_search" class="btn_recent_search on"
                   onclick="GA_Event('검색','최근 검색어','클릭')">최근 검색어</a>
                <a href="javascript:void(0);" rel="style_search" class="btn_style_search" id="btn_style_search">Style Search</a>
                <a href="javascript:void(0);" rel="popular_search" class="btn_style_search" id="btn_top_search"
                   style="display: none;" onclick="GA_Event('검색','인기검색어','클릭')">인기검색어</a>
              </div>
              <!-- 최근 검색어 -->
              <div class="recent_search s_tab">
                <ul id="mykeyword"></ul>
              </div>
              <!-- style search -->
              <form id="searchStyle" name="searchStyle" action="http://www.thehandsome.com/ko/hssearch/searchCount" method="post" onsubmit="return false;">
                <input type="hidden" name="query" value="" />
                <input type="hidden" name="collection" value="" />
                <input type="hidden" id="CSRFToken" name="CSRFToken" value="c8672c9d-757d-4ec1-812e-9368ce782426" />
                <input type="hidden" id="searchStyleYn" name="searchStyleYn" value="searchStyle" />
              </form>

              <div class="style_search s_tab" id="stylesearch_area">
                <p class="style_search_tlt">Style Search 2018</p>
                <div class="ss_txt_list">
                  <ul class="style_search_arr" id="style_search_arr"></ul>
                </div>
                <div class="ss_img_list" id="styleSearchSlider">
                  <ul class="slides">
                    <li></li>
                  </ul>
                </div>
              </div>

              <!-- //style search 컨텐츠 하나일 때-->
              <div class="popular_search s_tab" id="topsearch_area" style="display: none;">
                <ol class="ol_popular1" id="topsearchLeft"></ol>
              </div>
            </div>
            <!--// tab 검색어 입력 전 -->
            <!-- 검색어 입력 후 (검색어 자동완성) -->
            <div class="search_autocomplete">
              <div class="autocomplete_txt">
                <div id="brandView"><ul></ul></div>
                <div id="ark" style="height: 170px;"></div>
              </div>
              <div class="autocomplete_right">
                <div class="category_brand">
                  <p>카테고리/브랜드</p>
                  <div class="brand">
                    <p id="autocomplete_brand">브랜드</p>
                  </div>
                  <div class="category">
                    <p id="autocomplete_category">카테고리</p>
                  </div>
                </div>
                <div class="autocomplete_img">
                  <p>
											<span>"<span id="autocomplete_query">{0}</span>"
											</span>에 대한 주요 검색 결과
                  </p>
                  <!--                                     <p><span>"<span id="autocomplete_query"></span>&#32;"</span>에 대한 주요 검색 결과</p> -->
                  <ul id="auto2"></ul>
                </div>
              </div>
            </div>
            <!--// 검색어 입력 후 (검색어 자동완성) -->
          </div>
          <!--//검색박스 활성화 data_react -->
        </div>
        <!--// 201705 search_box_wrap -->
        <div class="util_menu" style="display: block;">
          <ul class="clearfix">

            <%
              if ((String)session.getAttribute("member") == null) { //세션에 값이 없으면 로그인 링크를 출력
            %>
            <li id="login_btn"><a href="/member/loginForm/">로그인</a></li>
            <%
            } else {
            %>
            <!-- 세션에 값이 있으면 ~님 환영합니다 출력 하고 로그아웃리으 출력 -->
            <li style="margin-top: 9px;"><%=session.getAttribute("member")%> 님 환영합니다</li>

            <!-- 버튼을 클릭했을때 함수호출 -->

            <li id="logout_btn"><a href="/member/logout"> 로그아웃 </a></li>


            <%
              }
            %>
            <li class="header_dropmemu mypage">
              <a href="http://www.thehandsome.com/ko/mypage" class="btn" onclick="GA_Event('공통','헤더_메뉴','마이페이지')">마이페이지</a>
              <div class="list">
                <ul>
                  <li><a href="http://www.thehandsome.com/ko/mypage/order/myorders" onclick="GA_Event('공통','헤더_메뉴','마이페이지_주문조회')">주문조회<!-- 주문조회 --></a></li>
                  <li><a href="http://www.thehandsome.com/ko/mypage/myGradeInfo" onclick="GA_Event('공통','헤더_메뉴','마이페이지_나의회원등급')">나의회원등급<!-- 온라인등급 --></a></li>
                  <li><a href="http://www.thehandsome.com/ko/mypage/voucher" onclick="GA_Event('공통','헤더_메뉴','마이페이지_쿠폰조회')">쿠폰조회<!-- 쿠폰조회 --></a></li>
                  <li><a href="http://www.thehandsome.com/ko/mypage/mypoint" onclick="GA_Event('공통','헤더_메뉴','마이페이지_마일리지조회')">마일리지조회<!-- 포인트조회 --></a></li>
                  <li><a href="http://www.thehandsome.com/ko/mypage/myEGiftCard" onclick="GA_Event('공통','헤더_메뉴','마이페이지_e-Gift Card')">e-Gift Card<!-- e-Gfit Card --></a></li>
                  <li><a href="http://www.thehandsome.com/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('공통','헤더_메뉴','마이페이지_회원정보변경')">회원정보변경<!-- 회원정보변경 --></a></li>
                  <li><a href="http://www.thehandsome.com/ko/svcenter/mantomaninquiry" onclick="GA_Event('공통','헤더_메뉴','마이페이지_온라인상담')">온라인상담<!-- 온라인 상담 --></a></li>
                </ul>
              </div>
            </li>
            <li>
              <div class="header_dropmemu lang_switch lang_1911">
                <a href="javascript:void(0);" class="btn" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE')">LANGUAGE</a>
                <div class="list" style="display: none; height: 87px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
                  <ul>
                    <li><a href="javascript:language('ko')" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_한국어')">한국어</a></li>
                    <li><a href="javascript:language('en')" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_ENGLISH')">ENGLISH</a></li>
                    <li><a href="javascript:language('zh')" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_中文')">中文</a></li>
                  </ul>
                </div>
              </div>
            </li>
          </ul>
        </div>
        <div class="honey_talk_service1905 remove1907">
          <!-- 추가 190702 -->
          <!-- vip 채팅 서비스 -->
          <div id="chatbotMain" style="display: none;">
            <a href="#none" class="btn_viptalk_v2 v3" onclick="callChatbot();GA_Event('공통','유틸_메뉴','하니톡');">
              <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/main/talk-talk-chat-icon.png">
            </a>
          </div>
          <!-- //vip 채팅 서비스 -->
        </div>
      </div>
    </div>

    <!-- validation check message global -->
    <input type="hidden" id="validationCheckPwd" value="비밀번호를 재입력 하셔야 합니다." />
    <input type="hidden" id="validationCheck" value="필수데이터가 입력되지 않았습니다." />
    <input type="hidden" id="validationCheckMsg" value="다음 사항을 확인해 주세요." />
    <input type="hidden" id="validationCheckMsg1" value="필수데이터가 입력되지 않았습니다." />
    <input type="hidden" id="validationCheckMsg2" value="동일문자를 3번 이상 사용할 수 없습니다." />
    <input type="hidden" id="validationCheckMsg3" value="연속된 문자열(123 또는 321, abc, cba 등) 3자리이상 올 수 없습니다." />
    <input type="hidden" id="validationCheckMsg4" value="Caps Lock 이 켜져 있습니다." />
    <input type="hidden" id="validationCheckMsg5" value="이메일 아이디의 중복 확인이 필요합니다." />
    <input type="hidden" id="validationCheckMsg6" value="이메일의 중복확인이 필요합니다." />
    <input type="hidden" id="deliveryOkMsg" value="확인" />
    <input type="hidden" id="deliveryCancelMsg" value="취소" />

    <form id="chatbotForm" action="https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp" method="post" target="chatwindow">
      <input type="hidden" name="token" id="chatbot_token">
      <input type="hidden" name="talkId" id="chatbot_talkId">
      <div>
        <input type="hidden" name="CSRFToken" value="c8672c9d-757d-4ec1-812e-9368ce782426" />
      </div>
    </form>
    <!-- //headerWrap -->

    <div class="gnbwarp new201608 clearfix">
      <h1 class="logo logo1903">
        <a href="/">thehandsome.com</a>
      </h1>
      <!-- 첫번째 c:if -->

      <div id="transparent_mask"></div>
      <!-- 201803 util menu -->
      <div class="util_menu util_menu1803">
        <ul class="clearfix">
          <li><a href="javascript:void(0);"><span class="ico_sh">search</span></a></li>
          <li><a href="http://www.thehandsome.com/ko/mypage/myWish" onclick="GA_Event('공통','유틸_메뉴','위시리스트');">
            <span class="ico wishlist">wish list</span> <span class="count">(<span id="wishlistCount">0</span>)</span></a></li>
          <li><a href="http://www.thehandsome.com/ko/shoppingbag" onclick="GA_Event('공통','유틸_메뉴','쇼핑백');">
            <span class="ico cart">장바구니</span> <span class="count">(<span id="cartCount">1</span>)</span></a></li>
        </ul>
      </div>
    </div>
    <!-- //201803 util menu -->
  </div>
</div>
<!-- //headerWrap -->

<!-- bodyWrap -->
<div id="bodyWrap">
  <h3 class="cnts_title">
    <span id="menuTitle">회원 탈퇴</span>
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
            <a href="/kakao/deleteuser">개인정보 탈퇴</a>
          </dd>
        </dl>
        <dl>
          <dt>나의 활동관리</dt>
          <dd>
            <a href="/member/review">내 상품평</a>
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
      <div class="title_wrap line mt30">
        <h4 class="float_left">회원 탈퇴 안내<!-- 회원 탈퇴 안내 --></h4>
        <p class="txt_line">회원 탈퇴 전 다음 사항을 반드시 숙지해 주시기 바랍니다.<!-- 회원 탈퇴 전 다음 사항을 반드시 숙지해 주시기 바랍니다. --></p>
      </div>

      <div class="dropout_info info_cont190830">
        <ul>
          <li>
            <div>
              <strong>1 </strong>
              <p>
                더한섬닷컴 <b>탈퇴 시 보유하신 쿠폰, 회원정보, 거래정보 등은 모두 삭제</b>됩니다.<!-- 회원 탈퇴 시 회원님께서 보유하셨던 e-money 잔액, 쿠폰, 회원정보, 거래정보 등은 모두 삭제 됩니다. -->
              </p>
            </div>
          </li>
          <li>
            <div class="line2">
              <strong>2</strong>
              <p>
                거래 정보가 있는 경우, 판매 거래 정보 관리를 위하여 구매와 관련된 상품정보, 거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 <br>보관합니다. <!-- 거래 정보가 있는 경우, 판매 거래 정보 관리를 위하여 구매와 관련된 상품정보, 아이디, 거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 보관합니다. -->
              </p>
            </div>
          </li>
          <li>
            <div class="line2">
              <strong>3</strong>
              <p>
                회원 <b>탈퇴 후 90일간 재가입이 불가</b>하며, 탈퇴 후 재가입 시에는 신규 회원가입으로 처리됩니다.<br>(탈퇴 전 쿠폰, 회원정보, 거래내역 등은 복구되지 않습니다.)<!-- 회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 탈퇴 전의 회원정보와 거래정보 및 e-money 잔액, 쿠폰 정보 등은 복구되지 않습니다. -->
              </p>
            </div>
          </li>
          <li>
            <div class="line2">
              <strong>4</strong>
              <p>
                더한섬닷컴의 주문(배송/교환/반품) 및 상담 등이 진행중이거나, e-money의 자산을 보유한 경우 탈퇴가 불가합니다.<br>(진행 건 처리 완료 및 자산 소진 시 탈퇴 가능)</p>
            </div>
          </li>
        </ul>
      </div>



      <!-- btn_btwrap -->
      <div class="btnwrap">

        <input type="button" class="btn gray" id="memberSecessionBtn" value="회원탈퇴 " > <!-- 회원탈퇴 --> <!-- 여기부터 밥먹고 와서 하자 로그인 하는거랑 비슷하게 함  -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

      </div>
      <!-- //btn_btwrap -->
    </div>
    <!-- //cnts -->


  </div>
</div>

<script>
  //주문 목록으로 이동한다.
  function Goorderlist(){
    $("#orderlist").submit();
  }

  $("#memberSecessionBtn").click(function(){

    const mid = "${member}";
    let csrfHeaderName ="${_csrf.headerName}";
    let csrfTokenValue="${_csrf.token}";

    $.ajax({
      type : "POST",
      url : "/member/deleteuserpro",
      beforeSend: function(xhr) {
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
      data : mid,// json 형태의 데이터
      contentType: "application/json; charset=utf-8",
      success : function(username) {
        console.log(username);
        if(username != "" || username != null){
          console.log("ajax data 값 : " + username);
          // alert("회원 탈퇴가 되었습니다. \n 다음에 또 이용해주세요");
          Swal.fire({
            icon: 'success',
            title: '회원 탈퇴가 되었습니다.',
            text: '다음에 또 이용해주세요.',
          }).then(function(){
            location.href='/';
          });
        }
        //location.reload(true);
      },
      error : function(jqXHR, textStatus, errorThrown){
        console.log(jqXHR);  //응답 메시지
        console.log(textStatus); //"error"
        console.log(errorThrown);
      }
    });


  })

</script>
</body>
<%@include file="/WEB-INF/views/common/footer.jspf"%>