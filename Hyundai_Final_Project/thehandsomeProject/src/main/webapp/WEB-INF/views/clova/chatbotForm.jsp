<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/chatbot/chatbotForm.css" rel="stylesheet">
<style>
.bx-wrapper{
 box-shadow: none !important;
 border:none !important;
}
</style>
<!-- bxSlider -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	//부모창으로 이동
	function parent_window(url){
		parent.parentsUrl(url);
	}

	//페이지 맨 하단으로 이동
	function scrollDown() {
	    setTimeout(function () {
	        $('.chatFieldDiv').animate({
	            'scrollTop': $('.chatFieldDiv')[0].scrollHeight
	        }, 300);
	    }, 100);
	}

	//입력창 높이 조절	
	function adjustHeight() {
	  var textEle = $('textarea');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
	};

    function textAreaEnter(){
             event.preventDefault();
             doSubmit();
    };
    
    
    function doSubmit(){
    	let message ='';
    	
    	if($("#queryin").val()==''){
			return;
		}
    	message = '<div class="chatMsgUserSection">';
    	message += '<div class="chatMsgUserContainer">';
    	message += '<div class="bubbleWrapper">';
    	message += '<div class="bubble user">';
    	message += $("#queryin").val();
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	
    	$(".chatFieldDiv").append(message);
    	
		//csrf토큰
		let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
		$.ajax({
			type:'post',
			dataType:'text',
			url:'/clova/chatbot',
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data:{
				queryin:$("#queryin").val()
			},
			success:function(result, textStatus){
				
				console.log("textStatus : " + textStatus+"\n\n\nresult: "+result);
				
				var jData = JSON.parse(result);
				// 영업시간에 질문에 대한 답변
				var description = jData.bubbles[0].data.description;
				var res = description.split('+');
				console.log("res[0]" + res[0]);
				console.log("res[1]" + res[1]);
				console.log("res[2]" + res[2]);
				var ans = res[0].replace(/\n+/g, '<br/>');
				
				message = '<div class="chatMsgBotSection">';
				message += 		'<div class="chatBubbleSection">';
				message += 			'<div class="chatMsgBotProfileDiv">';
				message += 				'<div class="chatMsgBotProfile">';
				message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
				message += 				'</div>';
				message += 			'</div>';
				message += 			'<div class="chatMsgNameDiv">';
				message += 				'<div class="chatMsgName">';
				message += 					'HEENDY';
				message += 				'</div>';
				message += 			'</div>';
				message += 		'</div>';
				message += 		'<div class="chatMsgBubbleContainer">';
				message += 			'<div class="chatMsgBubbleContainer2">';
				message += 				'<div class="bubble bot">';
				message += 					ans;
				message += 				'</div>';
				message += 			'</div>';
				message += 		'</div>';
				message += 	'</div>';
				message += '</div>';
				$(".chatFieldDiv").append(message);
				
				if(res[1] == "style"){
					f_chatbot['f_run_'+res[1]](res[2], res[3]);
				}else if(res[1] == "talk"){
					f_chatbot['f_run_'+res[1]](res[2]);
				}else{
					f_chatbot['f_run_'+res[1]]();
				}
			}
		});
		$("#queryin").val("");
		scrollDown();
		
    }
    
	$(function(){
		$("#query").click(function(){
			doSubmit();
		});
	});
	
	function thisclose() {
		 parent.window.launchChatbot(); 
	}
	
	
	//챗봇 기능 함수들
	var f_chatbot = {}

	//최근 주문내역
	f_chatbot.f_run_orderlist = function(){ 
		let message ='';
		//csrf토큰
		let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
		
		$.ajax({
			type:'post',
			url:'/clova/orderlist',
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data:{
				mid:"${mid}"
			},
			success:function(result){
				if(Object.keys(result).length === 0){
					message = '<div class="chatMsgBotSection">';
					message += '<div class="chatMsgBubbleContainer">';
					message += '<div class="chatMsgBubbleContainer2">';
					message += '<div class="card">';
					message += '<div class="cardHeader">';
					message += '<span class="cardHeaderText">';
					message += '주문내역';
					message += '</span> ';
					message += '<img width="50" height="50" ';
					message += 'src="/resources/images/chatbot/empty-shopping-cart.png" alt="avatar"';
					message += 'style="position: absolute; top: 20px; left: 180px;">';
					message += '</div>';
					message += '<div class="cardBody">';
					message += '<div class="cardDescription">';
					message += '<p class="cardBrandName">최근 주문 내역이 없습니다.</p>';
					message += '</div>';
					message += '<button class="chatButton" onclick="javascript:parent_window(`/member/orderlist`)">자세히 보기</button>';
					message += '</div>';
					message += '</div>';
					message += '</div>';
					message += '</div>';
					message += '</div>';
				}else{
					var orderStatus = "";
					console.log("result.ostatus : " + result.ostatus);
					switch (result.ostatus) {
					  case 1:
						 orderStatus = "주문 완료";
					    break;
					  case 2:
							 orderStatus = "배송 준비중";
						    break;
					  case 3:
							 orderStatus = "취소 요청";
						    break;
					  case 4:
							 orderStatus = "주문 취소";
						    break;
					  case 5:
							 orderStatus = "배송중";
						    break;
					  case 6:
							 orderStatus = "배송 완료";
						    break;
				      default:
				    	  orderStatus = "주문 오류";
					}
					message = '<div class="slider">';
						//주문한 상품 수에 맞추어 출력
						result.orders.forEach(function(order) {
							//message += 	'<div class="chatMsgBotSection swiper-slide">';
							message += 	'<div class="chatMsgBotSection">';
							message += 		'<div class="chatMsgContainer chatMsgBubbleContainer">';
							message += 			'<div class="chatMsgBubbleContainer2 ">';
							message += 				'<div class="card">';
							message += 					'<div class="cardHeader">';
							message += 						'<span class="cardHeaderText">';
							message += 							'주문내역';
							message += 						'</span> ';
							message += 						'<img width="50" height="50" ';
							message += 							'src="/resources/images/chatbot/shopping-cart.png" alt="avatar"';
							message += 							'style="position: absolute; top: 20px; left: 180px;">';
							message += 					'</div>';
							message += 				'<div class="cardBody">';
							message += 					'<div class="cardImg">';
							message += 						'<img width="135" height="135" src="'+order.thumbnail.c_thumbnail1+'" style="object-fit : cover; border-radius: 5px; margin: auto;">';
							message += 					'</div>';
							message += 					'<div class="cardDescription">';
														if(order.productVO.bname != null){
							message += 						'<p class="cardBrandName">'+order.productVO.bname+'</p>';
														}
							message += 						'<span class="cardTitle">'+order.productVO.pname+'</span>';
							message += 						'<p class="cardOption">';
							message += 							'color : '+order.thumbnail.cname;
							message += 							' <span class="and_line">/</span>  ';
							message += 							'size : '+order.ssize;
							message += 						'</p>';
							message += 						'<p class="cardOrderStatus">주문상태: '+orderStatus+'</p>'; //주문상태 넣어줄것
							message += 						'</div>';
							message += 						'<button class="chatButton" onclick="javascript:parent_window(`/member/orderlist`)">자세히 보기</button>';
							message += 					'</div>';
							message += 				'</div>';
							message += 			'</div>';
							message += 		'</div>';
							message += 	'</div>';
						});
					message += '</div>';
				}
				$(".chatFieldDiv").append(message); 
				const slider = $('.slider').bxSlider({
			    	pager:false,
			    	touchEnabled:false
				});
				slider.reloadSlider();
			},
			error : function(jqXHR, textStatus, errorThrown){
				message = '<div class="chatMsgBotSection">';
				message +=		'<div class="chatMsgBubbleContainer">';
				message += 			'<div class="chatMsgBubbleContainer2">';
				message += 				'<div class="card">';
				message += 					'<div class="cardHeader" style="background:linear-gradient(165deg, rgb(233 203 230 / 70%) 15.04%, rgba(74, 153, 231, 0.7) 100%);">';
				message += 						'<span class="cardHeaderText">';
				message += 							'로그인';
				message += 						'</span> ';
				message += 						'<img width="55" height="55" ';
				message += 							'src="/resources/images/chatbot/padlock.png" alt="avatar"';
				message += 							'style="position: absolute; top: 22px; left: 185px;">';
				message += 					'</div>';
				message += 					'<div class="cardBody">';
				message += 						'<div class="cardDescription">';
				message += 							'<p class="cardBrandName">로그인이 필요한 서비스입니다.</p>';
				message += 						'</div>';
				message += 						'<button class="chatButton" onclick="javascript:parent_window(`/member/loginForm`)">로그인</button>';
				message += 					'</div>';
				message += 				'</div>';
				message += 			'</div>';
				message += 		'</div>';
				message += 	'</div>';
				$(".chatFieldDiv").append(message); 
			}
		});
		scrollDown();
	};

	
	//이벤트 리스트
	f_chatbot.f_run_event = function(){ 
		let message ='';
		//csrf토큰
		let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
		
		$.ajax({
			type:'post',
			url:'/clova/event',
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data:{
				mid:"${mid}"
			},
			dataType:"json",
			success:function(result){
					message = '<div class="slider">';
					message += 	'<div class="chatMsgBotSection">';
					message += 		'<div class="chatMsgContainer chatMsgBubbleContainer">';
					message += 			'<div class="chatMsgBubbleContainer2 ">';
					message += 				'<div class="card">';
					message += 					'<div class="cardHeader">';
					message += 						'<span class="cardHeaderText">';
					message += 							'래플 이벤트';
					message += 						'</span> ';
					message += 						'<img width="50" height="50" ';
					message += 							'src="/resources/images/chatbot/gift-box.png" alt="avatar"';
					message += 							'style="position: relative; top: 0px; left: 185px;">';
					message += 					'</div>';
					message += 					'<div class="cardBody">';
					message += 						'<div class="cardImg">';
					message += 							'<img width="180" height="100" src="http://cdn.thehandsome.com/pc/event/list/banner/20221024_53156550084261471_ko.jpg" style="object-fit : cover; border-radius: 5px;margin: auto;">';	
					message += 						'</div>';
					message += 						'<div class="cardDescription">';
					message += 							'<p class="cardBrandName">릴레이 래플 이벤트</p>';
					message += 							'<p class="cardOption">';
					message += 								'2022-07-07 ~ 2023-02-10'
					message += 							'</p>';
					message += 						'</div>';
					/* 래플 이벤트 링크 넣기 */
					message += 						'<button class="chatButton" onclick="javascript:parent_window(`http://localhost:9000/raffle?mid=${mid}`)">자세히 보기</button>';
					message += 					'</div>';
					message += 				'</div>';
					message += 			'</div>';
					message += 		'</div>';
					message += 	'</div>';
					
					result.forEach(function(event, i) {
						var startDate = new Date(event.estartdate);
						var endDate = new Date(event.eenddate);
						message += 	'<div class="chatMsgBotSection">';
						message += 		'<div class="chatMsgContainer chatMsgBubbleContainer">';
						message += 			'<div class="chatMsgBubbleContainer2 ">';
						message += 				'<div class="card">';
						message += 					'<div class="cardHeader">';
						message += 						'<span class="cardHeaderText">';
						message += 							'이벤트';
						message += 						'</span> ';
						message += 						'<img width="50" height="50" ';
						message += 							'src="/resources/images/chatbot/gift-box.png" alt="avatar"';
						message += 							'style="position: relative; top: 0px; left: 185px;">';
						message += 					'</div>';
						message += 					'<div class="cardBody">';
						message += 						'<div class="cardImg">';
						if(i<1){
							message += 							'<img width="180" height="70" src="'+event.eimage+'" style="object-fit : cover; border-radius: 5px;margin: auto;">';	
						} else{
							message += 							'<img width="180" height="100" src="'+event.eimage+'" style="object-fit : cover; border-radius: 5px;margin: auto;">';
						}
						
						message += 						'</div>';
						message += 						'<div class="cardDescription">';
						message += 							'<p class="cardBrandName">'+event.ename+'</p>';
						message += 							'<p class="cardOption">';
						message += 								startDate.getFullYear()+'-'+(startDate.getMonth()+1)+'-'+(startDate.getDay()+1);
						message += 								'~';
						message += 								endDate.getFullYear()+'-'+(endDate.getMonth()+1)+'-'+(endDate.getDay()+1);
						message += 							'</p>';
						message += 						'</div>';
						if(i<1){
							message += 						'<button class="chatButton" onclick="javascript:parent_window(`/event/maineventdetail?eid='+event.eid+'&ename='+event.ename+'`)">자세히 보기</button>';
						}else{
							message += 						'<button class="chatButton" onclick="javascript:parent_window(`/event/eventdetails?eid='+event.eid+'`)">자세히 보기</button>';	
						}
						message += 					'</div>';
						message += 				'</div>';
						message += 			'</div>';
						message += 		'</div>';
						message += 	'</div>';
					});
					message += '</div>';
					$(".chatFieldDiv").append(message); 
					const slider = $('.slider').bxSlider({
				    	pager:false,
				    	touchEnabled:false
					});
					slider.reloadSlider();
			}
		});
		scrollDown();
	};
	
	//스타일 추천
	f_chatbot.f_run_style = function(style, words){ 
		let message ='';
		
		//csrf토큰
		let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
		
		$.ajax({
			type:'post',
			url:'/clova/style',
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data:{
				style: words
			},
			success:function(result){
						message += '<div class="slider'+style+'">';
						result.forEach(function(item) {
							message += 	'<div class="chatMsgBotSection">';
							message += 		'<div class="chatMsgContainer chatMsgBubbleContainer">';
							message += 			'<div class="chatMsgBubbleContainer2 ">';
							message += 				'<div class="card">';
							message += 					'<div class="cardHeader" style="background:linear-gradient(165deg, #fe4242 26.04%, rgb(249 146 101 / 80%) 100%);">';
							message += 						'<span class="cardHeaderText">';
							message += 							words+'&nbsp;스타일';
							message += 						'</span> ';
							message += 						'<img width="50" height="50" ';
							message += 							'src="/resources/images/chatbot/valentine-gift.png" alt="avatar"';
							message += 							'style="position: absolute;top: 30px; left: 185px;">';
							message += 					'</div>';
							message += 				'<div class="cardBody">';
							message += 					'<div class="cardImg">';
							message += 						'<img width="135" height="135" src="'+item.c_thumbnail1+'" style="object-fit : cover; border-radius: 5px;margin: auto;">';
							message += 					'</div>';
							message += 					'<div class="cardDescription">';
														if(item.bname != null){
							message += 						'<p class="cardBrandName">'+item.bname+'</p>';
														}
							message += 						'<span class="cardTitle" style="margin-top:5px;">'+item.pname+'</span>';
							message += 					'</div>';
							message += 						'<button class="chatButton" onclick="javascript:parent_window(`/product/product_detail?pid='+item.pid+'&colorcode='+item.ccolorcode+'`)">자세히 보기</button>';
							message += 					'</div>';
							message += 				'</div>';
							message += 			'</div>';
							message += 		'</div>';
							message += 	'</div>';
						});
					message += '</div>';
				$(".chatFieldDiv").append(message); 
				const slider = $('.slider'+style).bxSlider({
			    	pager:false,
			    	touchEnabled:false
				});
				slider.reloadSlider();
			}
		});
		scrollDown();
	};

	//스타일 선택지
	f_chatbot.f_run_styleSelect = function(){
		let message ='<div class="selectDiv">';
		message += '<a class="modern selectBtn"	onclick="javascript:f_chatbot[`f_run_recommend`](`modern`, `모던`);">';
		message += '<strong>[모던]</strong> 간결하고 세련된';
		message += '</a>';
		message += '<a class="classic selectBtn" onclick="javascript:f_chatbot[`f_run_recommend`](`classic`, `클래식`);">';
		message += '<strong>[클래식]</strong> 기본에 충실한';
		message += '</a>';
		message += '<a class="romantic selectBtn" onclick="javascript:f_chatbot[`f_run_recommend`](`romantic`, `로멘틱`);">';
		message += '<strong>[로맨틱]</strong> 사랑스러운';
		message += '</a>';
		message += '<a class="feminine selectBtn" onclick="javascript:f_chatbot[`f_run_recommend`](`feminine`, `페미닌`);">';
		message += '<strong>[페미닌]</strong> 여성스러운';
		message += '</a>';
		message += '<a class="natural selectBtn" onclick="javascript:f_chatbot[`f_run_recommend`](`natural`, `내추럴`);">';
		message += '<strong>[내추럴]</strong> 자연스러운';
		message += '</a>';
		message += '<a class="casual selectBtn" onclick="javascript:f_chatbot[`f_run_recommend`](`casual`, `캐주얼`);">';
		message += '<strong>[캐주얼]</strong> 편안한';
		message += '</a>';
		message += '</div>';
		
		$(".chatFieldDiv").append(message);
		scrollDown();
	}
	
	//스타일 추천 결과
	f_chatbot.f_run_recommend = function(style, words){ 
		let message ='';
		
		message = '<div class="chatMsgBotSection">';
		message += 		'<div class="chatBubbleSection">';
		message += 			'<div class="chatMsgBotProfileDiv">';
		message += 				'<div class="chatMsgBotProfile">';
		message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
		message += 				'</div>';
		message += 			'</div>';
		message += 			'<div class="chatMsgNameDiv">';
		message += 				'<div class="chatMsgName">';
		message += 					'HEENDY';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="bubble bot">';
		message += 					words+'한 의상을 추천드릴게요. 자세히보기 버튼을 클릭하여 상세 정보를 확인할 수 있어요'
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += '</div>';
		$(".chatFieldDiv").append(message);
		scrollDown();
		f_chatbot['f_run_style'](style, words);

	};
	
	//faq 답변
	f_chatbot.f_run_faq_search = function(item){
		let message = "";
		var query = $(item).find('strong').text();
		
		message += '<div class="chatMsgUserSection">';
    	message += '<div class="chatMsgUserContainer">';
    	message += '<div class="bubbleWrapper">';
    	message += '<div class="bubble user">';
    	message += '<strong>'+query+'</strong>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
		
		
		//csrf토큰
		 let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
		$.ajax({
			type:'post',
			dataType:'text',
			url:'/clova/chatbot',
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data:{
				queryin:query
			},
			success:function(result, textStatus){
				
				console.log("textStatus : " + textStatus+"\n\n\nresult: "+result);
				
				var jData = JSON.parse(result);

				var description = jData.bubbles[0].data.description;
				var res = description.split('+');
				console.log("res[0]" + res[0]);
				console.log("res[1]" + res[1]);
				var ans = res[0].replace(/\n+/g, '<br/>');
				
				message += '<div class="chatMsgBotSection">';
				message += 		'<div class="chatBubbleSection">';
				message += 			'<div class="chatMsgBotProfileDiv">';
				message += 				'<div class="chatMsgBotProfile">';
				message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
				message += 				'</div>';
				message += 			'</div>';
				message += 			'<div class="chatMsgNameDiv">';
				message += 				'<div class="chatMsgName">';
				message += 					'HEENDY';
				message += 				'</div>';
				message += 			'</div>';
				message += 		'</div>';
				message += 		'<div class="chatMsgBubbleContainer">';
				message += 			'<div class="chatMsgBubbleContainer2">';
				message += 				'<div class="bubble bot">';
				message += 					ans;
				message += 				'</div>';
				message += 			'</div>';
				message += 		'</div>';
				message += 	'</div>';
				message += '</div>';
				
				$(".chatFieldDiv").append(message);
				
				if(res[1] == "style"){
					f_chatbot['f_run_'+res[1]](res[2], res[3]);
				}else{
					f_chatbot['f_run_'+res[1]]();
				}
			}
		}); 
		
		scrollDown();
	}
	
	f_chatbot.f_run_faq = function(){
		let message ='';
		
		message += '<div class="sliderfaq">';
		message += '<div class="chatMsgBotSection">';
		message +=		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="card">';
		message += 					'<div class="cardHeader" style="background:linear-gradient(165deg, rgb(233 203 230 / 70%) 15.04%, rgba(74, 153, 231, 0.7) 100%);">';
		message += 						'<span class="cardHeaderText">';
		message += 							'자주 묻는 질문';
		message += 						'</span> ';
		message += 						'<img width="55" height="55" ';
		message += 							'src="/resources/images/chatbot/gradient-body.png" alt="avatar"';
		message += 							'style="position: absolute;top:0px;left: 0px; margin: auto;">';
		message += 					'</div>';
		message += 					'<div class="cardBody">';
		message += 						'<button class="chatButton" onclick="javascript:f_chatbot.f_run_faq1()">상품문의</button>';
		message += 						'<button class="chatButton" onclick="javascript:f_chatbot.f_run_faq2()">주문/배송</button>';
		message += 						'<button class="chatButton" onclick="javascript:f_chatbot.f_run_faq3()">교환/반품</button>';
		message += 					'</div>';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		
		message += '<div class="chatMsgBotSection">';
		message +=		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="card">';
		message += 					'<div class="cardHeader" style="background:linear-gradient(165deg, rgb(233 203 230 / 70%) 15.04%, rgba(74, 153, 231, 0.7) 100%);">';
		message += 						'<span class="cardHeaderText">';
		message += 							'자주 묻는 질문';
		message += 						'</span> ';
		message += 						'<img width="55" height="55" ';
		message += 							'src="/resources/images/chatbot/gradient-body.png" alt="avatar"';
		message += 							'style="position: absolute;top:0px;left: 0px; margin: auto;">';
		message += 					'</div>';
		message += 					'<div class="cardBody">';
		message += 						'<button class="chatButton" onclick="javascript:f_chatbot.f_run_faq4()">결제/환불</button>';
		message += 						'<button class="chatButton" onclick="javascript:f_chatbot.f_run_faq5()">사이트 이용</button>';
		message += 					'</div>';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += 	'</div>';
		
		$(".chatFieldDiv").append(message);
		const slider = $('.sliderfaq').bxSlider({
	    	pager:false,
	    	touchEnabled:false
		});
		slider.reloadSlider();
		
		scrollDown();
	}
	
	f_chatbot.f_run_faq1 = function(){
		let message = "";

    	message += '<div class="chatMsgUserSection">';
    	message += '<div class="chatMsgUserContainer">';
    	message += '<div class="bubbleWrapper">';
    	message += '<div class="bubble user">';
    	message += '<strong>'+'상품문의'+'</strong>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    
    	message += '<div class="chatMsgBotSection">';
		message += 		'<div class="chatBubbleSection">';
		message += 			'<div class="chatMsgBotProfileDiv">';
		message += 				'<div class="chatMsgBotProfile">';
		message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
		message += 				'</div>';
		message += 			'</div>';
		message += 			'<div class="chatMsgNameDiv">';
		message += 				'<div class="chatMsgName">';
		message += 					'HEENDY';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="bubble bot">';
		message += 					'질문을 선택하시면 흰디가 답변을 드릴게요.'
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += '</div>';
    	
    	
    	message +='<div class="selectDiv">';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>상품 사이즈를 알고 싶어요</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>제품회수가 지연되고 있어요</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>품절된 상품의 구매가 가능한가요?</strong>';
		message += '</a>';
		message += '</div>';
		
		$(".chatFieldDiv").append(message);
		scrollDown();
    	
	}
	
	// 주문/배송
	f_chatbot.f_run_faq2 = function(){
		let message = "";

    	message += '<div class="chatMsgUserSection">';
    	message += '<div class="chatMsgUserContainer">';
    	message += '<div class="bubbleWrapper">';
    	message += '<div class="bubble user">';
    	message += '<strong>'+'주문/배송'+'</strong>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    
    	message += '<div class="chatMsgBotSection">';
		message += 		'<div class="chatBubbleSection">';
		message += 			'<div class="chatMsgBotProfileDiv">';
		message += 				'<div class="chatMsgBotProfile">';
		message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
		message += 				'</div>';
		message += 			'</div>';
		message += 			'<div class="chatMsgNameDiv">';
		message += 				'<div class="chatMsgName">';
		message += 					'HEENDY';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="bubble bot">';
		message += 					'질문을 선택하시면 흰디가 답변을 드릴게요.'
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += '</div>';
    	
    	
    	message +='<div class="selectDiv">';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>주문 후 며칠이면 상품 수령이 가능한가요?</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>주문을 따로따로 했는데 묶어서 배송해주세요</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>현재 배송상태를 확인하고 싶어요</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>주문한 상품을 변경 또는 취소하고 싶어요</strong>';
		message += '</a>';
		message += '</div>';
		
		$(".chatFieldDiv").append(message);
		scrollDown();
    	
	}
	
	// 주문/배송
	f_chatbot.f_run_faq3 = function(){
		let message = "";

    	message += '<div class="chatMsgUserSection">';
    	message += '<div class="chatMsgUserContainer">';
    	message += '<div class="bubbleWrapper">';
    	message += '<div class="bubble user">';
    	message += '<strong>'+'교환/반품'+'</strong>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    
    	message += '<div class="chatMsgBotSection">';
		message += 		'<div class="chatBubbleSection">';
		message += 			'<div class="chatMsgBotProfileDiv">';
		message += 				'<div class="chatMsgBotProfile">';
		message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
		message += 				'</div>';
		message += 			'</div>';
		message += 			'<div class="chatMsgNameDiv">';
		message += 				'<div class="chatMsgName">';
		message += 					'HEENDY';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="bubble bot">';
		message += 					'질문을 선택하시면 흰디가 답변을 드릴게요.'
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += '</div>';
    	
    	
    	message +='<div class="selectDiv">';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>교환과 반품이 불가능한 경우가 있나요?</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>교환 및 반품할 때, 배송비는 누가 부담하나요?</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>상품 교환을 하고 싶어요</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>교환 및 반품은 구매 후 언제까지 가능한가요?</strong>';
		message += '</a>';
		message += '</div>';
		
		$(".chatFieldDiv").append(message);
		scrollDown();
    	
	}
	
	// 결제/환불
	f_chatbot.f_run_faq4 = function(){
		let message = "";

    	message += '<div class="chatMsgUserSection">';
    	message += '<div class="chatMsgUserContainer">';
    	message += '<div class="bubbleWrapper">';
    	message += '<div class="bubble user">';
    	message += '<strong>'+'결제/환불'+'</strong>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    
    	message += '<div class="chatMsgBotSection">';
		message += 		'<div class="chatBubbleSection">';
		message += 			'<div class="chatMsgBotProfileDiv">';
		message += 				'<div class="chatMsgBotProfile">';
		message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
		message += 				'</div>';
		message += 			'</div>';
		message += 			'<div class="chatMsgNameDiv">';
		message += 				'<div class="chatMsgName">';
		message += 					'HEENDY';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="bubble bot">';
		message += 					'질문을 선택하시면 흰디가 답변을 드릴게요.'
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += '</div>';
    	
    	
    	message +='<div class="selectDiv">';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>반품하면 환불은 언제 되나요?</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>환불된 금액이 달라요</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>실시간 계좌이체는 무엇인가요?</strong>';
		message += '</a>';
		message += '</div>';
		
		$(".chatFieldDiv").append(message);
		scrollDown();
    	
	}
	
	// 주문/배송
	f_chatbot.f_run_faq5 = function(){
		let message = "";

    	message += '<div class="chatMsgUserSection">';
    	message += '<div class="chatMsgUserContainer">';
    	message += '<div class="bubbleWrapper">';
    	message += '<div class="bubble user">';
    	message += '<strong>'+'사이트 이용'+'</strong>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    	message += '</div>';
    
    	message += '<div class="chatMsgBotSection">';
		message += 		'<div class="chatBubbleSection">';
		message += 			'<div class="chatMsgBotProfileDiv">';
		message += 				'<div class="chatMsgBotProfile">';
		message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
		message += 				'</div>';
		message += 			'</div>';
		message += 			'<div class="chatMsgNameDiv">';
		message += 				'<div class="chatMsgName">';
		message += 					'HEENDY';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="bubble bot">';
		message += 					'질문을 선택하시면 흰디가 답변을 드릴게요.'
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += '</div>';
    	
    	
    	message +='<div class="selectDiv">';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>회원 정보 변경은 어떻게 하나요?</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>회원가입은 무료인가요?</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>더한섬닷컴 ID를 바꾸고 싶어요</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>더한섬닷컴 회원탈퇴는 어떻게 하나요?</strong>';
		message += '</a>';
		message += '</div>';
		
		$(".chatFieldDiv").append(message);
		scrollDown();
    	
	}
	
	f_chatbot.f_run_talk = function(video){
		let message = "";
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<video class="chatVideo" autoplay="autoplay"  muted="muted" loop="loop">';
		message += 				'<source src="/resources/images/chatbot/'+video+'.mp4" type="video/mp4">';
		message += 				'</video>';
		message += 			'</div>';
		message += 		'</div>';
		$(".chatFieldDiv").append(message); 
		scrollDown();
	}
	
	// 주문/배송
	f_chatbot.f_run_home = function(){
		let message = "";

    	message += '<div class="chatMsgBotSection">';
		message += 		'<div class="chatBubbleSection">';
		message += 			'<div class="chatMsgBotProfileDiv">';
		message += 				'<div class="chatMsgBotProfile">';
		message += 					'<img width="24" height="24" src="/resources/images/chatbot/icon_Heendy_blue.png" alt="avatar">';
		message += 				'</div>';
		message += 			'</div>';
		message += 			'<div class="chatMsgNameDiv">';
		message += 				'<div class="chatMsgName">';
		message += 					'HEENDY';
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<video class="chatVideo" autoplay="autoplay"  muted="muted" loop="loop">';
		message += 				'<source src="/resources/images/chatbot/welcome.mp4" type="video/mp4">';
		message += 				'</video>';
		message += 			'</div>';
		message += 		'</div>';
		
		
		message += 		'<div class="chatMsgBubbleContainer">';
		message += 			'<div class="chatMsgBubbleContainer2">';
		message += 				'<div class="bubble bot">';
		message +=  				'<c:if test="${mname ne null }">${mname}님 </c:if>안녕하세요 </br>'
		message += 						 '더한섬닷컴 마스코트 HEENDY입니다.</br>'
		message +=  				   	 '무엇을 도와드릴까요?</br>'
		message += 				'</div>';
		message += 			'</div>';
		message += 		'</div>';
		message += 	'</div>';
		message += '</div>';
    	
    	
    	message +='<div class="selectDiv">';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>자주 묻는 질문</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>주문 조회</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>스타일 추천</strong>';
		message += '</a>';
		message += '<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">';
		message += '<strong>진행중인 이벤트 보기</strong>';
		message += '</a>';
		message += '</div>';
		
		$(".chatFieldDiv").append(message);
		
		
		scrollDown();
    	
	}
	
</script>

</head>
<body style="height: 100%; overflow: hidden;">

	<div id="chatMain">
		<div id="chatFrame">
			<div class="userChat">
				<!-- 챗봇 헤더 -->
				<header class="chatHeader">
					<div class="profileImage" size="30">
						<img width="30" height="30"
							src="/resources/images/chatbot/icon_Heendy_blue.png"
							alt="avatar">
					</div>
					<div class="headerTitle">
							<div class="UserChatHeader">
								<span class="titleText" data-testid="bezier-react-text">
									<div class="UserChatHeaderName">HEENDY</div>
								</span>
							</div>
					</div>

					<button class="btnClose" onclick="javascript:f_chatbot.f_run_home();">
						<img style="width:20px; height:20px; margin-right: 10px; margin-top: 2px;" src="/resources/images/chatbot/home.png"/>
					</button>
					
					<button class="btnClose" onclick="thisclose();">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
							xmlns="http://www.w3.org/2000/svg" foundation="[object Object]"
							class="btnCloseIcon"
							defaultopacity="1" hoveredopacity="1" margintop="0"
							marginright="0" marginbottom="0" marginleft="0" withtheme="true">
							<path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"
								d="M16.4818 4.69668L15.3033 3.51817L10 8.82147L4.69671 3.51817L3.5182 4.69668L8.8215 9.99998L3.51819 15.3033L4.6967 16.4818L10 11.1785L15.3033 16.4818L16.4818 15.3033L11.1785 9.99998L16.4818 4.69668Z"></path>
						</svg>
					</button>
					
					
					
				</header>
				<!-- //챗봇 헤더-->
				<div class="chatBody">
					<main class="chatLayout">
						<section class="chatField">
							<!-- 채팅창 영역 -->
							<div class="chatFieldDiv">
								<div class="chatDescription">
									<div class="descriptionLogo">
										<img width="96" height="96" src="/resources/images/chatbot/icon_Heendy_white.png" alt="avatar">
									</div>
									<div class="descriptionText">
										<div class="descriptionHeader">더한섬닷컴에 문의하기</div>
										<div class="descriptionContents">안녕하세요 더한섬닷컴입니다.</div>
										<div class="UserChatHeaderStatus"><li><span>흰디와 대화중</span></li></div>
									</div>
									
								</div>
								
								
								<!-- 대화 단위 -->
								<div class="chatMsgBotSection">
									
									<!-- 오른쪽 -->
									<div class="chatBubbleSection">
										<!-- 프로필(왼쪽) -->
										<div class="chatMsgBotProfileDiv">
											<div class="chatMsgBotProfile">
												<img width="24" height="24"
													src="/resources/images/chatbot/icon_Heendy_blue.png"
													alt="avatar">
											</div>
										</div>
										<!-- //프로필 (왼쪽)-->
										<!-- 이름 -->
										<div class="chatMsgNameDiv">
											<div class="chatMsgName">
												HEENDY
											</div>
										</div>
										<!-- //이름 -->
										
									</div>
									<div class="chatMsgBubbleContainer">
											<div class="chatMsgBubbleContainer2">
												<video class="chatVideo" autoplay="autoplay"  muted="muted" loop="loop">
													<source src="/resources/images/chatbot/welcome.mp4" type="video/mp4">
												</video>
											</div>
									</div>
										<!-- 말풍선  -->
										
										<div class="chatMsgBubbleContainer">
											<div class="chatMsgBubbleContainer2">
												<div class="bubble bot">
													<c:if test="${mname ne null }">${mname}님 </c:if>안녕하세요 </br>
													더한섬닷컴 마스코트 HEENDY입니다.</br>
													무엇을 도와드릴까요?</br>
												</div>
											</div>
										</div>
										<div class="selectDiv">
											<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">
												<strong>자주 묻는 질문</strong>
											</a>
											<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">
												<strong>주문 조회</strong>
											</a>
											<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">
												<strong>스타일 추천</strong>
											</a>
											<a class="selectBtn" onclick="javascript:f_chatbot[`f_run_faq_search`](this);">
												<strong>진행중인 이벤트 보기</strong>
											</a>
										</div>
										<!-- 스타일 선택 -->
										<!-- <div class="selectDiv">
											<a class="modern selectBtn"	onclick="javascript:f_chatbot['f_run_recommend']('modern', '모던');">
												<strong>[모던]</strong> 간결하고 세련된
											</a>
											<a class="classic selectBtn" onclick="javascript:f_chatbot['f_run_recommend']('classic', '클래식');">
												<strong>[클래식]</strong> 기본에 충실한
											</a>
											<a class="romantic selectBtn" onclick="javascript:f_chatbot['f_run_recommend']('romantic', '로멘틱');">
												<strong>[로맨틱]</strong> 사랑스러운
											</a>
											<a class="feminine selectBtn" onclick="javascript:f_chatbot['f_run_recommend']('feminine', '페미닌');">
												<strong>[페미닌]</strong> 여성스러운
											</a>
											<a class="natural selectBtn" onclick="javascript:f_chatbot['f_run_recommend']('natural', '내추럴');">
												<strong>[내추럴]</strong> 자연스러운
											</a>
											<a class="casual selectBtn" onclick="javascript:f_chatbot['f_run_recommend']('casual', '캐주얼');">
												<strong>[캐주얼]</strong> 편안한
											</a>
										</div> -->
										
										<!-- //말풍선  -->
										
										<!-- 이벤트 -->
										<!-- <div class="slider">
											카드
											<div class="chatMsgBotSection">
												<div class="chatMsgBubbleContainer chatMsgBubbleContainer">
													<div class="chatMsgBubbleContainer2">
														<div class="card">
															<div class="cardHeader">
																<span class="cardHeaderText">
																	이벤트
																</span> 
																<img width="50" height="50" 
																src="/resources/images/chatbot/gift-box.png" alt="avatar"
																style="position: relative; top: 15px; left: 45px;">
															</div>
															<div class="cardBody">
																<div class="cardImg">
																	<img width="180" height="100" src="http://cdn.thehandsome.com/pc/event/list/banner/20221213_57502766498662944_ko.jpg" style="object-fit : cover; border-radius: 5px;">
																</div>
																<div class="cardDescription" style="line-height: 17px;">
																	
																	<p class="cardBrandName">신규 회원님을 위한 특별 혜택</p>
																	<span class="cardTitle">더한섬닷컴이 처음인 신규회원님께 아낌없이 드리는 혜택</span>
																	<p class="cardOption">
												                        2023-01-23 ~ 2023-06-23
											                        </p>
																</div>
																<button class="chatButton" onclick="javascript:parent_window(`/member/orderlist`)">자세히 보기</button>
															</div>
														</div>
													</div>	
												</div>
											</div>
											//카드
											
											카드
											<div class="chatMsgBotSection">
												<div class="chatMsgBubbleContainer chatMsgBubbleContainer">
													<div class="chatMsgBubbleContainer2">
														<div class="card">
															<div class="cardHeader">
																<span class="cardHeaderText">
																	이벤트
																</span> 
																<img width="50" height="50" 
																src="/resources/images/chatbot/gift-box.png" alt="avatar"
																style="position: relative; top: 15px; left: 45px;">
															</div>
															<div class="cardBody">
																<div class="cardImg">
																	<img width="180" height="100" src="http://cdn.thehandsome.com/pc/event/list/banner/20221213_57502766498662944_ko.jpg" style="object-fit : cover; border-radius: 5px;">
																</div>
																<div class="cardDescription" style="line-height: 17px;">
																	
																	<p class="cardBrandName">신규 회원님을 위한 특별 혜택</p>
																	<span class="cardTitle">더한섬닷컴이 처음인 신규회원님께 아낌없이 드리는 혜택</span>
																	<p class="cardOption">
												                        2023-01-23 ~ 2023-06-23
											                        </p>
																</div>
																<button class="chatButton" onclick="javascript:parent_window(`/member/orderlist`)">자세히 보기</button>
															</div>
														</div>
													</div>	
												</div>
											</div>
											//카드
										</div> -->
										<!-- //이벤트  -->
										
										<!-- 카드 -->
										<!-- <div class="chatMsgBotSection">
											<div class="chatMsgBubbleContainer">
												<div class="chatMsgBubbleContainer2">
													<div class="card">
														<div class="cardHeader">
															<span class="cardHeaderText">
																주문내역
															</span> 
															<img width="50" height="50" 
															src="/resources/images/chatbot/empty-shopping-cart.png" alt="avatar"
															style="position: relative; top: 23px; left: 32px;">
														</div>
														<div class="cardBody">
															<div class="cardDescription">
																<p class="cardBrandName">최근 주문 내역이 없습니다.</p>
															</div>
															<button class="chatButton" onclick="javascript:parent_window(`/member/orderlist`)">자세히 보기</button>
														</div>
													</div>
												</div>	
											</div>
										</div> -->
										<!-- //카드 -->
										
										<!-- 비로그인일때  -->
										<!-- 카드 -->
									<!--<div class="chatMsgBotSection">
											<div class="chatMsgBubbleContainer">
												<div class="chatMsgBubbleContainer2">
													<div class="card">
														<div class="cardHeader" style="background:linear-gradient(165deg, rgb(233 203 230 / 70%) 15.04%, rgba(74, 153, 231, 0.7) 100%);">
															<span class="cardHeaderText">
																로그인
															</span> 
															<img width="55" height="55" 
															src="/resources/images/chatbot/padlock2.png" alt="avatar"
															style="position: relative; top: 17px; left: 16px;">
														</div>
														<div class="cardBody">
															<div class="cardDescription">
																<p class="cardBrandName">로그인이 필요한 서비스입니다.</p>
															</div>
															<button class="chatButton" onclick="javascript:parent_window(`/member/loginForm`)">로그인</button>
														</div>
													</div>
												</div>	
											</div>
										</div> -->
										<!-- //카드 -->
										
										
									<!-- 오른쪽 -->
								</div>
								<!-- //대화단위 -->
								
								<!-- 사용자 대화 -->
								<!-- <div class="chatMsgUserSection">
									<div class="chatMsgUserContainer">
										<div class="bubbleWrapper">
											<div class="bubble user">
												테스트
											</div>
										</div>
									</div>
								</div> -->
								<!-- //사용자 대화 -->
								
							</div>
							<!-- //채팅창 영역 -->
						</section>
						
						<!-- 입력부분 -->
						<section class="chatFooterSection">
							<div class="chatInputDiv">
								<div class="chatTextDiv">
									<textarea name="queryin" id="queryin" data-ch-testid="messenger-footer-text-area" placeholder="메시지를 입력해주세요."
									class="chatTextArea" style="height: 35px;" onkeypress="if( event.keyCode == 13  && !event.shiftKey){textAreaEnter();}"  onkeyup="adjustHeight();"></textarea>
								</div>
								<button class="chatMsgSendBtn" id="query">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg" foundation="[object Object]"
									class="sendIcon"
									defaultopacity="1" hoveredopacity="1" margintop="0"
									marginright="0" marginbottom="0" marginleft="0"
									withtheme="true">
									<path fill="currentColor" fill-rule="evenodd"
										clip-rule="evenodd"
										d="M20.9186 5.01057L2.91895 5.01034C2.51794 5.00977 2.15508 5.24929 1.99895 5.61886C1.84146 5.98808 1.92039 6.41478 2.19802 6.70366L7.74779 12.4761L17.7176 7.45444L18.0686 8.06239L8.74519 14.2097L10.9214 21.931C11.0307 22.3183 11.3609 22.6022 11.7599 22.6513C11.9807 22.6797 12.1991 22.6321 12.3836 22.5256C12.5326 22.4396 12.6604 22.315 12.7501 22.1604L21.7846 6.51053C21.964 6.20137 21.9636 5.82058 21.7846 5.51055C21.6061 5.20138 21.2765 5.01059 20.9186 5.01057Z"></path></svg>
							</button>
							</div>
						</section>
					</main>
					
				</div>
			</div>
		</div>
	</div>
	<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script>
	$(document).ready(function(){
	    $( '.slider' ).bxSlider({
	    	slideMargin: 5,
	    	pager:false,
	    });
	  } );
	</script>
</body>
</html>

