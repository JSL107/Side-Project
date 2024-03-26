<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="header.jspf" %>

<div id="bodyWrap">
<h3 class="cnts_title">
				<span>
				 래플
				</span>
</h3>
<c:forEach var="raffleList" items="${raffleList}" varStatus="status">
    <ul class="raffle-list" id="raffle-list">
            <%--INFO :: 래플의 상태 (0) : 끝난 이벤트, (1) 진행중인 이벤트, (2) 곧 다가올 이벤트--%>
        <c:choose>
            <c:when test="${raffleList.rstatus == 0}">
                <div class="state">
                    <div class="timers" style="padding-bottom: 25px;">00:00:00</div>
                </div>
                <div class="button">
                    <a class="btn-normal reverse"
                       onmouseover="btn_hover(${status.index})"
                       onmouseout="btn_out(${status.index})"
                       onclick="iamWinner()"
                       style="padding-bottom: 30px">
                        당첨 결과 확인하기</a>
                    <div class="win">
                        <div class="box-win-473" style="display: none">
                            당첨자 구매기간
                            : ${raffleList.purchaseStartDate}~${raffleList.purchaseEndDate}
                        </div>
                    </div>
                </div>
                <button id="btn-layer-user" type="button" class="btn-layer-user"
                        style="display: inline-block; background: none; margin-top: 30px;" onclick="show()">
                    <a href="javascript:void(0);">
                        당첨자 전체보기
                    </a>
                </button>
                <br>

                <a href="http://localhost:8080/product/product_detail?pid=${raffleList.rafflePid}&colorcode=${raffleList.ccolorcode}"
                   class="raffle-event-a">
                    <img src="${raffleList.cthumbnail1}"
                         alt class="raffle-product-img" style="text-align: center">
                    <br>
                    <strong class="raffle-product-name">${raffleList.pname}</strong>
                    <br>
                    <span class="raffle-brand-name">${raffleList.bname}</span>
                    <br>
                    <span><fmt:parseNumber var="percent" value="${(raffleList.pprice/10)}" integerOnly="true"/>
                    ₩<fmt:formatNumber value="${percent}" pattern="#,###"/> </span>
                </a>
                <div id="raffle_user" class="ui-layer" style="margin-top: -500.111px; display: none">
                    <h2 class="tit raffle-other" style="font-size: 20px;">당첨자 전체보기</h2>
                    <p class="info-user raffle-other" style="font-size: 5px; margin-top: 10px;">당첨된 분들의 개인 정보 보호를 위해
                        ID 및
                        전화번호
                        일부분을 별표로 표기하여 공지드립니다.</p>

                    <div class="list-scroll raffle-other" style="margin-top: 15px;">
                        <ul id="raffleUserList" class="list-user">
                            <span id="raffle_winner">${raffleList.winner}</span>
                        </ul>
                        <script>
                            $().ready(function () {
                                let tempName = " ${raffleList.winner}";
                                let maskingName = "";
                                if (tempName.length === 2) {
                                    maskingName = tempName.replace(/(?<=.{1})./gi, '*');
                                } else if (tempName.length > 2) {
                                    maskingName = tempName.replace(/(?<=.{4})./gi, '*');
                                } else {
                                    maskingName = tempName;
                                }
                                document.getElementById("raffle_winner").innerText = maskingName;
                            });
                        </script>
                    </div>
                    <a class="btn-close" href="javascript:void(0);">
                        <i class="ico ico-close" onclick="hide()">당첨자 전체보기 팝업 닫기</i>
                    </a>
                </div>
                <div style="margin-top: 30px">
                    <a class="open" href="javascript:void(0);" onclick="info_show(${status.index})">펼치기</a>
                    <div style="display: none; text-align: center;" class="raffle-view">
                        <span>총 참여인원 ${raffleList.participants}명</span>
                        <div class="app-info">
                            <ul>
                                <li><strong>래플 응모기간</strong> <fmt:formatDate pattern="yyyy-MM-dd"
                                                                             value="${raffleList.startDate}"/>
                                    ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${raffleList.endDate}"/></li>
                                <li><strong>당첨자 발표일</strong> ${raffleList.endDate}</li>
                                <li><strong>당첨자 구매기간</strong> ${raffleList.purchaseStartDate}
                                    ~ ${raffleList.purchaseEndDate}</li>
                            </ul>
                            <img src="../../../resources/static/images/info.png">
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${raffleList.rstatus == 1}">
                <div class="state active" onload="TimerDown(${status.index})">
                    <div class="timer" style="padding-bottom: 25px;"></div>
                    <input id="data_timer" type="hidden"
                           value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                             value="${raffleList.endDate}"/>">
                </div>
                <div class="button">
                    <a href="javascript:void(0);" class="btn-normal reverse"
                       onclick="apply(${status.index})"
                       onmouseover="btn_hover(${status.index})"
                       onmouseout="btn_out(${status.index})"
                       style="padding-bottom: 30px">응모하기</a>
                    <div class="win">
                        <div class="box-win-473" style="display: none">
                            당첨자 구매기간
                            : ${raffleList.purchaseStartDate}~${raffleList.purchaseEndDate}
                        </div>
                    </div>
                </div>
                <br>

                <%--Info :: 후에 해당 상품 좌표 값으로 찍어 줄 부분--%>
                <a href="http://localhost:8080/product/product_detail?pid=${raffleList.rafflePid}&colorcode=${raffleList.ccolorcode}"
                   class="raffle-event-a">
                    <img src="${raffleList.cthumbnail1}"
                         alt class="raffle-product-img" style="text-align: center">
                    <br>
                    <strong class="raffle-product-name">${raffleList.pname}</strong>
                    <br>
                    <span class="raffle-brand-name">${raffleList.bname}</span>
                    <br>
                    <span id ="price"><fmt:parseNumber var="percent" value="${(raffleList.pprice/10)}" integerOnly="true"/>
                     ₩<fmt:formatNumber value="${percent}" pattern="#,###"/></span>
                </a>
                <div style="margin-top: 30px">
                    <a class="open" href="javascript:void(0);" onclick="info_show(${status.index})">펼치기</a>
                    <div style="display: none; text-align: center;" class="raffle-view">
                        <span>총 참여인원 ${raffleList.participants}명</span>
                        <div class="app-info">
                            <ul>
                                <li><strong>래플 응모기간</strong> <fmt:formatDate pattern="yyyy-MM-dd"
                                                                             value="${raffleList.startDate}"/>
                                    ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${raffleList.endDate}"/></li>
                                <li><strong>당첨자 발표일</strong> ${raffleList.endDate}</li>
                                <li><strong>당첨자 구매기간</strong> ${raffleList.purchaseStartDate}
                                    ~ ${raffleList.purchaseEndDate}</li>
                            </ul>
                            <img src="../../../resources/static/images/info.png">
                        </div>
                    </div>

                </div>

            </c:when>
        </c:choose>


    </ul>

    </div>
    <script>
        function TimerDown(index) {
            let timer = $("#data_timer").val();
            let date_timer = new Date(timer);
            let nowDate = new Date();
            let sec = (((nowDate - date_timer) / (1000)) % 60);
            let min = (((nowDate - date_timer) / (1000 * 60)) % 60);
            let hour = (((nowDate - date_timer) / (1000 * 60 * 60)) % 24);
            $(".timer").text(Math.abs(Math.floor(hour)).toString().padStart(2, '0') + ":" + Math.abs(Math.floor(min)).toString().padStart(2, '0') + ":" + Math.abs(Math.floor(sec)).toString().padStart(2, '0'));

        }

        setInterval(TimerDown, 1000);

        function btn_hover(index) {
            $(".box-win-473")[index].style.display = "block";
        }

        function btn_out(index) {
            $(".box-win-473")[index].style.display = "none";
        }

        function apply() {
            $.ajax({
                url: "/raffle",
                type: 'POST',

                data: {
                    mid: "${mid}",
                    rid: "${raffleList.raffleId}"
                },
                success: function (data) {
                    if (data === "success") {
                        Swal.fire({
                            icon:'success',
                            text:'이벤트에 응모되었습니다.'
                        }).then(function(){
                            window.location.reload();
                        });

                    } else {
                        Swal.fire({
                            icon:'warning',
                            text:'이벤트에 이미 참여하셨습니다.'
                        });
                    }
                },
                fail: function (data) {
                    Swal.fire({
                        icon:'error',
                        text:data.status
                    });
                }
            });
        }
    </script>
    <script>
        function show() {
            document.getElementById("raffle_user").style.display = "block";
        }

        function hide() {
            document.getElementById("raffle_user").style.display = "none";
        }

    </script>
    <script>
        function info_show(index) {
            $(".raffle-view")[index].style.display = "block";
            $(".open")[index].innerText = "접기";
            $(".open")[index].setAttribute("onClick", "info_hide(" + index + ")");
        }

        function info_hide(index) {
            $(".raffle-view")[index].style.display = "none";
            if ($(".open")[index].innerText === "접기") {
                $(".open")[index].innerText = "펼치기";
                $(".open")[index].setAttribute("onClick", "info_show(" + index + ")");
            }
        }
    </script>
    <script>
        const winner = "${raffleList.winner}";
        const mid = "${mid}";

        function iamWinner() {
            let formData = new FormData();
            let price = ${percent};


            if (winner === mid) {
                Swal.fire({
                    icon:'success',
                    text:'당첨되셨습니다.'
                }).then(function(){
                    window.location.href = "http://localhost:8080/product/product_detail/?pid=${raffleList.rafflePid}&colorcode=${raffleList.ccolorcode}&price="+price
                });
            } else {
                Swal.fire({
                    icon:'warning',
                    text:'아쉽지만 다음 기회를 이용해 주세요.'
                });
            }
        }
    </script>
</c:forEach>


<%@include file="footer.jspf" %>