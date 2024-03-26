<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Latest compiled and minified CSS -->
<style>
.paging-div {
  padding: 15px 0 5px 10px;
  display: table;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}

 .right_col .admin_container{    
    box-shadow: 0 1px 14px 6px rgb(0 0 0 / 11%);
    border-radius: 10px 10px 10px 10px;
    postion: absolute;
    margin-right: auto;
    margin-left: 30px;
    width:85%    
  }
  .admin_container .top {
    background-color: #F3F3F3;
    height: 40px;
    border-radius: 10px 10px 0px 0px;
    vertical-align: middle;
  }

</style>

<body>
<%@ include file="../common/header.jspf"%>
<%@include file="../admin/sidebar.jspf" %>


	<div class="right_col" role="main">
            <!-- top tiles -->
				<div class="title_left" style="
   					 padding-left: 30;
    				 padding-top: 130;
    				 padding-bottom: 20;">
    			
    			<h3>주문 상태관리</h3>
                
                <h5>고객의 주문 내역 조회와 수정을 할 수 있습니다.</h5>
                <h5>${orderstatus }</h5>
              	</div>
				<div class="admin_container">
					<div class="top">
					<span style="line-height: 40px;
    					font-size: 15px;
    					padding-left: 20px;
    					font-weight: bold;">주문 상태관리    					
    				</span>
    				<span style="float: right;">
    					<button type="status_button" style="display:inline-block;color:#fff;font-size:14px;line-height:14px;font-family:Dotum,sans-serif;font-weight:normal;text-decoration:none;background-color:#4a4a4a;
    							border:0;padding:14px 48px;margin:0 height: 40px; width: 250px; margin-right:0px; " onclick="showOrderStatusChart();"><strong>통계보기</strong></button>    				
    				</span>
    				</div>					
					<div class="content bottom">					
						<div class="tbl_container" style="width: 95%;margin-left: auto;margin-right: auto;padding-top: 20px;padding-bottom: 20px;">		                		
								<table id="datatable" 
							style="width: 100%; border-top:1px solid #414040;border-collapse:collapse;border-spacing:0;margin-bottom:30px">
						      <thead>
					        <tr>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">주문 번호</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">회원 ID</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">결제 번호</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">주문 날짜</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">주문 상태</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">상태 관리</th>
					        </tr>
					      </thead>
					      <tbody>
					      			<c:forEach items="${orderlist }" var="orderVO" varStatus="status">
								
												<tr style="font-size:11px;text-align:center">
													<td style="padding:15px;color:#222;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:13px">${orderVO.oid }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${orderVO.mid }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${orderVO.imp_uid }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${orderVO.odate }</td>										
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">										
														<c:choose>
															<c:when test="${orderVO.ostatus ==1}">
																주문 완료
															</c:when>
															<c:when test="${orderVO.ostatus ==2}">
																배송 준비중
															</c:when>
															<c:when test="${orderVO.ostatus ==3}">
																취소 요청
															</c:when>
															<c:when test="${orderVO.ostatus ==4}">
																주문 취소
															</c:when>
															<c:when test="${orderVO.ostatus ==5}">
																배송중
															</c:when>
															<c:when test="${orderVO.ostatus ==6}">
																배송 완료
															</c:when>
															<c:otherwise>
																주문 오류
															</c:otherwise>
														</c:choose>
													</td>
													
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">
														<span>
															<select class="form-select" id="selected_${status.index }" style="height:40px;">
															  <option selected>상태 선택</option>
															  <option value="1">주문 완료</option>
															  <option value="2">배송 준비중</option>
															  <option value="3">취소 요청</option>
															  <option value="4">주문 취소</option>
															  <option value="5">배송중</option>
															  <option value="6">배송완료</option>
															</select>
														</span>
														<span style="padding-left:13px;">
															<button type="status_button" style="display:inline-block;color:#fff;font-size:14px;line-height:14px;font-family:Dotum,sans-serif;font-weight:normal;text-decoration:none;background-color:#4a4a4a;border:0;padding:14px 40px;margin:0"
															onclick="statusButtonClick(${status.index });">변경</button>
														</span>
														<input type="hidden" id="listoid_${status.index }" value="${orderVO.oid }" />																											
													</td>
												</tr>
																													
										</c:forEach>											
					      </tbody>
	
						</table>
						</div>						
									
					</div>
				</div>
            <!-- /top tiles -->
        </div>
        
        
        
    <!-- 답변  Modal-->
	<div class="modal fade" id="statusModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">현 주문 상황 통계</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>

				<div class="modal-body" id="question_qcontent">
					<div id="chart" width="300" height="186" style=""></div>
				</div>	

				<div class="modal-footer">
					<button class="btn" type="button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../common/footer.jspf" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script>
function showOrderStatusChart(){
	$('#statusModal').modal("show");
}

var options = {
        series: [${status1}, ${status2},${status3},${status4},${status5}],
        chart: {
        width: '100%',
        type: 'pie',
      },
      labels: ["주문완료", "배송준비중", "취소 요청", "주문 취소", "배송중"],
      theme: {
        monochrome: {
          enabled: true
        }
      },
      fill: {
    	  colors: ["#0080FF",
              "#fd7c78",
              "#70dafc",
              "#fed085",
              "#b9e88b" ]
    	},
      plotOptions: {
        pie: {
          dataLabels: {
            offset: -5
          }
        }
      },
      title: {
        text: "주문 상태 통계"
      },
      dataLabels: {
        formatter(val, opts) {
          const name = opts.w.globals.labels[opts.seriesIndex]
          return [name, val.toFixed(1) + '%']
        },       
      },
      legend: {
        show: false
      }
      };

      var chart = new ApexCharts(document.querySelector("#chart"), options);
      chart.render();

function statusButtonClick(index){
	let ostatus= $("#selected_"+index).val();
	let oid= $("#listoid_"+index).val();
	if(ostatus!="상태 선택"){		
		Swal.fire({
			  title: '주문 상태를 변경',	
			  text: "주문 상태를 변경 하시겠습니까?",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
						url : '/order/statuschange',
						type : 'POST',
						data :{oid:oid, ostatus:ostatus},
						success : function(result) {
							Swal.fire(
								      '상태 변경 완료',
								      '주문 상태가 변경되었습니다.',
								      'success'
								    ).then((result)=>{
								    	location.reload();
								    });
							
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("ajax 통신에러 주문 상태 변경 실패");
						},
					});  
			  }
			  else{
				  return;
			  }
		});
		
/* 		if(confirm("주문 상태를 변경 하시겠습니까?")){
			alert("상태가 변경 되었습니다.");
			$.ajax({
				url : '/order/statuschange',
				type : 'POST',
				data :{oid:oid, ostatus:ostatus},
				success : function(result) {
					alert("주문 상태 변경완료");
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("ajax 통신에러 주문 상태 변경 실패");
				},
			});
		}
		else{
			return;
		} */
	}
}
</script>
</body>
</html>