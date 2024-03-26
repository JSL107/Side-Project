<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<body oncontextmenu="return false">

<style media="screen">
    .sharing {
        float: right;
        background-position: right !important
    }

    .sharing a {
        display: none !important
    }

    .sharing.on {
        width: 90px !important
    }

    .sharing.on a {
        display: block !important;
        float: left;
        margin-top: 0
    }

    .btn_list_wrap {
        padding: 10px 0;
        text-align: right
    }

    /* 7주년 메인 이벤트 S */
    .evt-7th-main img {
        display: block;
    }

    .evt-7th-main .evt7th-video-wrap video {
        display: block;
        width: 100%;
    }

    .evt-7th-main .evt7th-main-event01 .coupon-wrap {
        position: relative;
        width: 613px;
        margin: 0 auto;
    }

    .evt-7th-main .evt7th-main-event01 .coupon-wrap .coupon-list {

    }

    .evt-7th-main .evt7th-main-event01 .coupon-wrap .coupon-list .coupon {
        position: absolute;
        top: 0;
        left: 0;
    }

    .evt-7th-main .evt7th-main-event01 .btn-coupon-wrap {
        position: relative;
        width: 360px;
        margin: 60px auto 0;
    }

    .evt-7th-main .evt7th-main-event01 .btn-coupon-wrap .btn-coupon {
        display: block;
    }

    .evt-7th-main .evt7th-main-notice-wrap {
        margin-top: 30px;
    }

    .evt-7th-main .evt7th-main-notice-title {
        position: relative;
        cursor: pointer;
    }

    .evt-7th-main .evt7th-main-notice-icon {
        display: block;
        position: absolute;
        width: 20px;
        height: 20px;
        top: 22px;
        left: 570px;
    }

    .evt-7th-main .evt7th-main-notice-title.on .evt7th-main-notice-icon {
        transform: rotate(45deg);
    }

    /* 7주년 메인 이벤트 E */
</style>

<!-- bodyWrap -->
<div id="bodyWrap" class="products">
    <!--title-->
    <h3 class="cnts_title">
        <span> 이벤트 </span>
    </h3>
    <!--//title-->
    <div class="sub_container">
        <div class="mgz_view">
            <div class="evt_top">
                <p class="subj">${ename}</p>
                <p class="date">
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${estartdate}"/>
                    ~
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${eenddate}"/>
                </p>
            </div>
            <div class="evt_cnts">
                <!-- 7주년 메인 이벤트 S -->
                <div class="evt-7th-main">
                    <div class="evt-video-wrap">
                        <img src="../../../resources/upload/${eimage}" style="width: 65vw; min-width: 65px;">
                    </div>
                    <div class="evt7th-main-event01">
                        <div class="coupon-wrap">
                            <div>
                                <img
                                        src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_main_evt01_coupon.gif">
                            </div>
                            <div class="coupon-list">
                                <div class="coupon coupon01" style="display: none">
                                    <img
                                            src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_main_evt01_coupon01.png">
                                </div>
                            </div>
                        </div>

                        <input id = "token" type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />


                        <div class="btn-coupon-wrap ready">
                            <a href="javascript:;" class="btn-coupon"> <img
                                    src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_btn_coupon.jpg"
                                    onclick=eventCoupon()>
                            </a>

                        </div>
                        <script>
                            function eventCoupon() {
                                $(document).ajaxSend(function(e, xhr, options) {
                                    xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
                                });
                                var token = $('#token').val();
                                console.log("token : " + token);
                                $.ajax({
                                        url: '/event/eventdetail?eid=${eid}',
                                       	data : {
                                            eid : ${eid}
                                        },
                                        type: "POST",
                                        success : function (data) {
                                            if (data === "success") {
                                                console.log(data);
                                                alert("쿠폰 발급 완료!");
                                            } else {
                                                alert("쿠폰이 소진되었습니다.");
                                            }
                                        },
                                        error : function(xhr){
                                            alert("error : " + xhr.status)
                                        }
                                    })
                            }


                        </script>
                    </div>
                </div>
                <!-- 7주년 메인 이벤트 E -->
            </div>
        </div>
        <div class="btn_list_wrap">
            <a href="/ko/magazine/events" class="btn_list">목록</a>
        </div>
    </div>
</div>
<!-- //bodyWrap -->
<script src="https://static.addtoany.com/menu/locale/ko-KR.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>