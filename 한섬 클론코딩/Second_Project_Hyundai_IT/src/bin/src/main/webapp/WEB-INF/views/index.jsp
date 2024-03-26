<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/font_80.css">
    <link rel="stylesheet" href="resources/css/css/layout.css">
    <link rel="stylesheet" href="resources/css/popup.css">
    <link rel="stylesheet" href="resources/css/swiper.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/layout.css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script type="text/javascript" src ="${path}/resources/jquery/common.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/jquery.form-3.51.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/jquery.vticker.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/common_function.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/swiper.min.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/jquery.flexslider.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/unorm.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/ui.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/netfunnel.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/netfunnel_skin.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/jquery-ui-1.11.2.min.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/siteoverlay.js"></script>
    <script type="text/javascript" src ="${path}/resources/jquery/html5shiv-printshiv.js"></script>



</head>
<body oncontextmenu="return false">
<!-- <div id="transparent_mask"></div> -->
<script>
    //라쿠텐 유입
    var siteID = "" ? "" : "";
    if(siteID != ""){
        (function(cname, cvalue){
            //20일 fix : 추후 변경 가능 - 변경시 bos단 처리
            var d = new Date();
            d.setTime(d.getTime() + (20*24*60*60*1000));
            document.cookie = cname + '=' + cvalue + '; expires=' + d.toUTCString() + '; path=/';
        })('rakuten', siteID);
    }
    (function(cname, cvalue, day){
        var d = new Date();
        d.setTime(d.getTime() + (day*24*60*60*1000));
        document.cookie = cname + '=' + cvalue + '; expires=' + d.toUTCString() + '; path=/';
    })('sslvisit1', false, -7);
</script>
<!-- 현대닷컴 유입 시작 -->
<script>
    (function(cname, cvalue, day){
        var d = new Date();
        d.setTime(d.getTime() + (day*24*60*60*1000));
        document.cookie = cname + '=' + cvalue + '; expires=' + d.toUTCString() + '; path=/';
    })('thehyundai', false, -7);
</script>
<!-- 현대닷컴 유입 끝 -->

<!-- hmall 유입 시작 -->
<script>
    (function(cname, cvalue, day){
        var d = new Date();
        d.setTime(d.getTime() + (day*24*60*60*1000));
        document.cookie = cname + '=' + cvalue + '; expires=' + d.toUTCString() + '; path=/';
    })('hyundaihmall', false, -7);
</script>
<!-- hmall 유입 끝 -->

<!-- 광고 유입 시작 -->
<script>
    (function(cname, cvalue, day){
        var d = new Date();
        d.setTime(d.getTime() + (day*24*60*60*1000));
        document.cookie = cname + '=' + cvalue + '; expires=' + d.toUTCString() + '; path=/';
    })('fromSite', '', -7);
</script>
<!-- 광고 유입 끝 -->
<!-- Loading -->
<div class="loading_bar" id="loadingBarDiv" style="display:none;">
    <img src="/_ui/desktop/common/images/common/loading.gif" alt="loading">
    <span>�로딩중</span>
</div>
<!-- //Loading -->

<form id="CSRFForm" action="/ko/" method="post"><div>
    <input type="hidden" name="CSRFToken" value="430e5a7c-f4cc-4cbf-9474-b680399cd085">
</div></form><!-- headerWrap -->
<div id="headerWrap">
    <div class="header header_fixed header_main1903">
        <script type="text/javascript" src="/_ui/desktop/common/js/SsoAjax.js"></script>

        <script>
            var arkQuery = $.noConflict(true);
        </script>

        <script>
            /*
 * 챗봇 관련 스크립트
 */
            // 챗봇의 푸시링크를 클릭했을 때
            function openChatView(token, talkId) {
                callChatbot(token, talkId);
            }

            function callChatbot(token, talkId) {
                if(token == null) {
                    $.ajax({
                        type:"POST",
                        url:"/ko/chatbot/token",
                        data: {"CSRFToken":"430e5a7c-f4cc-4cbf-9474-b680399cd085"},
                        async : false,
                        success:function(data){
                            if(data.result == "SHOULD_LOGIN") {
                                var la = new layerAlert("로그인이 필요합니다");
                                la.confirmAction = function(){//확인 버튼 클릭시 추가 호출 펑션
                                    location.href = "/ko/member/login";
                                };
                            }
                            else if(data.result == "NOT_VIP") {
                                var la = new layerAlert("VVIP 회원님만 이용 가능하십니다");
                                la.confirmAction = function(){//확인 버튼 클릭시 추가 호출 펑션
                                };
                            }
                            else if(data.result == "OFF-HOURS") {//일반 : CREW, FRIEND, 간편회원일경우, 평일 오전 9시 30분 ~ 오후 6시 30분만 사용가능
                                var la = new layerAlert("평일(월~금) 09:00 ~ 18:00 (토/일, 공휴일 휴무)에 이용 가능하십니다");
                                la.confirmAction = function(){//확인 버튼 클릭시 추가 호출 펑션
                                };
                            }
                            else {
                                if(data.token != "") {
                                    token = data.token;
                                }
                            }
                        },
                        error:function(e){
                            ;
                        }
                    });
                }

                if(token != null && token != '') {
                    try{
                        ga('gp.send','pageview',{
                            'title':'하니톡_채팅서비스', //가상페이지 화면명
                            'location':'http://www.thehandsome.com/ko/hanitalk' //가상페이지URL
                        });
                    }catch(e) {
                        console.log(e);
                    }
                    $("#chatbot_token").val(token);
                    $("#chatbot_talkId").val(talkId);


                    var targetTalkUrl = ""
                    if(location.href.indexOf("www.thehandsome.com") > -1){ //운영
                        //운영 챗봇 url
                        targetTalkUrl = "https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp";
                    }else { //그외
                        //개발 챗봇 url
                        targetTalkUrl = "https://handsome-dev.enomix.co.kr/front/v1/jsp/view/chat.jsp";
                    }

                    $("#chatbotForm").attr("action", targetTalkUrl);

                    $("#chatbotForm").submit();
                }
                return false;
            }
            /*
 * // 챗봇 관련 스크립트
 */
            function GA_Common(action,e){
                var eventCategory;
                var eventAction;
                var label;


                if (action == "topNav"){
                    eventCategory = "공통";
                    eventAction = "탑_네비게이션";
                    label = escape(e.text());
                } else if (action == "news"){
                    eventCategory = "공통";
                    eventAction = "뉴스";
                    label = escape(e.text());
                } else if (action.indexOf("commonBrand") > -1){
                    eventCategory = "공통_브랜드";
                    eventAction = gaBrandType(action.split('_')[0]);
                    label = e.text();
                } else if (action.indexOf("brandLike") > -1){
                    eventCategory = "공통_브랜드";
                    eventAction = gaBrandType(action.split('_')[0]) + "_좋아요";
                    label = e.parent().find("a").text();
                }

                GA_Event(eventCategory, eventAction,label);
            }

            function gaBrandType(brandCode){
                var brandTypeNm = "";
                if(brandCode == "WE"){
                    brandTypeNm = "여성_브랜드";
                }else if(brandCode == "ME"){
                    brandTypeNm = "남성_브랜드";
                }else if(brandCode == "ED"){
                    brandTypeNm = "편집_브랜드";
                }else if(brandCode == "OS"){
                    brandTypeNm = "해외_브랜드";
                }
                return brandTypeNm;
            }

        </script>

        <script type="text/javascript">
            var historyDelete = '검색기록전체삭제';
            var typingWord = '검색어를 입력해주세요.';
            var gotoBrand = '브랜드바로가기';
            var noRecommendCategory = '추천 카테고리가 없습니다.';
            var noRecommendBrand = '추천 브랜드가 없습니다.';
            var noRecommendResult = '해당 단어로 시작하는 검색어가 없습니다.';
            var brandReport = '브랜드리포트';
            var graph = '그래프';
            var fold = '접기';

            var favoriteBrands = new Array();
        </script>
        <script type="text/javascript" src="/_ui/desktop/common/wisenut/ark/js/beta.fix.js"></script>
        <script type="text/javascript" src="/_ui/desktop/common/wisenut/ark/js/ark.js"></script>
        <script type="text/javascript" src="/_ui/desktop/common/wisenut/js/search.js"></script>
        <script type="text/javascript">
            //<![CDATA[
            // #1067 - 201803 메인 개편
            function applyCategory(){

                layerAlert('로그인 후 당신만의 브랜드 즐겨찾기를 <br /> 완성하세요.');
                return;


                var brandNameArray = new Array();
                var brandCodeArray = new Array();
                var parentBrandCodeArray = new Array();
                var sortIndexArray = new Array();
                var valueSplitArray = new Array();
                var dataValue = "";

                $("input:checkbox[class=\"checkboxEvent\"]").each(function(){
                    if(this.checked){
                        dataValue = this.value;
                        valueSplitArray = dataValue.split('#');
                        brandNameArray.push(this.title);
                        parentBrandCodeArray.push(valueSplitArray[0]);
                        brandCodeArray.push(valueSplitArray[1]);
                        sortIndexArray.push(valueSplitArray[2]);
                    }
                });
                var parentBrandCode = parentBrandCodeArray.join(",");
                var brandName = brandNameArray.join(",");
                var brandCode = brandCodeArray.join(",");
                var sortIndex = sortIndexArray.join(",");

                $.ajax({
                    type:"GET",
                    url:"/intro/setCategoryList",
                    data:{"brandName":brandName,"brandCode":brandCode,"parentBrandCode":parentBrandCode,"sortIndex":sortIndex},
                    success:function(data){
                        window.location.reload();
                    },
                    error:function(e){
                        console.log("error", e);
                    }
                });

            }

            function resetCategory(){

                $("input:checkbox[class=\"checkboxEvent\"]").each(function(){
                    if(this.checked){
                        this.checked = false;
                    }
                });
                applyCategory();
            }


            function searchOn(){
                searchInit();
                $('div.gnb_sh_wrap').css("display", "block");
                $('div.util_menu').css("display", "none");
                $('div.gnb_sh_result').css("display", "block");

            }

            function searchOff(){

                $('div.util_menu').css("display", "block");
                $('div.gnb_sh_wrap').css("display", "none");

            }

            function showTab(){

                $('div.gnb_sh_result').css("display", "block");

            }

            // 쿠키 생성
            function setCookie(cName, cValue, cDay){
                var expire = new Date();
                expire.setDate(expire.getDate() + cDay);
                cookies = cName + '=' + escape(cValue) + '; path=/ ';
                if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
                document.cookie = cookies;
            }
            //쿠키 생성 (지정날짜 제거)
            function setLimitCookie(cName, cValue, cLimitDay){
                var expire = null;
                cookies = cName + '=' + escape(cValue) + '; path=/ ';

                if(cLimitDay && cLimitDay != "" && cLimitDay.indexOf('/') != -1){
                    var limitFullYear = parseInt(cLimitDay.split('/')[0],10);
                    var limitMonth = parseInt(cLimitDay.split('/')[1],10)-1;//0부터 1월
                    var limitDate = parseInt(cLimitDay.split('/')[2],10)
                    expire = new Date(limitFullYear,limitMonth,limitDate);

                    cookies += ';expires=' + expire.toGMTString() + ';';
                }
                document.cookie = cookies;
            }
            //쿠키 생성 (00시 제거)
            function setOneDayCookie(cName, cValue, cDay){
                var currentDate = new Date();
                var expire = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + cDay, 0, 0, 0);
                cookies = cName + '=' + escape(cValue) + '; path=/ ';
                if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
                document.cookie = cookies;
            }

            // 쿠키 가져오기
            function getCookie(cName) {
                cName = cName + '=';
                var cookieData = document.cookie;
                var start = cookieData.indexOf(cName);
                var cValue = '';
                if(start != -1){
                    start += cName.length;
                    var end = cookieData.indexOf(';', start);
                    if(end == -1)end = cookieData.length;
                    cValue = cookieData.substring(start, end);
                }
                return unescape(cValue);
            }

            //쿠키 삭제
            function deletecookie(name) {
                var today   = new Date();
                var path = "/ko/";
                var lastIndex = path.lastIndexOf('/');
                path = path.substring(0 , lastIndex);
                today.setDate(today.getDate() + -1);
                document.cookie = name + "=; path="+path+"; expires=" + today.toGMTString() + ";";
            }

            function deletecookiePath(name, path) {
                var today   = new Date();

                if(path == "") {
                    path = "/";
                }

                today.setDate(today.getDate() + -1);
                document.cookie = name + "=; path="+path+"; expires=" + today.toGMTString() + ";";
            }

            function searchInit(){
                var settingCookie = getCookie("searchSaveYN");
                if(settingCookie == "on"){

                    $('#searchSaveYN').text("끄기");
                    $('#searchSaveYNfame').text("끄기");

                }else{
                    $('#searchSaveYN').text("저장");
                    $('#searchSaveYNfame').text("저장");

                }
            }

            function ie8AlertHide() {
                setCookie("ie8AlertHideYN", "on", 365);
                $("#alertIE8").hide();
            }

            $(document).ready(function() {

                $('.gnb_nav.hscene1906 .cate_m .hscene').mouseover(function(){ // 툴팁
                    $('.gnb_nav.hscene1906 .cate_m li .delch_box').addClass('on');
                });
                $('.gnb_nav.hscene1906 .cate_m .hscene').mouseout(function(){
                    $('.gnb_nav.hscene1906 .cate_m li .delch_box').removeClass('on');
                });

                var todayDate = new Date();
                var startDate = new Date('2018/05/29 00:00:01'), endDate = new Date('2018/06/17 23:59:59');
                if (todayDate.getTime() >= startDate.getTime() && todayDate.getTime() <= endDate.getTime()) {
                    $("#athome_header_event").show();
                }else{
                    $("#athome_header_org").show();
                }

                //IE8버젼 체크
                if(getCookie("ie8AlertHideYN") != "on") {
                    if(navigator.appVersion.indexOf('MSIE 8.0') >= 0 || navigator.appVersion.indexOf('Trident/4.0') >= 0){
                        var html = "<div style='position:relative; width: 100%; height: 30px;'><div style='position:fixed;width:100%;background:#ffffbc none repeat scroll 0% 0%; text-align: center; z-index: 999; line-height: 30px;'>";
                        html += "Thehandsome.com은 인터넷 익스플로러 10 이상에 최적화되어 있습니다.";
                        html += " <a href='http://windows.microsoft.com/ko-kr/windows/downloads'><strong>[브라우저 업데이트 바로가기]</strong></a>";
                        html += "<a href='#' onclick='ie8AlertHide();' style='display:block;float:right;padding-right:10px'>X</a></div></div>";
                        $(".loading_bar").before("<div align='center' id='alertIE8'>"+html+"</div>");
                    }
                }

                settingCookie = getCookie("searchSaveYN");

                if(settingCookie == ""){
                    setCookie("searchSaveYN", "on", 365);
                }

                $('#gnbsearch').click(function () {
                    var searchwords = $('#gnbsearchwords').val();
                    searchwords = searchwords.replace(/(^\s*)|(\s*$)/g,"");

                    if(searchwords!=""){
                        location.href="/ko/hssearch?searchwords="+searchwords;
                    }else{
                        $('#gnbsearchwords').val("");
                        alert("검색어를 입력해주세요.");
                    }
                });

                $('.btn_svclose').click(function () {
                    settingCookie	= getCookie("searchSaveYN");
                    if($(this).children('span').text() == "끄기"){
                        $(this).children('span').text("저장");
                    } else {
                        $(this).children('span').text("끄기");
                    }
                    if(settingCookie == "off"){
                        $(this).children('span').attr("save","on");
                        setCookie("searchSaveYN", "on", 365);
                    } else {
                        $(this).children('span').attr("save","off");
                        setCookie("searchSaveYN", "off", 365);
                    }

                });
                $('.favBtn').click(function(){

                    words = $(this).text();
                    location.href="/ko/hssearch?searchwords="+words;

                });
                $('.newlyBtn').click(function(){

                    words = $(this).text();
                    location.href="/ko/hssearch?searchwords="+words;

                });

                var sw1 = decodeURIComponent(escape(getCookie("HS_Seachwords1")));
                var sw2 = decodeURIComponent(escape(getCookie("HS_Seachwords2")));
                var sw3 = decodeURIComponent(escape(getCookie("HS_Seachwords3")));
                var sw4 = decodeURIComponent(escape(getCookie("HS_Seachwords4")));
                var sw5 = decodeURIComponent(escape(getCookie("HS_Seachwords5")));

                var sw1_date = sw1 != "" ? sw1.split("_")[1] : "";
                var sw2_date = sw2 != "" ? sw2.split("_")[1] : "";
                var sw3_date = sw3 != "" ? sw3.split("_")[1] : "";
                var sw4_date = sw4 != "" ? sw4.split("_")[1] : "";
                var sw5_date = sw5 != "" ? sw5.split("_")[1] : "";

                var arr = [sw1,sw2,sw3,sw4,sw5];
                var arr_date = [sw1_date,sw2_date,sw3_date,sw4_date,sw5_date];

                arr_date.sort(compStringReverse);

                for(var i=0; i<arr_date.length;i++){
                    for(var j=0; j<arr.length;j++){
                        if(arr_date[i] != ""){
                            if(arr[j].indexOf(arr_date[i]) > 0){
                                $("#searchWord"+(i+1)).text(arr[j].split("_")[0]);
                                $('.searchWord'+(i+1)).css("display", "block");

                                $("#searchWord"+(i+1)).next().attr("onclick","deletecookie('HS_Seachwords"+(j+1)+"')");
                            }
                        }
                    }

                    if(arr_date[i] == ""){
                        $("#searchWord"+(i+1)).text("");
                    }
                }



                //자동로그인

                var ssoUrl = "https://sso.h-point.co.kr:29865" + "/co/setSsoReqJSONP.hd";
                gfnSsoReqAjax(ssoUrl, hpAutoLogin);


                //vip 채팅 서비스
                if("" != ""){
                    var pag = "main201903Page";

                    var chkPag = ["svCenterMainPage", "noticePage", "manToManInquiryPage", "faqPage",
                        "mendingPage", "vocProvisionPage", "vocInfoFormPage", "memberJoinGuidePage", "theClubInfoPage",
                        "memberBenefitGuidePage", "pointGuidePage", "couponGuidePage", "paymentGuidePage", "asGuidePage"];

                    var vipPassCheck = "N"; // VVIP/THESTAR/STAR 등급 체크
                    var timePassCheck = "N"; // 평일 0900~1800 체크

                    if("" == "VVIP" || ("" == "THESTAR" || "" == "STAR" )){
                        vipPassCheck = "Y";
                    }

                    if(vipPassCheck == "N" && "" == "PASS"){ // MANIA 이하 등급, 평일 체크
                        // chatbotInfo "PASS" : 등급이 VVIP/THESTAR/STAR/MANIA 이거나 평일 0900~1800
                        var hour = new Date().format("HHmm");
                        var weekName = new Date().format("E");
                        if(weekName != "일요일" && weekName != "토요일" && hour >= "0900" && hour <= "1800"){
                            $.ajax({
                                type:"POST",
                                url:"/ko/chatbot/chkholiday",
                                data: {"CSRFToken":"430e5a7c-f4cc-4cbf-9474-b680399cd085"},
                                async : false,
                                success:function(result){
                                    if(result == true) {
                                        timePassCheck = "Y";
                                    }
                                },
                                error:function(request,statuss,error){
                                    ;
                                }
                            });
                        }
                    }

                    if ((vipPassCheck == "Y" || timePassCheck == "Y") && "main201903Page" == "main201903Page") {
                        $('#chatbotMain').show();
                    }else{
                        $('#chatbotMain').hide();
                    }

                    if (chkPag.indexOf(pag) > -1) {
                        if(vipPassCheck == "Y" || timePassCheck == "Y"){
                            $('#chatbot').show();
                        }else{
                            $('#chatbot').hide();
                        }
                    }else{
                        $('#chatbot').hide();
                    }
                }

                //athome
                if("" != ""){
                    // #1067 - 메인 개편

                    $('.ico.athome').mouseenter(function(){
                        $('.athome_info').show();
                    });
                    $('.athome_header').mouseleave(function(){
                        $('.athome_info').hide();
                    });
                }

                // ##1141 - 카테고리 개편
                outletGnbNav();//아울렛 gnb

            });

            function athomeBlink(){
                $('.ico.athome').css('opacity','0');
                setTimeout(function(){
                    $('.ico.athome').css('opacity','1');
                },500);
            }
            function athomeEventBlink(){
                $('.athome_event').css('opacity','0');
                setTimeout(function(){
                    $('.athome_event').css('opacity','1');
                },500);
            }

            function hpAutoLogin(data){
                //console.log("data.succYn:"+data.succYn);
                if (data.succYn == "Y") {
                    $.ajax({
                        type:"GET",
                        url:"/ko/hpoint/simpleJoinMember",
                        data: {"mcustNo":data.mcustNo},
                        success:function(data){
                            if(data.resultCode == "L"){
                                $("#hcid").val(data.uid);
                                $("#autologinForm").submit();
                            }
                        },
                        error:function(e){
                        }
                    });
                }
            }

            function compStringReverse(a, b) {
                if (a > b) return -1;
                if (b > a) return 1;
                return 0;
            }

            function EnterSearchHeader(){

                var searchwords = $('#gnbsearchwords').val();
                searchwords = searchwords.replace(/(^\s*)|(\s*$)/g,"");

                if(searchwords!=""){
                    location.href="/ko/hssearch?searchwords="+searchwords;
                }else{
                    $('#gnbsearchwords').val("");
                    alert("검색어를 입력해주세요.");
                }


            }

            function language(isoCode) {
                if(location.href.indexOf("/handsome/") > -1){

                    $.ajax({
                        type : "post",
                        url : "/ko/_s/language" + "?" + "code="+isoCode,
                        dataType : "json",
                        error : function( request, status, error ){
                            console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
                        },
                        success : function( result ){
                            location.href = "/ko/";
                        }
                    });

                }else{
                    location.href = "/"+isoCode;
                }
            }

            function getCSRFToken(){
                return "CSRFToken="+$("#CSRFForm [name='CSRFToken']").first().val();
            }


            function setLogout(){
                deletecookie("UID");
                deletecookie("criteoEmail");
                deletecookie("memberGb");
                location.href = "/ko/logout";
            }




            //START OF 메인 검색창////////////////////////
            // #1067 - 201803 메인 개편
            $(function(){


                getNotLoginMyKeyWord($("#query").val(), 10);

                /*
        // 내가 찾은 검색어(비로그인 상태) set, get in DB
        getNotLoginMyKeyWord($("#query").val(), 10);
     */

                if(navigator.userAgent.toLowerCase().indexOf("firefox") > -1) {
                    $("#searchBox").on("keypress", function (event) {
                        var keyCode = event.which || event.keyCode;
                    });
                }

                $('#query').click(function(){
                    // 스타일 서치 아이템
                    doStyleItem();
                    $('.search_box_wrap').click(function(){
                        if(!$('.search_box_wrap').hasClass('on')){
                            var dataHeight = $('.data_react').height();
                            $("#transparent_mask").show();

                            GA_Event('공통','유틸_메뉴','검색');
                            $('.search_box_wrap').stop().animate({width:'406px',height:'+= dataHeight +"px"',"max-height":"430px","opacity":1},'fast');

                            $('.search_box_wrap').addClass('on');
                            $('.btn_search_tab').stop().show();

                            $('.data_react').stop().show();

                            $('#styleSearchSlider').hide();
                            $('.search_box .search').stop().fadeIn('fast');


                            //검색창 텝 >> style search slider
                            $(document).find('#styleSearchSlider').flexslider({
                                animation:"slide",
                                slideshow:false,
                                directionNav:true,
                                after: function(slider){
                                    $("#styleSearchSlider .slides li").not(".clone").each(function(idx){
                                        if($(this).hasClass("flex-active-slide")){
                                            $(".ss_txt_list li a").removeClass("on");
                                            $(".ss_txt_list li:eq("+idx+") a").addClass('on');
                                        }
                                    });
                                }
                            });
                            var styleTotal = $("#styleSearchSlider .slides li").size();
                            if(styleTotal <= 1) {
                                $("#styleSearchSlider .flex-direction-nav").hide();
                            }

                            //keyup 자동완성 리스트

                            //keyup 자동완성 리스트
                            $('#query').keyup(function(e){
                                if(!$('#query').val() == ""){
                                    $('.search_tab').hide();

                                    $('.search_box_wrap').stop().animate({width:'477px'},'fast',function(){
                                        $('.search_autocomplete').show();
                                    });
                                    $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'461px'},'fast');
                                    /*  var atcRightHeight = $(".autocomplete_right").height();//자동완성리스트 높이 조절
                    var atctxtHeight = $(".autocomplete_txt").height();
                    if(atcRightHeight < atctxtHeight){
                        $(".autocomplete_right").height(atctxtHeight);
                    } */

                                }else{
                                    $('.search_autocomplete').hide();
                                    $('.search_tab').show();

                                    $('.search_box_wrap').stop().animate({width:'406px'});
                                    $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'390px'});

                                }
                                $('.autocomplete_txt li a').each(function(){
                                    if(!$(this).hasClass('brand_main')){
                                        $(this).html($(this).html().replace("<strong>",""));
                                        $(this).html($(this).html().replace("</strong>",""));

                                        if($(this).html().indexOf($('#searchBox').val()) > -1){
                                            $(this).html($(this).html().replace($('#searchBox').val(),"<strong>"+$('#searchBox').val()+"</strong>"));
                                        }
                                    }
                                });
                            });

                            //검색창 click시 이미 value 값이 있을 때
                            if(!$('#query').val() == ""){
                                $('.search_box_wrap').stop().animate({width:'477px','opacity':1},'fast');
                                $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'461px'},'fast');
                            }else{
                                $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'390px'},'fast');
                            }

                        }

                        $('#styleSearchSlider').fadeIn();

                        //close button
                        $('.search_box a span.btn_close').on('click',function(){

                            $('.search_box_wrap').stop().animate({width:'30px',height:'-= dataHeight +"px"',"opacity":0});

                            $('.data_react').stop().hide();
                            $('.btn_search_tab').stop().hide();
                            $('.search_box_wrap').removeClass('on');
                            $("#transparent_mask").hide();
                            $('.search_box .search').stop().fadeOut('fast');
                            if(!$('#query').val() == ""){
                                $('#query').val("");
                                $('.search_autocomplete').hide();
                                $('.search_tab').show();
                            }
                            return false;
                        });
                    });
                    $("#transparent_mask").click(function(){
                        if($('.search_box_wrap').hasClass('on')){

                            $('.search_box_wrap').stop().animate({width:'30px',height:'-= dataHeight +"px"',"opacity":0});

                            $('.data_react').stop().hide();
                            $('.btn_search_tab').stop().hide();
                            $('.search_box_wrap').removeClass('on');
                            $("#transparent_mask").hide();
                            $('.search_box .search').stop().fadeOut('fast');
                        }
                    });
                    //검색창 텝
                    $(document).on('click','.btn_search_tab a',function(){
                        $(this).addClass('on');
                        $(this).siblings().removeClass('on');
                        $('.data_react .s_tab').stop().hide();
                        var activeTab = $(this).attr('rel');
                        $('.' + activeTab).stop().show();
                    });
                });
            });

            //##1141 - 카테고리 개편
            function outletGnbNav(){//아울렛 gnb
                $('.outlet_brand1803 .sub_menu > ul > li > ul > li > a').on('mouseenter focus',function(){
                    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > a').removeClass('on');
                    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > div').stop().hide();
                    $(this).addClass('on');
                    $(this).parent('li').children('div').stop().css('display','inline-block');
                    var liWidthSumDep3 = 0;
                    $(this).next('div').children('ul').children('li').each(function(idx3){
                        var liWidth = $(this).width();
                        var liLength = $(this).length;
                        if(idx3 > 0){
                            liWidthSumDep3 = liWidthSumDep3 + (liWidth + 25);
                        }
                        $(this).width(liWidth);
                    });
                    $(this).next('div').children('ul').width(liWidthSumDep3 -10);
                });
                $('.outlet_brand1803 .sub_menu > ul > li > ul > li').on('mouseleave blur',function(){
                    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > a').removeClass('on');
                    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > div').stop().hide();
                });
            }

            function GA_search(){

                var searchForm = document.search;
                var searchwords = escape(searchForm.query.value);

                GA_Event('검색','직접입력',searchwords);
            }

            //]]>
        </script>
        <form id="autologinForm" name="autologinForm" action="/ko/hp/autologin" method="get">
            <input type="hidden" name="hcid" id="hcid" value="e2gaf@naver.com">
        </form>
        <div class="top_nav topnav1903">
            <div class="top_nav_wrap clearfix">
                <div class="brand_menu brand_menu1903">
                    <ul class="clearfix">
                        <!-- 선호 브랜드 없음 -->
                        <li><span class="on"><a href="/ko/main" onclick="GA_Event('공통','탑_네비게이션','HOME')">HOME</a></span></li>
                        <!-- 로그인 상태 -->
                        <!-- 비로그인 상태 -->
                        <p class="brand_menu_guide_text">로그인 후 아래 '브랜드' 메뉴에서 좋아하는 브랜드를 <span style="margin-top:-1px; display:inline-block;">♥</span>해주세요</p>
                    </ul>
                </div>
                <div class="gnb_sh_wrap" style="display:none;">
                    <!-- search box -->
                    <div class="gnb_sh_box">
                        <input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value="" onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}">
                        <a href="javascript:void(0);" id="gnbsearch">검색</a>
                    </div>
                    <!-- //search box -->
                    <!-- search result -->
                    <div class="gnb_sh_result">
                        <div class="tab">
                            <a href="javascript:void(0);" class="menu on">최근검색어</a>
                            <div class="result_list on">
                                <div class="searchWord1" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord1"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords1')">닫기</a></div>
                                <div class="searchWord2" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord2"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords2')">닫기</a></div>
                                <div class="searchWord3" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord3"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords3')">닫기</a></div>
                                <div class="searchWord4" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord4"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords4')">닫기</a></div>
                                <div class="searchWord5" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord5"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords5')">닫기</a></div>
                                <a href="javascript:void(0);" class="btn_svclose">검색어 <span id="searchSaveYN" save="on">끄기</span></a>
                                <a href="javascript:void(0);" class="btn_allclose on" onclick="searchOff()">닫기</a>
                            </div>
                            <a href="javascript:void(0);" class="menu">인기검색어</a>
                            <div class="result_list">
                                <div><a href="javascript:void(0);" class="ml favBtn">jacket</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
                                <div><a href="javascript:void(0);" class="ml favBtn">blouse</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
                                <div><a href="javascript:void(0);" class="ml favBtn">stripe</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
                                <div><a href="javascript:void(0);" class="ml favBtn">ribbon</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
                                <div><a href="javascript:void(0);" class="ml favBtn">blouson</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
                                <a href="javascript:void(0);" class="btn_svclose">검색어 <span id="searchSaveYNfame" save="on">끄기</span></a>
                                <a href="javascript:void(0);" class="btn_allclose" onclick="searchOff()">닫기</a>
                            </div>
                        </div>
                    </div>
                    <!-- //search result -->
                </div>
                <!-- 201705 search_box_wrap -->
                <div class="search_box_wrap sbw1803" id="searchBox">
                    <form name="search" id="search" action="/ko/hssearch/searchCount" method="post" onsubmit="return false;">
                        <input type="hidden" name="CSRFToken" value="430e5a7c-f4cc-4cbf-9474-b680399cd085">
                        <input type="hidden" name="searchwords" value="">
                        <input type="hidden" name="startCount" value="">
                        <input type="hidden" name="mode" value="">
                        <input type="hidden" name="sort" value="">
                        <input type="hidden" name="collection" value="">
                        <input type="hidden" name="range" value="">
                        <input type="hidden" name="startDate" value="">
                        <input type="hidden" name="endDate" value="">
                        <input type="hidden" name="searchField" value="">
                        <input type="hidden" name="reQuery">
                        <input type="hidden" id="prefixQuery" value="">
                        <input type="hidden" id="identity" name="identity" value="">
                        <input type="hidden" id="realQuery" name="realQuery" value="">
                        <input type="hidden" id="loginState" value="loginOff">
                        <input type="hidden" id="athomeInfo" value="">
                        <input type="hidden" id="selectedLang" name="selectedLang" value="product_ko">
                        <input type="hidden" id="lang" name="lang" value="ko">
                        <input type="hidden" id="brandPageGubun" name="brandPageGubun" value="off"><!-- 브랜드 페이지 여부 -->
                        <input type="hidden" id="brand_img" name="brand_img" value="">
                        <input type="hidden" id="brand_url" name="brand_url" value="">
                        <div class="search_box">
                            <label for="query" class="hidden">search</label>
                            <input type="search" id="query" name="query" value="" onkeypress="javascript:pressCheck((event),this);" style="margin-top: 0.2px;" autocomplete="off">
                            <span class="placeholder"></span>
                            <a href="javascript:void(0);"><span class="btn_close">닫기</span></a>
                            <a href="javascript:GA_search();doSearch();" class="search"><span class="ico">검색</span></a>
                        </div>
                    </form>
                    <!--검색박스 활성화 data_react -->
                    <div class="data_react">
                        <!-- tab 검색어 입력 전 -->
                        <div class="search_tab">
                            <div class="btn_search_tab" style="display:none;">
                                <a href="javascript:void(0);" rel="recent_search" class="btn_recent_search on" onclick="GA_Event('검색','최근 검색어','클릭')">최근 검색어</a>
                                <a href="javascript:void(0);" rel="style_search" class="btn_style_search" id="btn_style_search">Style Search</a>
                                <a href="javascript:void(0);" rel="popular_search" class="btn_style_search" id="btn_top_search" style="display:none;" onclick="GA_Event('검색','인기검색어','클릭')">인기검색어</a>
                            </div>
                            <!-- 최근 검색어 -->
                            <div class="recent_search s_tab">
                                <ul id="mykeyword"><div class="clear_search_hs"><a href="javascript:removeAllMyKeyword()">검색기록전체삭제</a></div></ul>
                            </div>
                            <!-- style search -->
                            <form id="searchStyle" name="searchStyle" action="/ko/hssearch/searchCount" method="post" onsubmit="return false;">
                                <input type="hidden" name="query" value="">
                                <input type="hidden" name="collection" value="">
                                <input type="hidden" id="CSRFToken" name="CSRFToken" value="430e5a7c-f4cc-4cbf-9474-b680399cd085">
                                <input type="hidden" id="searchStyleYn" name="searchStyleYn" value="searchStyle">
                            </form>

                            <div class="style_search s_tab" id="stylesearch_area">
                                <p class="style_search_tlt">Style Search 2018</p>
                                <div class="ss_txt_list">
                                    <ul class="style_search_arr" id="style_search_arr">
                                    </ul>
                                </div>
                                <div class="ss_img_list" id="styleSearchSlider">
                                    <ul class="slides"><li></li></ul>
                                </div>
                            </div>

                            <!-- style search 컨텐츠 하나일 때-->
                            <!-- <div class="style_search s_tab">
	                            <div class="ss_txt_list">
	                                <p class="style_search_tlt">Style Search 2017 S/S</p>
	                                <ul id="style_search_arr">
	                               </ul>
	                            </div>
	                             <div class="ss_img_list" id="styleSearchSlider">
                                    <ul class="slides"><li></li></ul>
                                </div>
	                        </div> -->
                            <!-- //style search 컨텐츠 하나일 때-->
                            <div class="popular_search s_tab" id="topsearch_area" style="display:none;">
                                <ol class="ol_popular1" id="topsearchLeft">
                                </ol>
                                <!-- 				                <ol class="ol_popular2" id="topsearchRight"> -->
                                <!-- 	                            </ol> -->
                            </div>
                        </div>
                        <!--// tab 검색어 입력 전 -->
                        <!-- 검색어 입력 후 (검색어 자동완성) -->
                        <div class="search_autocomplete">
                            <div class="autocomplete_txt">
                                <div id="brandView">
                                    <ul>
                                    </ul>
                                </div>
                                <div id="ark" style="height:170px;"><div class="ark_wrap" id="ark_wrap" style="display: none;"><ul id="ark_content_list"></ul></div></div>
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
                                    <p><span>"<span id="autocomplete_query">{0}</span>"</span>에 대한 주요 검색 결과</p>
                                    <!--                                     <p><span>"<span id="autocomplete_query"></span>&#32;"</span>에 대한 주요 검색 결과</p> -->
                                    <ul id="auto2">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--// 검색어 입력 후 (검색어 자동완성) -->
                    </div>
                    <!--//검색박스 활성화 data_react -->
                </div>
                <!--// 201705 search_box_wrap -->
                <div class="util_menu" style="display:block;">
                    <ul class="clearfix">
                        <li><a href="/ko/member/login" onclick="GA_Event('공통','헤더_메뉴','로그인')">로그인<!-- 로그인 --></a></li>
                        <li class="header_dropmemu mypage">

                            <a href="/ko/mypage" class="btn" onclick="GA_Event('공통','헤더_메뉴','마이페이지')">마이페이지</a>
                            <div class="list" style="display: none; height: 170px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
                                <ul>
                                    <li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','헤더_메뉴','마이페이지_주문조회')">주문조회<!-- 주문조회 --></a></li>
                                    <li><a href="/ko/mypage/myGradeInfo" onclick="GA_Event('공통','헤더_메뉴','마이페이지_나의회원등급')">나의회원등급<!-- 온라인등급 --></a></li>
                                    <li><a href="/ko/mypage/voucher" onclick="GA_Event('공통','헤더_메뉴','마이페이지_쿠폰조회')">쿠폰조회<!-- 쿠폰조회 --></a></li>
                                    <li><a href="/ko/mypage/mypoint" onclick="GA_Event('공통','헤더_메뉴','마이페이지_마일리지조회')">마일리지조회<!-- 포인트조회 --></a></li>
                                    <li><a href="/ko/mypage/myEGiftCard" onclick="GA_Event('공통','헤더_메뉴','마이페이지_e-Gift Card')">e-Gift Card<!-- e-Gfit Card --></a></li>
                                    <li><a href="/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('공통','헤더_메뉴','마이페이지_회원정보변경')">회원정보변경<!-- 회원정보변경 --></a></li>
                                    <li><a href="/ko/svcenter/mantomaninquiry" onclick="GA_Event('공통','헤더_메뉴','마이페이지_온라인상담')">온라인상담<!-- 온라인 상담 --></a></li>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <div class="header_dropmemu lang_switch lang_1911">
                                <a href="javascript:void(0);" class="btn" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE')">LANGUAGE</a>
                                <div class="list" style="height: 87px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; display: none;">
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
            </div>
        </div>

        <!-- validation check message global -->
        <input type="hidden" id="validationCheckPwd" value="비밀번호를 재입력 하셔야 합니다.">
        <input type="hidden" id="validationCheck" value="필수데이터가 입력되지 않았습니다.">
        <input type="hidden" id="validationCheckMsg" value="다음 사항을 확인해 주세요.">
        <input type="hidden" id="validationCheckMsg1" value="필수데이터가 입력되지 않았습니다.">
        <input type="hidden" id="validationCheckMsg2" value="동일문자를 3번 이상 사용할 수 없습니다.">
        <input type="hidden" id="validationCheckMsg3" value="연속된 문자열(123 또는 321, abc, cba 등) 3자리이상 올 수 없습니다.">
        <input type="hidden" id="validationCheckMsg4" value="Caps Lock 이 켜져 있습니다.">
        <input type="hidden" id="validationCheckMsg5" value="이메일 아이디의 중복 확인이 필요합니다.">
        <input type="hidden" id="validationCheckMsg6" value="이메일의 중복확인이 필요합니다.">
        <input type="hidden" id="deliveryOkMsg" value="확인">
        <input type="hidden" id="deliveryCancelMsg" value="취소">

        <form id="chatbotForm" action="https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp" method="post" target="chatwindow"><input type="hidden" name="token" id="chatbot_token">
            <input type="hidden" name="talkId" id="chatbot_talkId">
            <div>
                <input type="hidden" name="CSRFToken" value="430e5a7c-f4cc-4cbf-9474-b680399cd085">
            </div></form><!-- //headerWrap --><div class="gnbwarp com clearfix">
        <h1 class="logo logo1903">
            <a href="/ko/main" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
        </h1>
        <div class="gnb_nav gnb_nav1903 hscene1906 hscene1910">
            <h2 class="invisible">주메뉴</h2>
            <ul class="cate_m cate_banner gnbul1" id="cate_m_main">
                <li><a href="javascript:void(0);" class="gnb_brand" onclick="GA_Event('공통','GNB','브랜드');">브랜드<span class="arr">arrow</span></a>
                    <div class="sub_back">
                        <div class="sub_menu clearfix" style="">
                            <p class="gnbbr_txt">
                                브랜드 명을 클릭하시면 해당 브랜드로 이동합니다.</p>
                            <ul class="al_frt1 sm_dep1" style="margin-left: 165px;">
                                <!-- #1141 - 카테고리 개편 - 메인 즐겨찾기 브랜드 레이어 -->
                                <li><strong>여성 브랜드</strong>
                                    <ul class="clearfix sm_dep2">
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR01" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="TIME" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR01#1">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR01"></label><a href="/ko/b/br01" onclick="GA_Common('WE_commonBrand',$(this));">TIME</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR02" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="MINE" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR02#2">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR02"></label><a href="/ko/b/br02" onclick="GA_Common('WE_commonBrand',$(this));">MINE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR19" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="LANVIN COLLECTION" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR19#3">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR19"></label><a href="/ko/b/br19" onclick="GA_Common('WE_commonBrand',$(this));">LANVIN COLLECTION</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR03" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="SYSTEM" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR03#4">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR03"></label><a href="/ko/b/br03" onclick="GA_Common('WE_commonBrand',$(this));">SYSTEM</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR04" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="SJSJ" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR04#5">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR04"></label><a href="/ko/b/br04" onclick="GA_Common('WE_commonBrand',$(this));">SJSJ</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR08" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="the CASHMERE" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR08#6">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR08"></label><a href="/ko/b/br08" onclick="GA_Common('WE_commonBrand',$(this));">the CASHMERE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR44" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="CLUB MONACO" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR44#7">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR44"></label><a href="/ko/b/br44" onclick="GA_Common('WE_commonBrand',$(this));">CLUB MONACO</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR43" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="OBZEE" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR43#8">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR43"></label><a href="/ko/b/br43" onclick="GA_Common('WE_commonBrand',$(this));">OBZEE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR31" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="LÄTT" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR31#9">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR31"></label><a href="/ko/b/br31" onclick="GA_Common('WE_commonBrand',$(this));">LÄTT</a>
                                        </li>
                                        <li class="oera"><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR63" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="LANVIN BLANC" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR63#10">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR63"></label><a href="/ko/b/br63" onclick="GA_Common('WE_commonBrand',$(this));">LANVIN BLANC<i class="ico-new">new</i></a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR45" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="O'2nd" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR45#11">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR45"></label><a href="/ko/b/br45" onclick="GA_Common('WE_commonBrand',$(this));">O'2nd</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_WE_BR61" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="oera" onclick="GA_Common('WE_brandLike',$(this));" value="NEW_NORMAL_BRANDS_WE#BR61#12">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_WE_BR61"></label><a href="/ko/b/br61" onclick="GA_Common('WE_commonBrand',$(this));">oera</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><strong>남성 브랜드</strong>
                                    <ul class="clearfix sm_dep2">
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ME_BR06" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="TIME HOMME" onclick="GA_Common('ME_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ME#BR06#1">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ME_BR06"></label><a href="/ko/b/br06" onclick="GA_Common('ME_commonBrand',$(this));">TIME HOMME</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ME_BR07" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="SYSTEM HOMME" onclick="GA_Common('ME_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ME#BR07#2">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ME_BR07"></label><a href="/ko/b/br07" onclick="GA_Common('ME_commonBrand',$(this));">SYSTEM HOMME</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ME_BR08" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="the CASHMERE" onclick="GA_Common('ME_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ME#BR08#3">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ME_BR08"></label><a href="/ko/b/br08" onclick="GA_Common('ME_commonBrand',$(this));">the CASHMERE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ME_BR44" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="CLUB MONACO" onclick="GA_Common('ME_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ME#BR44#4">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ME_BR44"></label><a href="/ko/b/br44" onclick="GA_Common('ME_commonBrand',$(this));">CLUB MONACO</a>
                                        </li>
                                        <li class="oera"><input id="gnb_br_NEW_NORMAL_BRANDS_ME_BR63" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="LANVIN BLANC" onclick="GA_Common('ME_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ME#BR63#5">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ME_BR63"></label><a href="/ko/b/br63" onclick="GA_Common('ME_commonBrand',$(this));">LANVIN BLANC<i class="ico-new">new</i></a>
                                        </li>
                                    </ul>
                                </li>
                                <li><strong>편집 브랜드</strong>
                                    <ul class="clearfix sm_dep2">
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ED_BR15" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="TOM GREYHOUND" onclick="GA_Common('ED_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ED#BR15#1">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ED_BR15"></label><a href="/ko/b/br15" onclick="GA_Common('ED_commonBrand',$(this));">TOM GREYHOUND</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ED_BR35" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="FOURM THE STORE" onclick="GA_Common('ED_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ED#BR35#2">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ED_BR35"></label><a href="/ko/b/br35" onclick="GA_Common('ED_commonBrand',$(this));">FOURM THE STORE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ED_BR30" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="FOURM STUDIO" onclick="GA_Common('ED_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ED#BR30#3">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ED_BR30"></label><a href="/ko/b/br30" onclick="GA_Common('ED_commonBrand',$(this));">FOURM STUDIO</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ED_BR32" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="FOURM MEN'S LOUNGE" onclick="GA_Common('ED_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ED#BR32#4">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ED_BR32"></label><a href="/ko/b/br32" onclick="GA_Common('ED_commonBrand',$(this));">FOURM MEN'S LOUNGE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ED_BR16" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="MUE" onclick="GA_Common('ED_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ED#BR16#5">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ED_BR16"></label><a href="/ko/b/br16" onclick="GA_Common('ED_commonBrand',$(this));">MUE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ED_BR47" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="H : SCENE" onclick="GA_Common('ED_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ED#BR47#6">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ED_BR47"></label><a href="/ko/b/br47" onclick="GA_Common('ED_commonBrand',$(this));">H : SCENE</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_ED_BR62" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="Liquides Perfume Bar" onclick="GA_Common('ED_brandLike',$(this));" value="NEW_NORMAL_BRANDS_ED#BR62#7">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_ED_BR62"></label><a href="/ko/b/br62" onclick="GA_Common('ED_commonBrand',$(this));">Liquides Perfume Bar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><strong>해외 브랜드</strong>
                                    <ul class="clearfix sm_dep2">
                                        <li class="oera"><input id="gnb_br_NEW_NORMAL_BRANDS_OS_BR64" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="OUR LEGACY" onclick="GA_Common('OS_brandLike',$(this));" value="NEW_NORMAL_BRANDS_OS#BR64#1">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_OS_BR64"></label><a href="/ko/b/br64" onclick="GA_Common('OS_commonBrand',$(this));">OUR LEGACY<i class="ico-new">new</i></a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_OS_BR37" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="ROCHAS" onclick="GA_Common('OS_brandLike',$(this));" value="NEW_NORMAL_BRANDS_OS#BR37#2">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_OS_BR37"></label><a href="/ko/c/br37/br37" onclick="GA_Common('OS_commonBrand',$(this));">ROCHAS</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_OS_BR41" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="3.1 Phillip Lim" onclick="GA_Common('OS_brandLike',$(this));" value="NEW_NORMAL_BRANDS_OS#BR41#3">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_OS_BR41"></label><a href="/ko/c/br41/br41" onclick="GA_Common('OS_commonBrand',$(this));">3.1 Phillip Lim</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_OS_BR20" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="LANVIN PARIS" onclick="GA_Common('OS_brandLike',$(this));" value="NEW_NORMAL_BRANDS_OS#BR20#4">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_OS_BR20"></label><a href="/ko/c/br20/br20" onclick="GA_Common('OS_commonBrand',$(this));">LANVIN PARIS</a>
                                        </li>
                                        <li><input id="gnb_br_NEW_NORMAL_BRANDS_OS_BR21" name="gnb_br_ch" type="checkbox" class="checkboxEvent" title="BALLY" onclick="GA_Common('OS_brandLike',$(this));" value="NEW_NORMAL_BRANDS_OS#BR21#5">
                                            <label for="gnb_br_NEW_NORMAL_BRANDS_OS_BR21"></label><a href="/ko/c/br21/br21" onclick="GA_Common('OS_commonBrand',$(this));">BALLY</a>
                                        </li>
                                    </ul>
                                </li>
                                <!-- #1141 - 카테고리 개편 - 메인 즐겨찾기 브랜드 레이어 -->
                            </ul>
                            <p class="gnbbr_txt">
                                로그인 후 좋아하는 브랜드를 ♥해주세요. '적용하기' 버튼을 클릭하면 웹사이트 상단에 추가됩니다.</p>
                            <br>
                            <div class="br_button_wrap">
                                <button type="button" name="button" class="btn_br_apply" onclick="applyCategory();GA_Event('공통_브랜드','적용','적용하기');">적용하기</button>
                                <button type="button" name="button" class="btn_br_reset" onclick="resetCategory();GA_Event('공통_브랜드','적용','초기화하기');">초기화하기</button>
                            </div>

                        </div>
                    </div>
                </li>

                <li><a href="/ko/item/we" onclick="GA_Event('공통','GNB','여성');GA_Event('공통_카테고리','1DEPTH','여성');">여성<span class="arr">arrow</span></a>
                    <div class="sub_back">
                        <div class="sub_menu clearfix" style="">
                            <ul class="al_frt1 sm_dep1" style="margin-left: 165px;">
                                <li>
                                    <a href="/ko/c/we" onclick="GA_Event('공통_카테고리','2DEPTH','여성_전체보기');">전체보기<!-- 전체보기 --></a>
                                </li>
                                <li><a href="/ko/c/we09/" onclick="GA_Event('공통_카테고리','2DEPTH','여성_SPECIAL SHOP*');">SPECIAL SHOP*</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/we09n/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_SJSJ : SIGNATURE JEANS');">SJSJ : SIGNATURE JEANS</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we09b/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_O&amp;#039;2ND : MIDNIGHT IN PARIS');">O'2ND : MIDNIGHT IN PARIS</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we09q/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_LATT : RIDING INTO THE CLASSIC');">LATT : RIDING INTO THE CLASSIC</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we098/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_SYSTEM : PARIS PRESENTATION');">SYSTEM : PARIS PRESENTATION</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we09x/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_TIME : 22 FALL CAPSULE COLLECTION');">TIME : 22 FALL CAPSULE COLLECTION</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we091/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_OBZEE : ICONIC OBZEE');">OBZEE : ICONIC OBZEE</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we09j/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_TOMGREYHOUND: EXCLUSIVE');">TOMGREYHOUND: EXCLUSIVE</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we095/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_FOURM THE STORE: EXCLUSIVE');">FOURM THE STORE: EXCLUSIVE</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we09r/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_LATT : THE FIRST');">LATT : THE FIRST</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we09y/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_MINE : CODE MINE ATELIER');">MINE : CODE MINE ATELIER</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/we05/" onclick="GA_Event('공통_카테고리','2DEPTH','여성_아우터');">아우터</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/we051/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_재킷');">재킷</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we052/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_점퍼');">점퍼</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we015/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_가디건/베스트');">가디건/베스트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we053/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_트렌치 코트');">트렌치 코트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we054/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_코트');">코트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we055/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_다운/패딩');">다운/패딩</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/we01/" onclick="GA_Event('공통_카테고리','2DEPTH','여성_탑');">탑</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/we011/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_티셔츠');">티셔츠</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we012/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_블라우스');">블라우스</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we013/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_셔츠');">셔츠</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we014/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_니트');">니트</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/we04/" onclick="GA_Event('공통_카테고리','2DEPTH','여성_드레스');">드레스</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/we041/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_드레스_미니 드레스');">미니 드레스</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we042/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_드레스_미디 드레스');">미디 드레스</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we043/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_드레스_롱/맥시 드레스');">롱/맥시 드레스</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/we02/" onclick="GA_Event('공통_카테고리','2DEPTH','여성_팬츠');">팬츠</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/we021/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_캐주얼');">캐주얼</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we022/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_포멀');">포멀</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we023/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_데님');">데님</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we024/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_쇼츠');">쇼츠</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li style="margin-right:0px"><a href="/ko/c/we03/" onclick="GA_Event('공통_카테고리','2DEPTH','여성_스커트');">스커트</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/we031/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_미니 스커트');">미니 스커트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we032/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_펜슬 스커트');">펜슬 스커트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we033/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_플레어 스커트');">플레어 스커트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/we034/" onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_롱/맥시 스커트');">롱/맥시 스커트</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="gnb_banner float_right">
                            </div>
                        </div>
                    </div>
                    <!--  status2.last end -->
                    <!-- categoryItemList end -->
                </li>
                <li><a href="/ko/item/me" onclick="GA_Event('공통','GNB','남성');GA_Event('공통_카테고리','1DEPTH','남성');" class="">남성<span class="arr">arrow</span></a>
                    <div class="sub_back" style="height: 0px; border-bottom: 0px;">
                        <div class="sub_menu clearfix" style="display: none;">
                            <ul class="al_frt1 sm_dep1" style="margin-left: 165px;">
                                <li>
                                    <a href="/ko/c/me" onclick="GA_Event('공통_카테고리','2DEPTH','남성_전체보기');">전체보기<!-- 전체보기 --></a>
                                </li>
                                <li><a href="/ko/c/me09/" onclick="GA_Event('공통_카테고리','2DEPTH','남성_SPECIAL SHOP*');">SPECIAL SHOP*</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/me09f/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_SYSTEM HOMME : ONLINE EXCLUSIVE');">SYSTEM HOMME : ONLINE EXCLUSIVE</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me094/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_SYSTEM HOMME : PARIS PRESENTATION');">SYSTEM HOMME : PARIS PRESENTATION</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me091/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_CLUB MONACO : PANTS ARCHIVE');">CLUB MONACO : PANTS ARCHIVE</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me095/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_TIME HOMME : ONLINE EXCLUSIVE');">TIME HOMME : ONLINE EXCLUSIVE</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/me03/" onclick="GA_Event('공통_카테고리','2DEPTH','남성_아우터');">아우터</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/me031/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_재킷');">재킷</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me032/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_점퍼');">점퍼</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me015/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_가디건/베스트');">가디건/베스트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me033/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_트렌치코트');">트렌치코트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me034/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_코트');">코트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me035/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_다운/패딩');">다운/패딩</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/me01/" onclick="GA_Event('공통_카테고리','2DEPTH','남성_탑');">탑</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/me011/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_티셔츠');">티셔츠</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me012/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_셔츠');">셔츠</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me013/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_니트');">니트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me014/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_스웨터');">스웨터</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/me02/" onclick="GA_Event('공통_카테고리','2DEPTH','남성_팬츠');">팬츠</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/me021/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_루즈/테이퍼드');">루즈/테이퍼드</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me025/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_슬림/스트레이트');">슬림/스트레이트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me028/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_조거/트랙');">조거/트랙</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me022/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_데님');">데님</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me023/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_쇼츠');">쇼츠</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li style="margin-right:0px"><a href="/ko/c/me04/" onclick="GA_Event('공통_카테고리','2DEPTH','남성_수트');">수트</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/me041/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_수트_드레스셔츠');">드레스셔츠</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me042/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_수트_수트재킷');">수트재킷</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/me044/" onclick="GA_Event('공통_카테고리','3DEPTH','남성_수트_수트팬츠');">수트팬츠</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="gnb_banner float_right">
                            </div>
                        </div>
                    </div>
                    <!--  status2.last end -->
                    <!-- categoryItemList end -->
                </li>
                <li><a href="/ko/c/as" onclick="GA_Event('공통','GNB','잡화');GA_Event('공통_카테고리','1DEPTH','잡화');" class="">잡화<span class="arr">arrow</span></a>
                    <div class="sub_back" style="height: 0px; border-bottom: 0px;">
                        <div class="sub_menu clearfix" style="display: none;">
                            <ul class="al_frt1 sm_dep1" style="margin-left: 165px; float: right;">
                                <li>
                                    <a href="/ko/c/as" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_전체보기');">전체보기<!-- 전체보기 --></a>
                                </li>
                                <li><a href="/ko/c/as01/" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_여성슈즈');">여성슈즈</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/as011/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성슈즈_부츠');">부츠</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as012/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성슈즈_로퍼/블로퍼');">로퍼/블로퍼</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as013/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성슈즈_스니커즈');">스니커즈</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as014/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성슈즈_플랫');">플랫</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as015/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성슈즈_힐/슬링백');">힐/슬링백</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as016/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성슈즈_샌들/슬라이드');">샌들/슬라이드</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as017/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성슈즈_기타 슈즈');">기타 슈즈</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/as02/" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_남성슈즈');">남성슈즈</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/as021/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성슈즈_부츠');">부츠</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as022/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성슈즈_포멀슈즈');">포멀슈즈</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as023/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성슈즈_스니커즈');">스니커즈</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as024/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성슈즈_샌들/슬라이드');">샌들/슬라이드</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as025/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성슈즈_기타 슈즈');">기타 슈즈</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/as03/" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_여성백');">여성백</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/as031/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성백_토트백');">토트백</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as032/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성백_숄더/크로스바디백');">숄더/크로스바디백</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as034/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_여성백_기타 백');">기타 백</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/as04/" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_남성백');">남성백</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/as041/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성백_토트백');">토트백</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as042/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성백_숄더/크로스바디백');">숄더/크로스바디백</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as043/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성백_클러치 백');">클러치 백</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as044/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_남성백_기타 백');">기타 백</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/as05/" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_머플러/스카프');">머플러/스카프</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/as051/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_머플러/스카프_머플러');">머플러</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as052/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_머플러/스카프_스카프');">스카프</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/as06/" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_주얼리');">주얼리</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/as061/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_주얼리_이어링/커프');">이어링/커프</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as062/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_주얼리_목걸이');">목걸이</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as063/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_주얼리_팔찌');">팔찌</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as064/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_주얼리_반지');">반지</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as065/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_주얼리_기타 주얼리');">기타 주얼리</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li style="margin-right:0px"><a href="/ko/c/as07/" onclick="GA_Event('공통_카테고리','2DEPTH','잡화_기타 ACC');">기타 ACC</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/as071/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_모자');">모자</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as072/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_양말');">양말</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as073/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_장갑');">장갑</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as074/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_벨트');">벨트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as075/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_지갑');">지갑</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as076/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_헤어ACC');">헤어ACC</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as077/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_테크ACC');">테크ACC</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/as078/" onclick="GA_Event('공통_카테고리','3DEPTH','잡화_기타 ACC_기타소품');">기타소품</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="gnb_banner float_right">
                            </div>
                        </div>
                    </div>
                    <!--  status2.last end -->
                    <!-- categoryItemList end -->
                </li>
                <li><a href="/ko/c/gf" onclick="GA_Event('공통','GNB','골프');GA_Event('공통_카테고리','1DEPTH','골프');">골프<i class="ico-new">new</i><span class="arr">arrow</span></a>
                    <div class="sub_back">
                        <div class="sub_menu clearfix" style="">
                            <ul class="al_frt1 sm_dep1" style="margin-left: 165px;">
                                <li>
                                    <a href="/ko/c/gf" onclick="GA_Event('공통_카테고리','2DEPTH','골프_전체보기');">전체보기<!-- 전체보기 --></a>
                                </li>
                                <li><a href="/ko/c/gf01/" onclick="GA_Event('공통_카테고리','2DEPTH','골프_여성웨어');">여성웨어</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/gf011/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_여성웨어_아우터');">아우터</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf012/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_여성웨어_가디건/베스트');">가디건/베스트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf013/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_여성웨어_탑');">탑</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf014/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_여성웨어_스커트/원피스');">스커트/원피스</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf015/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_여성웨어_팬츠');">팬츠</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/gf02/" onclick="GA_Event('공통_카테고리','2DEPTH','골프_남성웨어');">남성웨어</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/gf021/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_남성웨어_아우터');">아우터</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf022/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_남성웨어_베스트');">베스트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf023/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_남성웨어_탑');">탑</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf024/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_남성웨어_팬츠');">팬츠</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li style="margin-right:0px"><a href="/ko/c/gf03/" onclick="GA_Event('공통_카테고리','2DEPTH','골프_ACC');">ACC</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/gf031/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_ACC_골프백');">골프백</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf032/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_ACC_골프화');">골프화</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf033/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_ACC_모자');">모자</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf034/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_ACC_장갑');">장갑</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf035/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_ACC_양말');">양말</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf036/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_ACC_벨트');">벨트</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/gf037/" onclick="GA_Event('공통_카테고리','3DEPTH','골프_ACC_기타');">기타</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="gnb_banner float_right">
                            </div>
                        </div>
                    </div>
                    <!--  status2.last end -->
                    <!-- categoryItemList end -->
                </li>
                <li><a href="/ko/c/be" onclick="GA_Event('공통','GNB','뷰티');GA_Event('공통_카테고리','1DEPTH','뷰티');" class="">뷰티<span class="arr">arrow</span></a>
                    <div class="sub_back" style="height: 0px; border-bottom: 0px;">
                        <div class="sub_menu clearfix" style="display: none;">
                            <ul class="al_frt1 sm_dep1" style="margin-left: 165px;">
                                <li>
                                    <a href="/ko/c/be" onclick="GA_Event('공통_카테고리','2DEPTH','뷰티_전체보기');">전체보기<!-- 전체보기 --></a>
                                </li>
                                <li><a href="/ko/c/be01/" onclick="GA_Event('공통_카테고리','2DEPTH','뷰티_스킨케어');">스킨케어</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/be011/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_스킨케어_토너/에멀전/크림');">토너/에멀전/크림</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/be012/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_스킨케어_세럼/앰플/오일/밤');">세럼/앰플/오일/밤</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/be013/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_스킨케어_클렌징/스크럽/마스크');">클렌징/스크럽/마스크</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/be02/" onclick="GA_Event('공통_카테고리','2DEPTH','뷰티_메이크업');">메이크업</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/be021/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_메이크업_페이스 메이크업');">페이스 메이크업</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/be023/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_메이크업_립 메이크업');">립 메이크업</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/be03/" onclick="GA_Event('공통_카테고리','2DEPTH','뷰티_바디/헤어케어');">바디/헤어케어</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/be031/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_바디/헤어케어_핸드·바디로션/크림/오일');">핸드·바디로션/크림/오일</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/be032/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_바디/헤어케어_핸드·바디워시/스크럽');">핸드·바디워시/스크럽</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/be033/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_바디/헤어케어_샴푸/컨디셔너');">샴푸/컨디셔너</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/be034/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_바디/헤어케어_트리트먼트/오일/스프레이');">트리트먼트/오일/스프레이</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/be035/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_바디/헤어케어_기타 바디/헤어케어');">기타 바디/헤어케어</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li style="margin-right:0px"><a href="/ko/c/be04/" onclick="GA_Event('공통_카테고리','2DEPTH','뷰티_향수');">향수</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/be041/" onclick="GA_Event('공통_카테고리','3DEPTH','뷰티_향수_향수');">향수</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="gnb_banner float_right">
                            </div>
                        </div>
                    </div>
                    <!--  status2.last end -->
                    <!-- categoryItemList end -->
                </li>
                <li><a href="/ko/c/ls" onclick="GA_Event('공통','GNB','라이프스타일');GA_Event('공통_카테고리','1DEPTH','라이프스타일');" class="">라이프스타일<span class="arr">arrow</span></a>
                    <div class="sub_back" style="height: 0px; border-bottom: 0px;">
                        <div class="sub_menu clearfix" style="display: none;">
                            <ul class="al_frt1 sm_dep1" style="margin-left: 165px;">
                                <li>
                                    <a href="/ko/c/ls" onclick="GA_Event('공통_카테고리','2DEPTH','라이프스타일_전체보기');">전체보기<!-- 전체보기 --></a>
                                </li>
                                <li><a href="/ko/c/ls01/" onclick="GA_Event('공통_카테고리','2DEPTH','라이프스타일_홈');">홈</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/ls011/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_홈_패브릭');">패브릭</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls012/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_홈_프래그런스');">프래그런스</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls013/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_홈_데코레이션');">데코레이션</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls014/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_홈_기타소품');">기타소품</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/ls02/" onclick="GA_Event('공통_카테고리','2DEPTH','라이프스타일_배스');">배스</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/ls022/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_배스_욕실용품');">욕실용품</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/ls03/" onclick="GA_Event('공통_카테고리','2DEPTH','라이프스타일_키친');">키친</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/ls031/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키친_그릇');">그릇</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls032/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키친_보드/트레이');">보드/트레이</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls033/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키친_커트러리');">커트러리</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls034/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키친_커피/티');">커피/티</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls035/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키친_패브릭/냅킨');">패브릭/냅킨</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls036/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키친_기타소품');">기타소품</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li><a href="/ko/c/ls04/" onclick="GA_Event('공통_카테고리','2DEPTH','라이프스타일_데스크');">데스크</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/ls041/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_데스크_문구');">문구</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls042/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_데스크_책');">책</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls043/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_데스크_기타소품');">기타소품</a>
                                        </li>
                                    </ul>
                                </li>
                                <!--  status2.last end -->
                                <li style="margin-right:0px"><a href="/ko/c/ls06/" onclick="GA_Event('공통_카테고리','2DEPTH','라이프스타일_키즈');">키즈</a>
                                    <ul class="clearfix sm_dep2">
                                        <li>
                                            <a href="/ko/c/ls061/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키즈_의류');">의류</a>
                                        </li>
                                        <li>
                                            <a href="/ko/c/ls062/" onclick="GA_Event('공통_카테고리','3DEPTH','라이프스타일_키즈_잡화');">잡화</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="gnb_banner float_right">
                            </div>
                        </div>
                    </div>
                    <!--  status2.last end -->
                    <!-- categoryItemList end -->
                </li>
            </ul>

            <ul class="cate_m cate_banner gnbul2" id="cate_m_main" style="float:right;">
                <li><a href="/ko/magazine/exhibitions" onclick="GA_Event('공통','GNB','기획전');" class="">기획전<!-- 기획전 --></a></li>
                <li><a href="/ko/magazine/events" onclick="GA_Event('공통','GNB','이벤트');" class="">이벤트</a></li>
                <!-- THE 매거진 수정 200330 -->
                <li>
                    <a href="/ko/magazine/submain" class="magazine1803" onclick="GA_Event('공통','GNB','매거진');">매거진<!-- 매거진 --><span class="arr">arrow</span></a>
                    <div class="sub_back" style="height: 0px; border-bottom: 0px;">
                        <div class="sub_menu clearfix newtmzbox" style="display: none;">
                            <ul class="the_maga_sublist sm_dep1" style="margin-left: 165px;">
                                <li><a href="/ko/magazine/submain">전체보기</a>
                                    <ul class="sm_dep2">
                                        <li><a href="/ko/magazine/coverstory">커버스토리</a></li>
                                        <li><a href="/ko/magazine/weeklypick">위클리 픽</a></li>
                                        <li><a href="/ko/magazine/selection">셀렉션</a></li>
                                        <li><a href="/ko/magazine/styleguide">스타일 가이드</a></li>
                                        <li><a href="/ko/magazine/some">#SOME</a></li>
                                        <li><a href="/ko/magazine/news">뉴스 </a></li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="img_themaga_sub">
                                <a href="/ko/magazine/editorials/8806742808648">
                                    <img class="amc_img" src="http://cdn.thehandsome.com/mobile/editorial/list/banner/20221007_51715717836831438_ko.jpg" alt="">
                                    <p>
                                        <strong>커버스토리</strong>
                                        <span>타임옴므가 마주할 겨울</span>
                                    </p>
                                </a>
                                <a href="/ko/magazine/editorials/8806742775880">
                                    <img class="amc_img" src="http://cdn.thehandsome.com/pc/editorial/detail/image/20221007_51713450997977145_ko.jpg" alt="">
                                    <p>
                                        <strong>위클리 픽</strong>
                                        <span>CARDIGAN &amp; KNIT VEST</span>
                                    </p>
                                </a>
                                <a href="/ko/magazine/editorials/8806742743112">
                                    <img class="amc_img" src="http://cdn.thehandsome.com/mobile/editorial/list/banner/20221007_51692678309750614_ko.jpg" alt="">
                                    <p>
                                        <strong>커버스토리</strong>
                                        <span>오늘은 코트를 입는다</span>
                                    </p>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
                <!-- // THE 매거진 수정 200330 -->
                <!-- 20210319 편집샵 추가 -->
                <li><a href="/ko/ed/edMain" onclick="GA_Event('공통','GNB','편집샵');" class="">편집샵</a></li>
                <!-- 20200710 룩북 추가 -->
                <li><a href="/ko/ou/outletMain" onclick="GA_Event('공통','GNB','아울렛');" class="">아울렛*</a></li>
            </ul>
        </div>
        <!-- 첫번째 c:if -->


        <div id="transparent_mask"></div>
        <!-- 201803 util menu -->
        <div class="util_menu util_menu1803">
            <ul class="clearfix">
                <li><a href="javascript:void(0);"><span class="ico_sh">search</span></a></li>
                <li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','유틸_메뉴','위시리스트');"><span class="ico wishlist">wish list</span> <span class="count">(<span id="wishlistCount">0</span>)</span></a></li>
                <li><a href="/ko/shoppingbag" onclick="GA_Event('공통','유틸_메뉴','쇼핑백');"><span class="ico cart">장바구니</span> <span class="count">(<span id="cartCount">0</span>)</span></a></li>
            </ul>
        </div>
    </div>
        <!-- //201803 util menu -->
    </div>
</div>
<!-- //headerWrap -->

<script type="text/javascript">
    var newItemsSlider = "";
    var bestItemsSlider = "";
    var newProductCategory = "";
    var bestProductCategory = "";
    var checkInstagramInfo = false;
    var allLinkTemp = [];
    var allUrlTemp = [];
    var allCaptionTemp = [];
    var allIndex = 0;
    var accountCount = 0;
    var horiz = $(".horiz_topbanner").length;

    var rate_en = "";
    var symbol_en = "";
    var rate_zh = "";
    var symbol_zh = "";

    $(document).ready(function(){
        var todayDate = new Date();

        //추석 공지 팝업(2022)
        if(getCookie('chuseokPopup2022') != todayDate.getDate()) {
            var startChuseok = new Date('2022/09/02 14:00:00'), endChuseok = new Date('2022/09/11 23:59:59');
            if (todayDate.getTime() >= startChuseok.getTime() && todayDate.getTime() <= endChuseok.getTime()) {
                layerPopup11('open');
            }
        }

        if(getCookie('newYearPopup2022') != todayDate.getDate()) {
            var startNewYear = new Date('2022/01/25 21:00:00'), endNewYear = new Date('2022/02/01 23:59:59');
            if (todayDate.getTime() >= startNewYear.getTime() && todayDate.getTime() <= endNewYear.getTime()) {
                layerPopup9('open');
            }
        }

        if(getCookie('HSlayerPopup3') != todayDate.getDate()) { // 추석
            var startDate1 = new Date('2020/09/26 12:00:00'), endDate1 = new Date('2020/10/03 23:59:59');
            if (todayDate.getTime() >= startDate1.getTime() && todayDate.getTime() <= endDate1.getTime()) {
                layerPopup6('open');
            }
        }
        if(getCookie('newYearPopup') != todayDate.getDate()) { //설날
            var startNewYear = new Date('2020/01/20 00:00:00'), endNewYear = new Date('2020/01/28 00:00:00');
            if (todayDate.getTime() >= startNewYear.getTime() && todayDate.getTime() < endNewYear.getTime()) {
                layerPopup7('open'); //설날
            }
        }

        //설날 공지 팝업(2021)
        if(getCookie('newYearPopup2021') != todayDate.getDate()) {
            var startNewYear = new Date('2021/02/03 11:59:59'), endNewYear = new Date('2021/02/14 23:59:59');
            if (todayDate.getTime() >= startNewYear.getTime() && todayDate.getTime() <= endNewYear.getTime()) {
                layerPopup9('open');
            }
        }

        //추석 공지 팝업(2021)
        if(getCookie('chuseokPopup2021') != todayDate.getDate()) {
            var startChuseok = new Date('2021/09/15 16:00:00'), endChuseok = new Date('2021/09/21 23:59:59');
            if (todayDate.getTime() >= startChuseok.getTime() && todayDate.getTime() <= endChuseok.getTime()) {
                layerPopup11('open');
            }
        }

        //통합 멤버십 약관 제정 안내 팝업(2021/03/01~2021/03/07)
        if(getCookie('membershipInfoMain') == "") {
            var startMemberInfoMain = new Date('2021/03/01 00:00:00'), endMemberInfoMain = new Date('2021/03/07 23:59:59');
            //유효기간 validation
            if (todayDate.getTime() >= startMemberInfoMain.getTime() && todayDate.getTime() <= endMemberInfoMain.getTime()) {
                //팝업 호출
                layerPopup10('open');
            }
        }
        if(horiz > 0) {
            $("#mainNoticeWrap").css("top","230px");
            $(".popWrap1901").css("top", "78px");
        }

        mainSlider1903();
        edtSlider1903();
        videoPlay1903();

        $.ajax({
            type: "get",
            url : "/ko/intro/mainCategoryList",
            async : true,
            contentType : "application/json",
            error : function( request, status, error ){
                console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            },
            success : function( result ) {
                if(result.length > 0) {
                    var newHtml = "";
                    var bestHtml = "";
                    var newCount = 0;
                    var bestCount = 0;
                    var isoCode = "ko";
                    var categoryName = "";

                    for(var i=0; i < result.length; i++) {
                        if(isoCode == "ko") {
                            categoryName = result[i].categoryName;
                        } else if(isoCode == "en") {
                            categoryName = result[i].categoryNameEN;
                        } else if(isoCode == "zh") {
                            categoryName = result[i].categoryNameZH;
                        }

                        if(result[i].displayTypeYn == true) {
                            if(result[i].displayType == true) {
                                if(newCount == 0) {
                                    newProductCategory = result[i].categoryCode;
                                    newHtml += '<li class="on">';
                                } else {
                                    newHtml += '<li>';
                                }

                                newHtml += '	<a href="javascript:getNewProductList(\''+result[i].categoryCode+'\')" onclick="GA_Event(\'메인\', \'신상품\', \''+categoryName+'\');">'+categoryName+'</a>';
                                newHtml += '</li>';
                                newCount++;
                            } else if(result[i].displayType == false) {
                                if(bestCount == 0) {
                                    bestProductCategory = result[i].categoryCode;
                                    bestHtml += '<li class="on">';
                                } else {
                                    bestHtml += '<li>';
                                }

                                bestHtml += '	<a href="javascript:getBestProductList(\''+result[i].categoryCode+'\')" onclick="GA_Event(\'메인\', \'베스트\', \''+categoryName+'\');">'+categoryName+'</a>';
                                bestHtml += '</li>';
                                bestCount++;
                            }
                        }
                    }
                    $(".nbe_cnt.new .product_left_menu > ul").html(newHtml);
                    tabNew();
                    getNewProductList(newProductCategory);
                    $(".nbe_cnt.best .product_left_menu > ul").html(bestHtml);
                    tabBest();
                    getBestProductList(bestProductCategory);
                }
            }
        });

        getMagazineList();

        var getUrlParameter = function getUrlParameter(sParam) {//URL에 포함된 파라미터 이용하기
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;
            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');
                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };
        //layerPopup front test (노출 기한 상관 없이 pk 이용하여 메인에서 팝업 보기)
        var pop1 = getUrlParameter('pop1');
        if (typeof pop1 == "undefined") pop1 = "N";

        $.ajax({
            type: "get",
            url : "/ko/svcenter/mainNotice",
            cache : false,
            data: {"pop1":pop1},
            async : true,
            contentType : "application/json",
            error : function( request, status, error ){
                console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            },
            success : function( result ) {
                var todayDate = new Date();
                var switchMain = "";
                if(result.length > 0) switchMain = result[0].readCount;
                if("N" != switchMain){//switchMain = "N" 이면 메인팝업 기존방식(하드코딩)으로 돌리기
                    if(result.length > 0) {
                        var documentResult="";
                        var isocode = "ko";
                        for(var i = 0 ; i < result.length ; i ++ ){
                            var showYn = "N";
                            if(getCookie(result[i].pk+isocode) != todayDate.getDate()) showYn = "Y"; // 오늘은 그만보기
                            if(pop1 != "N") showYn = "Y"; //팝업 미리보기
                            if(showYn == "Y") {
                                if(null != result[i].bgImage && "" != result[i].bgImage.trim()) {
                                    documentResult += "<div class='popwrap_renewal1910 txtonimg add1' id='"+result[i].pk+isocode+"'>";
                                    documentResult += "<img src='"+result[i].bgImage+"' alt='' class='pop_backimg'>";
                                } else {
                                    documentResult += "<div class='popwrap_renewal1910' id='"+result[i].pk+isocode+"'>";
                                }
                                documentResult += "    <div class='pop_cnt'>";
                                if(null != result[i].noticeContentsYN && result[i].noticeContentsYN) {//단순 텍스트 출력 시 title 노출, html 포함 출력 시 title 비노출(html 코드에 title 포함)
                                    if(null != result[i].noticeTitle && "" != result[i].noticeTitle.trim()) {
                                        var noticeTitle = result[i].noticeTitle;
                                        var replacedTitle = noticeTitle.replace(/(?:\r\n|\r|\n)/g, '<br>');
                                        documentResult += '<h3 class="pop_tlt">'+replacedTitle+'</h3>';
                                    }
                                }
                                if(null != result[i].noticeContents && "" != result[i].noticeContents.trim()){
                                    if(result[i].noticeContentsYN) {
                                        documentResult += "        <p class='pop_txt'>";
                                    } else {//html 코드 출력
                                        documentResult += "        <p class='pop_txt' style='min-height: 0; padding: 25px 0 0 0;'>";
                                    }
                                    var noticeContents = result[i].noticeContents;
                                    var replacedContents = noticeContents.replace(/(?:\r\n|\r|\n)/g, '<br>');
                                    documentResult +=                replacedContents;
                                    documentResult += "        </p>";
                                }
                                if(null != result[i].bannerLink && "" != result[i].bannerLink.trim()){
                                    documentResult += "        <div class='linkbox'>";
                                    documentResult += "            <a href='"+result[i].bannerLink+"'>";
                                    if(null != result[i].bannerLinkText && "" != result[i].bannerLinkText.trim()) documentResult += result[i].bannerLinkText;
                                    documentResult += "            </a>";
                                    documentResult += "        </div>";
                                }
                                documentResult += "    </div>";
                                documentResult += "    <div class='btnwrap'>";
                                documentResult += "        <input type='button' class='btn stoptoday closeLayerPopup' value=\"오늘은 그만보기 \">";
                                documentResult += "        <input type='button' class='btn close closeLayerPopup' value=\"닫기\">";
                                documentResult += "    </div>";
                                documentResult += "    <a href='#' class='btn_close closeLayerPopup'><img src='/_ui/desktop/common/images/popup/ico_close.png' alt=\"닫기\"></a>";
                                documentResult += "</div>";
                            }
                        }
                        $("#mainNoticeWrap").html(documentResult);

                        $(".closeLayerPopup").on("click", function(){
                            if($(this).hasClass("stoptoday")){//오늘은 그만보기
                                var todayDate = new Date();
                                var cookieId = $(this).parents(".popwrap_renewal1910").attr("id");
                                setCookie(cookieId, todayDate.getDate(),1);
                            }
                            $(this).parents(".popwrap_renewal1910").css("display","none");
                        });

                    }
                } else {
                    // 한섬마일리지 조회/사용불가
                    if(getCookie('HSlayerPopup3') != todayDate.getDate()) {
                        var startDate1 = new Date('2018/12/28 16:00:00'), endDate1 = new Date('2019/02/31 00:00:00');
                        if (todayDate.getTime() >= startDate1.getTime() && todayDate.getTime() <= endDate1.getTime()) {
                            //layerPopup6('open');
                        }
                    }
                }
            }
        });

        $(".closeLayerPopup").on("click", function(){
            if($(this).hasClass("stoptoday")){//오늘은 그만보기
                var todayDate = new Date();
                var cookieId = $(this).parents(".popwrap_renewal1910").attr("id");
                setCookie(cookieId, todayDate.getDate(),1);
            }
            $(this).parents(".popwrap_renewal1910").css("display","none");
        });

        //추천 상품 호출
        getProductInfo("RECOMMEND");
        //비로그인 상태에서 메인페이지 진입시 쿠키 삭제

        deletecookiePath("UID", "/");
        deletecookiePath("criteoEmail", "/");
        deletecookiePath("memberGb", "/");


        var todayDate = new Date();

        //전환된 회원일 경우 처리


        //전환가입유도 팝업


        //자동로그인 팝업

        var ssoUrl = "https://sso.h-point.co.kr:29865" + "/co/setSsoReqJSONP.hd";
        gfnSsoReqAjax(ssoUrl, ssoTokenSuc);


        //인스타그램 생성 --START-- 중국어 인스타 그램 제외

        $.ajax({
            type: "get",
            url : "/ko/magazine/getAllInstargram"+"?type=search",
            cache : false,
            dataType : "json",
            async : true,
            contentType : "application/json",
            error : function( request, status, error ){
                console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            },
            success : function( result ){
                if(result.length > 0){
                    //정보 보여주기
                    var allHtml = [];
                    var account = "", logoImg = "";
                    var html = "";
                    accountCount = result.length;

                    for(var i=0; i < result.length; i++){
                        account = result[i].account;
                        logoImg = result[i].accountLogoImage;

                        allHtml = JSON.parse(result[i].html).data;
                        allHtml.sort(function (a,b) {
                            return a.created_time > b.created_time ? -1 : a.created_time < b.created_time ? 1 : 0;
                        });

                        $.each(allHtml, function(j, v){
                            if(j == 0){
                                if(v.user.username != "fourm_official" && v.user.username != "youarehandsome"){
                                    html += '<li class="swiper-slide">';
                                    html += '    <a href="' + '/ko/magazine/instagram"' + ' onclick="GA_main(\'moment\',$(this))">';
                                    html += '       <img src="' + v.images.low_resolution.url + '" class="respon_image" onerror="this.src=\'http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg\'" />';
                                    html += '		<div class="insta_account1903">';
                                    html += '			<div class="account">';
                                    html += '				<div class="img_wrap">';
                                    if(account == v.user.username) {
                                        html += '					<img src="'+logoImg+'/dims/resize/50x50" alt="brandimg">';
                                    }
                                    html += '				</div>';
                                    html += '				<p>@'+v.user.username+'</p>';
                                    html += '			</div>';
                                    html += '		</div>';
                                    html += '		<div class="insta_pic_info"></div>';
                                    html += '		<div class="insta_pic_info_txt">';
                                    if(v.caption != null){
                                        html += '			<p class="title">' + v.caption.text.normalize('NFC') + '</p>';
                                    }else{
                                        html += '          <p class="title"></p>';
                                    }
                                    html += '		</div>';
                                    html += '	</a>';
                                    html += '	<div class="insta_cover_dim"></div>';
                                    html += '</li>';
                                }
                            }
                        });
                    }
                }

                $('#instaContents > ul').html(html);

                instagramSlider1903();
                instaImgHover();
            }
        });

        //인스타그램 생성 --END--

        //룰렛 이벤트

        var uid = "anonymous";
        var chkUid = ["test1", "test2", "test3", "test4", "test5", "dlwnsdnjs7@yopmail.com",
            "test6","test7","test8","test10", "dlwnsdnjs70@yopmail.com"];
        var todayRouletteDate = new Date();
        //evt_roulette
        if(getCookie('rouletteEventPopup') != todayRouletteDate.getDate()) {
            var rouletteStartDate = new Date('2019/10/07 00:00:00'), rouletteEndDate = new Date('2019/11/01 00:00:00');
            //이벤트 기간
            if(todayRouletteDate.getTime() >= rouletteStartDate.getTime() && todayRouletteDate.getTime() < rouletteEndDate.getTime()){
                //통합회원 일때
                if("" == "MEMBER_UNION" || chkUid.indexOf(uid) > -1){
                    $.ajax({
                        type:"GET",
                        url:"/ko/magazine/event/checkUser",
                        data: {pk:'8799828694912'},
                        success:function(data){

                            if(data=="SUCCESS"){
                                var innerHtml = "";

                                innerHtml += "<div class=\"popWrap1901\" id=\"popRouletteEvt\" style=\"position:absolute;top:78px;right:10px;z-index:20;\">";
                                innerHtml += "	<div class=\"popwrap main_banner position1\" style=\"position:relative;\">";
                                innerHtml += "		<div class=\"pop_cnt\" style=\"position:relative;\">";
                                innerHtml += "			<img usemap=\"#main_popup\" src=\"http://cdn.thehandsome.com/pc/event/detail/image/190923_event/evt_190917_mainpop.jpg\" alt=\"\"> ";
                                innerHtml += "			<a href=\"javascript:goRouletteEvent();\" style=\"display:block;overflow:hidden;text-indent:-999em;position:absolute;left:50%;transform:translate3d(-50%,0,0);bottom:40px;width:212px;height:47px;\">지금응모하기</a> ";
                                innerHtml += "		</div> ";
                                innerHtml += "		<div class=\"chkbox_cls\" style=\"background:#363636;\"> ";
                                innerHtml += "			<input type=\"checkbox\" id=\"cls\" onclick=\"rouletteEvtPopClose(\'day_close\')\"><label for=\"cls\">오늘 하루 보지 않기</label> ";
                                innerHtml += "		</div> ";
                                innerHtml += "		<a href=\"#\" class=\"btn_close\" onclick=\"rouletteEvtPopClose(\'close\')\">닫기</a> ";
                                innerHtml += "	</div>";
                                innerHtml += "</div> ";

                                $("#bodyWrap").prepend(innerHtml);

                            }
                        }
                    });
                }

            }
        }

        var jeventStartDate = new Date('2019/11/01 00:00:00'), jeventEndDate = new Date('2019/12/31 00:00:00');

        if(location.href.indexOf("www.thehandsome.com") > -1){
            jeventStartDate = new Date('2019/12/01 00:00:00')
        }
        //이벤트 기간
        if(todayDate.getTime() >= jeventStartDate.getTime() && todayDate.getTime() < jeventEndDate.getTime()){
            //통합회원 일때
            if("" == "MEMBER_UNION" || "" == "MEMBER_TRANS"  || chkUid.indexOf(uid) > -1){
                $.ajax({
                    type:"GET",
                    url:"/ko/magazine/event/checkEventPopJoinUser",
                    success:function(data){
                        if(data == "SUCCESS"){

                            var innerHtml = "";

                            innerHtml += "<div class=\"layerArea191029\" style=\"display:block;outline:none;\" id=\"joinEventPopup\">";
                            innerHtml += "  <div class=\"layerBg\" style=\"display:block;width:100%;height:100%;position:fixed;top:0;left:0;background:rgba(0,0,0,0.5);z-index:999;\"></div>";
                            innerHtml += "      <div class=\"popwrap notipop_20191127\" style=\"display:block;\">                                                     ";
                            innerHtml += "          <div class=\"inner_notipop_20191127\">                                                                          ";
                            innerHtml += "              <img src=\"http://cdn.thehandsome.com/pc/event/detail/image/pc_evt_191127_pop.jpg\" alt=\"쿠폰함 바로가기\">  ";
                            innerHtml += "              <a href=\"/ko/mypage/voucher\" class=\"go_coupon_page_191127\">쿠폰함 바로가기</a> ";
                            innerHtml += "          </div>                                                                                                        ";
                            innerHtml += "          <a href=\"javascript:popClose1911();\" class=\"btn_close\" >닫기</a>                                                       ";
                            innerHtml += "      </div>                                                                                                            ";
                            innerHtml += "  </div>";
                            innerHtml += "</div> ";

                            $("#bodyWrap").prepend(innerHtml);

                        }
                    }
                });
            }
        }


        var eventStartDate = new Date('2019/10/29 00:00:00'), eventEndDate = new Date('2019/12/01 00:00:00');

        if(location.href.indexOf("www.thehandsome.com") > -1){
            eventStartDate = new Date('2019/11/01 13:00:00')
        }
        //이벤트 기간
        if(todayDate.getTime() >= eventStartDate.getTime() && todayDate.getTime() < eventEndDate.getTime()){
            //통합회원 일때
            if("" == "MEMBER_UNION" || chkUid.indexOf(uid) > -1){
                $.ajax({
                    type:"GET",
                    url:"/ko/magazine/event/checkEventPopUser",
                    data: {pk:'8799959734144'},
                    success:function(data){
                        if(data=="SUCCESS"){
                            var innerHtml = "";

                            innerHtml += "<div class=\"layerArea191029\" style=\"display:block;outline:none;\" id=\"playHandsomeStyle\">";
                            innerHtml += "	<div class=\"layerBg\" style=\"display:block;width:100%;height:100%;position:fixed;top:0;left:0;background:rgba(0,0,0,0.5);z-index:999;\"></div>";
                            innerHtml += "		<div class=\"locky_popup_1910\" style=\"position:fixed;top:50%;left:50%;transform:translate3d(-50%, -50%, 0);z-index:1000;\">";
                            innerHtml += "			<div class=\"pop_inner\" style=\"position:relative;\"> ";
                            innerHtml += "			<img src=\"http://cdn.thehandsome.com/pc/event/detail/image/191028_event/guide_popup.jpg\" alt=\"guide_popup\" style=\"display:block;\">";
                            innerHtml += "			<a href=\"javascript:goHandsomeStyleEvent();\" style=\"display:block;width:304px;height:63px;position:absolute;bottom:32px;left:50%;transform:translate3d(-50%, 0, 0);overflow:hidden;text-indent:-999em;\">지금 응모하기</a> ";
                            innerHtml += "			<a href=\"javascript:popClose1904();\" class=\"pop_close\" style=\"display:block;width:50px;height:50px;position:absolute;top:15px;right:15px;overflow:hidden;text-indent:-9999em;\">닫기</a>";
                            innerHtml += "			</div>";
                            innerHtml += "		</div> ";
                            innerHtml += "	</div>";
                            innerHtml += "</div> ";

                            $("#bodyWrap").prepend(innerHtml);

                        }
                    }
                });
            }
        }


        for(var i=0; i < $("#edtSlider1903_0 > ul > li .price").length ; i++) {
            var exPrice = $("#edtSlider1903_0 > ul > li .price").eq(i).html();
            $("#edtSlider1903_0 > ul > li .price").eq(i).html(getExchangePrice(exPrice));
        }

        for(var i=0; i < $("#edtSlider1903_1 > ul > li .price").length ; i++) {
            var exPrice = $("#edtSlider1903_1 > ul > li .price").eq(i).html();
            $("#edtSlider1903_1 > ul > li .price").eq(i).html(getExchangePrice(exPrice));
        }

        // 마케팅 수신 동의 팝업


        //8월 올빼미 이벤트 팝업
        //올빼미 테스트
        var strArray = location.search.split('&');
        var testDate = "";

        /* $.each(strArray, function (index, item){
        		if(item.indexOf('testDate') != -1) {
        			var strSubArray = item.split('=');
        			testDate = strSubArray[1];
        		}
        	});

        	if (testDate !== "") {
        		if(parseInt(testDate) >= 20200807200000 && parseInt(testDate) <= 20200807235959 && getCookie('nightEvtFriPopup') != todayDate.getDate()) {
        			layerPopup8('open', 'fri');
        		}
        		if(parseInt(testDate) >= 20200808200000 && parseInt(testDate) <= 20200808235959 && getCookie('nightEvtSatPopup') != todayDate.getDate()) {
        			layerPopup8('open', 'sat');
        		}
        		if(parseInt(testDate) >= 20200809200000 && parseInt(testDate) <= 20200809235959 && getCookie('nightEvtSunPopup') != todayDate.getDate()) {
        			layerPopup8('open', 'sun');
        		}
        	} else {
            	if(false && getCookie('nightEvtFriPopup') != todayDate.getDate()) {
            		layerPopup8('open', 'fri');
            	}
            	if(false && getCookie('nightEvtSatPopup') != todayDate.getDate()) {
            		layerPopup8('open', 'sat');
            	}
            	if(false && getCookie('nightEvtSunPopup') != todayDate.getDate()) {
            		layerPopup8('open', 'sun');
            	}
        	} */

    });



    function getNewProductList(categoryCode) {
        $.ajax({
            type: "get",
            url : "/ko/intro/mainNewProductList"+"?categoryCode="+categoryCode,
            dataType : "json",
            async : true,
            contentType : "application/json",
            error : function( request, status, error ){
                console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            },
            success : function( result ) {
                var html = "";
                if(result.length > 0) {
                    window.sessionStorage.setItem('main_new_ecommerceDataList', JSON.stringify(result));
                    html += '<div class="nbe_cnt_inner swiper-container" id="newListSlider">';
                    html += '	<ul class="items_list swiper-wrapper">';
                    for(var i=0; i < result.length; i++) {
                        html += '		<li class="swiper-slide">';
                        html += '			<div class="item_box">';
                        html += '				<a href="/ko/p/'+result[i].productCode+'" class="item_info1" onclick="javascript:GA_main(\'newImg\',$(this));setEcommerceData('+ i +', \'NEW\', \''+categoryCode+'\');">';
                        html += '					<span class="item_img">';
                        html += '						<img src="'+result[i].T01imageUrl+'/dims/resize/234x353" alt="" name="'+result[i].productName+'" class="respon_image">';
                        html += '					</span>';
                        html += '				</a>';
                        html += '				<a href="/ko/p/'+result[i].productCode+'" class="item_info2" onclick="javascript:GA_main(\'new\',$(this));setEcommerceData('+ i +', \'NEW\', \''+categoryCode+'\');">';
                        html += '					<span class="brand">'+result[i].brandName+'</span>';
                        html += '					<span class="price">'+ getExchangePrice(result[i].price) +'</span>';
                        html += '				</a>';
                        html += '			</div>';
                        html += '		</li>';
                    }
                    html += '	</ul>';
                    html += '<div class="swiper-button-next"></div>';
                    html += '<div class="swiper-button-prev"></div>';
                    html += '</div>';
                    $(".product_list1903 .nbe_cnt.new .nbe_cnt_inner_wrap").html(html);
                    newProductListSlider1903();
                } else {
                    $(".product_list1903 .nbe_cnt.new .nbe_cnt_inner_wrap").html(html);
                }
            }
        });
    }

    function getBestProductList(categoryCode) {
        $.ajax({
            type: "get",
            url : "/ko/intro/mainBestProductList"+"?categoryCode="+categoryCode,
            dataType : "json",
            async : true,
            contentType : "application/json",
            error : function( request, status, error ){
                console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            },
            success : function( result ) {
                var html = "";
                if(result.length > 0) {
                    window.sessionStorage.setItem('main_best_ecommerceDataList', JSON.stringify(result));
                    html += '<div class="nbe_cnt_inner swiper-container" id="bestListSlider">';
                    html += '	<ul class="items_list swiper-wrapper">';
                    for(var i=0; i < result.length; i++) {
                        html += '		<li class="swiper-slide">';
                        html += '			<div class="item_box">';
                        html += '				<a href="/ko/p/'+result[i].productCode+'" class="item_info1" onclick="javascript:setEcommerceData('+ i +', \'BEST\', \''+categoryCode+'\');">';
                        html += '					<span class="item_img">';
                        html += '						<img src="'+result[i].T01imageUrl+'/dims/resize/234x353" alt="" name="'+result[i].productName+'" class="respon_image" onclick="GA_main(\'bestImg\',$(this))">';
                        html += '					</span>';
                        html += '				</a>';
                        html += '				<a href="/ko/p/'+result[i].productCode+'" class="item_info2" onclick="javascript:GA_main(\'best\',$(this));setEcommerceData('+ i +', \'BEST\', \''+categoryCode+'\');">';
                        html += '					<span class="brand">'+result[i].brandName+'</span>';
                        html += '					<span class="price">'+ getExchangePrice(result[i].price) +'</span>';
                        html += '				</a>';
                        html += '			</div>';
                        html += '		</li>';
                    }
                    html += '	</ul>';
                    html += '<div class="swiper-button-next"></div>';
                    html += '<div class="swiper-button-prev"></div>';
                    html += '</div>';
                    $(".product_list1903 .nbe_cnt.best .nbe_cnt_inner_wrap").html(html);
                    bestProductListSlider1903();
                }else {
                    $(".product_list1903 .nbe_cnt.best .nbe_cnt_inner_wrap").html(html);
                }
            }
        });
    }

    function getMagazineList() {
        $.ajax({
            type: "get",
            url : "/ko/intro/mainMagazine",
            cache : false,
            dataType : "json",
            async : true,
            contentType : "application/json",
            error : function( request, status, error ){
                console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            },
            success : function( result ) {
                var categoryText = "";
                var url = "";
                var html = "";
                if(result.length > 0) {
                    for(var i=0; i < result.length; i++) {
                        if(result[i].category == "뉴스") {
                            categoryText = "뉴스";
                        } else if(result[i].category == "SPOTLIGHT_ON") {
                            categoryText = "위클리 픽";
                        } else if(result[i].category == "HANDSOME_PEOPLE") {
                            categoryText = "핸썸피플";
                        } else if(result[i].category == "TREND_TO_KNOW") {
                            categoryText = "셀렉션";
                        } else if(result[i].category == "HOW_TO_STYLE") {
                            categoryText = "커버스토리";
                        } else if(result[i].category == "EDITORS_PICK") {
                            categoryText = "스타일 가이드";
                        } else if(result[i].category == "PLAY_PLAY") {
                            categoryText = "플레이";
                        } else if(result[i].category == "SHARP_SOME") {
                            categoryText = "#SOME";
                        }

                        html += '<li class="swiper-slide">';
                        if(result[i].category == "뉴스") {
                            html += '	<a href="/ko/magazine/newsDetail'+result[i].template+'?newsCode='+result[i].pk+'" class="img_wrap" onclick="GA_main(\''+i+'theMagazine\',$(this));">';
                        } else {
                            html += '	<a href="/ko/magazine/editorials/'+result[i].pk+'" class="img_wrap" onclick="GA_main(\''+i+'theMagazine\',$(this));">';
                        }
                        if(result[i].imageUrl.indexOf(".mp4") > -1){
                            html += '          <video autoplay muted playsinline loop preload="auto" style="width:100%; max-height:352px; auto;outline:none;" poster="">';
                            html += '          <source src="'+result[i].imageUrl+'" type="video/mp4">';
                            html += '          </video>';
                        }else{
                            html += '       <img src="'+result[i].imageUrl+'/dims/resize/348x352" alt="매거진이미지">';
                        }


                        html += '	</a>';
                        html += '	<div class="txt_wrap">';
                        html += '		<p class="magazine_tit">'+categoryText+'</p>';
                        html += '		<p class="tit">'+result[i].desktopTitle+'</p>';
                        html += '		<p class="s_t">'+result[i].desktopSubTitle+'</p>';
                        if(result[i].category == "뉴스") {
                            html += '		<a href="/ko/magazine/newsDetail'+result[i].template+'?newsCode='+result[i].pk+'" class="detail" onclick="GA_main(\''+i+'theMagazine\',$(this));">자세히 보기</a>';
                        } else {
                            html += '		<a href="/ko/magazine/editorials/'+result[i].pk+'" class="detail" onclick="GA_main(\''+i+'theMagazine\',$(this));">자세히 보기</a>';
                        }
                        html += '	</div>';
                        html += '</li>';
                        html += '';
                    }
                    $(".the_magazine_wrap1903 .magazine_slider1903 > ul").html(html);
                    magazinSlider1903();
                }
            }
        });
    }

    // 상단 띠 배너 닫기
    function popClose03() {
        $('.horiz_topbanner, .horiz_topbanner_inner').slideUp();
        if(horiz > 0) {
            $("#mainNoticeWrap").css("top","150px");
        }
    };

    // RECOMMEND 호출 ajax
    function getProductInfo(productOrderCode){

        var categorySize = 0;
        var categoryList = "";

        $.ajax({
            type: "get",
            url : "/ko/intro/newRecommend",
            cache : false,
            dataType : "json",
            contentType : "application/json",
            error : function( request, status, error ){
                console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            },
            success : function( result ){
                //추천상풍 리스트

                var html = "";
                if(result.length > 0){
                    window.sessionStorage.setItem('main_recommend_ecommerceDataList', JSON.stringify(result));
                }
                for(var i = 0; i < result.length; i++) {
                    var image = result[i].imageUrl;
                    if(image.indexOf("_T01") > -1){
                        image = image.replace("_T01","_S01");
                    }

                    html +="<li>";
//                         html +="    <a href=\"javascript:goDetailPagebyRecommend('" + result[i].baseProductCode + "','" + result[i].clicklogRedirectLink + "')\" onclick=\"GA_main('recommend',$(this))\"> \n";
//                         html += '	<a href="/ko/p/'+result[i].productCode+'" class="item_info1" onclick="javascript:GA_main(\'recommend\',$(this));setEcommerceData('+ i +', \'RECOMMEND\', \'\');">';
                    html += '   <a href="javascript:goDetailPagebyRecommend(\'' + result[i].baseProductCode + '\',\'' + result[i].clicklogRedirectLink + '\')" class="item_info1" onclick="javascript:GA_main(\'recommend\',$(this));setEcommerceData('+ i +', \'RECOMMEND\', \'\');">';
                    html +="        <img src=\""+ image +"/dims/resize/289x289\"/> \n";
                    html +="    </a>";
                    html +="    <span class=\"item_info2\">";
                    html += "            <span class=\"brand "+ result[i].brandCode +"\">"+ result[i].brandName +"</span> \n";
                    html += "            <span class=\"title\">"+ result[i].productName +"</span> \n";
                    if(result[i].price === 0) {
                        html += "        <span class=\"price\"></span> \n";
                    } else {
                        html += "        <span class=\"price\">"+ getExchangePrice(result[i].price) +"</span> \n";
                    }
                    html +="    </span> \n";
                    html +="    <span class=\"flag\"></span> \n";
                    html +="</li>";
                }

                if(result.length == 0){
                    $(".pickfor_wrap1903").hide();
                }
                $("#pickForSlider1903 ul").html(html);
                pickForSlider1903();
            }
        });
    }

    //전환가입
    function hpoinJoin(){
        var url = "/ko/hpoint/transInfo";

        $.ajax({
            type:"GET",
            url:url,
            success:function(data){
                var hdUrl = data.hpUrl + "/cu/join/start.nhd";
                $("#prtnrId").val(data.pt1002.prtnrId);
                $("#chnnlId").val(data.pt1002.chnnlId);
                $("#custNm").val(data.pt1002.custNm);
                $("#birthDt").val(data.pt1002.birthDt);
                $("#mophNo").val(data.pt1002.mophNo);
                $("#chId").val(data.pt1002.chId);
                $("#custUniqKey").val(data.pt1002.custUniqKey);
                $("#email").val(data.pt1002.email);
                $("#sexGbCd").val(data.pt1002.sexGbCd);

                window.open(hdUrl,"transMember");

                document.getElementById("ptcoReqnMdaInf").value = "pc";
                $("#userHiddenForm").attr("action", hdUrl);
                $("#userHiddenForm").submit();
                $("#hpMemberLayer").hide();
            },
            error:function(e){
            }
        });
    }

    function ssoTokenSuc(data){
        if (data.succYn == "Y") {
            $.ajax({
                type:"GET",
                url:"/ko/hpoint/simpleJoinMember",
                data: {"mcustNo":data.mcustNo},
                success:function(data){
                    if(data.resultCode == "C"){
                        $("#ssoMcustNo").val(data.mcustNo);
                        layerPopup4('open');
                    }
                },
                error:function(e){
                }
            });
        }
    }

    //간편회원가입 전송
    function simpJoin(){
        var hdUrl = "https://www.h-point.co.kr/cu/join/simpJoinStart.nhd";
        window.open(hdUrl,"simpStart_window");

        document.getElementById("ptcoReqnMdaInf").value = "pc";
        $("#simpJoinForm").attr("action", hdUrl);
        $("#simpJoinForm").submit();
        $("#simpJoinLayer").hide();
    }

    //전환가입 유도 팝업
    function layerPopup3(division) {
        if(division == "open") {
            $("#hpMemberLayer").show();
        } else if(division == "close") {
            if($('#memPop').is(":checked")) {
                setCookie("memberTransPopup", 'Y', 90);
            }else{
                setCookie("memberTransPopup", 'N', 0);
            }
            $("#hpMemberLayer").hide();
        } else if(division == "oneweek") {
            if($('#oweek').is(":checked")) {
                setCookie("memberTransPopup", 'Y', 7);
            }else{
                setCookie("memberTransPopup", 'N', 0);
            }
            $("#hpMemberLayer").hide();
        }
    }
    //간편가입팝업
    function layerPopup4(division) {
        if(division == "open") {
            $("#simpJoinLayer").show();
        } else {
            $("#simpJoinLayer").hide();
        }
    }

    function layerPopup6(division) {
        var documentResult = "";

        if(division == "open") {

//                     documentResult += '<div class="popWrap1901" style="position:fixed;top:90px;right:20px;z-index:3;">                                     ';
// 	                documentResult += '    <div class="popwrap main_banner position1" style="position:relative;">                                          ';
// 	                documentResult += '        <div class="pop_cnt">                                                                                       ';
// 	                documentResult += '            <img usemap="#main_popup" src="http://cdn.thehandsome.com/pc/notice/pc_delivnoti_ko_190906.jpg" alt=""> ';
// 	                documentResult += '            <div class="chkbox_cls">                                                                                ';
// 	                documentResult += '                <input type="checkbox" id="popPos3" name="popPos3" onclick="layerPopup6(\'close\');" > <label for="popPos3">오늘 하루 열지 않음</label>               ';
// 	                documentResult += '            </div>                                                                                                  ';
// 	                documentResult += '        </div>                                                                                                      ';
// 	                documentResult += '        <a href="#" class="btn_close" onclick="layerPopup6(\'close\');">닫기</a>                                           ';
// 	                documentResult += '    </div>                                                                                                          ';
// 	                documentResult += '</div>                                                                                                              ';

            documentResult += '<div class="popWrap1901" style="position:fixed;top:-22px;right:10px;z-index:20;">                                           ';
            documentResult += '    <div class="popwrap main_banner position1" style="position:relative;">                                             ';
            documentResult += '        <div class="pop_cnt" style="position:relative;">                                                               ';
            documentResult += '            <img src="http://cdn.thehandsome.com/pc/notice/pc_delivnoti_ko_200922.jpg" alt="">                         ';
            documentResult += '            <a href="/ko/svcenter/notice" style="display:block;overflow:hidden;text-indent:-999em;position:absolute;left:50%;transform:translate3d(-50%,0,0);bottom:5%;width:140px;height:35px;">자세히보기</a>';
            documentResult += '        </div>                                                                                                         ';
            documentResult += '        <div class="chkbox_cls" style="background:#363636;">                                                           ';
            documentResult += '            <input type="checkbox" id="popPos3" name="popPos3" onclick="layerPopup6(\'close\');"> <label for="popPos3">1일 동안 열지 않음</label>            ';
            documentResult += '        </div>                                                                                                         ';
            documentResult += '        <a href="#" class="btn_close" onclick="layerPopup6(\'close\');"">닫기</a>                                              ';
            documentResult += '    </div>                                                                                                             ';
            documentResult += '</div>                                                                                                                 ';

            $("#mainPopwrap1").html(documentResult);

        } else if(division == "close") {

            if($('#popPos3').is(":checked")) {
                var todayDate = new Date();
                setCookie("HSlayerPopup3",todayDate.getDate(),1);
            }
            $("#mainPopwrap1").data('scroll',$('#mainPopwrap1').scrollTop());
            $("#mainPopwrap1").hide();
        }
    }
    //설날 공지 팝업
    function layerPopup7(division) {

        var todayDate = new Date();
        var endBankCheck = new Date('2020/01/26 06:00:00');
        var documentResult = "";
        if(division == "open") {

            documentResult += '<div class="popWrap1901" style="position:fixed;top:78px;right:10px;z-index:20;"><!--수정 200117--> ';
            documentResult += '    <div class="popwrap main_banner position1" style="position:relative;">';
            documentResult += '        <div class="pop_cnt" style="position:relative;">';
            if(todayDate.getTime() < endBankCheck.getTime()){
                documentResult += '            <img src="http://cdn.thehandsome.com/pc/notice/pc_main_popup_holiday_20200122_ko.jpg" alt="2020년 명절배송안내"><!--수정 200117-->';
                documentResult += '            <a href="/ko/svcenter/notice" style="display:block;overflow:hidden;text-indent:-999em;position:absolute;left:107px;bottom:10px;width:142px;height:37px;">자세히보기</a><!--수정 200122-->';
            } else {
                documentResult += '            <img src="http://cdn.thehandsome.com/pc/notice/pc_main_popup_holiday_200116_ko.jpg" alt="2020년 명절배송안내"><!--수정 200117-->';
                documentResult += '            <a href="/ko/svcenter/notice" style="display:block;overflow:hidden;text-indent:-999em;position:absolute;left:178px;transform:translate3d(-50%,0,0);bottom:29px;width:142px;height:37px;">자세히보기</a><!--수정 200117-->';
            }
            documentResult += '        </div>';
            documentResult += '        <div class="chkbox_cls" style="background:#363636;">';
            documentResult += '            <input type="checkbox" id="popPos4" name="popPos4" onclick="layerPopup7(\'close\');"><label for="popPos4">1일 동안 열지 않음</label>                      ';
            documentResult += '        </div>';
            documentResult += '        <a href="#" class="btn_close" onclick="layerPopup7(\'close\');">닫기</a>';
            documentResult += '    </div>';
            documentResult += '</div>';


            $("#mainPopwrap1").html(documentResult);
        } else if(division == "close") {

            if($('#popPos4').is(":checked")) {
                var todayDate = new Date();
                setCookie("newYearPopup",todayDate.getDate(),1);
            }
            $("#mainPopwrap1").data('scroll',$('#mainPopwrap1').scrollTop());
            $("#mainPopwrap1").hide();
        }
    }

    //올빼미 8월 이벤트 팝업
    function layerPopup8(division, week) {

        if(division === "open") {
            var documentResult = "";

            if(week === "fri" || week === "sat" || week === "sun") {
                documentResult += '<div class="layerArea" id="nightEvtPop">';
                documentResult += '    <div class="layerBg" style="display:block;"></div>';
                documentResult += '        <div class="popwrap notipop_20190813 images-event-popup" style="display:block;">';
                documentResult += '            <div class="in-box">';
                documentResult += '                <div class="in-ab">';
                if(week === "fri") {
                    documentResult += '        <div class="event-img-zone">';
                    documentResult += '            <img src="http://cdn.thehandsome.com/mobile/event/detail/image/handsome_202008/happy_4hour_mob_popup_img_01.jpg" style="width:100%;" alt="">';
                    documentResult += '        </div>';
                    documentResult += '        <div class="grayCloseCheckBox190821 black">';
                    documentResult += '            <input type="checkbox" id="eventpop_check_fri" onclick="layerPopup8(\'close\', \'fri\');"><label for="eventpop_check">오늘 그만 보기</label>';
                    documentResult += '        </div>';
                }
                if(week === "sat") {
                    documentResult += '        <div class="event-img-zone">';
                    documentResult += '            <img src="http://cdn.thehandsome.com/mobile/event/detail/image/handsome_202008/happy_4hour_mob_popup_img_02.jpg" style="width:100%;" alt="">';
                    documentResult += '        </div>';
                    documentResult += '        <div class="grayCloseCheckBox190821 black">';
                    documentResult += '            <input type="checkbox" id="eventpop_check_sat" onclick="layerPopup8(\'close\', \'sat\');"><label for="eventpop_check">오늘 그만 보기</label>';
                    documentResult += '        </div>';
                }
                if(week === "sun") {
                    documentResult += '        <div class="event-img-zone">';
                    documentResult += '            <img src="http://cdn.thehandsome.com/mobile/event/detail/image/handsome_202008/happy_4hour_mob_popup_img_03.jpg" style="width:100%;" alt="">';
                    documentResult += '        </div>';
                    documentResult += '        <div class="grayCloseCheckBox190821 black">';
                    documentResult += '            <input type="checkbox" id="eventpop_check_sun" onclick="layerPopup8(\'close\', \'sun\');"><label for="eventpop_check">오늘 그만 보기</label>';
                    documentResult += '        </div>';
                }
                documentResult += '                <a href="javascript:void(0);" class="btn_close" onclick="nightEvtPopLayerClose();"><img src="/_ui/desktop/common/images/popup/ico_close.png"></a>';
                documentResult += '            </div>';
                documentResult += '        </div>';
                documentResult += '    </div>';
                documentResult += '</div>';
            }

            $("#nightEventPopup").html(documentResult);

        } else if(division === "close") {

            if(week === "fri" && $("#eventpop_check_fri").is(":checked")) {
                var todayDate = new Date();
                setCookie("nightEvtFriPopup",todayDate.getDate(),1);
            }

            if(week === "sat" && $("#eventpop_check_sat").is(":checked")) {
                var todayDate = new Date();
                setCookie("nightEvtSatPopup",todayDate.getDate(),1);
            }

            if(week === "sun" && $("#eventpop_check_sun").is(":checked")) {
                var todayDate = new Date();
                setCookie("nightEvtSunPopup",todayDate.getDate(),1);
            }

            $("#nightEventPopup").data('scroll',$('#mainPopwrap1').scrollTop());
            $("#nightEventPopup").hide();
        }

    }

    //설날 공지 팝업 (2021)
    function layerPopup9(division) {

        var todayDate = new Date();
        var documentResult = "";
        if(division == "open") {

            documentResult += '	<div class="popWrap1901" style="position:fixed;top:-21px;right:10px;z-index:20;"> ';
            documentResult += '		<div class="popwrap main_banner position1 newyears-pop" style="position:relative;">';
            documentResult += '        	<div class="pop_cnt" style="position:relative;">';
            documentResult += '				<img src="http://cdn.thehandsome.com/pc/notice/pc_newyear_ko_220120.jpg" alt="설 연휴 배송 안내">';
            documentResult += '        		<a href="/ko/svcenter/notice" style="display:block;overflow:hidden;text-indent:-999em;position:absolute;left:50%;transform:translate3d(-50%,0,0);bottom:5%;width:140px;height:35px;">자세히보기</a>';
            documentResult += '        	</div>';
            documentResult += '        	<div class="chkbox_cls" style="background:#363636;">';
            documentResult += '        		<input type="checkbox" id="cls" onclick="layerPopup9(\'close\')"> <label for="cls"> 1일 동안 열지 않음</label>';
            documentResult += '			</div>';
            documentResult += '			<a href="javascript:;" class="btn_close" onclick="layerPopup9(\'close\')">닫기</a>';
            documentResult += '		</div>';
            documentResult += '	</div>';


            $("#mainPopwrap1").html(documentResult);
        } else if(division == "close") {

            if($('#cls').is(":checked")) {
                var todayDate = new Date();
                setCookie("newYearPopup2022",todayDate.getDate(),1);
            }
            $("#mainPopwrap1").data('scroll',$('#mainPopwrap1').scrollTop());
            $("#mainPopwrap1").hide();
        }
    }

    //추석 공지 팝업 (2022)
    function layerPopup11(division) {

        var todayDate = new Date();
        var documentResult = "";
        if(division == "open") {

            documentResult += ' <div class="popWrap1901" style="position:fixed;top:130px;right:10px;z-index:20;"> ';
            documentResult += '     <div class="popwrap main_banner position1 newyears-pop" style="position:relative;right:0;top:0;">';
            documentResult += '         <div class="pop_cnt" style="position:relative;width:370px;">';
            documentResult += '             <img src="http://cdn.thehandsome.com/pc/notice/pc_thanksgiving_ko_220901_1.jpg" alt="추석 연휴 배송 안내" style="width:100%;">';
            documentResult += '             <a href="/ko/svcenter/notice" style="display:block;overflow:hidden;text-indent:-999em;position:absolute;left:50%;transform:translate3d(-50%,0,0);bottom:23px;width:114px;height:34px;">자세히보기</a>';
            documentResult += '         </div>';
            documentResult += '         <div class="chkbox_cls" style="background:#363636;">';
            documentResult += '             <input type="checkbox" id="cls" onclick="layerPopup11(\'close\')"> <label for="cls"> 1일 동안 열지 않음</label>';
            documentResult += '         </div>';
            documentResult += '         <a href="javascript:;" class="btn_close" onclick="layerPopup11(\'close\')">닫기</a>';
            documentResult += '     </div>';
            documentResult += ' </div>';


            $("#mainPopwrap1").html(documentResult);
        } else if(division == "close") {

            if($('#cls').is(":checked")) {
                var todayDate = new Date();
                setCookie("chuseokPopup2022",todayDate.getDate(),1);
            }
            $("#mainPopwrap1").data('scroll',$('#mainPopwrap1').scrollTop());
            $("#mainPopwrap1").hide();
        }
    }

    //통합 멤버십 약관 제정 안내 팝업(21/03/01 00시~ 03/07 23:59:59)
    function layerPopup10(division) {

        var todayDate = new Date();
        var documentResult = "";
        if(division == "open") {

            //layerPopup 생성
            documentResult += '	<div class="layerArea"> ';
            documentResult += ' 	<div class="layerBg" style="display:block;"></div>';
            documentResult += '     <div class="popwrap notipop_20190813 images-event-popup wd-atuo integration-pop" style="display:block;" tabindex="-1">';
            documentResult += '			<div class="in-box">';
            documentResult += '     		<div class="in-ab" style="width:420px; height:421px;">';
            documentResult += '					<div class="event-img-zone">';
            documentResult += '						<img src="http://cdn.thehandsome.com/pc/notice/main-popup-integration-img.jpg" alt="한섬 통합 멤버십 이용 약관 제정 안내">';
            documentResult += '						<a href="http://www.thehandsome.com/ko/svcenter/notice?subject=한섬 통합 멤버십 이용 약관 제정 안내" class="link-btn"><span class="blind">자세한 내용 보기</span></a>';
            documentResult += '					</div>';
            documentResult += '					<div class="grayCloseCheckBox190821 black">';
            documentResult += '						<input type="checkbox" id="eventpop_check" name="eventpop_check" onclick="layerPopup10(\'close\')"><label for="eventpop_check">7일 동안 열지 않음</label>';
            documentResult += '					</div>';
            documentResult += '					<a href="javascript:void(0)" class="btn_close" onclick="layerPopup10(\'close\')"><img src="/_ui/desktop/common/images/popup/ico_close.png"></a>';
            documentResult += '				</div>';
            documentResult += '			</div>';
            documentResult += '		</div>';
            documentResult += '	</div>';


            //layerPopup 삽입
            $("#membershipInfoMainWrap").html(documentResult);
        } else if(division == "close") {
            if($('#eventpop_check').is(":checked")) {
                //쿠키생성 유효기간 쿠키생성일부터 7일
                var todayDate = new Date();
                setCookie("membershipInfoMain",todayDate.getDate(),7);
            }
            $("#membershipInfoMainWrap").data('scroll',$('#membershipInfoMainWrap').scrollTop());
            //popup hide
            $("#membershipInfoMainWrap").hide();
        }
    }

    //#1240 recopick 추가
    function goDetailPagebyRecommend(productCode, clickUrl){
        var url = '/ko/p' + "/" + productCode;
        var host = "http://"+ $(location).attr('host') + url +"?type=recommendProd";
        var tempUrl = clickUrl + "&url=" + encodeURI(host);
        window.location.href=tempUrl;
    }

    function mainSlider1903() {
        $('.big_banner_inner').each(function(){
            if($(this).hasClass('init')){
                $(this).removeClass('init');
            }
        });

        /* 슬라이드 갯수에 따른 loop추가 및 제거(20210222) */
        var bannerIndex1 = $('#mainSlider1903_0 .swiper-slide').length;
        var bannerIndex2 = $('#mainSlider1903_1 .swiper-slide').length;
        var bannerIndex3 = $('#mainSlider1903_2 .swiper-slide').length;

        var interleaveOffset = 1;
        var swiperOptions0 = {
            initialSlide:0,
            loop: bannerIndex1 === 1 ? false:true,
            autoplay: {
                delay: 4000,
                autoplayDisableOnInteraction: true,// 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
                disableOnInteraction: false,//180911 스와이핑 후에도 자동 롤링 되도록 추가
            },
            loopAdditionalSlides: 6,
            speed: 1000,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
                // 20200914 페이징 퍼이를 위한 주석처리
                /* type: 'progressbar', */
            },
            navigation: {
                nextEl: '.swiper-button-next.bigb',
                prevEl: '.swiper-button-prev.bigb',
            },
            simulateTouch:false,
            parallax: true,
            grabCursor: true,
            watchSlidesProgress: true,
            slidesPerView: 'auto',
            centeredSlides:true,
            on: {
                progress: function(){
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        var slideProgress = swiper.slides[i].progress,
                            innerOffset = swiper.width * interleaveOffset,
                            innerTranslate = slideProgress * innerOffset;
                        swiper.slides[i].querySelector(".slide-bgimg").style.transform =
                            "translate3d(" + innerTranslate + "px, 0, 0)";
                    }
                },
                touchStart: function() {
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = "";
                    }
                },
                setTransition: function(speed) {
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = speed + "ms";
                        swiper.slides[i].querySelector(".slide-bgimg").style.transition =
                            speed + "ms";
                    }
                }
            }
        }
        var swiperOptions1 = {
            initialSlide:1,
            loop: bannerIndex2 === 1 ? false:true,
            autoplay: {
                delay: 4000,
                autoplayDisableOnInteraction: true,// 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
                disableOnInteraction: false,//180911 스와이핑 후에도 자동 롤링 되도록 추가
            },
            loopAdditionalSlides: 6,
            speed: 1000,
            navigation: {
                nextEl: '.swiper-button-next.bigb',
                prevEl: '.swiper-button-prev.bigb',
            },
            parallax: true,
            grabCursor: true,
            watchSlidesProgress: true,
            slidesPerView: 'auto',
            centeredSlides:true,
            on: {
                progress: function(){
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        var slideProgress = swiper.slides[i].progress,
                            innerOffset = swiper.width * interleaveOffset,
                            innerTranslate = slideProgress * innerOffset;
                        swiper.slides[i].querySelector(".slide-bgimg").style.transform =
                            "translate3d(" + innerTranslate + "px, 0, 0)";
                    }
                },
                touchStart: function() {
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = "";
                    }
                },
                setTransition: function(speed) {
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = speed + "ms";
                        swiper.slides[i].querySelector(".slide-bgimg").style.transition =
                            speed + "ms";
                    }
                }
            }
        }
        var swiper2length = $("#mainSlider1903_2 > ul > li").length;
        if(swiper2length > 0){
            swiper2length -= 1;
        }
        var swiperOptions2 = {
            initialSlide: swiper2length ,
            loop: bannerIndex3 === 1 ? false:true,
            autoplay: {
                delay: 4000,
                autoplayDisableOnInteraction: true,// 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
                disableOnInteraction: false,//180911 스와이핑 후에도 자동 롤링 되도록 추가
            },
            loopAdditionalSlides: 6,
            speed: 1000,
            navigation: {
                nextEl: '.swiper-button-next.bigb',
                prevEl: '.swiper-button-prev.bigb',
            },
            parallax: true,
            grabCursor: true,
            watchSlidesProgress: true,
            slidesPerView: 'auto',
            centeredSlides:true,
            on: {
                progress: function(){
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        var slideProgress = swiper.slides[i].progress,
                            innerOffset = swiper.width * interleaveOffset,
                            innerTranslate = slideProgress * innerOffset;
                        swiper.slides[i].querySelector(".slide-bgimg").style.transform =
                            "translate3d(" + innerTranslate + "px, 0, 0)";
                    }
                },
                touchStart: function() {
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = "";
                    }
                },
                setTransition: function(speed) {
                    var swiper = this;
                    for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = speed + "ms";
                        swiper.slides[i].querySelector(".slide-bgimg").style.transition =
                            speed + "ms";
                    }
                }
            }
        };

        $("#mainSlider1903_1").find("div.a_txt_wrap").hide();
        $("#mainSlider1903_2").find("div.a_txt_wrap").hide();
        var swiper01 = new Swiper("#mainSlider1903_0", swiperOptions0);
        var swiper02 = new Swiper("#mainSlider1903_1", swiperOptions1);
        var swiper03 = new Swiper("#mainSlider1903_2", swiperOptions2);
    }


    function edtSlider1903(){//기획전 슬라이더
        $('.edt_banner_wrap1903 .edt_list1903').each(function(idx){
            var swiper1903 = new Swiper('#edtSlider1903_'+idx, {
                slidesPerView: 3,
                freeMode: false,
                spaceBetween: 11,
                simulateTouch:true,
                /* scrollbar: {
                        el: '.swiper-scrollbar.bar'+idx,
                        hide: false,
                    }, */
                pagination: {
                    el: '.edt-swiper-pagination',
                },
                navigation: {
                    nextEl: '.swiper-button-next.btn'+idx,
                    prevEl: '.swiper-button-prev.btn'+idx,
                }
            });

            if($(this).find('.swiper-slide').length < 4){
                $(this).find('.swiper-button-next, .swiper-button-prev').hide();
            }
        });
    }

    function newProductListSlider1903(){//신상품 슬라이더
        var swiper1903 = new Swiper('#newListSlider', {
            slidesPerView: 'auto',
            freeMode: false,
//                 spaceBetween: 7,
            simulateTouch:false,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            }
        });
    }
    function bestProductListSlider1903(){//베스트 슬라이더
        var swiper1903 = new Swiper('.product_list1903 .nbe_cnt.best .nbe_cnt_inner', {
            slidesPerView: 'auto',
            freeMode: false,
//                 spaceBetween: 7,
            simulateTouch:false,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            }
        });
    }
    function tabNew(){
        var $newMenu = $('.product_list1903 .nbe_cnt.new .product_left_menu');
        var $newProd = $('.product_list1903 .nbe_cnt.new .nbe_cnt_inner');
        $newMenu.find('a').on('click',function(){
            $newMenu.find('li').removeClass('on');
            $(this).closest('li').addClass('on');
        });
    }
    function tabBest(){
        var $bestMenu = $('.product_list1903 .nbe_cnt.best .product_left_menu');
        var $bestProd = $('.product_list1903 .nbe_cnt.best .nbe_cnt_inner');
        $bestMenu.find('a').on('click',function(){
            $bestMenu.find('li').removeClass('on');
            $(this).closest('li').addClass('on');
        });
    }
    function magazinSlider1903(){
        var swiper1903 = new Swiper('#magazinSlider1903', {
            slidesPerView: 3,
            freeMode: false,
            spaceBetween: 20,
            navigation: {
                nextEl: '.themagazine_arrow.next',
                prevEl: '.themagazine_arrow.prev',
            }
        });

        $(".the_magazine_wrap1903 .themagazine_arrow.prev").css("opacity", "1");
        $(".the_magazine_wrap1903 .themagazine_arrow.next").css("opacity", "1");
        $(".the_magazine_wrap1903 .magazine_slider1903 ul").css("opacity", "1");
    }//더매거진 슬라이더
    function videoWidth(){
        var target = $('.video_area1903').attr('id');
        var idx = 0;
        var width = $("#"+ target +" div:eq("+idx+")").width();
        var height = $("#"+ target +"  div:eq("+idx+")").height();
        $('#'+target).find('video').css({'width':width+'px','height':height+'px'});
        $('#'+target).css({'width':width+'px','height':height+'px'});
    }
    function videoPlay1903(){
        $('.video_area1903').children('a').on('click',function(){
            $(this).find('.video_main').next('video').show();
            $(this).find('.video_main').hide();
            $('#video')[0].play();
        });
    }
    function videoEnded(target, idx){
        $("#"+ target +" video").hide();
        $("#"+ target +" div:eq("+idx+")").show();
    }

    function pickForSlider1903(){
        var position = 0;
        var movesize = 206;
        var activeSlide = 3;
        var viewTotalWidth = $("#pickForSlider1903 ul li").size();
        var $slideId = $('#pickForSlider1903 ul');
        //$slideId.width((movesize * viewTotalWidth)+88);
        $slideId.css('left',position);
        for(var i=0;i<2;i++){
            $slideId.find('li:last-child').prependTo("#pickForSlider1903 ul");
        }
        $slideId.find('li:nth-child('+activeSlide+')').addClass('slide_active');
        $('#pickforControls > a').click(function(event){
            var $target=$(event.target);
            if($target.is('#pickforControls > .next')){
                if(position==-movesize){
                    $slideId.css('left',0);
                    $slideId.find('li:first-child').appendTo("#pickForSlider1903 ul");
                    position = 0;
                }
                position-=movesize;
                $slideId.stop().animate({left:position}, 'fast', 'swing',function(){
                    if(position==-movesize){
                        $slideId.css('left',0);
                        $slideId.find('li:first-child').appendTo("#pickForSlider1903 ul");
                        position=0;
                    }
                    activeSlide = 3;
                    $slideId.find('li').removeClass('slide_active');
                    $slideId.find('li:nth-child('+activeSlide+')').addClass('slide_active');
                });

            }else if($target.is('#pickforControls > .prev')){
                if(position==0){
                    $slideId.css('left',-movesize);
                    $slideId.find('li:last-child').prependTo("#pickForSlider1903 ul");
                    position=-movesize;
                }
                position+=movesize;
                $slideId.stop().animate({left:position}, 'fast',function(){
                    if(position==0){
                        $slideId.css('left',-movesize);
                        $slideId.find('li:last-child').prependTo("#pickForSlider1903 ul");
                        position=-movesize;
                    }
                    activeSlide = 4;
                    $slideId.find('li').removeClass('slide_active');
                    $slideId.find('li:nth-child('+activeSlide+')').addClass('slide_active');
                });

            }
        });

        $(".pickfor_wrap1903 .controls .prev").css("opacity", "1");
        $(".pickfor_wrap1903 .controls .next").css("opacity", "1");
        $(".pickfor_wrap1903 .pick_for ul").css("opacity", "1");
    }//당신만을 위 추천 슬라이더

    function instagramSlider1903(){
        var swiper1903 = new Swiper('#instaContents', {
            slidesPerView: 'auto',
            paginationClickable: false,
            simulateTouch:false,
            freeMode: false,
            loopedSlides: accountCount,
            spaceBetween: 20,
            centeredSlides:true,
            loop:true,
            speed:600,
            navigation: {
                nextEl: '.instagram_arrow.next',
                prevEl: '.instagram_arrow.prev'
            }
        });
    }

    function instaImgHover(){//인스타 이미지 hover
        $(".instagram_wrap1903 #instaContents li a > div.insta_pic_info, #instaContents li a > div.insta_pic_info_txt").hide();
        $(".instagram_wrap1903 #instaContents li > a").hover(function(){
            $(this).find(".insta_pic_info").stop().fadeIn("easeOutQuart");
            $(this).find(".insta_pic_info_txt").stop().fadeIn("easeOutQuart");
            $(this).children('img').addClass('active');
        },function(){
            $(this).find(".insta_pic_info, .insta_pic_info_txt").stop().fadeOut("300");
            $(this).children('img').removeClass('active');
        });
    }

    function rouletteEvtPopClose(type) {
        if(type == "close") {
            $('#popRouletteEvt').hide();
        }else {
            var date;

            $.ajax({
                type : "GET",
                cache: false,
                async: false,
                url: location.href,
                complete: function (req, textStatus){
                    var dateString = req.getResponseHeader('Date');
                    if(dateString.indexOf('GMT')===-1){
                        dateString +=' GMT';
                    }
                    date = new Date(dateString);

                }
            });

            var todayDate = new Date(date);
            setCookie("rouletteEventPopup",todayDate.getDate(),1);
            $('#popRouletteEvt').hide();
        }
    }


    function goRouletteEvent(){
        location.href='/ko/magazine/events/8799828694912';
    }

    //11월 한섬스타일 이벤트 랜딩
    function goHandsomeStyleEvent(){
        location.href='/ko/magazine/events/8799959734144';
    }
    //이벤트 유도팝업 닫기
    function popClose1904(){ //팝업 닫기
        $('#playHandsomeStyle').remove();
    }
    function popClose1911(){ //팝업 닫기
        $('#joinEventPopup').remove();
    }

    function GA_main(action,e){
        var index;
        var label;
        var eventAction;
        if(action == "banner"){
            label = escape(e.find('.title').text());
            index = parseInt(e.parent().attr('data-swiper-slide-index')) + 1;
            eventAction = "배너_"+index;

        } else if (action == "eventBanner"){
            eventAction = "이벤트_배너";
            label = escape(e.find('.s_title').text());

        } else if (action == "exhibitionBanner"){
            eventAction = "기획전_배너";
            label = escape(e.find('.s_title').text());

        } else if (action == "exhibitionListImage0"){
            eventAction = "기획전_리스트";
            label = escape(e.parents().find('.edt_banner_inner1 .s_title').text())+"_"+escape(e.parent().find('.title').html());

        } else if (action == "exhibitionList0"){
            eventAction = "기획전_리스트";
            label = escape(e.parents().find('.edt_banner_inner1 .s_title').text())+"_"+escape(e.find('.title').html());

        } else if (action == "exhibitionListImage1"){
            eventAction = "기획전_리스트";
            label = escape(e.parents().find('.edt_banner_inner3 .s_title').text())+"_"+escape(e.parent().find('.title').html());

        } else if (action == "exhibitionList1"){
            eventAction = "기획전_리스트";
            label = escape(e.parents().find('.edt_banner_inner3 .s_title').text())+"_"+escape(e.find('.title').html());

        } else if (action == "newImg") {
            eventAction = "신상품";
            label = escape(e.parents().find('.nbe_cnt.new li.on').text())+"_"+escape(e.find('img').attr('name'));

        } else if (action == "new") {
            eventAction = "신상품";
            label = escape(e.parents().find('.nbe_cnt.new li.on').text())+"_"+escape(e.parent().find('img').attr('name'));

        } else if (action == "bestImg") {
            eventAction = "베스트";
            label = escape(e.parents().find('.nbe_cnt.best li.on').text())+"_"+escape(e.attr('name'));

        } else if (action == "best") {
            eventAction = "베스트";
            label = escape(e.parents().find('.nbe_cnt.best li.on').text())+"_"+escape(e.parent().find('img').attr('name'));

        } else if (action == "exhibitionVideo"){
            eventAction = "기획영상";
            label = escape(e.parents().find('.video_main_wrap p.tit').text());

        } else if (action.indexOf("theMagazine") > -1){
            action.split("the");
            index =parseInt(action[0])+1;
            eventAction = "더매거진";
            label = index+"_"+ escape(e.parent().find('p.tit').text());
        } else if (action == "recommend"){
            eventAction = "당신만을위한추천";
            label = escape(e.parent().find('.title').text());
        } else if (action == "moment"){
            eventAction = "한섬모먼트";
            label = e.find('.account p').text().substring(1);
        }


        GA_Event("메인", eventAction,label);
    }


    //CMS 컴포넌트 처리용 GA 전자상거래 메인데이터
    function setEcommerceDataCompnt(productCode, brandName, productName, location){
        var listNm = "";
        var position;
        if(location == "0"){
            listNm = "메인_기획전";
            position = 1;
        }else if(location == "1"){
            listNm = "메인_기획전_하단";
            position = 2;
        }

        dataLayer.push({
            'event': 'ga_event', 'layerCategory' : 'Ecommerce', 'layerAction' : 'Click','layerLabel' : undefined,
            'ecommerce': {
                'currencyCode': 'KRW', //통화
                'click': {
                    'actionField': { 'list': listNm }, //상품 리스트명
                    'products':
                        [{
                            "id": productCode.indexOf("_") > -1 ? productCode.split("_")[0] : productCode, //상품코드
                            "name": productName.replace(/\&#039;/gi,"'"), //상품명
                            "brand": brandName.replace(/\&#039;/gi,"'"), //상품 브랜드
                            "category": "", //상품 카테고리
                            "position": position //상품 위치
                        }]
                }
            }
        });
        /* Ecommerce data 초기화
            dataLayer에 남아 있는 경우에는 전자상거래 단계만을 위해 사용하는
            필드들이 세팅되어 있으므로 undefined를 통해 초기화합니다. */
        dataLayer.push({
            'layerCategory' : undefined,
            'layerAction' : undefined,
            'nonInteraction' : false,
            'ecommerce' : undefined
        });
    }

    //기본 GA 전자상거래 메인데이터
    function setEcommerceData(idx, type, categoryCode){
        var listNm = "";
        var position;
        var prodList;

        if(type == "NEW"){
            prodList = JSON.parse(window.sessionStorage.getItem('main_new_ecommerceDataList'));
            if(categoryCode == "WE"){
                listNm += "메인_신상품_여성";
                position = 3;
            }else if(categoryCode == "ME"){
                listNm += "메인_신상품_남성";
                position = 4;
            }
        }else if(type == "BEST"){
            prodList = JSON.parse(window.sessionStorage.getItem('main_best_ecommerceDataList'));
            if(categoryCode == "WE"){
                listNm += "메인_베스트_여성";
                position = 5;
            }else if(categoryCode == "ME"){
                listNm += "메인_베스트_남성";
                position = 6;
            }
        }else if(type == "RECOMMEND"){

            prodList = JSON.parse(window.sessionStorage.getItem('main_recommend_ecommerceDataList'));
            listNm += "메인_개인화 추천";
            position = 7;

        }

        if(prodList != null && typeof prodList != undefined){
            if(prodList.length > 0){
                var prodInfo = prodList[idx];

                if(listNm != ""){
                    dataLayer.push({
                        'event': 'ga_event', 'layerCategory' : 'Ecommerce', 'layerAction' : 'Click','layerLabel' : undefined,
                        'ecommerce': {
                            'currencyCode': 'KRW', //통화
                            'click': {
                                'actionField': { 'list': listNm }, //상품 리스트명
                                'products':
                                    [{
                                        'id': prodInfo.baseProductCode.indexOf("_") > -1 ? prodInfo.baseProductCode.split("_")[0] : prodInfo.baseProductCode,  //상품코드
                                        'name': prodInfo.productName, //상품명
                                        'brand': prodInfo.brandName, //상품 브랜드
                                        'category': '', //상품 카테고리
                                        'position': position //상품 위치
                                    }]
                            }
                        }
                    });
                    /* Ecommerce data 초기화
			            dataLayer에 남아 있는 경우에는 전자상거래 단계만을 위해 사용하는
			            필드들이 세팅되어 있으므로 undefined를 통해 초기화합니다. */
                    dataLayer.push({
                        'layerCategory' : undefined,
                        'layerAction' : undefined,
                        'nonInteraction' : false,
                        'ecommerce' : undefined
                    });
                }

            }
        }
    }

    function getExchangeRate() {
        $.ajax({
            type : "get",
            url : "/ko/intro/getExchageRate",
            dataType : "json",
            async : false,
            success : function( result ) {
                if(result.length > 0) {
                    for(var i=0; i < result.length; i++) {
                        if(result[i].currencyCode == "USD") {
                            rate_en = result[i].exchangeRate;
                            symbol_en = result[i].symbol;
                        } else {
                            rate_zh = result[i].exchangeRate;
                            symbol_zh = result[i].symbol;
                        }
                    }
                }
            }
        });
    }

    function getExchangePrice(price) {
        var exchangePrice = "";

        exchangePrice = "₩" + addComma(parseInt(price));


        return exchangePrice;
    }

    // 마케팅수신동의 팝업 닫기
    function maketingAgreeClose() {
        $("#marketingAgreeLayer").hide();

    }

    // 마케팅수신동의얼럿
    function maketingAgreeAlert() {



        if ( !$('#emailchk').is(':checked') && !$('#smschk').is(':checked') ) {
            var lc = new layerConfirm('고객님께서는 마케팅수신 재동의하지 않으셨습니다. 이대로 진행할 경우, 더한섬닷컴에서 진행하는 마케팅 및 이벤트 소식을 받아보실수 없습니다. 진행하시겠습니까?', '확인', '취소');
            lc.confirmAction = function() {
                maketingAgreeProcess('N','N');
            };
        } else if ( $('#emailchk').is(':checked') && !$('#smschk').is(':checked') ) {
            var lc = new layerConfirm('고객님께서는 SMS 수신은 동의하지 않으셨습니다. 이대로 진행할 경우, 더한섬닷컴에서 진행하는 마케팅 및 이벤트 소식을 SMS로 받아보실수 없습니다. 진행하시겠습니까?', '확인', '취소');
            lc.confirmAction = function() {
                maketingAgreeProcess('Y','N');
            };
        } else if ( !$('#emailchk').is(':checked') && $('#smschk').is(':checked') ) {
            var lc = new layerConfirm('고객님께서는 이메일 수신은 동의하지 않으셨습니다. 이대로 진행할 경우, 더한섬닷컴에서 진행하는 마케팅 및 이벤트 소식을 이메일로 받아보실수 없습니다. 진행하시겠습니까?', '확인', '취소');
            lc.confirmAction = function() {
                maketingAgreeProcess('N','Y');
            };
        } else {
            maketingAgreeProcess('Y','Y');
        }


    }

    // 마케팅수신동의처리
    function maketingAgreeProcess(emailChkYn, smsChkYn) {
        $.ajax({
            type:"POST",
            url:"/ko/appDownloadSMS/maketingAgree",
            data:{"emailChkYn" : emailChkYn, "smsChkYn" : smsChkYn, "CSRFToken" : "430e5a7c-f4cc-4cbf-9474-b680399cd085"},
            error:function(e){
                console.log(e);
            }
        });
        maketingAgreeClose();
    }

    //8월 올빼미 이벤트 팝업 닫기
    function nightEvtPopLayerClose(){
        $("#nightEvtPop").hide();
    }

</script>

<!-- bodyWrap -->
<div id="bodyWrap" style="padding-bottom:0;">
    <!-- layer pop-->
    <div class="notice_pop" id="mainNoticeWrap"></div>
    <div id="mainPopwrap1"></div>
    <div id="mainPopwrap2"></div>
    <div id="nightEventPopup"></div>
    <div id="membershipInfoMainWrap"></div>
    <!-- //layer pop -->
    <!-- main_container-->
    <div class="big_banner1903">
        <div class="swiper-container big_banner_inner swiper-container-horizontal swiper-container-wp8-horizontal" id="mainSlider1903_0">
            <div class="big_banner_frame"></div>
            <ul class="slides swiper-wrapper" style="transform: translate3d(-11209px, 0px, 0px); transition-duration: 1000ms;"><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(11209px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap ">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(10190px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(9171px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap ">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(8152px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(7133px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(6114px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(5095px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(4076px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap ">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(3057px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(2038px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap ">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                    </div>
                </a>
            </li>
                <li class="swiper-slide swiper-slide-prev" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(1019px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-active" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(0px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-next" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(-1019px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(-2038px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(-3057px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(-4076px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(-5095px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(-6114px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(-7133px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(-8152px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(-9171px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(-10190px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(-11209px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(-12228px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(-13247px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(-14266px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(-15285px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(-16304px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(-17323px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(-18342px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap ">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li></ul>
            <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
        </div>
        <div class="swiper-container big_banner_inner swiper-container-horizontal swiper-container-wp8-horizontal" id="mainSlider1903_1" style="margin-top: -480px; left: 1035px; cursor: grab;">
            <div class="big_banner_frame"></div>
            <ul class="slides swiper-wrapper" style="transform: translate3d(-14266px, 0px, 0px); transition-duration: 1000ms;"><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(14266px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(13247px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(12228px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(11209px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(10190px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(9171px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(8152px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(7133px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(6114px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(5095px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                    </div>
                </a>
            </li>
                <li class="swiper-slide" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(4076px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(3057px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(2038px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-prev" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(1019px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-active" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(0px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-next" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(-1019px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(-2038px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(-3057px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(-4076px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(-5095px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(-6114px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(-7133px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(-8152px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(-9171px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(-10190px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(-11209px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(-12228px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(-13247px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(-14266px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(-15285px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li></ul>
        </div>
        <div class="swiper-container big_banner_inner swiper-container-horizontal swiper-container-wp8-horizontal" id="mainSlider1903_2" style="margin-top: -480px; left: -1035px; cursor: grab;">
            <div class="big_banner_frame"></div>
            <ul class="slides swiper-wrapper" style="transform: translate3d(-11209px, 0px, 0px); transition-duration: 1000ms;"><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(11209px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(10190px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(9171px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(8152px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(7133px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(6114px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(5095px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(4076px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(3057px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap left" style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                    </div>
                </a>
            </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(2038px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                    <div class="a_txt_wrap " style="display: none;">
                        <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                        </p>
                        <p class="s_title">
                            <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                        </p>
                        <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                    </div>
                    <div class="v_img">
                        <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                    </div>
                </a>
            </li>
                <li class="swiper-slide swiper-slide-prev" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(1019px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-active" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(0px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-next" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(-1019px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(-2038px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(-3057px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(-4076px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(-5095px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(-6114px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(-7133px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(-8152px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li>
                <li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI&quot;); transform: translate3d(-9171px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362468536" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">Hotel Meribel</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">파리지앵의 윈터 리조트 룩<br>오즈세컨 22 F/W 뉴 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-o2nd-06.jpg?context=bWFzdGVyfGltYWdlc3w5NzI1NXxpbWFnZS9qcGVnfGltYWdlcy9oMzcvaDZkLzkzMzgzMzMxNjc2NDYuanBnfDBhYjcyODNlYzhlZTUwM2I0MjYwYTc4M2M3ZmFlZmExNzczMGU4ZDc5NjE4N2RlZWNkM2YwYTE1YTlkZWMwNWI" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="1" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI&quot;); transform: translate3d(-10190px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804547221376" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">신규회원을 위한 릴레이 래플<br>2주차 라인업을 만나보세요!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">이벤트 응모하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221011-A-7th-raffle-week2-pc.jpg?context=bWFzdGVyfGltYWdlc3w0NzI5NnxpbWFnZS9qcGVnfGltYWdlcy9oMzIvaDkzLzkzMzg4MjMwNDkyNDYuanBnfGEzYWMyN2IwOWE4NDE1MjM4NTRhY2ZiOGFmODBlZTE1NmM3OTNkZmMzYmQ5MTBjMWVjMjY0OGU0YWJmOTIzZGI" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="2" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl&quot;); transform: translate3d(-11209px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804514486144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">배우 김고은의 섬세한 순간<br>광고 감상평 남기고 쿠폰 받기!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">영상 보러가기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/A-somemoments-01-.jpg?context=bWFzdGVyfGltYWdlc3wyMTI0NTh8aW1hZ2UvanBlZ3xpbWFnZXMvaDI5L2g5Yi85MzM3OTA3ODA2MjM4LmpwZ3wyMjhkODJkMTU4YWUyNDhkNDA5OGQxZGIzZTJlMzFiZTc1Y2IyN2Q1ZTk4ZjIwOTNjZjQ2M2Y1OTNhNTJiNGFl" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM&quot;); transform: translate3d(-12228px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742808648" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">타임옴므가 마주할 겨울</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">겨울을 준비하는 타임옴므의<br>온라인 익스클루시브 컬렉션</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-timehomme-02.jpg?context=bWFzdGVyfGltYWdlc3w1MTg1MnxpbWFnZS9qcGVnfGltYWdlcy9oNTEvaDdhLzkzMzg0NjAxMTA4NzguanBnfGEzNjE5MjY3MjMxMDFhZDc5YzllYzlhZjQxMDY0YTE4YWM0NGQyM2FjY2JkZjE0MjA1YzNjNDE2NzhlZDM0ZmM" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU&quot;); transform: translate3d(-13247px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742743112" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">오늘은 코트를 입는다</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">클럽모나코가 선정한 코트 아홉개<br>최대 20만원 구매 리워드</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-clubmonaco-02.jpg?context=bWFzdGVyfGltYWdlc3w5MzU0NHxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDkyLzkzMzgxOTgyOTQ1NTguanBnfDY0NDc4MWE3MTZhM2U5YjlmYzEyODNlYzA3MjU0Y2I2YmZhM2Q2NGI0NDRhZGUzNWQyYzk2M2E4MTdkZTEyOGU" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg&quot;); transform: translate3d(-14266px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362009784" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">THE LIFEMENTARY</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">찰나의 순간 속 스토리를 담은<br>더캐시미어의 22FW 캠페인</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-thecashmere.jpg?context=bWFzdGVyfGltYWdlc3w4MDM5MXxpbWFnZS9qcGVnfGltYWdlcy9oMjAvaGRiLzkzMzgxNDE0NzQ4NDYuanBnfDhiOGQ4NzQ5NTBjYmYzZGQ5YjhjODBjMWM5YTZkYmYzMzRhNjVkZmQwMmZlMWZhMjVlNWI1NzMwYjE2YjE0OTg" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA&quot;); transform: translate3d(-15285px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813361845944" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">BARE INSTINCTS</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">SJSJ가 선보이는 뉴 시즌 캠페인<br>무스탕 퍼 베스트 GIFT까지!</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221005-A-sjsj-01.jpg?context=bWFzdGVyfGltYWdlc3w0NDgxM3xpbWFnZS9qcGVnfGltYWdlcy9oNGIvaDdjLzkzMzc2NDEzMzY4NjIuanBnfGI0Mzg2OGVlYjkxYjNmNTY5N2JlMzZmMTM1MzRmOTYwOTA2ZDhkYjYxYTVkYmNlN2I4MGU4NmZhM2YyMTQ3YzA" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ&quot;); transform: translate3d(-16304px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/exhibitions/8813362042552" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">에코 아우터 웨어 브랜드<br>쇼디치스키클럽 by TOM</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">Shop Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-tom-04.jpg?context=bWFzdGVyfGltYWdlc3w4MjIyNnxpbWFnZS9qcGVnfGltYWdlcy9oNDkvaDhjLzkzMzgxNzQwNDYyMzguanBnfGUxN2YyZGFjNDQ3MTYzMjQ3ZDdhYTY4ZWM1MjcwZGM3NWExYmQzMDVlYWJjNWYxMTBjZGFjMzU2Y2E1MDYwMzQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU&quot;); transform: translate3d(-17323px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/events/8804612790144" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap left" style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#FFFFFF">릴레이 체험단</font>
                                <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
                                <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#FFFFFF">새롭게 선보이는 오에라<br>궁극의 세럼을 체험해보세요</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#FFFFFF;color:#FFFFFF">체험단 신청하기</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221006-A-relay-05-.jpg?context=bWFzdGVyfGltYWdlc3w0NjM4OXxpbWFnZS9qcGVnfGltYWdlcy9oODIvaDU1LzkzMzgxNzU2MTkxMDIuanBnfDE0NzE1Y2ZiYmZjZTgzMDk3YjU5YThjMGY3MGQ5MmRiNTZiNmFmYzQyMmI1NDA5MmJlY2UyMTQ0Mjc5ZGNkMTU" alt="" class="entity-img">
                        </div>
                    </a>
                </li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9" style="transition: all 1000ms ease 0s;">
                    <div class="slide-bgimg" style="background-image: url(&quot;http://www.thehandsome.com/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ&quot;); transform: translate3d(-18342px, 0px, 0px); transition: all 1000ms ease 0s;"></div>
                    <a href="/ko/magazine/editorials/8806742775880" onclick="GA_main('banner',$(this));">
                        <div class="a_txt_wrap " style="display: none;">
                            <p class="title">
                    	<span class="bar-in">
                            <font color="#000000">CARDIGAN &amp; KNIT VEST</font>
                                <span class="ab-bar left" style="background-color:#000000;"></span>
                                <span class="ab-bar right" style="background-color:#000000;"></span>
                            </span>
                            </p>
                            <p class="s_title">
                                <font color="#000000">쌀쌀한 가을 날씨 대비 아이템<br>더한섬닷컴 PICK 니트 가디건 &amp; 베스트</font>
                            </p>
                            <div class="shop_now_btn" style="border-color:#000000;color:#000000">Check Out Now</div>
                        </div>
                        <div class="v_img">
                            <img src="/medias/221007-A-weeklypick-01.jpg?context=bWFzdGVyfGltYWdlc3w3NTA4MHxpbWFnZS9qcGVnfGltYWdlcy9oN2MvaDA3LzkzMzgzOTY3MDQ3OTguanBnfDg5YjQyODdiNDg3YzQ3ODdjNmRiYjEzNmM0NjI0OWUyYjNjMWVkOTUwYjNmMmMxN2VjNzRmN2M3YTc2ZTVmYTQ" alt="" class="entity-img">
                        </div>
                    </a>
                </li></ul>
        </div>
        <div class="swiper-button-prev bigb"></div>
        <div class="swiper-button-next bigb"></div>
    </div>
    <div class="main_container">
        <div class="mid_banner" style="">
            <div class="banner1 banner1_N" style="">
                <a href="/ko/c/we095/#1_0_0_0_0_67_0_0_0" onclick="GA_main('eventBanner',$(this));">
                    <img src="/medias/221007-2-1-liquidesbar-02.jpg?context=bWFzdGVyfGltYWdlc3wxOTY4MnxpbWFnZS9qcGVnfGltYWdlcy9oNzMvaGU4LzkzMzgyNzcyOTgyMDYuanBnfDJlZTU1NjgzMzhmM2U2ZjU2ODExYjE4MDVhZjRiMjYyM2Y5ZThiNDg0ZGFlZWU0YTYwOTBjMzk1YTM0YjQ4OGQ" alt="banner image">
                    <div class="ban_txt_wrap">
                        <p class="title"><font color="black">BON VOYAGE</font></p>
                        <p class="s_title"><font color="black">폼더스토어의 생동감 있는 캠핑 룩</font></p>
                    </div>
                </a>
            </div>
            <div class="banner1 banner1_N" style="display:none;">
                <a href="/ko/magazine/exhibitions/8812968957624" onclick="GA_main('eventBanner',$(this));">
                    <img src="/medias/2-2-outer-01.jpg?context=bWFzdGVyfGltYWdlc3wxMjU0MnxpbWFnZS9qcGVnfGltYWdlcy9oYmIvaDVjLzkzMjc1NzA0NTI1MTAuanBnfDBiNjMzMGFlNzlhNmRkYWE0MzJlMGQxMDlhZDNjYjk1YzA4MDdkNTQ3ZmRkOTEyNGQ3NmY5ODRiNjMxMzk2NmQ" alt="banner image">
                    <div class="ban_txt_wrap">
                        <p class="title"><font color="black">피어오브갓 에센셜</font></p>
                        <p class="s_title"><font color="black">국내 공식 단독 런칭 at MUE</font></p>
                    </div>
                </a>
            </div>
            <div class="banner2 banner2_N" style="">
                <a href="/ko/magazine/exhibitions/8813263541944" onclick="GA_main('eventBanner',$(this));">
                    <img src="/medias/221007-2-2-liquidesbar.jpg?context=bWFzdGVyfGltYWdlc3wxMzQ0NnxpbWFnZS9qcGVnfGltYWdlcy9oZmQvaDAwLzkzMzgyNzY3NzM5MTguanBnfDIzMmU3MTc5MDk5NzY4ODdiOTk2MDc1Zjc4ZmFiNTg4ZTBmZWVkMWNhNDhmYzA2NmU2ZjgyMTcwODFhZWI3NDQ" alt="banner image">
                    <div class="ban_txt_wrap">
                        <p class="title"><font color="white">가을 날의 우디 퍼퓸</font></p>
                        <p class="s_title"><font color="white">리퀴드 퍼퓸바 추천 우디 향수</font></p>
                    </div>
                </a>
            </div>
            <div class="banner2 banner2_N" style="display:none;">
                <a href="/ko/magazine/exhibitions/8813165401784" onclick="GA_main('eventBanner',$(this));">
                    <img src="/medias/220915-2-2-ourlegacy-02.jpg?context=bWFzdGVyfGltYWdlc3wxMTU1OXxpbWFnZS9qcGVnfGltYWdlcy9oNGMvaGVlLzkzMzA3MTI5MDM3MTAuanBnfDU3OGI3NWZkYzZlMTBkNmVhNGExNTMwNWY5OWMzY2I3NzQyOThjOGUzN2NkOTg3NDM3YWJlY2I1MWM0MjI5MDg" alt="banner image">
                    <div class="ban_txt_wrap">
                        <p class="title"><font color="black">OUR LEGACY</font> </p>
                        <p class="s_title"><font color="black">아워레가시 한섬 국내 단독 런칭</font></p>
                    </div>
                </a>
            </div>
            <div class="banner2 banner2_N" style="display:none;">
                <a href="/ko/magazine/events/8804088600448" onclick="GA_main('eventBanner',$(this));">
                    <img src="/medias/2-2-payco-3-04.jpg?context=bWFzdGVyfGltYWdlc3wxNDIyM3xpbWFnZS9qcGVnfGltYWdlcy9oNWUvaDMzLzkzMDMxMzA5OTY3NjYuanBnfDAxNjYwM2IxZmM1NGI2NWI0NDk2NjJlM2YzNTExYmE4NDkyMDMwNDI3ODg2NmU4ZTBjMTQ2NjQ0YWQ5NTY3NTA" alt="banner image">
                    <div class="ban_txt_wrap">
                        <p class="title"><font color="white">PAYCO 결제 혜택</font></p>
                        <p class="s_title"><font color="white">충전 포인트로 결제하면 5% 적립!</font></p>
                    </div>
                </a>
            </div>
        </div>
        <div class="edt_banner_wrap1903">
            <h4 class="tit">기획전</h4>
            <div class="edt_banner_inner1">
                <div class="edt_banner">
                    <a href="/ko/magazine/exhibitions/8813263509176" onclick="GA_main('exhibitionBanner',$(this));">
                        <img src="/medias/B-essential-02.jpg?context=bWFzdGVyfGltYWdlc3wxMzUyNjR8aW1hZ2UvanBlZ3xpbWFnZXMvaDA0L2g0OC85MzM4MjQ5MjgxNTY2LmpwZ3wwMWJkNzk5NjlhYmM5MzI1YmY1Y2MyMDdlMGEyMjUwMDBkMjExMDFkZjIxZmViMjk1NjU4MGQwMzE5NzU1NDlm" alt="기획전 배너">
                        <div class="ban_txt_wrap">
                            <span class="sticker" style="background:#e16a6a;">new</span>
                            <p class="s_title">
                                <font color="#ffffff">에센셜 라인 2차 공식 단독 런칭</font>
                            </p>
                            <p class="title">
                   <span class="bar-in">
                       <font color="#ffffff">피어오브갓 ESSENTIALS</font>
                       <span class="ab-bar left" style="background-color:#ffffff;"></span>
					   <span class="ab-bar right" style="background-color:#ffffff;"></span>
                   </span>
                            </p>
                        </div>
                    </a>
                </div>
                <div class="edt_list1903">
                    <div class="edt_list_inner swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="edtSlider1903_0">
                        <p class="tit">FEAR OF GOD ESSENTIALS</p>
                        <ul class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                            <li class="swiper-slide swiper-slide-active" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C9AHT018M5E_DB" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C9AHT018M5E_DB','MUE','[ESSENTIALS] 버킷 햇', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C9AHT018M5E_DB_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C9AHT018M5E_DB" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C9AHT018M5E_DB','MUE','[ESSENTIALS] 버킷 햇', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 버킷 햇</span>
                                        <span class="price">₩91,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide swiper-slide-next" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C9TTO108M5E_BK" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C9TTO108M5E_BK','MUE','[ESSENTIALS] 로고 스웻셔츠', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C9TTO108M5E_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C9TTO108M5E_BK" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C9TTO108M5E_BK','MUE','[ESSENTIALS] 로고 스웻셔츠', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 로고 스웻셔츠</span>
                                        <span class="price">₩191,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C9TPC030M5E_BK" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C9TPC030M5E_BK','MUE','[ESSENTIALS] 릴렉스 스웻 팬츠', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C9TPC030M5E_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C9TPC030M5E_BK" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C9TPC030M5E_BK','MUE','[ESSENTIALS] 릴렉스 스웻 팬츠', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 릴렉스 스웻 팬츠</span>
                                        <span class="price">₩215,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C9TTO145N3K_YL" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C9TTO145N3K_YL','MUE','[ESSENTIALS] 1977 후드 티셔츠', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C9TTO145N3K_YL_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C9TTO145N3K_YL" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C9TTO145N3K_YL','MUE','[ESSENTIALS] 1977 후드 티셔츠', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 1977 후드 티셔츠</span>
                                        <span class="price">₩155,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C9TTO140N3K_BK" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C9TTO140N3K_BK','MUE','[ESSENTIALS] 레터링 티셔츠', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C9TTO140N3K_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C9TTO140N3K_BK" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C9TTO140N3K_BK','MUE','[ESSENTIALS] 레터링 티셔츠', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 레터링 티셔츠</span>
                                        <span class="price">₩71,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C9TPC044N3K_BK" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C9TPC044N3K_BK','MUE','[ESSENTIALS] 밴딩 스웻쇼츠', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C9TPC044N3K_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C9TPC044N3K_BK" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C9TPC044N3K_BK','MUE','[ESSENTIALS] 밴딩 스웻쇼츠', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 밴딩 스웻쇼츠</span>
                                        <span class="price">₩97,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C7TTO098W5E_BK" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C7TTO098W5E_BK','MUE','[ESSENTIALS] 레터링 티셔츠', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C7TTO098W5E_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C7TTO098W5E_BK" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C7TTO098W5E_BK','MUE','[ESSENTIALS] 레터링 티셔츠', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 레터링 티셔츠</span>
                                        <span class="price">₩87,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C7TDR002W5E_BR" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C7TDR002W5E_BR','MUE','[ESSENTIALS] 레터링 티셔츠 드레스', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C7TDR002W5E_BR_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C7TDR002W5E_BR" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C7TDR002W5E_BR','MUE','[ESSENTIALS] 레터링 티셔츠 드레스', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 레터링 티셔츠 드레스</span>
                                        <span class="price">₩131,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/MU2C7TSC001W5E_YL" class="item_info1" onclick="GA_main('exhibitionListImage0',$(this));setEcommerceDataCompnt('MU2C7TSC001W5E_YL','MUE','[ESSENTIALS] 스트레치 스커트', '0');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/MU/2C/FW/MU2C7TSC001W5E_YL_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/MU2C7TSC001W5E_YL" class="item_info2" onclick="GA_main('exhibitionList0',$(this));setEcommerceDataCompnt('MU2C7TSC001W5E_YL','MUE','[ESSENTIALS] 스트레치 스커트', '0');">
                                        <span class="brand">MUE</span>
                                        <span class="title">[ESSENTIALS] 스트레치 스커트</span>
                                        <span class="price">₩215,000</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                        <div class="edt-swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
                    </div>
                    <div class="swiper-button-next btn0"></div>
                    <div class="swiper-button-prev btn0 swiper-button-disabled"></div>
                </div>
            </div>
            <div class="edt_banner_inner2">
                <div class="edt_banner">
                    <ul>
                        <li>
                            <a href="/ko/magazine/exhibitions/8813263836856" onclick="GA_main('exhibitionBanner',$(this));">
                                <img src="/medias/C-accc.jpg?context=bWFzdGVyfGltYWdlc3wxNzc0NzN8aW1hZ2UvanBlZ3xpbWFnZXMvaDIwL2hjNy85MzM4MjQ5ODcxMzkwLmpwZ3xiNjBjYzA3NmQ3OWY0OTg5NGI1ZWFjZDZiYjA1YzlhNmNkZTYzMGVjZTI4OGIyMjk4NDVlMGIwMDkxNDlkNTQy" alt="기획전 배너">
                                <div class="ban_txt_wrap">
                                    <span class="sticker" style="background:#99a5d7;">style guide</span>
                                    <p class="s_title"><font color="#FFFFFF">인플루언서 PICK 베스트 머플러 스타일링</font></p>
                                    <p class="title"><font color="#FFFFFF">FALL STYLE TIP</font></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="/ko/magazine/exhibitions/8813329307320" onclick="GA_main('exhibitionBanner',$(this));">
                                <img src="/medias/C-minebeauty-01.jpg?context=bWFzdGVyfGltYWdlc3wxMjc0NzJ8aW1hZ2UvanBlZ3xpbWFnZXMvaDQ3L2gyNi85MzM4MjUwMTAwNzY2LmpwZ3xmOWZlOWEyODdmZmZhNzg2OWVhYzRmNjE2YjY5MGE5NmIzYzNjOWZkMzM2NjRiNGM2M2M1MGU2ZWJhZjZkZWYz" alt="기획전 배너">
                                <div class="ban_txt_wrap">
                                    <span class="sticker" style="background:#e99143;">we love</span>
                                    <p class="s_title"><font color="#ffffff">배우 박규영의 우아한 가을 화보</font></p>
                                    <p class="title"><font color="#ffffff">MINE BEAUTY</font></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="/ko/magazine/exhibitions/8813329143480" onclick="GA_main('exhibitionBanner',$(this));">
                                <img src="/medias/221007-C-timehomme-01.jpg?context=bWFzdGVyfGltYWdlc3wxMTE4NDd8aW1hZ2UvanBlZ3xpbWFnZXMvaDFmL2hmNC85MzM4MjUwNTI2NzUwLmpwZ3xkZDE5YjE2YWY5YWMxZTI5OGEyMmE0OGEzMGIyZWYzOGFiMjQyYjc3ODM1MGNlODY1ZTJhZTAwNGExNDJlZWNm" alt="기획전 배너">
                                <div class="ban_txt_wrap">
                                    <span class="sticker" style="background:#e16a6a;">new</span>
                                    <p class="s_title"><font color="#ffffff">타임옴므가 제안하는 아우터 스타일링</font></p>
                                    <p class="title"><font color="#ffffff">WINTER OUTER</font></p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="edt_banner_inner3">
                <div class="edt_banner">
                    <a href="/ko/magazine/exhibitions/8813231068856" onclick="GA_main('exhibitionBanner',$(this));">
                        <img src="/medias/221007-B-obzee.jpg?context=bWFzdGVyfGltYWdlc3wxNzkwNzF8aW1hZ2UvanBlZ3xpbWFnZXMvaDFjL2gzMC85MzM4MjUwNzg4ODk0LmpwZ3wxMTYwNWRiODYzNmNmZTg1ZDIxNTczMjUzZTg4NjZkZGQwYzlmOTQ0NDU4MWZkN2RhZDdhZTE3NThlOGQzMzgw" alt="기획전 배너">
                        <div class="ban_txt_wrap">
                            <span class="sticker" style="background:#99a5d7;">style guide</span>
                            <p class="s_title">
                                <font color="#FFFFFF">오브제 우먼의 무드를 담은 뉴 캠페인</font>
                            </p>
                            <p class="title">
                   <span class="bar-in">
                       <font color="#FFFFFF">JAZZ ON NIGHT</font>
                       <span class="ab-bar left" style="background-color:#FFFFFF;"></span>
					   <span class="ab-bar right" style="background-color:#FFFFFF;"></span>
                   </span>
                            </p>
                        </div>
                    </a>
                </div>
                <div class="edt_list1903">
                    <div class="edt_list_inner swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="edtSlider1903_1">
                        <p class="tit">OBZÉÉ 22FW</p>
                        <ul class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                            <li class="swiper-slide swiper-slide-active" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2CAWJC018W_PK" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2CAWJC018W_PK','OBZEE','[FWOBZEE] 모헤어 블렌드 재킷', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAWJC018W_PK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2CAWJC018W_PK" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2CAWJC018W_PK','OBZEE','[FWOBZEE] 모헤어 블렌드 재킷', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 모헤어 블렌드 재킷</span>
                                        <span class="price">₩895,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide swiper-slide-next" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2CAWSC468W_PK" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2CAWSC468W_PK','OBZEE','[FWOBZEE] 모헤어 블렌드 스커트', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAWSC468W_PK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2CAWSC468W_PK" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2CAWSC468W_PK','OBZEE','[FWOBZEE] 모헤어 블렌드 스커트', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 모헤어 블렌드 스커트</span>
                                        <span class="price">₩525,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2CAWOT006W_LA" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2CAWOT006W_LA','OBZEE','[FWOBZEE] 울 멜란지 하프 코트', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAWOT006W_LA_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2CAWOT006W_LA" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2CAWOT006W_LA','OBZEE','[FWOBZEE] 울 멜란지 하프 코트', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 울 멜란지 하프 코트</span>
                                        <span class="price">₩945,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2C8WPC372W_BK" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2C8WPC372W_BK','OBZEE','[FWOBZEE] 울 블렌드 원턱 와이드 팬츠', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2C8WPC372W_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2C8WPC372W_BK" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2C8WPC372W_BK','OBZEE','[FWOBZEE] 울 블렌드 원턱 와이드 팬츠', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 울 블렌드 원턱 와이드 팬츠</span>
                                        <span class="price">₩425,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2CAWSC471WM1_LV" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2CAWSC471WM1_LV','OBZEE','[FWOBZEE] 페이크 레더 스커트', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAWSC471WM1_LV_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2CAWSC471WM1_LV" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2CAWSC471WM1_LV','OBZEE','[FWOBZEE] 페이크 레더 스커트', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 페이크 레더 스커트</span>
                                        <span class="price">₩545,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2CBWCT015W_IV" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2CBWCT015W_IV','OBZEE','[FWOBZEE] 울 블렌드 하운드투스 코트', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CBWCT015W_IV_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2CBWCT015W_IV" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2CBWCT015W_IV','OBZEE','[FWOBZEE] 울 블렌드 하운드투스 코트', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 울 블렌드 하운드투스 코트</span>
                                        <span class="price">₩1,450,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2CAKTO788W_WT" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2CAKTO788W_WT','OBZEE','[FWOBZEE] 컷아웃 니트 탑', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAKTO788W_WT_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2CAKTO788W_WT" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2CAKTO788W_WT','OBZEE','[FWOBZEE] 컷아웃 니트 탑', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 컷아웃 니트 탑</span>
                                        <span class="price">₩595,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2C9AHT391WS_BK" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2C9AHT391WS_BK','OBZEE','[FWOBZEE] 글리터 라인 헌팅 캡', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2C9AHT391WS_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2C9AHT391WS_BK" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2C9AHT391WS_BK','OBZEE','[FWOBZEE] 글리터 라인 헌팅 캡', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 글리터 라인 헌팅 캡</span>
                                        <span class="price">₩235,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2C7ASZ073W_BK" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2C7ASZ073W_BK','OBZEE','[FWOBZEE] 돔 체인 메리제인 슈즈', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2C7ASZ073W_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2C7ASZ073W_BK" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2C7ASZ073W_BK','OBZEE','[FWOBZEE] 돔 체인 메리제인 슈즈', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 돔 체인 메리제인 슈즈</span>
                                        <span class="price">₩435,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2C9ASZ096W_SV" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2C9ASZ096W_SV','OBZEE','[FWOBZEE] 스퀘어 토 앵클 부츠', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2C9ASZ096W_SV_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2C9ASZ096W_SV" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2C9ASZ096W_SV','OBZEE','[FWOBZEE] 스퀘어 토 앵클 부츠', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 스퀘어 토 앵클 부츠</span>
                                        <span class="price">₩395,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2C9ASZ092W_BK" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2C9ASZ092W_BK','OBZEE','[FWOBZEE] 크리스탈 &amp; 시퀸 라인 앵클 부츠', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2C9ASZ092W_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2C9ASZ092W_BK" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2C9ASZ092W_BK','OBZEE','[FWOBZEE] 크리스탈 &amp; 시퀸 라인 앵클 부츠', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 크리스탈 &amp; 시퀸 라인 앵클 부츠</span>
                                        <span class="price">₩495,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2C7ASZ073WM_WT" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2C7ASZ073WM_WT','OBZEE','[FWOBZEE] 펄 체인 시퀸 메리제인 슈즈', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2C7ASZ073WM_WT_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2C7ASZ073WM_WT" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2C7ASZ073WM_WT','OBZEE','[FWOBZEE] 펄 체인 시퀸 메리제인 슈즈', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 펄 체인 시퀸 메리제인 슈즈</span>
                                        <span class="price">₩435,000</span>
                                    </a>
                                </div>
                            </li>
                            <li class="swiper-slide" style="width: 180px; margin-right: 11px;">
                                <div class="item_box">
                                    <a href="/ko/p/OB2C9ABG193W_BK" class="item_info1" onclick="GA_main('exhibitionListImage1',$(this));setEcommerceDataCompnt('OB2C9ABG193W_BK','OBZEE','[FWOBZEE] 크리스탈 레더 크로스백', '1');">
                           <span class="item_img">
                                <img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2C9ABG193W_BK_T01.jpg/dims/resize/180x272" alt="" class="respon_image">
                           </span>
                                    </a>
                                    <a href="/ko/p/OB2C9ABG193W_BK" class="item_info2" onclick="GA_main('exhibitionList1',$(this));setEcommerceDataCompnt('OB2C9ABG193W_BK','OBZEE','[FWOBZEE] 크리스탈 레더 크로스백', '1');">
                                        <span class="brand">OBZEE</span>
                                        <span class="title">[FWOBZEE] 크리스탈 레더 크로스백</span>
                                        <span class="price">₩465,000</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                        <div class="edt-swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
                    </div>
                    <div class="swiper-button-next btn1"></div>
                    <div class="swiper-button-prev btn1 swiper-button-disabled"></div>
                </div>
            </div>
        </div>


        <!-- new & best -->
        <div class="product_list1903">
            <div class="nbe_cnt new">
                <div class="product_left_menu">
                    <h4 class="tit">신상품</h4>
                    <ul><li class="on">	<a href="javascript:getNewProductList('WE')" onclick="GA_Event('메인', '신상품', '여성');">여성</a></li><li>	<a href="javascript:getNewProductList('ME')" onclick="GA_Event('메인', '신상품', '남성');">남성</a></li><li>	<a href="javascript:getNewProductList('WE03')" onclick="GA_Event('메인', '신상품', '포인트 ACC.');">포인트 ACC.</a></li><li>	<a href="javascript:getNewProductList('WE01')" onclick="GA_Event('메인', '신상품', '셀렉티드');">셀렉티드</a></li></ul>
                </div>
                <div class="nbe_cnt_inner_wrap"><div class="nbe_cnt_inner swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="newListSlider">	<ul class="items_list swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">		<li class="swiper-slide swiper-slide-active">			<div class="item_box">				<a href="/ko/p/TM2C9KCD245W_BK" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(0, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C9KCD245W_BK_W01.jpg/dims/resize/234x353" alt="" name="캐시미어 블렌드 자카드 가디건" class="respon_image">					</span>				</a>				<a href="/ko/p/TM2C9KCD245W_BK" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(0, 'NEW', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩895,000</span>				</a>			</div>		</li>		<li class="swiper-slide swiper-slide-next">			<div class="item_box">				<a href="/ko/p/OB2CAWTO108W_BK" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(1, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAWTO108W_BK_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 비딩 탑" class="respon_image">					</span>				</a>				<a href="/ko/p/OB2CAWTO108W_BK" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(1, 'NEW', 'WE');">					<span class="brand">OBZEE</span>					<span class="price">₩495,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/MN2C8WJC022WP1_LN" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(2, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/MN/2C/FW/MN2C8WJC022WP1_LN_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 칼라리스 재킷" class="respon_image">					</span>				</a>				<a href="/ko/p/MN2C8WJC022WP1_LN" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(2, 'NEW', 'WE');">					<span class="brand">MINE</span>					<span class="price">₩1,150,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SY2CAWOP201W_BG" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(3, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2CAWOP201W_BG_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 레이어 드레스" class="respon_image">					</span>				</a>				<a href="/ko/p/SY2CAWOP201W_BG" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(3, 'NEW', 'WE');">					<span class="brand">SYSTEM</span>					<span class="price">₩595,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/O22C9WOT273W_BK" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(4, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/O2/2C/FW/O22C9WOT273W_BK_W01.jpg/dims/resize/234x353" alt="" name="퀼팅 글리터 체인 패딩 점퍼" class="respon_image">					</span>				</a>				<a href="/ko/p/O22C9WOT273W_BK" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(4, 'NEW', 'WE');">					<span class="brand">O'2nd</span>					<span class="price">₩538,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/MW2CARCT206W_LE" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(5, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/MW/2C/FW/MW2CARCT206W_LE_W01.jpg/dims/resize/234x353" alt="" name="캐시미어 블렌드 더블 코트" class="respon_image">					</span>				</a>				<a href="/ko/p/MW2CARCT206W_LE" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(5, 'NEW', 'WE');">					<span class="brand">CLUB MONACO</span>					<span class="price">₩738,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/IL2CAWJC527W_GY" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(6, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/IL/2C/FW/IL2CAWJC527W_GY_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 트위드 재킷" class="respon_image">					</span>				</a>				<a href="/ko/p/IL2CAWJC527W_GY" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(6, 'NEW', 'WE');">					<span class="brand">LÄTT</span>					<span class="price">₩795,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/O22C9KTO723W_GY" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(7, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/O2/2C/FW/O22C9KTO723W_GY_W01.jpg/dims/resize/234x353" alt="" name="프릴 슬리브리스 니트 탑" class="respon_image">					</span>				</a>				<a href="/ko/p/O22C9KTO723W_GY" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(7, 'NEW', 'WE');">					<span class="brand">O'2nd</span>					<span class="price">₩298,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SY2CAROT418W_IN" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(8, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2CAROT418W_IN_W01.jpg/dims/resize/234x353" alt="" name="캐시미어 블렌드 레터링 재킷" class="respon_image">					</span>				</a>				<a href="/ko/p/SY2CAROT418W_IN" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(8, 'NEW', 'WE');">					<span class="brand">SYSTEM</span>					<span class="price">₩699,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TM2C9WJC244W_BR" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(9, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C9WJC244W_BR_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 체크 재킷" class="respon_image">					</span>				</a>				<a href="/ko/p/TM2C9WJC244W_BR" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(9, 'NEW', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩1,450,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/OB2CAKCD794W_LL" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(10, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAKCD794W_LL_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 부클레 가디건" class="respon_image">					</span>				</a>				<a href="/ko/p/OB2CAKCD794W_LL" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(10, 'NEW', 'WE');">					<span class="brand">OBZEE</span>					<span class="price">₩745,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SJ2C9QOT213W_WG" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(11, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2C9QOT213W_WG_W01.jpg/dims/resize/234x353" alt="" name="플랩 포켓 구스 다운 점퍼" class="respon_image">					</span>				</a>				<a href="/ko/p/SJ2C9QOT213W_WG" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(11, 'NEW', 'WE');">					<span class="brand">SJSJ</span>					<span class="price">₩695,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SY2C8WJS656WM1_DE" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(12, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2C8WJS656WM1_DE_W01.jpg/dims/resize/234x353" alt="" name="디테쳐블 커프스 체크 재킷" class="respon_image">					</span>				</a>				<a href="/ko/p/SY2C8WJS656WM1_DE" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(12, 'NEW', 'WE');">					<span class="brand">SYSTEM</span>					<span class="price">₩559,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/LC2C9WOT152WP1_OG" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(13, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/LC/2C/FW/LC2C9WOT152WP1_OG_W01.jpg/dims/resize/234x353" alt="" name="캐시미어 블렌드 크롭 재킷" class="respon_image">					</span>				</a>				<a href="/ko/p/LC2C9WOT152WP1_OG" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(13, 'NEW', 'WE');">					<span class="brand">LANVIN COLLECTION</span>					<span class="price">₩1,450,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TM2CAWOT761W_BK" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(14, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_W01.jpg/dims/resize/234x353" alt="" name="캐시미어 블렌드 하이넥 점퍼" class="respon_image">					</span>				</a>				<a href="/ko/p/TM2CAWOT761W_BK" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(14, 'NEW', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩845,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/CM2CAWJC416W_LK" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(15, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2CAWJC416W_LK_W01.jpg/dims/resize/234x353" alt="" name="알파카 블렌드 칼라리스 재킷" class="respon_image">					</span>				</a>				<a href="/ko/p/CM2CAWJC416W_LK" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(15, 'NEW', 'WE');">					<span class="brand">the CASHMERE</span>					<span class="price">₩1,250,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/OB2CAWSC482W_GD" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(16, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAWSC482W_GD_W01.jpg/dims/resize/234x353" alt="" name="시퀸 플리츠 스커트" class="respon_image">					</span>				</a>				<a href="/ko/p/OB2CAWSC482W_GD" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(16, 'NEW', 'WE');">					<span class="brand">OBZEE</span>					<span class="price">₩795,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SJ2CAKCD034W_PR" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(17, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2CAKCD034W_PR_W01.jpg/dims/resize/234x353" alt="" name="캐시미어 블렌드 칼라 가디건" class="respon_image">					</span>				</a>				<a href="/ko/p/SJ2CAKCD034W_PR" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(17, 'NEW', 'WE');">					<span class="brand">SJSJ</span>					<span class="price">₩435,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SJ2CANPC351W_MB" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(18, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2CANPC351W_MB_W01.jpg/dims/resize/234x353" alt="" name="크롭 스트레이트 데님 팬츠" class="respon_image">					</span>				</a>				<a href="/ko/p/SJ2CANPC351W_MB" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(18, 'NEW', 'WE');">					<span class="brand">SJSJ</span>					<span class="price">₩295,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/O22C9KTO728W_GY" class="item_info1" onclick="javascript:GA_main('newImg',$(this));setEcommerceData(19, 'NEW', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/O2/2C/FW/O22C9KTO728W_GY_W01.jpg/dims/resize/234x353" alt="" name="울 글리터 라인 니트 탑" class="respon_image">					</span>				</a>				<a href="/ko/p/O22C9KTO728W_GY" class="item_info2" onclick="javascript:GA_main('new',$(this));setEcommerceData(19, 'NEW', 'WE');">					<span class="brand">O'2nd</span>					<span class="price">₩318,000</span>				</a>			</div>		</li>	</ul><div class="swiper-button-next"></div><div class="swiper-button-prev swiper-button-disabled"></div></div></div>
            </div>
            <div class="nbe_cnt best">
                <div class="product_left_menu">
                    <h4 class="tit">베스트</h4>
                    <ul><li class="on">	<a href="javascript:getBestProductList('WE')" onclick="GA_Event('메인', '베스트', '여성');">여성</a></li><li>	<a href="javascript:getBestProductList('ME')" onclick="GA_Event('메인', '베스트', '남성');">남성</a></li></ul>
                </div>
                <div class="nbe_cnt_inner_wrap"><div class="nbe_cnt_inner swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="bestListSlider">	<ul class="items_list swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">		<li class="swiper-slide swiper-slide-active">			<div class="item_box">				<a href="/ko/p/IL2C9TTO870N_BK" class="item_info1" onclick="javascript:setEcommerceData(0, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/IL/2C/FW/IL2C9TTO870N_BK_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 하이넥 탑" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/IL2C9TTO870N_BK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(0, 'BEST', 'WE');">					<span class="brand">LÄTT</span>					<span class="price">₩145,000</span>				</a>			</div>		</li>		<li class="swiper-slide swiper-slide-next">			<div class="item_box">				<a href="/ko/p/YS2C7TTO086WZS_BL" class="item_info1" onclick="javascript:setEcommerceData(1, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/YS/2C/FW/YS2C7TTO086WZS_BL_W01.jpg/dims/resize/234x353" alt="" name="[SAINT JAMES] 밍콰이어 18 티셔츠" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/YS2C7TTO086WZS_BL" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(1, 'BEST', 'WE');">					<span class="brand">FOURM THE STORE</span>					<span class="price">₩108,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/CM2C9KTO002W_BK" class="item_info1" onclick="javascript:setEcommerceData(2, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2C9KTO002W_BK_W01.jpg/dims/resize/234x353" alt="" name="캐시미어 라운드 넥 니트 탑" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/CM2C9KTO002W_BK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(2, 'BEST', 'WE');">					<span class="brand">the CASHMERE</span>					<span class="price">₩395,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TG2C7KTO036NDU_CR" class="item_info1" onclick="javascript:setEcommerceData(3, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TG/2C/FW/TG2C7KTO036NDU_CR_W01.jpg/dims/resize/234x353" alt="" name="[DUNST] 덤홀 커프 스웨터" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/TG2C7KTO036NDU_CR" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(3, 'BEST', 'WE');">					<span class="brand">TOM GREYHOUND</span>					<span class="price">₩89,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TM2C8KTO427W_BK" class="item_info1" onclick="javascript:setEcommerceData(4, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C8KTO427W_BK_W01.jpg/dims/resize/234x353" alt="" name="하이넥 리브 니트 탑" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/TM2C8KTO427W_BK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(4, 'BEST', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩295,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SJ2C8TTO413WM_RE" class="item_info1" onclick="javascript:setEcommerceData(5, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2C8TTO413WM_RE_W01.jpg/dims/resize/234x353" alt="" name="보트넥 스트라이프 티셔츠" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/SJ2C8TTO413WM_RE" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(5, 'BEST', 'WE');">					<span class="brand">SJSJ</span>					<span class="price">₩195,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TM2C9WSC550WP4_BK" class="item_info1" onclick="javascript:setEcommerceData(6, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C9WSC550WP4_BK_W01.jpg/dims/resize/234x353" alt="" name="백 밴딩 플레어 스커트" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/TM2C9WSC550WP4_BK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(6, 'BEST', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩725,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TG2C7KTO037NDU_GY" class="item_info1" onclick="javascript:setEcommerceData(7, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TG/2C/FW/TG2C7KTO037NDU_GY_W01.jpg/dims/resize/234x353" alt="" name="[DUNST] 홀가먼트 라쿤 캐시미어 스웨터" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/TG2C7KTO037NDU_GY" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(7, 'BEST', 'WE');">					<span class="brand">TOM GREYHOUND</span>					<span class="price">₩109,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/CM2C9KOP179W_DB" class="item_info1" onclick="javascript:setEcommerceData(8, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2C9KOP179W_DB_W01.jpg/dims/resize/234x353" alt="" name="[LOUNGE] 캐시미어 홀가먼트 드레스" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/CM2C9KOP179W_DB" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(8, 'BEST', 'WE');">					<span class="brand">the CASHMERE</span>					<span class="price">₩695,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SJ2CAKTO150W_DG" class="item_info1" onclick="javascript:setEcommerceData(9, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2CAKTO150W_DG_W01.jpg/dims/resize/234x353" alt="" name="울 모크넥 리브 탑" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/SJ2CAKTO150W_DG" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(9, 'BEST', 'WE');">					<span class="brand">SJSJ</span>					<span class="price">₩295,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TM2C7NPC303WP1_BK" class="item_info1" onclick="javascript:setEcommerceData(10, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C7NPC303WP1_BK_W01.jpg/dims/resize/234x353" alt="" name="버튼 와이드 데님 팬츠" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/TM2C7NPC303WP1_BK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(10, 'BEST', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩395,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SJ2C9ROT905W_BK" class="item_info1" onclick="javascript:setEcommerceData(11, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2C9ROT905W_BK_W01.jpg/dims/resize/234x353" alt="" name="앙고라 블렌드 재킷" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/SJ2C9ROT905W_BK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(11, 'BEST', 'WE');">					<span class="brand">SJSJ</span>					<span class="price">₩515,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/LC2C9KOT345W_IM" class="item_info1" onclick="javascript:setEcommerceData(12, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/LC/2C/FW/LC2C9KOT345W_IM_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 케이블 스터드 가디건" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/LC2C9KOT345W_IM" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(12, 'BEST', 'WE');">					<span class="brand">LANVIN COLLECTION</span>					<span class="price">₩1,150,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SJ2CANPC351W_MB" class="item_info1" onclick="javascript:setEcommerceData(13, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2CANPC351W_MB_W01.jpg/dims/resize/234x353" alt="" name="크롭 스트레이트 데님 팬츠" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/SJ2CANPC351W_MB" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(13, 'BEST', 'WE');">					<span class="brand">SJSJ</span>					<span class="price">₩295,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TM2C8WTO625W_GY" class="item_info1" onclick="javascript:setEcommerceData(14, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C8WTO625W_GY_W01.jpg/dims/resize/234x353" alt="" name="울 블렌드 케이블 크롭 탑" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/TM2C8WTO625W_GY" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(14, 'BEST', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩260,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SY2C9KOT324W_CR" class="item_info1" onclick="javascript:setEcommerceData(15, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2C9KOT324W_CR_W01.jpg/dims/resize/234x353" alt="" name="울 텍스처 블록 점퍼" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/SY2C9KOT324W_CR" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(15, 'BEST', 'WE');">					<span class="brand">SYSTEM</span>					<span class="price">₩699,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/TM2C9NPC345W_DM" class="item_info1" onclick="javascript:setEcommerceData(16, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C9NPC345W_DM_W01.jpg/dims/resize/234x353" alt="" name="스트레이트 데님 팬츠" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/TM2C9NPC345W_DM" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(16, 'BEST', 'WE');">					<span class="brand">TIME</span>					<span class="price">₩395,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/SY2C9KTO221W_PK" class="item_info1" onclick="javascript:setEcommerceData(17, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2C9KTO221W_PK_W01.jpg/dims/resize/234x353" alt="" name="모헤어 블렌드 칼라 니트 탑" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/SY2C9KTO221W_PK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(17, 'BEST', 'WE');">					<span class="brand">SYSTEM</span>					<span class="price">₩395,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/OB2CAKCD799W_BR" class="item_info1" onclick="javascript:setEcommerceData(18, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/OB/2C/FW/OB2CAKCD799W_BR_W01.jpg/dims/resize/234x353" alt="" name="[FWOBZEE] 라쿤 블렌드 플랩 가디건" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/OB2CAKCD799W_BR" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(18, 'BEST', 'WE');">					<span class="brand">OBZEE</span>					<span class="price">₩565,000</span>				</a>			</div>		</li>		<li class="swiper-slide">			<div class="item_box">				<a href="/ko/p/YS2C9TTS038NZS_BK" class="item_info1" onclick="javascript:setEcommerceData(19, 'BEST', 'WE');">					<span class="item_img">						<img src="http://newmedia.thehandsome.com/YS/2C/FW/YS2C9TTS038NZS_BK_W01.jpg/dims/resize/234x353" alt="" name="[SAINT JAMES] 봉봉 스웻셔츠" class="respon_image" onclick="GA_main('bestImg',$(this))">					</span>				</a>				<a href="/ko/p/YS2C9TTS038NZS_BK" class="item_info2" onclick="javascript:GA_main('best',$(this));setEcommerceData(19, 'BEST', 'WE');">					<span class="brand">FOURM THE STORE</span>					<span class="price">₩158,000</span>				</a>			</div>		</li>	</ul><div class="swiper-button-next"></div><div class="swiper-button-prev swiper-button-disabled"></div></div></div>
            </div>
        </div>
        <!-- new & best -->
    </div>
    <!-- //main_container-->
    <!-- video_main_wrap-->
    <div class="video_main_wrap">
        <h4 class="tit"><spring:theme code="main.video.title"></spring:theme></h4>
        <div class="video_area1903" id="videoDiv1903">
            <a href="javascript:void(0);" onclick="GA_main('exhibitionVideo',$(this));">
                <div class="video_main" style="display: block;">
                    <span class="play_btn"></span>
                    <img src="/medias/D-7th-03.jpg?context=bWFzdGVyfGltYWdlc3wxMDk0NjF8aW1hZ2UvanBlZ3xpbWFnZXMvaGQxL2hhNS85MzM3NjQxNzYyODQ2LmpwZ3w2OWZmMTU1MmYxMGI2MGFkYjk2MGRmOGI4NDA0ZWE0NGYxYTQ2NzhjMGJiMDRjOTg5MzVhODJkOTA2YzIyMmNh" alt="poster">
                </div>
                <video id="video" class="video-js" controls="auto" preload="auto" style="display: none; width:884px; height:auto;" onended="videoEnded('videoDiv1903',0)" width="884" height="auto">
                    <source src="http://s3.ap-northeast-2.amazonaws.com/cdn.thehandsome.com-kr/pc/0_main_video/221005_tvc/2022%20tvc.mp4" type="video/mp4">
                </video>
            </a>
        </div>
        <div class="txt">
            <p class="tit">Some Moments<br>배우 김고은 X 더한섬닷컴</p>
            <p class="s_t">한 순간을 살아도 섬세하게<br>2022 새로운 브랜딩 캠페인을 만나보세요.</p>
        </div>
    </div>
    <!--// video_main_wrap-->
    <!-- main_container-->
    <div class="main_container">
        <!-- the_magazine_wrap1903-->
        <div class="the_magazine_wrap1903">
            <h4 class="tit">THE 매거진</h4>
            <div class="magazine_slider1903 swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="magazinSlider1903">
                <ul class="swiper-wrapper" style="opacity: 1; transform: translate3d(0px, 0px, 0px);"><li class="swiper-slide swiper-slide-active" style="width: 348px; margin-right: 20px;">	<a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804154038044" class="img_wrap" onclick="GA_main('0theMagazine',$(this));">       <img src="http://cdn.thehandsome.com/mobile/news/list/banner/20221004_51458943140487959_ko.jpg/dims/resize/348x352" alt="매거진이미지">	</a>	<div class="txt_wrap">		<p class="magazine_tit">뉴스</p>		<p class="tit">핸써미와 함께하는 <br> '한섬 ESG 친환경 정화설비' 탐구</p>		<p class="s_t">청바지 워싱 과정으로 살펴보는 친환경 폐수 재활용 전략</p>		<a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804154038044" class="detail" onclick="GA_main('0theMagazine',$(this));">자세히 보기</a>	</div></li><li class="swiper-slide swiper-slide-next" style="width: 348px; margin-right: 20px;">	<a href="/ko/magazine/editorials/8806709909576" class="img_wrap" onclick="GA_main('1theMagazine',$(this));">       <img src="http://cdn.thehandsome.com/mobile/editorial/list/banner/20220930_51111045809856703_ko.jpg/dims/resize/348x352" alt="매거진이미지">	</a>	<div class="txt_wrap">		<p class="magazine_tit">#SOME</p>		<p class="tit">두 여행자가 전하는 <br> 커플의 소리</p>		<p class="s_t">#LESONDUCOUPLE's CLOSET</p>		<a href="/ko/magazine/editorials/8806709909576" class="detail" onclick="GA_main('1theMagazine',$(this));">자세히 보기</a>	</div></li><li class="swiper-slide" style="width: 348px; margin-right: 20px;">	<a href="/ko/magazine/editorials/8806677141576" class="img_wrap" onclick="GA_main('2theMagazine',$(this));">       <img src="http://cdn.thehandsome.com/mobile/editorial/list/banner/20220928_50917314663945819_ko.jpg/dims/resize/348x352" alt="매거진이미지">	</a>	<div class="txt_wrap">		<p class="magazine_tit">커버스토리</p>		<p class="tit">언제, 어디서나 폼더스토어</p>		<p class="s_t">BON VOYAGE, FOURM</p>		<a href="/ko/magazine/editorials/8806677141576" class="detail" onclick="GA_main('2theMagazine',$(this));">자세히 보기</a>	</div></li><li class="swiper-slide" style="width: 348px; margin-right: 20px;">	<a href="/ko/magazine/editorials/8806644373576" class="img_wrap" onclick="GA_main('3theMagazine',$(this));">       <img src="http://cdn.thehandsome.com/mobile/editorial/list/banner/20220928_50913400671461362_ko.jpg/dims/resize/348x352" alt="매거진이미지">	</a>	<div class="txt_wrap">		<p class="magazine_tit">#SOME</p>		<p class="tit">여기 우리가 <br> 만나는 곳, 쌤쌤쌤</p>		<p class="s_t">aweSOME life 08. 쌤쌤쌤 @SAMSAMSAM</p>		<a href="/ko/magazine/editorials/8806644373576" class="detail" onclick="GA_main('3theMagazine',$(this));">자세히 보기</a>	</div></li><li class="swiper-slide" style="width: 348px; margin-right: 20px;">	<a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804088534812" class="img_wrap" onclick="GA_main('4theMagazine',$(this));">       <img src="http://cdn.thehandsome.com/mobile/news/list/banner/20220926_50745317219414187_ko.jpg/dims/resize/348x352" alt="매거진이미지">	</a>	<div class="txt_wrap">		<p class="magazine_tit">뉴스</p>		<p class="tit">배우 남윤수와 <br> 함께한 클럽모나코</p>		<p class="s_t">클럽모나코의 룩으로 차려 입은 배우 남윤수의 화보</p>		<a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804088534812" class="detail" onclick="GA_main('4theMagazine',$(this));">자세히 보기</a>	</div></li><li class="swiper-slide" style="width: 348px; margin-right: 20px;">	<a href="/ko/magazine/editorials/8806644406344" class="img_wrap" onclick="GA_main('5theMagazine',$(this));">       <img src="http://cdn.thehandsome.com/pc/editorial/detail/image/20220923_50508128292464737_ko.jpg/dims/resize/348x352" alt="매거진이미지">	</a>	<div class="txt_wrap">		<p class="magazine_tit">위클리 픽</p>		<p class="tit">TRENCH COATS</p>		<p class="s_t">9월의 네 번째 위클리 픽</p>		<a href="/ko/magazine/editorials/8806644406344" class="detail" onclick="GA_main('5theMagazine',$(this));">자세히 보기</a>	</div></li></ul>
            </div>
            <!--add arrow -->
            <div class="themagazine_arrow next" style="opacity: 1;">다음</div>
            <div class="themagazine_arrow prev swiper-button-disabled" style="opacity: 1;">이전</div>
        </div>
        <!-- //the_magazine_wrap1903-->
        <!--배너영역 -->
        <!--//배너영역 -->

        <!-- pick_for-->
        <div class="pickfor_wrap1903">
            <h4 class="tit"><span>당신</span>만을 위한 특별한 추천</h4>
            <div class="pick_for" id="pickForSlider1903">
                <ul class="slides" style="left: 0px; opacity: 1;"><li>   <a href="javascript:goDetailPagebyRecommend('CM2CAWVT495W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=CM2CAWVT495W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(18, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2CAWVT495W_LS_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR08">the CASHMERE</span>
            <span class="title">퀼팅 패딩 베스트</span>
        <span class="price">₩645,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('TG2C7KTO036NDU','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=TG2C7KTO036NDU&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(19, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/TG/2C/FW/TG2C7KTO036NDU_CR_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR15">TOM GREYHOUND</span>
            <span class="title">[DUNST] 덤홀 커프 스웨터</span>
        <span class="price">₩89,000</span>
    </span>
                    <span class="flag"></span>
                </li><li class="slide_active">   <a href="javascript:goDetailPagebyRecommend('SY2C7AMF273W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=SY2C7AMF273W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(0, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2C7AMF273W_IV_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR03">SYSTEM</span>
            <span class="title">울 블렌드 케이블 베스트 머플러</span>
        <span class="price">₩185,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('SH2C8TRN607M','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=SH2C8TRN607M&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(1, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/SH/2C/FW/SH2C8TRN607M_BK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR07">SYSTEM HOMME</span>
            <span class="title">패널 자수 티셔츠</span>
        <span class="price">₩275,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('TM2C8KTO427W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=TM2C8KTO427W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(2, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C8KTO427W_BK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR01">TIME</span>
            <span class="title">하이넥 리브 니트 탑</span>
        <span class="price">₩295,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('SY2C9KTO221W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=SY2C9KTO221W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(3, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2C9KTO221W_PK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR03">SYSTEM</span>
            <span class="title">모헤어 블렌드 칼라 니트 탑</span>
        <span class="price">₩395,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('CM2C9KTO224W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=CM2C9KTO224W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(4, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2C9KTO224W_BK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR08">the CASHMERE</span>
            <span class="title">캐시미어 버튼 업 니트 탑</span>
        <span class="price">₩575,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('IL2C9TTO870N','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=IL2C9TTO870N&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(5, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/IL/2C/FW/IL2C9TTO870N_BK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR31">LÄTT</span>
            <span class="title">울 블렌드 하이넥 탑</span>
        <span class="price">₩145,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('SJ2C9TTO421W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=SJ2C9TTO421W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(6, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2C9TTO421W_BK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR04">SJSJ</span>
            <span class="title">모크넥 리브 티셔츠</span>
        <span class="price">₩175,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('CM2C9KTO002W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=CM2C9KTO002W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(7, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2C9KTO002W_BK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR08">the CASHMERE</span>
            <span class="title">캐시미어 라운드 넥 니트 탑</span>
        <span class="price">₩395,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('MN2C9KCD343W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=MN2C9KCD343W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(8, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/MN/2C/FW/MN2C9KCD343W_BG_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR02">MINE</span>
            <span class="title">알파카 블렌드 니트 가디건</span>
        <span class="price">₩675,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('CM2CAAMF333W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=CM2CAAMF333W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(9, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2CAAMF333W_EK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR08">the CASHMERE</span>
            <span class="title">캐시미어 머플러</span>
        <span class="price">₩195,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('SJ2CAKTO150W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=SJ2CAKTO150W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(10, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2CAKTO150W_DG_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR04">SJSJ</span>
            <span class="title">울 모크넥 리브 탑</span>
        <span class="price">₩295,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('SJ2C8TTO413WM','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=SJ2C8TTO413WM&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(11, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/SJ/2C/FW/SJ2C8TTO413WM_RE_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR04">SJSJ</span>
            <span class="title">보트넥 스트라이프 티셔츠</span>
        <span class="price">₩195,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('SY2C9KOT324W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=SY2C9KOT324W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(12, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/SY/2C/FW/SY2C9KOT324W_CR_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR03">SYSTEM</span>
            <span class="title">울 텍스처 블록 점퍼</span>
        <span class="price">₩699,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('LC2C9KOT345W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=LC2C9KOT345W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(13, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/LC/2C/FW/LC2C9KOT345W_IM_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR19">LANVIN COLLECTION</span>
            <span class="title">울 블렌드 케이블 스터드 가디건</span>
        <span class="price">₩1,150,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('LC2C9WCT745W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=LC2C9WCT745W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(14, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/LC/2C/FW/LC2C9WCT745W_IV_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR19">LANVIN COLLECTION</span>
            <span class="title">울 블렌드 퍼널넥 하프 코트</span>
        <span class="price">₩1,650,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('CM2C9WSC625W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=CM2C9WSC625W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(15, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/CM/2C/FW/CM2C9WSC625W_LK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR08">the CASHMERE</span>
            <span class="title">캐시미어 블렌드 핸드메이드 스커트</span>
        <span class="price">₩525,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('TM2C9WSC550WP4','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=TM2C9WSC550WP4&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(16, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2C9WSC550WP4_BK_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR01">TIME</span>
            <span class="title">백 밴딩 플레어 스커트</span>
        <span class="price">₩725,000</span>
    </span>
                    <span class="flag"></span>
                </li><li>   <a href="javascript:goDetailPagebyRecommend('TM2CAWOTS61W','https://lc.recopick.com/1/banner/1919/pick?uid=84618628.1664171908900&amp;source=&amp;pick=TM2CAWOTS61W&amp;method=46&amp;channel=main&amp;reco_type=user-item&amp;product_type=R&amp;reco_list=%5B%22IL2C9TTO870N%22%2C%22SY2C7AMF273W%22%2C%22TM2C9WSC550WP4%22%2C%22SJ2CAKTO150W%22%2C%22SY2C9KTO221W%22%2C%22TM2CAWCT573W%22%2C%22TM2C8KTO427W%22%2C%22TM2C9KCDS42W%22%2C%22TG2C7KTO036NDU%22%2C%22SJ2C8TTO413WM%22%2C%22CM2C9WSC625W%22%2C%22CM2C9KTO002W%22%2C%22SY2C9KOT324W%22%2C%22TM2C9KCD247W%22%2C%22LC2C9KOT345W%22%2C%22SJ2CANPC351W%22%2C%22TM2CAWOTS61W%22%2C%22MN2C9KCD343W%22%2C%22LC2C9WCT745W%22%2C%22CM2CAAMF333W%22%2C%22SJ2C9TTO421W%22%2C%22TM2C9KTO452W%22%2C%22MN2CANPC361WP%22%2C%22CM2C9KTO224W%22%2C%22CM2CAWVT495W%22%2C%22SH2C8TRN607M%22%5D&amp;tag=D')" class="item_info1" onclick="javascript:GA_main('recommend',$(this));setEcommerceData(17, 'RECOMMEND', '');">        <img src="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOTS61W_DN_S01.jpg/dims/resize/289x289">
                </a>    <span class="item_info2">            <span class="brand BR01">TIME</span>
            <span class="title">울 블렌드 자수 재킷</span>
        <span class="price">₩1,250,000</span>
    </span>
                    <span class="flag"></span>
                </li></ul>
            </div>
            <div class="controls" id="pickforControls">
                <a href="#;" class="prev" style="opacity: 1;"></a>
                <a href="#;" class="next" style="opacity: 1;"></a>
            </div>
        </div>
        <!--// pick_for-->
    </div>
    <!-- //main_container-->
    <!-- instagram -->
    <div class="instagram_wrap1903" style="display:none">
        <div class="txt_wrap">
            <h4 class="tit"># THE HANDSOME MOMENT</h4>
            <p class="s_title">한섬 브랜드 공식 인스타그램 속 사진을 감상하세요.</p>
        </div>
        <div class="pic_wrap swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="instaContents">
            <ul class="swiper-wrapper" style="transition-duration: 0ms;"><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thsofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thehandsome_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">스포트라이트 온 🛎
                SYSTEM (#SY2A5WOP947W)
                ⠀
                시원한 텍스처를 자랑하는 원피스. 마치 원피스 위에 니트 탑을 겹쳐 입은 듯한 레이어드 디자인이 특징입니다. 캐주얼하게 또는 포멀하게 입어보세요.
                ⠀
                🏷 딱 일주일만 10% 할인 쿠폰을 드립니다(~7/3)
                ⠀
                ✔️ 더한섬닷컴 - [THE매거진] 스포트라이트 온
                ⠀
                #더한섬닷컴#한섬#handsome#thehandsomecom#瀚纤#더매거진#스포트라이트온#시스템#system#드레스#dress</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_timeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@time___official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">#TimeRenewal  #현대본점 #caspermuellerkneer
                시간과 같이 유한 하지만 무한한 자연을 모티브로 연속되는 형태, 관계, 속성들이 계속 변화하는 모습의 공간.
                변화를 유연하게 받아 들이고 시대를 대표하는 브랜드의 여성을 공간에 녹이다.
                자연과 시간의 흐름의 연계성…</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_mineofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@mine___official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">MINE [2020 S/S CAMPAIGN]

                Wearing your summer with a #MYSTIC_TRAVELLER style

                #MINE #마인 #한섬 #MINE_20SS #summer #collection #fashion #resort #look  #summerfashion #resortlook #SS2020 #lookbook</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_systemofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@systemofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">📎#SYSTEM 20SS CAMPAIGN

                1990-2020
                WORK IN PROGRESS:

                #WORKINPROGRESS_SYSTEM

                #시스템#시스템옴므#SYSTEM2020#SYSTEMhomme
                #SYSTEM20SS#SYSTEMhomme20SS</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_sjsjofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@sjsjofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[SJSJ 20 Summer Capsule Collection]
                Life is a Journey ; Artistic Escape
                -
                려원과 그녀의 절친이자 아티스트인 임수미와의 브이로그 마지막편 #4
                서로에게 너무나 고마운 존재🦄
                -
                #SJSJArtisticEscape #SJSJ #에스제이</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_timehofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@timehomme_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">.
                TIME HOMME X gb20
                .
                🔎gb20이란?
                - 0.1% VVIP들의 피부를 책임져온 30여년의 임상경험과 글로벌 바이오 기업이 만나 탄생한 프리미엄 화장품 브랜드입니다.
                .
                🔎Super EGF
                - 피부 재생을 촉진시키는 성분의 대명사로 알려진 EGF보다 3배 이상 높은 투과율, 흡수력으로 더욱 강력한 효능을 발휘
                .
                🔎QUAD CORE ELEMENTS
                - 최상의 원료(Super EGF, 콜라겐, 베타글루탄, 나이아신아마이드)를 결합하여 압도적인 주름개선 및 미백효과를 선사
                .
                타임옴므에서 특별한 '선크림'을 선보입니다. 유해 자극을 최소화하여 피부에 자극이 적고 발림성이 산뜻한 무기 자외선 차단제입니다. 타임옴므의 첫 뷰티 아이템을 한정 기간 사은품으로 만나보세요!
                .
                - 기간: 4/30(목)-5/17(일)
                - 장소: 전국 타임옴므 매장 및 더한섬닷컴
                - 대상: 80만원 이상 구매고객 (선착순)
                .
                #타임옴므 #TIMEHOMME #선크림 #SUNBLOCK</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmereofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmere_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                [더캐시미어의 작업실]
                .
                최상의 원사에 새 숨결을 불어넣는 더캐시미어의 장인들.
                그 정교하고 섬세한 순간을 감상하세요.
                -
                #더캐시미어_작업실
                #theCASHMERE #더캐시미어
                #theCASHMERE_20SS #한섬</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmerethings.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmerethings</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">#띵스홈
                .
                LOOK DIFFERENT!
                더캐시미어띵스가 제안하는 작지만 큰 만족을 주는 아트 오브제들
                .
                ✔️코펜하겐에 위치한 더 포스터 클럽의 아트 포스터
                ✔️북유럽 디자인의 다양한 라이프스타일 아이템을 선보이는 HK LIVING의 세라믹 화병
                -
                #THEPOSTERCLUB #HKLIVING by #더캐시미어띵스 #thecashmerethings</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmerekids.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmerekids</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                ⓔⓝⓙⓞⓨ ⓢⓤⓜⓜⓔⓡ☀
                .
                덴마크 브랜드 LIEWOOD(리우드)는 어린시절의 부드러움과 순수함, 현대 가정의 라이프스타일을 존중합니다.
                .
                ✔️프릴 장식으로 러블리한 느낌을 살린 원피스 수영복
                -
                #더캐시미어키즈 #thecashmerekids #한섬
                #liewood #리우드 by @thecashmerekids</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_lattbyt.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@lattbyt</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">'초록우산 재단'어린이들의 그림이 래트바이티의 티셔츠와 스카프로 재탄생되었습니다. 아이들의 꽃 같은 마음과 희망을 담은 콜라보레이션 아이템을 더한섬닷컴에서 만나보세요. .
                #LATTBYT #래트바이티 #20SS</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="10">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_obzeeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@obzee_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                • OBZÉÉ X 이하늬 •
                .
                이하늬(@honey_lee32)와 함께한 오브제의 2020 FALL
                캠페인 촬영 현장을 깜작 방문한 SBS '본격연예 한밤' 팀📹
                .
                곧 공개될 그녀의 간절기 스타일링을 미리 감상하세요✨
                -
                #오브제 #OBZEE #한섬
                #OBZEE_20FALL #이하늬</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="11">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_tomgreyhound.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@tomgreyhound</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[TOM’S PICK]
                -
                SUMMER LINNEN SET-UP
                여름에도 셋업을 즐기는 방법. 캐주얼과 포멀의 그 중간을 찾는다면 린넨 셋업은 어떠세요? 톰그레이하운드의 린넨 셋업은 브랜드만의 감성을 담은 볼륨감 있는 슬리브로 유니크한 실루엣을 연출합니다✨

                #TOMGREYHOUND #톰그레이하운드
                #TOMSTAGRAM #톰스타그램
                #theHANDSOMEmoment</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="12">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_deckeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@deckeofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">⚡️덱케 노필터TV 기념 댓글 이벤트⚡️ .
                .
                패셔니스타 김나영님의 노필터TV 에서 선보여 더욱 특별한 덱케 가방들🙏🏻
                .
                가장 마음에 드는 노필터TV 속 제품을 골라주세요!
                .
                여름철 입고 싶은 스타일링팁과 함께 댓글을 남겨주시면 추첨을 통해 총 7분께 대표 아이템 각 1개씩을 선물해드립니다!
                .
                .
                ⭐️당첨혜택 : 노필터TV 소개제품 총 7종 1개씩 제공, 총 7명
                (클레프 캔버스 / 드로우 / 플로우 / 하프 쇼퍼 / 플로우 호보 / 줄리하프 / 오르간 크로커)
                - ⭐️이벤트 기간 : 2020년 6월 29일(월) ~ 2020년 7월 19일(일)
                -
                ⭐️결과 발표 : 2020년 7월 24일(금), 당첨자 DM 개별연락
                .
                ⭐️참여방법 : 덱케 공식 인스타그램(@deckeofficial)을 팔로우하고 이 게시물에 댓글로 스타일링 팁과 갖고싶은 가방 이름 남기기
                [당첨 TIP : 친구 계정을 댓글에 태그하면 당첨확률 UP UP!]</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="13">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thshaus.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thehandsomehaus</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">🏠 STAFF TODAY
                더한섬하우스 스태프의 한섬 룩.
                당장이라도 훌쩍 떠나고 싶은 #더한섬하우스제주 스태프의 여름 스타일링을 소개합니다.
                착용한 아이템 모두 #랑방컬렉션 제품으로, 더한섬하우스 #ARCHIVE 매장에서 만나보세요!
                -
                #더한섬하우스 #더한섬하우스광주 #더한섬하우스제주 #한섬 #신상 #데일리룩 #THEHANDSOMEHAUS #HANDSOME #WOMENSFASHION #LANVINCOLLECTION</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="14">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_o2nd.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@o2nd_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[SEASON OFF]
                🌷오즈세컨 시즌오프가 시작됩니다.🌷
                눈여겨본 아이템을 할인혜택과 함께 만나볼 수 있는 기회! 많은 관심 부탁드립니다

                기간 : 2020년 6월 12일 ~ 시즌 종료 시
                혜택 : 30%할인(*일부품목 제외)

                #오즈세컨 #o2nd #한섬 #handsome #시즌오프 #seasonoff #sale</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="0">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thsofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thehandsome_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">스포트라이트 온 🛎
                SYSTEM (#SY2A5WOP947W)
                ⠀
                시원한 텍스처를 자랑하는 원피스. 마치 원피스 위에 니트 탑을 겹쳐 입은 듯한 레이어드 디자인이 특징입니다. 캐주얼하게 또는 포멀하게 입어보세요.
                ⠀
                🏷 딱 일주일만 10% 할인 쿠폰을 드립니다(~7/3)
                ⠀
                ✔️ 더한섬닷컴 - [THE매거진] 스포트라이트 온
                ⠀
                #더한섬닷컴#한섬#handsome#thehandsomecom#瀚纤#더매거진#스포트라이트온#시스템#system#드레스#dress</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="1">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_timeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@time___official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">#TimeRenewal  #현대본점 #caspermuellerkneer
                시간과 같이 유한 하지만 무한한 자연을 모티브로 연속되는 형태, 관계, 속성들이 계속 변화하는 모습의 공간.
                변화를 유연하게 받아 들이고 시대를 대표하는 브랜드의 여성을 공간에 녹이다.
                자연과 시간의 흐름의 연계성…</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="2">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_mineofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@mine___official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">MINE [2020 S/S CAMPAIGN]

                Wearing your summer with a #MYSTIC_TRAVELLER style

                #MINE #마인 #한섬 #MINE_20SS #summer #collection #fashion #resort #look  #summerfashion #resortlook #SS2020 #lookbook</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="3">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_systemofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@systemofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">📎#SYSTEM 20SS CAMPAIGN

                1990-2020
                WORK IN PROGRESS:

                #WORKINPROGRESS_SYSTEM

                #시스템#시스템옴므#SYSTEM2020#SYSTEMhomme
                #SYSTEM20SS#SYSTEMhomme20SS</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="4">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_sjsjofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@sjsjofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[SJSJ 20 Summer Capsule Collection]
                Life is a Journey ; Artistic Escape
                -
                려원과 그녀의 절친이자 아티스트인 임수미와의 브이로그 마지막편 #4
                서로에게 너무나 고마운 존재🦄
                -
                #SJSJArtisticEscape #SJSJ #에스제이</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="5">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_timehofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@timehomme_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">.
                TIME HOMME X gb20
                .
                🔎gb20이란?
                - 0.1% VVIP들의 피부를 책임져온 30여년의 임상경험과 글로벌 바이오 기업이 만나 탄생한 프리미엄 화장품 브랜드입니다.
                .
                🔎Super EGF
                - 피부 재생을 촉진시키는 성분의 대명사로 알려진 EGF보다 3배 이상 높은 투과율, 흡수력으로 더욱 강력한 효능을 발휘
                .
                🔎QUAD CORE ELEMENTS
                - 최상의 원료(Super EGF, 콜라겐, 베타글루탄, 나이아신아마이드)를 결합하여 압도적인 주름개선 및 미백효과를 선사
                .
                타임옴므에서 특별한 '선크림'을 선보입니다. 유해 자극을 최소화하여 피부에 자극이 적고 발림성이 산뜻한 무기 자외선 차단제입니다. 타임옴므의 첫 뷰티 아이템을 한정 기간 사은품으로 만나보세요!
                .
                - 기간: 4/30(목)-5/17(일)
                - 장소: 전국 타임옴므 매장 및 더한섬닷컴
                - 대상: 80만원 이상 구매고객 (선착순)
                .
                #타임옴므 #TIMEHOMME #선크림 #SUNBLOCK</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="6">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmereofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmere_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                [더캐시미어의 작업실]
                .
                최상의 원사에 새 숨결을 불어넣는 더캐시미어의 장인들.
                그 정교하고 섬세한 순간을 감상하세요.
                -
                #더캐시미어_작업실
                #theCASHMERE #더캐시미어
                #theCASHMERE_20SS #한섬</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="7">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmerethings.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmerethings</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">#띵스홈
                .
                LOOK DIFFERENT!
                더캐시미어띵스가 제안하는 작지만 큰 만족을 주는 아트 오브제들
                .
                ✔️코펜하겐에 위치한 더 포스터 클럽의 아트 포스터
                ✔️북유럽 디자인의 다양한 라이프스타일 아이템을 선보이는 HK LIVING의 세라믹 화병
                -
                #THEPOSTERCLUB #HKLIVING by #더캐시미어띵스 #thecashmerethings</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="8">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmerekids.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmerekids</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                ⓔⓝⓙⓞⓨ ⓢⓤⓜⓜⓔⓡ☀
                .
                덴마크 브랜드 LIEWOOD(리우드)는 어린시절의 부드러움과 순수함, 현대 가정의 라이프스타일을 존중합니다.
                .
                ✔️프릴 장식으로 러블리한 느낌을 살린 원피스 수영복
                -
                #더캐시미어키즈 #thecashmerekids #한섬
                #liewood #리우드 by @thecashmerekids</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="9">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_lattbyt.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@lattbyt</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">'초록우산 재단'어린이들의 그림이 래트바이티의 티셔츠와 스카프로 재탄생되었습니다. 아이들의 꽃 같은 마음과 희망을 담은 콜라보레이션 아이템을 더한섬닷컴에서 만나보세요. .
                #LATTBYT #래트바이티 #20SS</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="10">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_obzeeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@obzee_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                • OBZÉÉ X 이하늬 •
                .
                이하늬(@honey_lee32)와 함께한 오브제의 2020 FALL
                캠페인 촬영 현장을 깜작 방문한 SBS '본격연예 한밤' 팀📹
                .
                곧 공개될 그녀의 간절기 스타일링을 미리 감상하세요✨
                -
                #오브제 #OBZEE #한섬
                #OBZEE_20FALL #이하늬</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="11">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_tomgreyhound.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@tomgreyhound</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[TOM’S PICK]
                -
                SUMMER LINNEN SET-UP
                여름에도 셋업을 즐기는 방법. 캐주얼과 포멀의 그 중간을 찾는다면 린넨 셋업은 어떠세요? 톰그레이하운드의 린넨 셋업은 브랜드만의 감성을 담은 볼륨감 있는 슬리브로 유니크한 실루엣을 연출합니다✨

                #TOMGREYHOUND #톰그레이하운드
                #TOMSTAGRAM #톰스타그램
                #theHANDSOMEmoment</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="12">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_deckeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@deckeofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">⚡️덱케 노필터TV 기념 댓글 이벤트⚡️ .
                .
                패셔니스타 김나영님의 노필터TV 에서 선보여 더욱 특별한 덱케 가방들🙏🏻
                .
                가장 마음에 드는 노필터TV 속 제품을 골라주세요!
                .
                여름철 입고 싶은 스타일링팁과 함께 댓글을 남겨주시면 추첨을 통해 총 7분께 대표 아이템 각 1개씩을 선물해드립니다!
                .
                .
                ⭐️당첨혜택 : 노필터TV 소개제품 총 7종 1개씩 제공, 총 7명
                (클레프 캔버스 / 드로우 / 플로우 / 하프 쇼퍼 / 플로우 호보 / 줄리하프 / 오르간 크로커)
                - ⭐️이벤트 기간 : 2020년 6월 29일(월) ~ 2020년 7월 19일(일)
                -
                ⭐️결과 발표 : 2020년 7월 24일(금), 당첨자 DM 개별연락
                .
                ⭐️참여방법 : 덱케 공식 인스타그램(@deckeofficial)을 팔로우하고 이 게시물에 댓글로 스타일링 팁과 갖고싶은 가방 이름 남기기
                [당첨 TIP : 친구 계정을 댓글에 태그하면 당첨확률 UP UP!]</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="13">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thshaus.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thehandsomehaus</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">🏠 STAFF TODAY
                더한섬하우스 스태프의 한섬 룩.
                당장이라도 훌쩍 떠나고 싶은 #더한섬하우스제주 스태프의 여름 스타일링을 소개합니다.
                착용한 아이템 모두 #랑방컬렉션 제품으로, 더한섬하우스 #ARCHIVE 매장에서 만나보세요!
                -
                #더한섬하우스 #더한섬하우스광주 #더한섬하우스제주 #한섬 #신상 #데일리룩 #THEHANDSOMEHAUS #HANDSOME #WOMENSFASHION #LANVINCOLLECTION</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide" data-swiper-slide-index="14">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_o2nd.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@o2nd_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[SEASON OFF]
                🌷오즈세컨 시즌오프가 시작됩니다.🌷
                눈여겨본 아이템을 할인혜택과 함께 만나볼 수 있는 기회! 많은 관심 부탁드립니다

                기간 : 2020년 6월 12일 ~ 시즌 종료 시
                혜택 : 30%할인(*일부품목 제외)

                #오즈세컨 #o2nd #한섬 #handsome #시즌오프 #seasonoff #sale</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thsofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thehandsome_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">스포트라이트 온 🛎
                SYSTEM (#SY2A5WOP947W)
                ⠀
                시원한 텍스처를 자랑하는 원피스. 마치 원피스 위에 니트 탑을 겹쳐 입은 듯한 레이어드 디자인이 특징입니다. 캐주얼하게 또는 포멀하게 입어보세요.
                ⠀
                🏷 딱 일주일만 10% 할인 쿠폰을 드립니다(~7/3)
                ⠀
                ✔️ 더한섬닷컴 - [THE매거진] 스포트라이트 온
                ⠀
                #더한섬닷컴#한섬#handsome#thehandsomecom#瀚纤#더매거진#스포트라이트온#시스템#system#드레스#dress</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_timeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@time___official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">#TimeRenewal  #현대본점 #caspermuellerkneer
                시간과 같이 유한 하지만 무한한 자연을 모티브로 연속되는 형태, 관계, 속성들이 계속 변화하는 모습의 공간.
                변화를 유연하게 받아 들이고 시대를 대표하는 브랜드의 여성을 공간에 녹이다.
                자연과 시간의 흐름의 연계성…</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_mineofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@mine___official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">MINE [2020 S/S CAMPAIGN]

                Wearing your summer with a #MYSTIC_TRAVELLER style

                #MINE #마인 #한섬 #MINE_20SS #summer #collection #fashion #resort #look  #summerfashion #resortlook #SS2020 #lookbook</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_systemofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@systemofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">📎#SYSTEM 20SS CAMPAIGN

                1990-2020
                WORK IN PROGRESS:

                #WORKINPROGRESS_SYSTEM

                #시스템#시스템옴므#SYSTEM2020#SYSTEMhomme
                #SYSTEM20SS#SYSTEMhomme20SS</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_sjsjofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@sjsjofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[SJSJ 20 Summer Capsule Collection]
                Life is a Journey ; Artistic Escape
                -
                려원과 그녀의 절친이자 아티스트인 임수미와의 브이로그 마지막편 #4
                서로에게 너무나 고마운 존재🦄
                -
                #SJSJArtisticEscape #SJSJ #에스제이</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_timehofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@timehomme_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">.
                TIME HOMME X gb20
                .
                🔎gb20이란?
                - 0.1% VVIP들의 피부를 책임져온 30여년의 임상경험과 글로벌 바이오 기업이 만나 탄생한 프리미엄 화장품 브랜드입니다.
                .
                🔎Super EGF
                - 피부 재생을 촉진시키는 성분의 대명사로 알려진 EGF보다 3배 이상 높은 투과율, 흡수력으로 더욱 강력한 효능을 발휘
                .
                🔎QUAD CORE ELEMENTS
                - 최상의 원료(Super EGF, 콜라겐, 베타글루탄, 나이아신아마이드)를 결합하여 압도적인 주름개선 및 미백효과를 선사
                .
                타임옴므에서 특별한 '선크림'을 선보입니다. 유해 자극을 최소화하여 피부에 자극이 적고 발림성이 산뜻한 무기 자외선 차단제입니다. 타임옴므의 첫 뷰티 아이템을 한정 기간 사은품으로 만나보세요!
                .
                - 기간: 4/30(목)-5/17(일)
                - 장소: 전국 타임옴므 매장 및 더한섬닷컴
                - 대상: 80만원 이상 구매고객 (선착순)
                .
                #타임옴므 #TIMEHOMME #선크림 #SUNBLOCK</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmereofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmere_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                [더캐시미어의 작업실]
                .
                최상의 원사에 새 숨결을 불어넣는 더캐시미어의 장인들.
                그 정교하고 섬세한 순간을 감상하세요.
                -
                #더캐시미어_작업실
                #theCASHMERE #더캐시미어
                #theCASHMERE_20SS #한섬</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmerethings.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmerethings</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">#띵스홈
                .
                LOOK DIFFERENT!
                더캐시미어띵스가 제안하는 작지만 큰 만족을 주는 아트 오브제들
                .
                ✔️코펜하겐에 위치한 더 포스터 클럽의 아트 포스터
                ✔️북유럽 디자인의 다양한 라이프스타일 아이템을 선보이는 HK LIVING의 세라믹 화병
                -
                #THEPOSTERCLUB #HKLIVING by #더캐시미어띵스 #thecashmerethings</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thecashmerekids.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thecashmerekids</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                ⓔⓝⓙⓞⓨ ⓢⓤⓜⓜⓔⓡ☀
                .
                덴마크 브랜드 LIEWOOD(리우드)는 어린시절의 부드러움과 순수함, 현대 가정의 라이프스타일을 존중합니다.
                .
                ✔️프릴 장식으로 러블리한 느낌을 살린 원피스 수영복
                -
                #더캐시미어키즈 #thecashmerekids #한섬
                #liewood #리우드 by @thecashmerekids</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="9">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_lattbyt.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@lattbyt</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">'초록우산 재단'어린이들의 그림이 래트바이티의 티셔츠와 스카프로 재탄생되었습니다. 아이들의 꽃 같은 마음과 희망을 담은 콜라보레이션 아이템을 더한섬닷컴에서 만나보세요. .
                #LATTBYT #래트바이티 #20SS</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="10">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_obzeeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@obzee_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">-
                • OBZÉÉ X 이하늬 •
                .
                이하늬(@honey_lee32)와 함께한 오브제의 2020 FALL
                캠페인 촬영 현장을 깜작 방문한 SBS '본격연예 한밤' 팀📹
                .
                곧 공개될 그녀의 간절기 스타일링을 미리 감상하세요✨
                -
                #오브제 #OBZEE #한섬
                #OBZEE_20FALL #이하늬</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="11">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_tomgreyhound.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@tomgreyhound</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[TOM’S PICK]
                -
                SUMMER LINNEN SET-UP
                여름에도 셋업을 즐기는 방법. 캐주얼과 포멀의 그 중간을 찾는다면 린넨 셋업은 어떠세요? 톰그레이하운드의 린넨 셋업은 브랜드만의 감성을 담은 볼륨감 있는 슬리브로 유니크한 실루엣을 연출합니다✨

                #TOMGREYHOUND #톰그레이하운드
                #TOMSTAGRAM #톰스타그램
                #theHANDSOMEmoment</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="12">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_deckeofficial.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@deckeofficial</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">⚡️덱케 노필터TV 기념 댓글 이벤트⚡️ .
                .
                패셔니스타 김나영님의 노필터TV 에서 선보여 더욱 특별한 덱케 가방들🙏🏻
                .
                가장 마음에 드는 노필터TV 속 제품을 골라주세요!
                .
                여름철 입고 싶은 스타일링팁과 함께 댓글을 남겨주시면 추첨을 통해 총 7분께 대표 아이템 각 1개씩을 선물해드립니다!
                .
                .
                ⭐️당첨혜택 : 노필터TV 소개제품 총 7종 1개씩 제공, 총 7명
                (클레프 캔버스 / 드로우 / 플로우 / 하프 쇼퍼 / 플로우 호보 / 줄리하프 / 오르간 크로커)
                - ⭐️이벤트 기간 : 2020년 6월 29일(월) ~ 2020년 7월 19일(일)
                -
                ⭐️결과 발표 : 2020년 7월 24일(금), 당첨자 DM 개별연락
                .
                ⭐️참여방법 : 덱케 공식 인스타그램(@deckeofficial)을 팔로우하고 이 게시물에 댓글로 스타일링 팁과 갖고싶은 가방 이름 남기기
                [당첨 TIP : 친구 계정을 댓글에 태그하면 당첨확률 UP UP!]</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="13">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_thshaus.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@thehandsomehaus</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">🏠 STAFF TODAY
                더한섬하우스 스태프의 한섬 룩.
                당장이라도 훌쩍 떠나고 싶은 #더한섬하우스제주 스태프의 여름 스타일링을 소개합니다.
                착용한 아이템 모두 #랑방컬렉션 제품으로, 더한섬하우스 #ARCHIVE 매장에서 만나보세요!
                -
                #더한섬하우스 #더한섬하우스광주 #더한섬하우스제주 #한섬 #신상 #데일리룩 #THEHANDSOMEHAUS #HANDSOME #WOMENSFASHION #LANVINCOLLECTION</p>		</div>	</a>	<div class="insta_cover_dim"></div></li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="14">    <a href="/ko/magazine/instagram" onclick="GA_main('moment',$(this))">       <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/instagram_video_thumb_283.jpg'">		<div class="insta_account1903">			<div class="account">				<div class="img_wrap">					<img src="http://cdn.thehandsome.com/pc/brand/insta_o2nd.jpg/dims/resize/50x50" alt="brandimg">				</div>				<p>@o2nd_official</p>			</div>		</div>		<div class="insta_pic_info" style="display: none;"></div>		<div class="insta_pic_info_txt" style="display: none;">			<p class="title">[SEASON OFF]
                🌷오즈세컨 시즌오프가 시작됩니다.🌷
                눈여겨본 아이템을 할인혜택과 함께 만나볼 수 있는 기회! 많은 관심 부탁드립니다

                기간 : 2020년 6월 12일 ~ 시즌 종료 시
                혜택 : 30%할인(*일부품목 제외)

                #오즈세컨 #o2nd #한섬 #handsome #시즌오프 #seasonoff #sale</p>		</div>	</a>	<div class="insta_cover_dim"></div></li></ul>
            <div class="instagram_arrow next">다음</div>
            <div class="instagram_arrow prev">이전</div>
        </div>
        <a href="/ko/magazine/instagram" class="insta_view_more">전체보기</a>
    </div>
    <!-- //instagram -->
</div>

<!-- //bodyWrap -->
<div class="layerArea" id="hpMemberLayer" style="display:none;">
    <div class="layerBg" style="display:block;" tabindex="-1"></div>
    <div class="popwrap w_type_8" id="" style="position: absolute; z-index: 201; display: block;top:50%;margin-top:-283px;" tabindex="-1">
        <!-- Title1 -->
        <div class="pop_tltwrap3">
            <h3>현대백화점 통합회원 가입 안내</h3>
        </div>
        <!-- //Title1 -->
        <div class="pop_cnt">
            <div class="hpoint">
                <p class="txt">현대백화점 통합회원으로 가입 시<br>현대백화점그룹의 관계사 사이트를 동시에 이용하실 수 있으며,<br>각종 혜택을 누리실 수 있습니다.</p>
                <p class="img"><img src="/_ui/desktop/common/images/popup/main_popup_hpoint.jpg" style="vertical-align:top" alt=""></p>
                <div class="noticeTxt">
                    <p>동의하실 경우 다음의 정보가 공유됩니다.</p>
                    <p>- 제공받는자 : (주)현대백화점</p>
                    <p>- 목적 : 회원가입 시 필수정보 입력, 기 가입여부, 타인과의 아이디 중복여부 확인</p>
                    <p>- 항목 : 성명, 아이디, 생년월일, 전화번호, 이메일</p>
                </div>
                <div class="btnwrap mt30">
                    <input class="btn gray" value="동의하고 회원가입 진행" type="button" style="width:200px" onclick="hpoinJoin();">
                    <input class="btn wt" value="쇼핑 계속하기" type="button" style="width:200px" onclick="layerPopup3('close');">
                </div>
            </div>
        </div>
        <div class="grayBox">
            <input type="checkbox" id="memPop" name="memPop" onclick="layerPopup3('close');"><label for="chk1">다시보지않기</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" id="oweek" name="oweek" onclick="layerPopup3('oneweek');"><label for="chk2">1주일동안 열지 않음</label>
        </div>
        <!-- btn_close -->
        <a href="#" class="btn_close" id="closeLayerPop" onclick="layerPopup3('close');"><img src="/_ui/desktop/common/images/popup/ico_close.png"></a>
        <!-- //btn_close -->
    </div>
</div>
<!--  criteo 메인 페이지 트래커 START -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">


    var banner1 = $(".banner1");
    var banner2 = $(".banner2");
    var leftCnt = 0;
    var rightCnt = 0;
    if(banner1.length > 1){
        $.each($(".banner1"), function(i) {
            if($(this).hasClass("banner1_Y")){
                $(this).show();
                leftCnt++;
                return false;
            }
        });
    }
    if(leftCnt == 0){
        $(".banner1").eq(0).show();
    }
    if(banner2.length > 1){
        $.each($(".banner2"), function(i) {
            if($(this).hasClass("banner2_Y")){
                $(this).show();
                rightCnt++;
                return false;
            }
        });
    }
    if(rightCnt == 0){
        $(".banner2").eq(0).show();
    }
    $(".mid_banner").show();


    window.criteo_q = window.criteo_q || [];
    window.criteo_q.push(
        { event: "setAccount", account: 24596 },

        { event: "setSiteType", type: "d" },
        //{ event: "viewHome", requiresDOM: "yes"}
        { event: "viewHome"}
    );

    if ( 'true' == 'false' ) {
        window.onload = function() {
            NetFunnel_Complete();
        };
    }
</script>
<!--  criteo 메인 페이지 트래커 END -->

<div class="layerArea" id="simpJoinLayer" style="display:none;">
    <div class="layerBg" style="display:block;" tabindex="-1"></div>
    <div class="popwrap w_type_8" id="" style="position: absolute; z-index: 201; display: block;" tabindex="-1">
        <div class="pop_tltwrap3">
            <h3>더한섬닷컴 회원가입</h3>
        </div>
        <div class="pop_cnt">
            <div class="hpoint">
                <p class="img"><img src="/_ui/desktop/common/images/popup/join_pop_icon.jpg" style="vertical-align:top"></p>
                <p class="txt">
                    H.Point통합회원 정보로 더한섬닷컴에 회원가입이 가능합니다.<br>
                    단, 더한섬닷컴 가입확인을 위해 아래의 정보로 조회가 진행됩니다.<br>
                    동의하시면 회원가입 해주세요.<br>
                    <span>※ 조회정보 : 이름, 생년월일, 휴대폰번호</span>
                </p>
                <div class="btnwrap mt30">
                    <input class="btn gray" value="더한섬닷컴 가입" type="button" style="width:200px" onclick="simpJoin();">
                </div>
            </div>
        </div>
        <a href="#" class="btn_close" id="closeLayerPop" onclick="layerPopup4('close');"><img src="/_ui/desktop/common/images/popup/ico_close.png"></a>
    </div>
</div>

<!-- 마케팅 수신 팝업 : s -->
<div class="layerArea" id="marketingAgreeLayer" style="display:none;">
    <div class="layerBg" style="display:block;"></div>
    <div class="popwrap w_type_8" style="outline:none;top:50%;margin-top:-235px;" tabindex="-1">
        <!-- Title1 -->
        <div class="pop_tltwrap3">
            <h3>마케팅 수신 재동의 안내</h3>
        </div>
        <!-- //Title1 -->
        <div class="pop_cnt">
            <div class="hpoint">
                <p class="txt">고객님께서는 마케팅 수신 재동의 대상입니다.<br>더한섬닷컴에서 제공되는 서비스에 대한 수신동의 여부를<br>다시 한번 확인해주세요.<br>선택 하시면 더한섬닷컴에서 진행하는 마케팅 및 이벤트소식을<br>받아보실 수 있습니다.</p>
                <div class="marketing_rcv_box" style="overflow:hidden;text-align:center;">
                    <!-- marketing_rcv_con -->
                    <div class="marketing_rcv_con" style="display:inline-block;margin:0 20px;">
                        <input type="checkbox" id="emailchk" name="agree_marketing">
                        <label for="emailchk">이메일(Email)</label>
                    </div>
                    <!-- // marketing_rcv_con -->
                    <!-- marketing_rcv_con -->
                    <div class="marketing_rcv_con" style="display:inline-block;margin:0 20px;">
                        <input type="checkbox" id="smschk" name="agree_marketing">
                        <label for="smschk">SMS</label>
                    </div>
                    <!-- // marketing_rcv_con -->
                </div>
                <div class="noticeTxt">
                    <p>단, 가입 및 주문/결제와 재입고 알림 등에 관련된 이메일과 SMS는 동의와 상관없이 발송됩니다.</p>
                </div>
                <div class="btnwrap mt30">
                    <input class="btn gray" value="확인하기" type="button" onclick="maketingAgreeAlert();">
                </div>
            </div>
        </div>
        <!-- btn_close -->
        <a href="#" class="btn_close" id="closeLayerPop" onclick="maketingAgreeClose();"><img src="/_ui/desktop/common/images/popup/ico_close.png"></a>
        <!-- //btn_close -->
    </div>
</div>
<!-- 마케팅 수신 팝업 : e -->

<form id="simpJoinForm" method="post" action="" target="simpStart_window">
    <input type="hidden" name="prtnrId" value="D080">
    <input type="hidden" name="chnnlId" value="1705">
    <input type="hidden" name="ssoMcustNo" id="ssoMcustNo" value="">
    <input type="hidden" name="ptcoReqnMdaInf" id="ptcoReqnMdaInf">
</form>

<form id="userHiddenForm" method="post" target="transMember">
    <input type="hidden" name="prtnrReqGb" value="03">
    <input type="hidden" name="prtnrId" id="prtnrId" value="">
    <input type="hidden" name="chnnlId" id="chnnlId" value="">
    <input type="hidden" name="custNm" id="custNm" value="">
    <input type="hidden" name="birthDt" id="birthDt" value="">
    <input type="hidden" name="mophNo" id="mophNo" value="">
    <input type="hidden" name="chId" id="chId" value="">
    <input type="hidden" name="custUniqKey" id="custUniqKey" value="">
    <input type="hidden" name="email" id="email" value="">
    <input type="hidden" name="sexGbCd" id="sexGbCd" value="">
    <input type="hidden" name="ci" id="ci" value="">
    <input type="hidden" name="ptcoReqnMdaInf" id="ptcoReqnMdaInf" value="">
</form>
<script type="application/ld+json">
    {
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "thehandsome",
        "url": "http://www.thehandsome.com",
        "sameAs": [
            "https://www.instagram.com/thehandsome_official/",
            "https://www.youtube.com/c/%EB%8D%94%ED%95%9C%EC%84%AC%EB%8B%B7%EC%BB%B4HANDSOME",
            "https://play.google.com/store/apps/details?id=com.handsome.thehandsome",
            "https://apps.apple.com/kr/app/itunes-connect/id1072288949"
        ]
    }
</script>
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
// 	location.href = location.href.replace("?uiel=Desktop", "") + "?uiel=Mobile";
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
    <div id="topBtn" style="display: none;">
        <a href="javascript:void(0);" class="viewTopArea"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/top_btn.png" alt="맨 위로" onclick="GA_Event('공통','퀵버튼','TOP');"></a>
    </div>
    <div class="footer">
        <!--footer_cnts1 -->
        <div class="footer_cnts1 clearfix">
            <!-- footer_menu-->
            <div class="footer_menu cnts1_left">
                <div class="footer_logo"><a href="/ko/main" onclick="GA_Event('공통','로고','하단');"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/footer_logo_renew.png" alt="HANDSOME"></a></div>
                <div class="footer_link">
                    <ul class="clearfix">
                        <li><a href="/ko/svcenter/theClubInfo" onclick="GA_Event('공통','푸터_메뉴','온라인 멤버십');">온라인 멤버십</a></li>
                        <li><a href="/ko/svcenter/memberbenefitguide" onclick="GA_Event('공통','푸터_메뉴','한섬 VVIP 혜택');">한섬 VVIP 혜택</a></li>
                        <li><a href="/ko/svcenter/pointguide" onclick="GA_Event('공통','푸터_메뉴','한섬마일리지 혜택');">한섬마일리지 혜택</a></li>
                        <li><a href="/ko/svcenter/couponguide" onclick="GA_Event('공통','푸터_메뉴','쿠폰');">쿠폰</a></li>
                        <li><a href="/ko/svcenter/asguide" onclick="GA_Event('공통','푸터_메뉴','반품&amp;환불안내');">반품&amp;환불안내</a></li>
                    </ul>
                    <ul class="clearfix">
                        <li><a href="/ko/svcenter/submain" onclick="GA_Event('공통','푸터_메뉴','고객센터');">고객센터</a></li>
                        <li><a href="/ko/svcenter/faq" onclick="GA_Event('공통','푸터_메뉴','FAQ');">FAQ</a></li>
                        <li><a href="/ko/svcenter/mending" onclick="GA_Event('공통','푸터_메뉴','수선진행조회');">수선진행조회</a></li>
                    </ul>
                    <ul class="clearfix">
                        <li><a href="/ko/member/login" onclick="GA_Event('공통','푸터_메뉴','로그인');">로그인</a></li>
                        <li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','푸터_메뉴','주문배송조회');">주문배송조회</a></li>
                        <li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','푸터_메뉴','취소/반품');">취소/반품</a></li>
                        <li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','푸터_메뉴','위시리스트');">위시리스트</a></li>
                    </ul>
                    <ul class="clearfix">
                        <li><a href="http://www.handsome.co.kr/ko/company/aboutHandsome.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','회사소개');">회사소개<!-- 회사소개 --></a></li>
                        <li><a href="http://www.handsome.co.kr/ko/brand/fashion.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','브랜드소개');">브랜드소개</a></li>
                        <li><a href="http://www.handsome.co.kr/ko/ir/governance01.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','투자정보');">투자정보</a></li>
                        <li><a href="https://recruit.ehyundai.com/recruit-info/announcement/list.nhd?pageNo=1&amp;hireGb=01&amp;coCd=HDHAN" target="_blank" onclick="GA_Event('공통','푸터_메뉴','채용정보');">채용정보</a></li>
                        <li><a href="http://www.handsome.co.kr/ko/sustainability/sharedGrowth01.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','동반성장');">동반성장</a></li>
                    </ul>
                </div>
            </div>
            <!-- //footer_menu-->
            <div class="footer_apps cnts1_right">
                <ul>
                    <li class="loca"><a href="/ko/b/storeInformation" onclick="GA_Event('공통','푸터','매장안내');">매장안내</a></li>
                    <li class="look"><a href="/ko/magazine/lookbook" onclick="GA_Event('공통','푸터','룩북');">룩북</a></li>
                    <li class="ico_youtube"><a href="/ko/magazine/youtubeList" onclick="GA_Event('공통','푸터_SNS','YOUTUBE');">비디오</a></li><!-- 200330 추가 -->
                    <li class="ico_insta" id="f_insta" style=""><a href="https://www.instagram.com/thehandsome_official/" target="_blank" onclick="GA_Event('공통','푸터_SNS','INSTAGRAM');">인스타그램</a></li><!-- 200330 추가 -->
                </ul>
                <!--download_app , athome-->
                <div class="cnts1_right_inner">
                    <a href="/ko/appDownloadSMS/sendSMSPage" onclick="GA_Event('공통','푸터','APP다운로드');">
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/footer_ico_apps.png" alt="APP 다운로드" style="width:52px;height:71px;">
                        <!-- 				        <img src="/_ui/desktop/common/images/common/ico_apps_new.png" alt="APP 다운로드" style="width:54px;height:70px;"> -->
                        <p>APP 다운로드 &gt;</p>
                    </a>
                    <a href="/ko/svcenter/footerAthomeInfo" style="margin-right:0;" onclick="GA_Event('공통','푸터','딜리버리서비스');">
                        <img src="http://cdn.thehandsome.com/pc/footer/footer_athome_car.png" alt="딜리버리 서비스" style="width:85px;">
                        <!-- 				        <img src="http://cdn.thehandsome.com/pc/footer_athome_car.jpg" alt="딜리버리 서비스" style="width:95px;"> -->
                        <p>딜리버리 서비스 &gt;</p>
                    </a>
                </div>
                <!--//download_app , athome-->
            </div>
        </div>
        <!--//footer_cnts1 -->
    </div>
    <!--footer_cnts2 -->
    <div class="footer_cnts2 clearfix">
        <div class="footer">
            <div class="cnts2_left">
                <a href="/ko/footer/footerTermBusiness" onclick="GA_Event('공통','푸터_CNT','서비스이용약관');">서비스이용약관</a>
                <a href="/ko/footer/footerPrivacy" onclick="GA_Event('공통','푸터_CNT','개인정보처리방침');"><strong>개인정보처리방침<!-- 개인정보처리방침 --></strong></a>
                <a href="javascript:void(0);" class="box" onclick="javascript:window.open('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208126337', 'communicationViewPopup', 'width=750, height=700');GA_Event('공통','푸터_CNT','통신판매사업자정보확인');">통신판매사업자정보확인</a>
                <a href="https://mark.inicis.com/mark/escrow_popup.php?mid=handsomep1" class="box" onclick="GA_Event('공통','푸터_CNT','에스크로서비스가입확인');">에스크로서비스 가입 확인</a>
                <p class="top_p"><span>(주)한섬</span><span>대표이사 : 김민덕</span><span>서울시 강남구 도산대로 523 한섬빌딩</span><span>TEL 1800-5700 (유료)</span><span class="bgnone">FAX 02-6078-2856</span></p>
                <p><span>사업자등록번호 120-81-26337</span><span>통신판매업신고번호 강남 제 00826호</span><span>개인정보보호책임자 윤인수</span><span class="bgnone">호스팅서비스 : (주) 한섬</span></p>
                <p class="copyright">COPYRIGHT © 2017 HANDSOME. ALL RIGHT RESERVED.</p>
            </div>
            <div class="cnts2_right">
                <div class="related_site clearfix">
                    <dl class="global lang_1911">
                        <dt><a href="javascript:void(0);" class="" onclick="GA_Event('공통','푸터_CNT','LANGUAGE');">LANGUAGE</a></dt>
                        <dd style="display: none;">
                            <ul>
                                <li><a href="javascript:language('ko')" onclick="GA_Event('공통','푸터_CNT','LANGUAGE_한국어');">한국어</a></li>
                                <li><a href="javascript:language('en')" onclick="GA_Event('공통','푸터_CNT','LANGUAGE_ENGLISH');">ENGLISH</a></li>
                                <li><a href="javascript:language('zh')" onclick="GA_Event('공통','푸터_CNT','LANGUAGE_中文');">中文</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="family">
                        <dt><a href="javascript:void(0);" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE');">FAMILY SITE<!-- FAMILY SITE --></a></dt>
                        <dd style="">
                            <ul>
                                <li class="bold_division1811">쇼핑몰 Site<!-- 쇼핑몰 Site --></li>
                                <li><a href="https://www.thehyundai.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_더현대닷컴');">더현대닷컴<!-- 더현대닷컴 --></a></li>
                                <li><a href="https://www.hddfs.com/shop/dm/main.do?ptnrChlCd=00003014" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점 면세점');">현대백화점 면세점<!-- 현대백화점 DUTY FREE --></a></li>
                                <li><a href="http://esuper.ehyundai.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_e수퍼마켓');">e수퍼마켓<!-- e수퍼마켓 --></a></li>
                                <li><a href="https://www.hyundaihmall.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대Hmall');">현대Hmall<!-- 현대 Hmall --></a></li>
                                <li><a href="http://mall.hyundailivart.co.kr/front/vrStoreList.lv" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대리바트몰');">현대리바트몰<!-- 현대리바트몰 --></a></li>
                                <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대렌탈케어');">현대렌탈케어<!-- 현대렌탈케어 --></a></li>
                                <li><a href="http://www.hfashionmall.com/sfmweb/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_H패션몰');">H패션몰<!-- H패션몰 --></a></li>
                                <li><a href="https://www.h-vrstation.com/main" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_VR STATION');">VR STATION<!-- VR STATION --></a></li>

                                <li class="bold_division1811">관계사 Site<!-- 관계사 Site --></li>
                                <li><a href="http://www.ehyundai.com/newPortal/ir/main.do" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점그룹');">현대백화점그룹<!-- 현대백화점 그룹 --></a></li>
                                <li><a href="https://www.ehyundai.com/newPortal/index.do" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점');">현대백화점<!-- 현대백화점 --></a></li>
                                <li><a href="http://www.hyundaigreenfood.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대그린푸드');">현대그린푸드<!-- (주)현대그린푸드 --></a></li>
                                <li><a href="https://www.hyundaihmall.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대홈쇼핑');">현대홈쇼핑<!-- (주)현대홈쇼핑 --></a></li>
                                <li><a href="http://www.hyundailivart.co.kr/ko/intro/index.lvt" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대리바트');">현대리바트<!-- (주)현대 리바트 --></a></li>
                                <li><a href="http://www.hyundaimedia.com/mpp/index.hcn" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대미디어');">현대미디어<!-- 현대 미디어 --></a></li>
                                <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대렌탈케어');">현대렌탈케어<!-- 현대렌탈케어 --></a></li>
                                <li><a href="http://www.hyundaidreamtour.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대드림투어');">현대드림투어<!-- 현대드림투어 --></a></li>
                                <li><a href="http://www.everdigm.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_에버다임');">에버다임<!-- 에버다임 --></a></li>
                                <li><a href="http://www.cnsfoodsystem.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_씨엔에스푸드시스템');">씨엔에스푸드시스템<!-- 씨엔에스푸드시스템 --></a></li>
                                <li><a href="http://www.hyundaicatering.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대캐터링시스템');">현대캐터링시스템<!-- 현대캐터링시스템 --></a></li>
                                <li><a href="http://www.hyundai-ite.com/index.jsp" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대IT&amp;E');">현대IT&amp;E<!-- 현대IT&amp;E --></a></li>
                                <li><a href="http://www.hyundailnc.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대L&amp;C');">현대L&amp;C<!-- 현대L&amp;C --></a></li>
                            </ul>
                        </dd>
                    </dl>


                </div>
                <!-- 푸터 공지 추가 220404 -->
                <!-- 공지 -->
                <div id="noticeWrap" class="notice">
                    <div class="controls">
                        <a href="javascript:void(0);" class="prev">이전</a>
                        <a href="javascript:void(0);" class="next">다음</a>
                    </div>
                    <div class="list">
                        <div class="tlt">공지<!-- 공지 --></div>
                        <ul class="list_new" style="top: 0px;"><li><a href="/ko/svcenter/notice?noticeCode=8804448915376">10월 한글날 연휴(대체공휴일)로 인한 배송지연 안내</a></li></ul>
                    </div>
                </div>
                <!-- //공지 -->

                <!-- 뉴스 -->
                <div id="newsWrap" class="news">
                    <div class="controls">
                        <a href="javascript:void(0);" class="prev">이전</a>
                        <a href="javascript:void(0);" class="next">다음</a>
                    </div>
                    <div class="list">
                        <div class="tlt">뉴스<!-- 뉴스 --></div>
                        <ul class="list_new" style="top: -20px;"><li><a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804154005276&amp;typeCode=WEB" onclick="GA_Common('news',$(this))">[핸썸TV] 가을을 장식할 한섬 BEST 액세서리</a></li><li><a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804121237276&amp;typeCode=WEB" onclick="GA_Common('news',$(this))">[핸썸TV] 한섬살롱 3편 with MINE</a></li><li><a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804154070812&amp;typeCode=WEB" onclick="GA_Common('news',$(this))">[핸썸TV] MUE에서 만나는 피어오브갓 ESSENTIALS</a></li><li><a href="/ko/magazine/newsDetailtemplatetype4?newsCode=8804154038044&amp;typeCode=WEB" onclick="GA_Common('news',$(this))">핸써미와 함께하는 <br> '한섬 ESG 친환경 정화설비' 탐구</a></li></ul>
                    </div>
                </div>
                <!-- //뉴스 -->
                <!-- // 푸터 공지 추가 220404 -->
            </div>
        </div>
    </div>
    <!--//footer_cnts2 -->
</div><!-- 네이버 애널리틱스 전환페이지 설정 : s -->
<!-- 네이버 애널리틱스 전환페이지 설정 : e -->
<form name="accessiblityForm">
    <input type="hidden" id="accesibility_refreshScreenReaderBufferField" name="accesibility_refreshScreenReaderBufferField" value="">
</form>
<div id="ariaStatusMsg" class="skip" role="status" aria-relevant="text" aria-live="polite"></div>

<!--loadingbar-->
<div class="layerBg"></div>
<!--//loadingbar-->

<div id="popwrap_maple_evt2209" style="top:50%;left:50%;margin:-200px 0 0 -185px;width:400px;position:fixed;display:block;z-index:102">
</div>

<div class="layerArea" id="mapleLayer" style="display:none;">
    <div class="layerBg"></div>
</div>

<!-- Google 리마케팅 태그 코드 -->
<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 943253288;
    var google_custom_params = window.google_tag_params;
    var google_remarketing_only = true;
    /* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/943253288/?value=0&amp;guid=ON&amp;script=0"/>
    </div>
</noscript>

<script type="text/javascript">

    var virtusizeViewYn = false;

    virtusizeViewYn = true;

    if(virtusizeViewYn){

    }
</script>

<input type="hidden" id="apiConfmKey" value="U01TX0FVVEgyMDE5MDYxNzE2NDczMzEwODgxNTI=">

<!-- GTM 추적코드 추가 -->
<!-- Google Tag Manager (noscript) -->
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5PCJDFJ"
            height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Beusable(뷰저블 코드) : s -->
<script type="text/javascript">
    (function(w, d, a){
        w.__beusablerumclient__ = {
            load : function(src){
                var b = d.createElement("script");
                b.src = src; b.async=true; b.type = "text/javascript";
                d.getElementsByTagName("head")[0].appendChild(b);
            }
        };w.__beusablerumclient__.load(a);
    })(window, document, "//rum.beusable.net/script/b200506e124944u371/29f6068460");
</script>
<!-- Beusable(뷰저블 코드) : e -->


<!-- 네이버 애널리틱스 공통 적용 : s -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
    if (!wcs_add) var wcs_add = {};
    wcs_add["wa"] = "5c81384bbc8d5c";
    if (window.wcs) {
        wcs_do();
    }
</script>
<!-- 네이버 애널리틱스 공통 적용 : e -->
<!-- 네이버 애널리틱스 공통 적용(프리미엄로그분석) : s -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
    if (!wcs_add)
        var wcs_add = {};
    wcs_add["wa"] = "s_56892c2154ef";

    if (!_nasa)
        var _nasa = {};
    wcs.inflow("thehandsome.com");
    wcs_do(_nasa);
</script>
<!-- 네이버 애널리틱스 공통 적용(프리미엄로그분석) : e -->
<!-- Enliple Tracker Start -->
<script type="text/javascript">
    try{
        (function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
        enp('create', 'common', 'thehandsome', { device: 'W' });  // W:웹, M: 모바일, B: 반응형
        enp('send', 'common', 'thehandsome');
    } catch(e) {
        console.log(e);
    }
</script>
<!-- Enliple Tracker End -->


<!-- AceCounter Log Gathering Script V.7.5.2013010701 -->
<script language="javascript">
    var _AceGID=(function(){var Inf=['dgc17.acecounter.com','8080','AP6F40149814536','CW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
    var _AceCounter=(function(){var G=_AceGID;if(G.o!=0){var _A=G.val[G.o-1];var _G=( _A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];	var _U=( _A[5]).replace(/\,/g,'_');var _S=((['<scr','ipt','type="text/javascr','ipt"></scr','ipt>']).join('')).replace('tt','t src="'+location.protocol+ '//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime())+'" t');document.writeln(_S); return _S;} })();
</script><script src="http://cr.acecounter.com/Web/AceCounter_CW.js?gc=AP6F40149814536&amp;py=0&amp;gd=dgc17&amp;gp=8080&amp;up=NaPm_Ncisy&amp;rd=1665458234594" type="text/javascript"></script>

<noscript><img src='http://dgc17.acecounter.com:8080/?uid=AP6F40149814536&je=n&' border='0' width='0' height='0' alt=''></noscript>
<!-- AceCounter Log Gathering Script End -->

<!-- adinsight 공통스크립트 start -->
<script type="text/javascript">
    var TRS_AIDX = 11864;
    var TRS_PROTOCOL = document.location.protocol;
    document.writeln();
    var TRS_URL = TRS_PROTOCOL + '//' + ((TRS_PROTOCOL=='https:')?'analysis.adinsight.co.kr':'adlog.adinsight.co.kr') +  '/emnet/trs_esc.js';
    document.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
</script>
<script language="javascript" src="http://adlog.adinsight.co.kr/emnet/trs_esc.js"></script>

<!-- adinsight 공통스크립트 end -->



<iframe id="groobeeBox" name="groobeeBox" style="display: none;"></iframe><div id="criteo-tags-div" style="display: none;"></div><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;"></iframe></body>
</html>