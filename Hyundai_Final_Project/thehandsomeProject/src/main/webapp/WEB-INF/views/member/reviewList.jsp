<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/common/header.jspf"%>

<div id="bodyWrap">
	<h3 class="cnts_title"><span id="menuTitle">내 상품평</span></h3>
	<div class="sub_container">
		<!-- lnb -->
		<div class="lnb_wrap">
			<h4><a href="/member/mypage">마이페이지<!-- 마이페이지 --></a></h4>
			<div class="lnb">
				<dl>
					<dt>주문조회</dt>
					<dd>
						<a href="/member/orderlist">주문/배송/반품/취소</a>
						<form id="orderlist" action="/member/orderlist" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</dd>
				</dl>
				<dl>
					<dt>나의 상품관리</dt>
					<dd>
						<a href="/member/wishList">위시리스트<!-- 위시리스트 --></a>
					</dd>
				</dl>
				<dl>
					<dt>나의 정보관리</dt>
					<dd>
						<a href="/member/pwcheck">개인정보 변경/탈퇴</a>
					</dd>
				</dl>
				<dl>
					<dt>나의 활동관리</dt>
					<dd>
						<a href="/member/reviewList">내 상품평</a>
					</dd>
				</dl>
			</div>
			<!-- ph_guide -->
			<div class="ph_guide">
				<p class="tlt">고객센터 운영 안내</p>
				<p class="phone">1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span></p>
				<p class="txt">평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span></p>
				<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com</a>
			</div>
			<!-- //ph_guide -->
		</div>
		<!-- //lnb -->
		<!-- cnts -->
		<div class="sub_cnts">
			<div class="review_betterment1905">
				<div class="my_review_wrap1905">
					<h4>상품평 작성 시 추가 마일리지를 드려요!</h4>
					<div class="my_review_wrap_box">
						<div class="left">
							<p>• 온라인 구매 상품평 작성 시</p>
							<ul class="online">
								<li>
									<span class="img">정상상품</span>
									<span>구매금액의<br><b>0.5%</b></span>
								</li>
								<li>
									<span class="img">아울렛상품</span>
									<span>구매금액의<br><b>0.1%</b></span>
								</li>
								<li>
									<span class="img">포토상품평</span>
									<span>(상품별 최초)<br><b>2,000마일리지</b></span>
								</li>
							</ul>
						</div>
						<div class="right">
							<p>• 온라인/오프라인 구매</p>
							<ul class="offline">
								<li>
									<span class="img">베스트리뷰</span>
									<span>매월 5명<br><b>10만원</b> 바우처</span>
								</li>
							</ul>
						</div>
					</div>
					<div class="info">
						<ul class="bul_sty01_li">
							<li>마일리지는 배송 완료일로부터 30일 이내, 작성한 상품평에 한하여 제공됩니다.</li>
							<li>상품평 작성 시, 제공되는 추가 마일리지는 온라인에서 구입한 상품에 한하여 제공됩니다.</li>
							<li>베스트 리뷰는 온라인/오프라인에서 구매한 상품의 상품평 전체를 대상으로 선정합니다.</li>
							<li>할인, 쿠폰 적용 후 실결제금액이 5,000원 이상인 상품에 한하여 지급됩니다.</li>
							<li>판매가 종료된 상품의 경우, 상품 상세페이지가 소멸되어 상품평 작성 및 마일리지 적립이 불가능합니다.</li>
						</ul>
					</div>
				</div>
				<!-- Table -->
				<div class="review_tab_01" style="display: block;">
					<div class="tblwrap">
						<table class="tbl_ltype my_review_table review_betterment1905 add_arr190830">
							<caption>내 상품평 목록</caption>
							<colgroup>
								<!-- 수정 181204 -->
								<col style="width: 15%">
								<col style="width: 50%">
								<col style="width: 5%">
								<col style="width: 15%">
								<col style="width: 15%">
							</colgroup>
							<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">상품정보</th>
								<th scope="col" style="padding: 15px 0">수량</th>
								<th scope="col">판매가</th>
								<th scope="col">작성상태</th>
							</tr>
							</thead>
							<tbody id="listBody">
								<c:choose>
									<c:when test="${ouvl eq null }">
										<tr>
											<td colspan="5" class="no_data">주문내역이 없습니다.<!-- 주문내역이 없습니다. --></td>
										</tr>
									</c:when>	
									<c:otherwise>
										<c:forEach items="${ouvl}" var="ouv">
											<tr class="al_middle">
											<td rowspan="${fn:length(ouv.orders)+1 }" class="frt">
												<p class="num">${ouv.oid }</p>
												<span class="sum_date">
				                                    (${ouv.odate })
			                                    </span>
											</td>
											<c:forEach items="${ ouv.orders}" var="order" varStatus="st">
														<tr class="al_middle">
															<td>
																<div class="pt_list_all">
																	<a href="/product/product_detail?pid=${order.productVO.pid}&colorcode=${order.ccolorcode}">
																		<img src="${order.thumbnail.c_thumbnail1 }" style="object-fit : cover">
																	</a>
																	<div class="tlt_wrap">
																		<a href="/product/product_detail?pid=${order.productVO.pid}&colorcode=${order.ccolorcode}">
																		<span class="tlt">
																				<span class="bname">${order.productVO.bname }</span>
																		</span>
																			<br/>
																			<span class="sb_tlt">
																					${order.productVO.pname }
																			</span>
																		</a>
																		<p class="color_op">
																			COLOR : ${order.thumbnail.cname }<span class="and_line">/</span>SIZE : ${order.ssize }
																		</p>
																	</div>
																</div>
															</td>
															<td>${order.oamount }</td>
															<td class="totalprice"> ₩<fmt:formatNumber value="${order.totalprice }" pattern="#,###"></fmt:formatNumber> 
																<input type="hidden" class="totalprice" value="${order.totalprice }">
															</td>
															<td>
																<c:choose>
																	<c:when test="${order.reviewcheck=='false' }">
																		<a href="javascript:void(0)" class="btn wt_ss orderCancelBtn ReviewWriteBtn" onclick="reviewWrite(this);">리뷰작성</a>
																		<form class="reviewWriteForm" action="/member/reviewWrite" method="post" >
																			<input type="hidden" name="oid" value="${ order.oid}">
																			<input type="hidden" name="pid" value="${ order.pid}">
																			<input type="hidden" name="ccolorcode" value="${ order.ccolorcode}">
																			<input type="hidden" name="bname" value="${order.productVO.bname }">
																			<input type="hidden" name="pname" value="${order.productVO.pname }">
																			<input type="hidden" name="cname" value="${order.thumbnail.cname }">
																			<input type="hidden" name="size" value="${order.ssize }">
																			<input type="hidden" name="thumbnail" value="${order.thumbnail.c_thumbnail1 }">
																			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
																		</form>
																	</c:when>
																	<c:otherwise>
																		<a href="javascript:void(0)" class="btn wt_ss orderCancelBtn" id="getReview" onclick="getReview(this);">리뷰조회</a>
																		<form class="getReviewForm" action="/member/review" method="post" >
																			<input type="hidden" name="oid" value="${ order.oid}">
																			<input type="hidden" name="ccolorcode" value="${ order.ccolorcode}">
																			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
																		</form>
																	</c:otherwise>
																</c:choose>
															</td>
														</tr>
													</c:forEach>
												</c:forEach>
											</c:otherwise>
										</c:choose>
											
							</tbody>
						</table>
					</div>
				</div>
				<!-- //Table -->
				<!-- paging -->
				<div class="paging prPaging" style="display: none;"></div>
				<!-- //paging -->
				<div class="gd_wrap review_betterment1905" style="border-top:0;">
					<dl class="gd_list">
						<dt class="grd_inf">안내 및 유의사항</dt>
						<dd>
							<ul class="bul_sty01_li">
								<li>상품평 작성 마일리지는 정상 0.5%, 아울렛 0.1% 적립됩니다.</li>
								<li>마일리지는 온라인에서 구입한 상품의 상품평에 한하여 제공됩니다.</li>
								<li>상품평 작성 마일리지는 배송 완료일로부터 30일 이내 작성 시, 작성일 1일 이후 적립됩니다.</li>
								<li>구매 마일리지 적립 전에 작성한 상품평에 대해서는, 구매 마일리지 적립일에 합산 적립됩니다.</li>
								<li>마일리지의 유효기간은 적립일로부터 2년입니다.</li>
								<li>오프라인 매장에서 구매한 상품의 상품평 작성은 가능하나, 마일리지 적립 대상은 아닙니다.</li>
								<li>상품평은 홍보, 이벤트 등 다양한 방법으로 활용될 수 있습니다.</li>
								<li>아래와 같은 상품평은 사전 동의 없이 미게시로 전환될 수 있으며, 지급된 마일리지는 자동으로 회수됩니다.<br>
									1)부당 리뷰(직접 촬영하지 않은 캡쳐 사진, 해석 및 식별이 불가능한 리뷰, 타 상품에 대한 리뷰, 제 3자 사진 도움 등)<br>
									2)약관 및 법률 위배(비속어, 허위사실 등)<br>
									3)상기 내용에 준하는 사유라고 합리적으로 판단되는 경우</li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<!-- //cnts -->
	</div>
</div>
<script>

	function reviewWrite(btn){
	    // 1.빈창 팝업 생성
	    var url = "";
	    var windowTargetName = "targetName";
	    var popupX = (document.body.offsetWidth/2)-(750/2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (document.body.offsetHeight/2)-(1150/2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	    var features = 'scrollbars=yes,width=750,height=1150,location=no, resizable=yes,left='+ popupX + ', top='+ popupY;
	   
	    window.open(url, windowTargetName, features);
	
	    // 2.POST로 데이터 전달
	    let reviewWriteForm = btn.nextElementSibling;
	    reviewWriteForm.action="/member/reviewWrite"; // 이동
	    reviewWriteForm.method="post";
	    reviewWriteForm.target=windowTargetName;
	    reviewWriteForm.submit();
	}
	
	function getReview(btn){
	    // 1.빈창 팝업 생성
	    var url = "";
	    var windowTargetName = "targetName";
	    var popupX = (document.body.offsetWidth/2)-(750/2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (document.body.offsetHeight/2)-(1150/2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	    var features = 'scrollbars=yes,width=750,height=1150,location=no, resizable=yes,left='+ popupX + ', top='+ popupY;
	   
	    window.open(url, windowTargetName, features);
	
	    // 2.POST로 데이터 전달
	    let reviewWriteForm = btn.nextElementSibling;
	    reviewWriteForm.action="/member/review"; // 이동
	    reviewWriteForm.method="post";
	    reviewWriteForm.target=windowTargetName;
	    reviewWriteForm.submit();
	}
</script>
<%@include file="/WEB-INF/views/common/footer.jspf"%>