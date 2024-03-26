<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                <h3>상품 QnA 관리</h3>
                <h5>상품 QnA 조회와 답변을 할 수 있습니다.</h5>
                <h5>${qnastatus }</h5>
              	</div>
				<div class="admin_container">
					<div class="top">
					<span style="line-height: 40px;
    					font-size: 15px;
    					padding-left: 20px;
    					font-weight: bold;">상품 QnA 관리
    				</span>
    				<span style="float: right;">
    					<button type="status_button" style="display:inline-block;color:#fff;font-size:14px;line-height:14px;font-family:Dotum,sans-serif;font-weight:normal;text-decoration:none;background-color:#4a4a4a;
    							border:0;padding:14px 48px;margin:0 height: 40px; width: 250px; margin-right:0px; " onclick="showQnaStatusChart();"><strong>통계보기</strong></button>    				
    				</span>
    				</div>					
					<div class="content bottom">					
						<div class="tbl_container" style="width: 95%;margin-left: auto;margin-right: auto;padding-top: 20px;padding-bottom: 20px;">		                		
								<table id="datatable" style="width: 100%; border-top:1px solid #414040;border-collapse:collapse;border-spacing:0;margin-bottom:30px">
					
						      <thead>
					        <tr>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">상품 번호</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">제목</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">이름</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">작성 날짜</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">이메일</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">답변상태</th>
											<th scope="col" style="padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#eae9e9;font-size:12px">SMS수신</th>	
					        </tr>
					      </thead>
					      <tbody>
					      				<c:forEach items="${qnalist }" var="qnaDTO" varStatus="status">								
												<tr style="font-size:11px;text-align:center">
													<td style="padding:15px;color:#222;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:13px">${qnaDTO.pid }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">
														<a href="javascript:qnaDetail('${qnaDTO.qtitle}', '${qnaDTO.qcontent}', '${qnaDTO.qsmssend}','${qnaDTO.qno}','${qnaDTO.qemail}',
																'${qnaDTO.qphonenum}','${qnaDTO.qdate}','${qnaDTO.qreplycontent}');">${qnaDTO.qtitle}</a>
													</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${qnaDTO.mname }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${qnaDTO.qdate }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${qnaDTO.qemail }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${qnaDTO.qstate }</td>
													<td style="padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px">${qnaDTO.qsmssend }</td>													
												</tr>
												<input type="hidden" id="replycontent_${qnaDTO.qno }" value="${qnaDTO } " />																																								
										</c:forEach>										
					      </tbody>
	
						</table>
						
								
							</div>						
									
					</div>
				</div>

		 <!-- 답변  Modal-->
		<div class="modal fade" id="qnaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">문의 조회</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body" id="question_qtitle"></div>
					<div class="modal-body" id="question_qcontent" style="border-bottom:1px solid #dee2e6;"></div>
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">답변</h5>					
					</div>
					<div class="modal-body" id="reply_content" >
						<div class="x_content">
								<div id="alerts"></div>
								<div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
										<ul class="dropdown-menu">
										</ul>
									</div>

									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li>
												<a data-edit="fontSize 5">
													<p style="font-size:17px">Huge</p>
												</a>
											</li>
											<li>
												<a data-edit="fontSize 3">
													<p style="font-size:14px">Normal</p>
												</a>
											</li>
											<li>
												<a data-edit="fontSize 1">
													<p style="font-size:11px">Small</p>
												</a>
											</li>
										</ul>
									</div>
								
									<div class="btn-group">
										<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
										<a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
										<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
										<a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn btn-info" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
										<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
										<a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
										<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
									</div>
									
									<div class="btn-group">
										<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
										<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
									</div>
								</div>

								<div id="editor-one" class="editor-wrapper placeholderText"  contenteditable="true">
								</div>
					
								<textarea name="descr" id="descr" style="display:none;"></textarea>
								<br>
								
							</div>
					</div>
					<div class="modal-footer">
						<a class="btn" id="modalY" onclick="reply_submit();">답변</a>
						<button class="btn" type="button" data-dismiss="modal">취소</button>
					</div>
					<input type="hidden" id="qno" value=""/>
					<input type="hidden" id="qemail" value=""/>
					<input type="hidden" id="qphonenum" value=""/>
					<input type="hidden" id="qsmssend" value=""/>
					<input type="hidden" id="qcontent" value=""/>
					<input type="hidden" id="qdate" value=""/>					
					<input type="hidden" id="qreplycontent" value=""/>
				</div>
			</div>
		</div>
            <!-- 여기까지 틀 -->
        </div>
     
     
<div class="modal fade" id="qnaModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">문의 조회</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
      </div>
      <div class="modal-body" id="question_qtitle2"></div>
      <div class="modal-body" id="question_qcontent2" style="border-bottom:1px solid #dee2e6;"></div>
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">답변</h5>					
      </div>
      <div class="modal-body" id="reply_content2" >
      </div>
      <div class="modal-footer">
        <button class="btn" type="button" data-dismiss="modal">취소</button>
      </div>
      <input type="hidden" id="qno" value=""/>
      <input type="hidden" id="qemail" value=""/>
      <input type="hidden" id="qphonenum" value=""/>
      <input type="hidden" id="qsmssend" value=""/>
      <input type="hidden" id="qcontent" value=""/>
      <input type="hidden" id="qdate" value=""/>					
      <input type="hidden" id="qreplycontent" value=""/>
    </div>
  </div>
</div> 
     
    
    
    
    
    
        
    <!-- 통계  Modal-->
	<div class="modal fade" id="statusModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">답변 통계</h5>
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
function showQnaStatusChart(){
	$('#statusModal').modal("show");
}

function qnaDetail(title, content, smssend, qno, email, phonenum, date, qreplycontent){
	$("#question_qtitle").text(title);
	$("#question_qcontent").text(content);
	$("#qno").val(qno);	
	$("#qemail").val(email);
	$("#qphonenum").val(phonenum);
	$("#qsmssend").val(smssend);
	$("#qcontent").val(content);
	$("#qdate").val(date);
	$("#qreplycontent").val(qreplycontent);

	if($("#qreplycontent").val()!=""){
		$("#question_qtitle2").text(title);
		$("#question_qcontent2").text(content);
		$("#reply_content2").text(qreplycontent);
		$('#qnaModal2').modal("show");
	}
	else{		
		$('#qnaModal').modal("show");
	}
}
function reply_submit(){
	const divNode = document.getElementById("editor-one");
	let qreplycontent=divNode.innerHTML;
	let qno=$("#qno").val();
	let qemail=$("#qemail").val();
	let qphonenum=$("#qphonenum").val();
	let qsmssend=$("#qsmssend").val();
	let qcontent=$("#qcontent").val();
	let qdate=$("#qdate").val();
	let qmanager="${mid}";
	const params={
			qno: qno,
			qreplycontent: qreplycontent,
			qmanager: qmanager,
			qemail: qemail,
			qphonenum: qphonenum,
			qsmssend: qsmssend,
			qcontent: qcontent,
			qdate: qdate
	};
	
	Swal.fire({
		  title: '답변 등록',
		  text: "회원의 질문에 답변을 등록하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',		  
		  confirmButtonText: '확인',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.isConfirmed) {
			  $.ajax({
					url : '/qna/adminreply',
					type : 'POST',
					data : JSON.stringify(params),
		            contentType : 'application/json; charset=utf-8',
					success : function(result) {
						 Swal.fire(
							      '답변 등록 완료',
							      '당신의 답변이 등록 완료되었습니다.',
							      'success'
							    ).then((result)=>{
							    	location.reload();
							    });
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("ajax 통신에러 답변 등록 실패");
					},
				})  

		  }
		  else{
			  return;
		  }
		})	


}

var options = {
        series: [${qnastatus1}, ${qnastatus2}],
        chart: {
        width: '100%',
        type: 'pie',
      },
      labels: ["답변대기중", "답변완료"],
      theme: {
        monochrome: {
          enabled: true
        }
      },
      fill: {
    	  colors: ["#7BACEB",
              "#F58E81" ]
    	},
      plotOptions: {
        pie: {
          dataLabels: {
            offset: -5
          }
        }
      },
      title: {
        text: "관리자 답변 상태 통계"
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
      

</script>