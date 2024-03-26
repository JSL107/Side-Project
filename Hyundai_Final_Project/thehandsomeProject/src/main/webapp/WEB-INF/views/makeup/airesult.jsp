<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/common/header.jspf" %>
<link rel="stylesheet" type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
<div id="bodyWrap" class="products">
    <h3 class="cnts_title" style="font-weight: bold;">
        <span>Cosmetic Studio</span>
    </h3>
    <%--TODO :: 3. MakeupController에서 넘어온 결과 값에 따라 다른이미지를 출력해준다. --%>
    	<!-- TEST CODE  -->
        <div id="result" style="text-align: center;">
            <!-- <img id="spring-warm" style="height: 1000px;"
                 src="../../../resources/images/result/Spring-warm.png" alt=""/> <br>
            <button id="makeup"
            style="white-space: nowrap; border-radius: 8px; width: 252px;
			height: 68px;
			background-color: #FF5DA3;
			color: white;
			font-family: Pretendard;
			box-sizing: border-box;
			font-size: 21px;
			cursor: pointer;
			border:none"
                    onmouseover="hover()" onmouseout="hoverOut()">메이크업하러 가기
            </button> -->

			<input type="hidden" name="CSRFToken"
               value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">

			<form action="artist" id="personal_form" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                    <input value="${fileName}" name="fileName" type="hidden"/> 
                    <input value="${personalColor}" name="personalColor" type="hidden"/>
           </form>
			
                <c:if test="${personalColor.startsWith('봄')}">
                    <img id="spring-warm" style="height: 1000px;"
                         src="../../../resources/images/result/Spring-warm.png" alt=""/>
                    <br>
                    <button id="makeup"
                            style="white-space: nowrap; border-radius: 8px; width: 252px;
			height: 68px; background-color: #FF5DA3;
			color: white; font-family: Pretendard;
			box-sizing: border-box;
			font-size: 21px;
			cursor: pointer;
			border:none"
                            onmouseover="hover()" onmouseout="hoverOut()" onclick="submit2()">메이크업하러 가기
                    </button>
                </c:if>
                <c:if test="${personalColor.startsWith('여름')}">
                    <img id="summer-cool" style="height: 1000px;"
                         src="../../../resources/images/result/summer-cool.png" alt=""/>
                    <br>
                    <button id="makeup"
                            style="white-space: nowrap; border-radius: 8px; width: 252px;
			height: 68px; background-color: #FF5DA3;
			color: white; font-family: Pretendard;
			box-sizing: border-box;
			font-size: 21px;
			cursor: pointer;
			border:none"
                            onmouseover="hover()" onmouseout="hoverOut()" onclick="submit2()">메이크업하러 가기
                    </button>
                </c:if>
                <c:if test="${personalColor.startsWith('가을')}">
                    <img id="fall-warm" style="height: 1000px;"
                         src="../../../resources/images/result/fall-warm.png" alt=""/>
                    <br>
                    <button id="makeup"
                            style="white-space: nowrap; border-radius: 8px; width: 252px;
			height: 68px; background-color: #FF5DA3;
			color: white; font-family: Pretendard;
			box-sizing: border-box;
			font-size: 21px;
			cursor: pointer;
			border:none"
                            onmouseover="hover()" onmouseout="hoverOut()" onclick="submit2()">메이크업하러 가기
                    </button>
                </c:if>
                <c:if test="${personalColor.startsWith('겨울')}">
                    <img id="winter-cool" style="height: 1000px;"
                         src="../../../resources/images/result/winter-cool.png" alt=""/>
                    <br>
                    <button id="makeup"
                            style="white-space: nowrap; border-radius: 8px; width: 252px;
			height: 68px; background-color: #FF5DA3;
			color: white; font-family: Pretendard;
			box-sizing: border-box;
			font-size: 21px;
			cursor: pointer;
			border:none"
                            onmouseover="hover()" onmouseout="hoverOut()" onclick="submit2()">메이크업하러 가기
                    </button>
                </c:if>
            
            <script>
                function hover() {
                    document.getElementById('makeup').style.background = "#9f9f9f";
                    document.getElementById('makeup').style.transition = "all 0.5s ease";
                    document.getElementById('makeup').style.transitionDuration = "0.5s";
                    document.getElementById('makeup').style.transitionTimingFunction = "ease";
                    document.getElementById('makeup').style.transitionDelay = "0s";
                    document.getElementById('makeup').style.transitionProperty = "all";
                }

                function hoverOut() {
                    document.getElementById('makeup').style.background = "#FF5DA3";
                    document.getElementById('makeup').style.transition = "all 0.5s ease";
                    document.getElementById('makeup').style.transitionDuration = "0.5s";
                    document.getElementById('makeup').style.transitionTimingFunction = "ease";
                    document.getElementById('makeup').style.transitionDelay = "0s";
                    document.getElementById('makeup').style.transitionProperty = "all";
                }
                
                function submit2() {
                	$("#personal_form").submit();
                }
            </script>

        </div>
    </div>

<%@include file="/WEB-INF/views/common/footer.jspf" %>