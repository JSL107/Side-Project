<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/common/header.jspf" %>


<body oncontextmenu="return false">

<div id="headerWrap">
    <style>
        #contentsInProgress .col2:nth-child(odd) {
            margin-left: 10px
        }

        #contentsInPast .col2:nth-child(odd) {
            margin-right: 10px
        }
    </style>

    <!-- bodyWrap -->
    <div id="bodyWrap" class="products">
        <!--title-->
        <h3 class="cnts_title">
				<span>
				 이벤트
				</span>
        </h3>
        <!--//title-->
        <div class="adaptive_wrap">
            <div role="wrapper">
                <div class="event_list" id="contentsInProgress">
                    <c:forEach items="${eid}" var="event" begin="0" end="0" step="1">
                    <div class="event_box col1" style="" data-last="9">
                        <a href="../maineventdetail?eid=${event.eid}&ename=${event.ename}">
                            <div class="pic">
                                <img src="<c:out value="${event.eimage}"/>"/>
                            </div>
                            <div class="evt_txt_box">
                                <p class="title"><c:out value="${event.ename}"/></p>
                                <p class="date">
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${event.estartdate}"/>
                                    ~
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${event.eenddate}"/></p>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                    <c:forEach items="${eid}" var="event" begin="1" end="${fn:length(eid)}" step="1">
                        <div class="event_box col2" style="" data-last="9">
                            <a href="../eventdetails?eid=${event.eid}">
                                <div class="pic">
                                    <img src="<c:out value="${event.eimage}"/>"/>
                                </div>
                                <div class="evt_txt_box">
                                    <p class="title"><c:out value="${event.ename}"/></p>
                                    <p class="date">
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${event.estartdate}"/>
                                        ~
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${event.eenddate}"/></p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>

            </div>
        </div>
    </div>
</div>
<!-- //bodyWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf" %>
