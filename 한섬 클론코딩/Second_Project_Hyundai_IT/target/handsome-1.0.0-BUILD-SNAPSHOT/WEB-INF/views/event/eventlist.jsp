<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/views/common/header.jsp"%>

<!-- bodyWrap -->
<div id="bodyWrap" class="products">
	<!--title-->
	<h3 class="cnts_title">
		<span> 이벤트 </span>
	</h3>
	<!--//title-->
	<div class="adaptive_wrap">
		<div class="tab_b event_tab">
			<ul id="tab">
				<li><a style="cursor: pointer"
					onclick="GA_Event('이벤트', '탭', this.text);changeTab(this, false);"
					class="on">진행 중인 이벤트</a></li>
			</ul>
		</div>
		<div role="wrapper" style="">
			<!-- 메인 이벤트 (제일 큰 배너) -->
			<div class="event_list" id="contentsInProgress">
				<div class="event_box col1" style="" data-last="14">
					<a href="eventdetail?eid=${edata[0].eid}"
						onclick="GA_EventList($(this));goDetail('/ko/magazine/events/8804514453376');">
						<div class="pic">
							<img src="${edata[0].eimage}" alt="있는건가">
						</div>
						<div class="evt_txt_box">
							<p class="title">${edata[0].ename}</p>
							<p class="date">
								<fmt:formatDate value="${edata[0].estartdate}"
									pattern="yyyy-MM-dd" />
								~
								<fmt:formatDate value="${edata[0].eenddate}"
									pattern="yyyy-MM-dd" />
							</p>
						</div>
					</a>
				</div>

				<c:forEach items="${edata}" var="event" begin="1"
					end="${fn:length(edata)}" step="1">
					<div class="event_box col2" style="" data-last="14">
						<a href="eventDetail?eid=${event.eid}"
							onclick="GA_EventList($(this));goDetail('/ko/magazine/events/8804547221376');">
							<div class="pic">
								<img src="<c:out value="${event.eimage}"/>" />
							</div>
							<div class="evt_txt_box">
								<p class="title">
									<c:out value="${event.ename}"></c:out>
								</p>
								<p class="date">
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${event.estartdate}" />
									~
									<fmt:formatDate pattern="yyyy-MM-dd" value="${event.eenddate}" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>

			<%--INFO::더보기--%>
			<div class="morewrap" style="display: none;">
				<a style="cursor: pointer" onclick="getEvents(this, false);">더보기</a>
			</div>

		</div>
	</div>
	<!-- //bodyWrap -->
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>