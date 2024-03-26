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
                        <div>
                            <img style="display: block" src="${edetail}"/>
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
                console.log("token : " + token);
                $.ajax({
                    url: '/event/eventdetail?eid=${eid}',
                    data: {
                        eid: ${eid}
                    },
                    type: "POST",
                    success: function (data) {
                        if (data === "success") {
                            console.log(data);
                            Swal.fire({
                                icon:'success',
                                text:'쿠폰발급 완료!',
                            });
                        } else {
                            Swal.fire({
                                icon:'success',
                                text:'쿠폰이 소진되었습니다!',
                            });
                        }
                    },
                    error: function (xhr) {
                        alert("error : " + xhr.status)
                    }
                });
            }
        </script>
        <!-- //bodyWrap -->
    </div>
</div>
</body>

<%@include file="/WEB-INF/views/common/footer.jspf" %>