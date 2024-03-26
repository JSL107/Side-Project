<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/common/header.jspf" %>
<body oncontextmenu="return false">
<!-- <div id="transparent_mask"></div> -->

<!-- bodyWrap -->
<div id="bodyWrap" class="products">
    <!--title-->
    <h3 class="cnts_title">
			<span>
				이벤트
			</span>
    </h3>
    <div class="sub_container">
        <div class="mgz_view">
            <div class="evt_top">
                <p class="subj">${ename}</p>
                <p class="date">
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${estartdate}"/>
                    ~
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${eenddate}"/>
                </p>
                <div class="sns_wrap a2a_kit a2a_kit_size_32 a2a_default_style" id="shareSns">
                </div>
                <!--//title-->
            </div>
            <div class="evt_cnts">
                <div class="pic">
                    <p>&nbsp;</p>
                    <div class="evt_pc_newyear_present">
                        <video style="width: 995px; height: 786px;"
                               poster="http://cdn.thehandsome.com/pc/event/detail/image/handsome_202301/event_newyear_present_pc_img_01.jpg"
                               autoplay="autoplay" muted="" controls="controls" width="300" height="150">
                            <source src="http://cdn.thehandsome.com/pc/event/detail/image/handsome_202301/event_newyear_present_video_01.mp4"
                                    type="video/mp4">
                        </video>
                        <div>
                            <div><img style="display: block; width:700px; height:150px;"
                                      src="../../../resources/images/couponImage.png"/>
                            </div>
                            <div><img style="display: block; width:675px; height:150px;"
                                      src="../../../resources/images/couponImage2.png"/>
                            </div>
                            <div style="display:block; text-align: center;">
                                <a href="javascript:void(0);" onclick="eventCoupon()">
                                    <img style="width:500px; height:100px;  margin-left: auto; margin-right: auto;"
                                         src="../../../resources/images/event_newmember_dec_pc_img_05.jpg" alt>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="newyear_notice">
                <img style="display: block;"
                     src="http://cdn.thehandsome.com/pc/event/detail/image/handsome_202301/event_newyear_present_pc_img_08.jpg"
                     alt="">
            </div>

        </div>
        <script>

            function eventCoupon() {
                $(document).ajaxSend(function (e, xhr, options) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                });
                var token = $('#token').val();
                $.ajax({
                    url: '/event/eventdetail?eid=${eid}',
                    data: {
                        eid: ${eid},
                    },
                    type: "POST",
                    success: function (data) {
                        if (data === "success") {
                            Swal.fire({
                                icon:'success',
                                text:'쿠폰 발급완료!'
                            });
                        } else if (data === "checked_login") {
                            Swal.fire({
                                icon:'warning',
                                text:'로그인을 해주세요',
                            });
                        } else if (data === "overlap") {
                            Swal.fire({
                                icon:'warning',
                                text:'이미 쿠폰을 발급받으셨습니다.',
                            });
                        } else {
                            Swal.fire({
                                icon:'warning',
                                text:'쿠폰이 소진되었습니다.',
                            });
                        }
                    },
                    error: function (xhr) {
                        Swal.fire({
                            icon:'error',
                            text:'쿠폰발급에 오류가 발생하였습니다. 로그인 상황을 확인해주세요.',
                        });
                    }
                });
            }
        </script>
    </div>
</div>
</body>
<%@include file="/WEB-INF/views/common/footer.jspf" %>