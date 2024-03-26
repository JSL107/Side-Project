<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="bodyWrap">
	<h3 class="cnts_title">
		<span id="menuTitle">고객센터</span>
	</h3>
	<div class="sub_container">
		<!-- lnb -->
		<div class="lnb_wrap">
			<h4>
				<a href="/ko/mypage">마이페이지 <!-- 마이페이지 --></a>
			</h4>
			<div class="lnb">
				<dl>
					<dt>주문조회</dt>
					<dd>
						<a href="/ko/mypage/order/myorders"
							onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a>
					</dd>
				</dl>
				<dl>
					<dt>혜택관리</dt>
					<dd>
						<a href="/ko/mypage/voucher"
							onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰 <!-- 쿠폰함 --></a>
					</dd>
				</dl>
				<dl>
					<dt>나의 상품관리</dt>
					<dd>
						<a href="/ko/mypage/myWish"
							onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트 <!-- 위시리스트 --></a>
					</dd>
				</dl>
				<dl>
					<dt>나의 정보관리</dt>
					<dd>
						<a href="/ko/mypage/personInfomationChangePWCheck"
							onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a>
					</dd>
					<dd>
						<a href="/ko/mypage/shoppingAddressPWCheck"
							onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a>
					</dd>
				</dl>
				<dl>
					<dt>나의 활동관리</dt>
					<!-- <dd><a href="#">회원등급</a></dd> -->
					<dd>
						<a href="/ko/mypage/myreview"
							onclick="GA_Event('마이페이지','LNB','내 상품평');">내 상품평</a>
					</dd>
					<dd>
						<a href="/ko/mypage/myqna"
							onclick="GA_Event('마이페이지','LNB','상품 Q&amp;A');">상품 Q&amp;A</a>
					</dd>
					<dd>
						<a href="/ko/mypage/mymantomaninquiry"
							onclick="GA_Event('마이페이지','LNB','1:1 문의');">1:1 문의</a>
					</dd>
					<!-- <dd><a href="#">이벤트 참여현황</a></dd> -->
				</dl>
			</div>
			<!-- ph_guide -->
			<div class="ph_guide">
				<p class="tlt">고객센터 운영 안내</p>
				<p class="phone">
					1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
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


			<style type="text/css">
tr.hidden {
	display: none;
}

.reply {
	margin-top: 20px;
}
</style>
			<!-- //lnbWrap -->

			<form id="mantomaninquiryForm" action="/ko/svcenter/mantomaninquiry">
				<input type="hidden" name="pkInquiry" id="pkInquiry">
			</form>
			<form id="mantomaninquiryListForm"
				action="/ko/mypage/mymantomaninquirylist"></form>

			<div class="title_wrap mt50">
				<h4 class="float_left">고객센터</h4>
				<p class="txt_line">고객님의 문의를 등록하시면 빠른 시일 내 답변 드리겠습니다.</p>
				<div class="btn_wrap">
					<a href="/qna/qnaAdd" class="btn add_ss mr0">문의하기</a>
				</div>
			</div>

			<div class="tblwrap">
				<table class="tbl_ltype">
					<caption>&gt;나의 1:1 문의 목록</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 140px">
						<col>
						<col style="width: 100px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">등록일</th>
							<th scope="col">상담유형</th>
							<th scope="col">내용</th>
							<th scope="col">작성자</th>
							<th scope="col">처리상태</th>
						</tr>
					</thead>
					<tbody id="listBody">
						<c:forEach items="${list}" var="list" varStatus="status">
							<tr class="al_middle" id="clickme1" cdlist="[]"
								pk="8934868406202"
								onclick="show1('${list.qid}', '${list.mid}', '${list.state}');">
								<td class="frt"><fmt:formatDate value="${list.qdate}"
										pattern="yyyy-MM-dd" /></td>
								<td class="al_left" style="text-align: center">
									${list.qcategory}</td>
								<td>${list.qtitle}</td>
								<td>${list.mid}</td>
								<c:choose>
									<c:when test="${list.state eq '[답변완료]'}">
										<td style="color: blue">${list.state}</td>
									</c:when>
									<c:otherwise>
										<td>${list.state}</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="info3" style="display: none" id="hideme${list.qid}">
								<td class="qna_wrap" colspan="5">
									<div class="qna_box ch">
										<p></p>
										<div class="qt">
											<span class="ico">quest</span>
											<div class="txt">
												<p style="word-wrap: break-word">${fn:replace(list.qcontent, replaceChar,
													"<br />")}</p>
											</div>
										</div>
										<div class="an">
											<span class="ico"></span>
											<div class="txt">
												<p>${fn:replace(list.qreply, replaceChar, "<br />")}</p>
											</div>
											<form id="addReply" action="/qna/qnaReplyAdd" name="formm"
												method="post" enctype="multipart/form-data">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<div class="reply">
													<input type="hidden" name="qid" value="${list.qid}" />
													<%-- <input type="text" name="qreply" id="adminAnswer${list.qid}" style="display:none;"/> --%>
													<textarea name="qreply" id="adminAnswer${list.qid}"
														style="display: none; width: 98%; vertical-align: middle; resize: none; padding: 2px"
														cols rows="4"></textarea>
													<div style="margin: 5px 0 0 2px;">
														<input type="submit" id="adminAnswerBtn${list.qid}"
															value="답변달기" onclick="addReply('${list.qid}')"
															style="display: none; width: 98%; padding: 5px 0;" />
													</div>
												</div>
											</form>
											<div class="btnwrap mt40" id="myDIV${list.qid}"
												style="display: none; text-align: right;">
												<a href="/qna/qnaModify?qid=${list.qid}" id="qnaWriteSend">수정</a>
												<a href="javascript:deleteQna(${list.qid})" id="qnaCancle">삭제</a>
											</div>
											<p class="date"></p>
										</div>
									</div>

								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- //Table -->

			<!-- 김가희 김나형 - paging-->
			<div class="paging" style="display: block;">
				<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
				<a class="prev2" href="#"></a>
				<c:if test="${pageMaker.prev}">
					<!-- 이전 버튼 -->
					<a class="prev" href="/qnaMain?pageNum=${pageMaker.startPage - 1}">Previous</a>
				</c:if>

				<!-- 1~10 버튼 -->
				<span class="num"> <c:forEach var="num"
						begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
							<a href="/qna/qnaMain?pageNum=${num}" class="pageBtn">${num}</a>
						</c:if>
					</c:forEach>
				</span>  
				<c:if test="${pageMaker.next}">
					<!-- 다음 버튼 -->
					<a href="/qna/qnaMain?pageNum=${pageMaker.endPage +1}" class="next">Next</a>
				</c:if>
				<a class="next2" href="#"></a>
			</div>

			<form id='actionForm' action="/qnaMain" method='get'>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type='hidden' name='pageNum'
					value='${pageMaker.cri.pageNum}'> <input type='hidden'
					name='amount' value='${pageMaker.cri.amount}'>
			</form>
			<!--//paging-->
		</div>
		<!-- //cnts -->
	</div>
</div>
<script type="text/javascript">
	//김가희 김나형 - 누르면 답변내용 보여지게 하는거
	function show1(qid, mid, qstate) {
		console.log("qid: " + qid + " mid: " + mid);
		//누른 게시글 내용보이기
		$('#hideme' + qid).slideToggle();

		//작성자와 로그인한 아이디 비교해서 같으면 수정삭제버튼 보이기
		console.log("로그인한 아이디: " + "${member.mid}");
		var loginId = "${member.mid}";

		//관리자일때 답변다는 창 보여주기
		if (loginId == 'admin' && qstate == '[접수완료]') {
			console.log("관리자");
			$("#adminAnswer" + qid).css('display', 'block');
			$("#adminAnswerBtn" + qid).css('display', 'block');
		}

		if (loginId != mid) {
			console.log("로그인 아이디랑 다름!");
			$("#myDIV" + qid).css('display', 'none');
			/* document.getElementById("myDIV").style.display = "none"; */

		} else {
			console.log("로그인 아이디와 같음");
			if (qreply != '') {
				$("#myDIV" + qid).css('display', 'none');
			} else {
				$("#myDIV" + qid).css('display', 'block');
			}
		}

	}

	//김가희 김나형 - 게시글을 삭제하는 함수
	function deleteQna(qid) {
		if (confirm('정말 삭제하시겠습니까?')) {
			location.href = "/qna/qnaDelete?qid=" + qid;
		}
	}

	//김가희 김나형 - 관리자가 답변을 다는 함수
	function addReply(qid) {
		/* console.log(document.formm.qreply.value()); */
		document.formm.action = "/qna/qnaReplyAdd";
		$("#addReply").submit();
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>