<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/common/header.jspf"%>

   <!-- bodyWrap -->
   <div id="bodyWrap">
      <h3 class="cnts_title">
         <span id="menuTitle">마이 페이지</span>
      </h3>
      <div class="sub_container">
         <!-- lnb -->
         <div class="lnb_wrap">
            <h4>
               <a href="/member/mypage">마이페이지<!-- 마이페이지 --></a>
            </h4>
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
               <p class="phone">
                  1800-5700 <span style="color: #c69c6d;" class="txt">(유료)</span>
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
         
         
         
    <form id="hpointHiddenForm" method="post" action="" target="joinStart_window">
        <input type="hidden" name="prtnrReqGb" value="02">
        <input type="hidden" name="prtnrId" value="D080">
        <input type="hidden" name="chnnlId" value="1705">
        <input type="hidden" name="ptcoReqnMdaInf" id="ptcoReqnMdaInf" value="">
    </form>
    <form id="orderSearchForm" action="http://www.thehandsome.com/ko/mypage/order/myorderlist">
        <input type="hidden" name="sterm" class="input_date" title="기간 입력" id="sterm" value="2022-09-19" readonly="">
        <input type="hidden" name="eterm" class="input_date" title="기간 입력" id="eterm" value="2022-10-19" readonly="">
    </form>
    <!-- 최근주문 -->
    <div class="title_wrap" style="margin-top: 37px">
        <h4 class="float_left">최근주문<!-- 최근주문 --></h4>
    </div>
    <!-- table -->
    <div class="tblwrap lncl1812"><!-- 클래스추가 181204 -->
        <table class="tbl_ltype review_betterment1905">
            <caption>상품평 리스트</caption>
            <colgroup class="interval1812"><!-- 수정 181204 -->
                <col style="width:120px">
                <col>
                <col style="width:42px">
                <col style="width:107px">
                <col style="width:108px">
                <col style="width:96px">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">주문번호<!-- 주문번호 --></th>
                    <th scope="col">상품정보<!-- 상품정보 --></th>
                    <th scope="col" style="padding:15px 0">수량<!-- 수량 --></th><!-- 스타일추가 181204 -->
                    <th scope="col">판매가<!-- 판매가 --></th>
                    <th scope="col">주문상태<!-- 주문상태 --></th>
                    <th scope="col">구분<!-- 구분 --></th>
                </tr>
            </thead>
            <tbody id="listBody">
            <c:choose>
                  <c:when test="${recentouv eq null }">
                     <tr>
                             <td colspan="6" class="no_data">최근 한 달간 주문내역이 없습니다.<!-- 최근 한 달간 주문내역이 없습니다. --></td>
                         </tr>   
                     </c:when>
         <c:otherwise>
                        <tr class="al_middle">
                        <td rowspan="${fn:length(recentouv.orders)+1 }" class="frt">
                                  <p class="num">${recentouv.oid }</p>
                               <span class="sum_date">
                               (${recentouv.odate })
                               </span>

                            </td>
                           <c:forEach items="${recentouv.orders }" var="order" varStatus="st">
                              <c:choose>
                                 <c:when test="${st.current=='0' }">
                                    <td>
                                       <div class="pt_list_all">
                                          <a
                                             href="/product/product_detail?pid=${order.productVO.pid}&colorcode=${order.ccolorcode}">
                                             <img src="${order.thumbnail.c_thumbnail1 }"
                                             style="object-fit: cover">
                                          </a>
                                          <div class="tlt_wrap">
                                             <a
                                                href="/product/product_detail?pid=${order.productVO.pid}&colorcode=${order.ccolorcode}">
                                                <span class="tlt"> ${order.productVO.bname } </span> <br />
                                                <span class="sb_tlt"> ${order.productVO.pname } </span>
                                             </a>
                                             <p class="color_op">
                                                color : ${order.thumbnail.cname } <span class="and_line">
                                                   /</span> size : ${order.ssize }
                                             </p>
                                          </div>
                                       </div>
                                    </td>
                                    <td>${order.oamount }</td>
                                    <td rowspan="${fn:length(ouv.orders)+1 }" class="totalprice">${recentouv.oprice}<input
                                       type="hidden" class="totalprice"
                                       value="${recentouv.oprice}">
                                    </td>
                                    <td>배송준비중</td>
                                    <td></td>
                                 </c:when>
                                 <c:otherwise>
                                    <tr class="al_middle">
                                       <td>
                                          <div class="pt_list_all">
                                             <img src="${order.thumbnail.c_thumbnail1 }"
                                                style="object-fit: cover">
                                             <div class="tlt_wrap">
                                                <a
                                                   href="/product/product_detail?pid=${order.productVO.pid}&colorcode=${order.ccolorcode}">
                                                   <span class="tlt"> ${order.productVO.bname } </span> <br />
                                                   <span class="sb_tlt"> ${order.productVO.pname }
                                                </span>
                                                </a>
                                                <p class="color_op">
                                                   color : ${order.thumbnail.cname } <span
                                                      class="and_line"> /</span> size : ${order.ssize }
                                                </p>
                                             </div>
                                          </div>
                                       </td>
                                       <td>${order.oamount }</td>
                                       
                                       <c:if test="${st.index==0 }">
                                       <td rowspan="${fn:length(recentouv.orders)+1 }" class="totalprice">${recentouv.oprice}
                                           <input
                                          type="hidden" class="totalprice"
                                          value="${recentouv.oprice}">
                                       </td>
                                             <input type="hidden" id="ostatus" value="${recentouv.ostatus }">
                                             <td rowspan="${fn:length(recentouv.orders)+1 }" >
                                                <c:choose>
                                                   <c:when test="${recentouv.ostatus ==1}">
                                                      주문 완료
                                                   </c:when>
                                                   <c:when test="${recentouv.ostatus ==2}">
                                                      배송 준비중
                                                   </c:when>
                                                   <c:when test="${recentouv.ostatus ==3}">
                                                      취소 요청
                                                   </c:when>
                                                   <c:when test="${recentouv.ostatus ==4}">
                                                      주문 취소
                                                   </c:when>
                                                   <c:when test="${recentouv.ostatus ==5}">
                                                      배송중
                                                   </c:when>
                                                   <c:when test="${recentouv.ostatus ==6}">
                                                      배송 완료
                                                   </c:when>
                                                   <c:otherwise>
                                                      주문 오류
                                                   </c:otherwise>
                                                </c:choose>
                                                
                                             </td>                                    
                                             <td rowspan="${fn:length(recentouv.orders)+1 }" >
                                                <c:if test="${recentouv.ostatus==1 }">
                                                   <a href="javascript:orderCancelBtnClick()"
                                                      class="btn wt_ss orderCancelBtn" id="orderCancelBtn">주문취소</a>
                                                      <form id="orderCancel" action="/order/ordercancel"
                                                         method="post">
                                                         <input type="hidden" name="oid" id="oid" value="${recentouv.oid }" />
                                                         <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                      </form>
                                                </c:if>                                                 
                                             </td>
                                          </c:if>
                                    </tr>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                  </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div> 
    <!-- table -->
   <div class="paging"></div>
            <!-- //paging -->

            <!-- Guide Table -->
            <div class="gd_wrap mt70">
               <dl class="gd_list com pl0">
                  <dt>
                     주문 배송 조회 안내
                     <!-- 주문 배송 조회 안내 -->
                  </dt>
                  <dd>
                     <ul class="bul_sty01_li">
                        <li>한섬마일리지는 배송 완료 후 10일 후 지급 됩니다.<!-- 한섬마일리지는 배송 완료 후 10일 후 지급 됩니다. --></li>
                        <li>반품신청은 배송완료 후 7일까지 가능 합니다.<!-- 반품신청은 배송완료 후 7일까지 가능 합니다. --></li>
                        <li>배송준비중 상태에서는 주문의 취소/변경이나 주소의 변경이 불가능 합니다.<!-- 배송준비중 상태에서는 주문의 취소/변경이나 주소의 변경이 불가능 합니다. --></li>
                        <li>주문 시 사용한 기프트 카드, 한섬마일리지는 모두 동일 수단으로 환불됩니다.<!-- 주문 시 사용한 기프트 카드 , 한섬마일리지는 모두 동일 수단으로 환불됩니다. --></li>
                        <li>한섬마일리지는 정상 매장 기준 5%, 아울렛 1% 적립됩니다. (세일상품 제외)<!-- 한섬마일리지는 정상 매장 기준 5%, 아울렛 1% 적립됩니다. (세일상품 제외) --></li>
                        <li>10%를 초과하여 할인하는 상품은 마일리지 적립 대상에서 제외됩니다.<!-- 10%를 초과하여 할인하는 상품은 마일리지 적립 대상에서 제외됩니다. --></li>
                        <li>주문완료 상태까지는 배송지 수정이 가능 합니다.<!-- 주문완료 상태까지는 배송지 수정이 가능 합니다. --></li>
                        <li>가상계좌 결제 시 입금대기 상태에서 4시간 내 입금하지 않으면 자동으로 주문이 취소 됩니다.<!-- 가상계좌 결제 시 입금대기 상태에서 24시간 내 입금하지 않으면 자동으로 주문이 취소 됩니다. --></li>
                        <li>상세보기 화면에서 증빙서류의 출력이 가능 합니다.<!-- 상세보기 화면에서 증빙서류의 출력이 가능 합니다. --></li>
                     </ul>
                  </dd>
               </dl>
            </div>
            <div class="gd_wrap">
               <div class="delivery_step">
                  <p class="title">
                     주문/배송프로세스
                     <!-- 주문 / 배송 프로세스 -->
                  </p>
                  <ol>
                     <li>
                        <p class="step">
                           <span>STEP 1</span> 1. 입금대기중
                           <!-- 입금 대기중 -->
                        </p>
                        <p class="txt">
                           가상계좌를 선택 하셨다면 결제를 완료해 주세요.
                           <!-- 가상계좌를 선택 하셨다면<br>결제를 완료해 주세요. -->
                        </p>
                     </li>
                     <li>
                        <p class="step">
                           <span>STEP 2</span> 2. 주문완료
                           <!-- 주문완료 -->
                        </p>
                        <p class="txt">
                           주문정보를 확인하고 있습니다.
                           <!-- 주문정보를 확인 하고<br>있습니다. -->
                        </p>
                     </li>
                     <li>
                        <p class="step">
                           <span>STEP 3</span> 3. 배송준비중
                           <!-- 배송 준비중 -->
                        </p>
                        <p class="txt">
                           상품의 배송을 준비하고 있습니다.
                           <!-- 상품의 배송을 준비하고<br>있습니다. -->
                        </p>
                     </li>
                     <li>
                        <p class="step">
                           <span>STEP 4</span> 4. 배송중
                           <!-- 배송중 -->
                        </p>
                        <p class="txt">
                           물품이 발송되어 고객님께 배송 중 입니다.
                           <!-- 물품이 발송되어 고객님께<br>배송 중 입니다. -->
                        </p>
                     </li>
                     <li>
                        <p class="step">
                           <span>STEP 5</span> 5. 배송완료
                           <!-- 배송완료 -->
                        </p>
                        <p class="txt">
                           배송이 완료 되었습니다.
                           <!-- 배송이 완료 되었습니다.-->
                        </p>
                     </li>
                  </ol>
               </div>
            </div>
            <!-- //Guide Table -->
         </div>

         <!-- //cnts -->
      </div>
   </div>
</body>
<script>
$('.totalprice').each(function(idx){
   $(this).text("₩"+$("input[class='totalprice']").val().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
})

$('.orderCancelBtn').click(function(){

    Swal.fire({
        text: '주문을 취소 하시겠습니까?',
        icon: 'warning',

        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
        confirmButtonText: '주문취소', // confirm 버튼 텍스트 지정
        cancelButtonText: '닫기', // cancel 버튼 텍스트 지정
    }).then(result => {
        if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
            Swal.fire('주문이 취소되었습니다.');
            $(this).next().submit();
        }
    });
});

//주문을 취소할 때 실행되는 함수
function orderCancelBtnClick(){
    Swal.fire({
        text: '주문을 취소 하시겠습니까?',
        icon: 'warning',
        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
        confirmButtonText: '주문취소', // confirm 버튼 텍스트 지정
        cancelButtonText: '닫기', // cancel 버튼 텍스트 지정
    }).then(result => {
        if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
            Swal.fire(
                  '주문 취소',
                  '주문이 취소되었습니다.',
                  'success'
                  ).then((result)=>{
                     $("#orderCancel").submit();
                  });
        }  
   });
}
//주문 목록으로 이동한다.
function Goorderlist(){
   $("#orderlist").submit();
}
</script>
<%@include file="/WEB-INF/views/common/footer.jspf"%>