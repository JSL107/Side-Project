<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- footerWrap -->

<script type="text/javascript">
//<![CDATA[ 

$(document).ready(function(){
    var ua = navigator.userAgent.toLowerCase();
    // 익스플로러 브라우저 아닐 때만 인스타 링크버튼 노출
    if((ua.indexOf('trident') == -1) && (ua.indexOf("msie") == -1) ){
        $("#f_insta").show();
    }
});

getNewsList("/ko/magazine");


// 2022.03.29 푸터 공지사항 추가
getFooterNotices("/ko/svcenter");


function moveMobile(){
//    location.href = location.href.replace("?uiel=Desktop", "") + "?uiel=Mobile";
   location.href = "/ko/?uiel=Mobile";
}


function setLogout(){
    deletecookie("UID");   
    deletecookie("criteoEmail"); 
    deletecookie("memberGb");
    location.href = "/ko/logout";
}

//]]>
</script>

<div id="footerWrap">
   <div id="topBtn">
      <a href="javascript:void(0);" class="viewTopArea"><img
         src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/top_btn.png"
         alt="맨 위로" onclick="GA_Event('공통','퀵버튼','TOP');" /></a>
   </div>
   <div class="footer">
      <!--footer_cnts1 -->
      <div class="footer_cnts1 clearfix">
         <!-- footer_menu-->
         <div class="footer_menu cnts1_left">
            <div class="footer_logo">
               <a href="/ko/main" onclick="GA_Event('공통','로고','하단');"><img
                  src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/footer_logo_renew.png"
                  alt="HANDSOME" /></a>
            </div>
            <div class="footer_link">
               <ul class="clearfix">
                  <li><a href="/ko/svcenter/pointguide"
                     onclick="GA_Event('공통','푸터_메뉴','한섬마일리지 혜택');">한섬 등급 혜택</a></li>
                  <li><a href="/ko/svcenter/couponguide"
                     onclick="GA_Event('공통','푸터_메뉴','쿠폰');">쿠폰</a></li>
                  <li><a href="/ko/svcenter/asguide"
                     onclick="GA_Event('공통','푸터_메뉴','반품&환불안내');">반품&amp;환불안내</a></li>
               </ul>
               <ul class="clearfix">
                  <li><a href="/ko/svcenter/submain"
                     onclick="GA_Event('공통','푸터_메뉴','고객센터');">고객센터</a></li>
                  <li><a href="/ko/svcenter/faq"
                     onclick="GA_Event('공통','푸터_메뉴','FAQ');">FAQ</a></li>
               </ul>
               <ul class="clearfix">
                  <li><a href="/ko/member/login"
                     onclick="GA_Event('공통','푸터_메뉴','로그인');">로그인</a></li>
                  <li><a href="/ko/mypage/order/myorders"
                     onclick="GA_Event('공통','푸터_메뉴','주문배송조회');">주문배송조회</a></li>
                  <li><a href="/ko/mypage/order/myorders"
                     onclick="GA_Event('공통','푸터_메뉴','취소/반품');">취소/반품</a></li>
                  <li><a href="/ko/mypage/myWish"
                     onclick="GA_Event('공통','푸터_메뉴','위시리스트');">위시리스트</a></li>
               </ul>
               <ul class="clearfix">
               </ul>
            </div>
         </div>
         <!-- //footer_menu-->
         <div class="footer_apps cnts1_right">
            <ul>
               <!-- 200330 추가 -->
               <li class="ico_insta" id="f_insta" style="display: none;"><a
                  href="https://www.instagram.com/thehandsome_official/"
                  target="_blank" onclick="GA_Event('공통','푸터_SNS','INSTAGRAM');">한섬 인스타그램</a></li>
               <!-- 200330 추가 -->
            </ul>
         </div>
      </div>
      <!--//footer_cnts1 -->
   </div>
   <!--footer_cnts2 -->
   <div class="footer_cnts2 clearfix">
      <div class="footer">
         <div class="cnts2_left">
            <a href="/ko/footer/footerTermBusiness"
               onclick="GA_Event('공통','푸터_CNT','서비스이용약관');">서비스이용약관</a> <a
               href="/ko/footer/footerPrivacy"
               onclick="GA_Event('공통','푸터_CNT','개인정보처리방침');"><strong>개인정보처리방침<!-- 개인정보처리방침 --></strong></a>
            <a href="javascript:void(0);" class="box"
               onclick="javascript:window.open('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208126337', 'communicationViewPopup', 'width=750, height=700');GA_Event('공통','푸터_CNT','통신판매사업자정보확인');">통신판매사업자정보확인</a>
            <a
               href="https://mark.inicis.com/mark/escrow_popup.php?mid=handsomep1"
               class="box" onclick="GA_Event('공통','푸터_CNT','에스크로서비스가입확인');">에스크로서비스
               가입 확인</a>
            <p class="top_p">
               <span>(주)한섬</span><span>대표이사 : 김민덕</span><span>서울시 강남구 도산대로
                  523 한섬빌딩</span><span>TEL 1800-5700 (유료)</span><span class="bgnone">FAX
                  02-6078-2856</span>
            </p>
            <p>
               <span>사업자등록번호 120-81-26337</span><span>통신판매업신고번호 강남 제 00826호</span><span>개인정보보호책임자
                  윤인수</span><span class="bgnone">호스팅서비스 : (주) 한섬</span>
            </p>
            <p class="copyright">COPYRIGHT © 2017 HANDSOME. ALL RIGHT
               RESERVED.</p>
         </div>
   </div>
   <!--//footer_cnts2 -->
</div>
<!-- 네이버 애널리틱스 전환페이지 설정 : s -->
<!-- 네이버 애널리틱스 전환페이지 설정 : e -->
<form name="accessiblityForm">
   <input type="hidden" id="accesibility_refreshScreenReaderBufferField"
      name="accesibility_refreshScreenReaderBufferField" value="" />
</form>
<div id="ariaStatusMsg" class="skip" role="status" aria-relevant="text"
   aria-live="polite"></div>

<!--loadingbar-->
<div class="layerBg"></div>
<!--//loadingbar-->

<div id="popwrap_maple_evt2209"
   style="top: 50%; left: 50%; margin: -200px 0 0 -185px; width: 400px; position: fixed; display: block; z-index: 102">
</div>

<div class="layerArea" id="mapleLayer" style="display: none;">
   <div class="layerBg"></div>
</div>
<script type="text/javascript">  
   
       var virtusizeViewYn = false;
       
           virtusizeViewYn = true;
           
       if(virtusizeViewYn){
            
       }
   </script>
</body>
</html>