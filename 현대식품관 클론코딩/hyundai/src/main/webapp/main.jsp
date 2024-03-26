<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style class="vjs-styles-defaults">
.video-js {
	width: 300px;
	height: 150px;
}

.vjs-fluid {
	padding-top: 56.25%
}
</style>
<link rel="shortcut icon" type="image/x-icon"
	href="./UIUX/images/favicon.ico?ver=15">

<link rel="stylesheet" type="text/css"
	href="./UIUX/css/css-library.min.css?ver=15">
<link rel="stylesheet" type="text/css"
	href="./UIUX/css/common.min.css?ver=15">
<link rel="stylesheet" type="text/css" href="./UIUX//css/main.min.css">
<meta charset="UTF-8">
<title>새벽투홈</title>
<%--data aos css , script 설정--%>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- jquery -->
<link rel="stylesheet" type="text/css" href="/UIUX/css/main.min.css?ver=1815">

<link rel="stylesheet" type="text/css" href="/UIUX/css/css-library.min.css?ver=15">
<script type="text/javascript" src="/UIUX/js/jquery-library.min.js?ver=15"></script>
<script type="text/javascript" src="/UIUX/js/function.min.js?ver=15"></script>

<link rel="stylesheet" type="text/css" href="/UIUX/css/common.min.css?ver=15">
<script type="text/javascript" src="/js/common.js?ver=1663480889177"></script>

</head>
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
<link rel="stylesheet" type="text/css" href="/UIUX/css/main.min.css?ver=1815">
<script type="text/javascript" src="/UIUX/js/main.min.js"></script>
	<!-- body -->
	<link rel="stylesheet" type="text/css"
		href="./UIUX/css/main.min.css?ver=1021">

	<div id="wrap" class="main">
		<jsp:include page="Common/Link.jsp" />
		<!-- contents// -->

		<div id="contents">

			<!-- contents// -->
			<!-- 슬라이딩 이미지 -->
			<!-- contents// -->
			<section class='mainbanner'>
				<div class='swiper-container mainbannerswiper'>
					<div class='swiper-wrapper'>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=220902100385001&ga_param=dwMain1'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','홍콩 호우섬');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/09/02/111509/nxmvu.jpg?RS=1204x540'
								alt=''></a>
						</div>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=220902121121001&ga_param=dwMain2'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','일상으로 되찾는 생활리듬');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/09/13/093704/hvgys.jpg?RS=1204x540'
								alt=''></a>
						</div>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=211223100385001&ga_param=dwMain3'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','곶감 투홈');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/09/14/133917/epwde.png?RS=1204x540'
								alt=''></a>
						</div>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=902571&ga_param=dwMain4'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','유아용품 창고개방전');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/08/22/115648/pcmzr.jpg?RS=1204x540'
								alt=''></a>
						</div>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/mk/mkf/evnt.do?evntNo=00000690&dlvUse=Y&ga_param=dwMain5'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','현대식품문학 9월');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/09/07/164623/jucih.jpg?RS=1204x540'
								alt=''></a>
						</div>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901358&ga_param=dwMain6'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','캠핑용품 모음전');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/09/07/164623/ijlet.jpg?RS=1204x540'
								alt=''></a>
						</div>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=902610&ga_param=dwMain7'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','쌀 발효 유기농 천연 비누');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/08/31/090509/agmzl.jpg?RS=1204x540'
								alt=''></a>
						</div>
						<div class='swiper-slide'>
							<a
								href='https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=220103100576001&ga_param=dwMain8'
								onclick="GA_Event('PC_새벽투홈_메인', '메인배너','병철이네쪽갈비');"><img
								src='https://tohomeimage.thehyundai.com/DP/DP034/2022/01/05/185631/fmejp.jpg?RS=1204x540'
								alt=''></a>
						</div>
					</div>
					<div class='innercon'>
						<div class='swiper-pagination-tot'>
							<strong>00</strong> / <span>00</span>
						</div>
						<a href='#' class='btn-play active'>재생/일시정지</a>
					</div>
			</section>

			<div id='cdnTimeSale'>
				<section class='timesale' id='timeSale'>
					<div class='innercon'>
						<h2>
							<span class='bl' style='border-top: 4px solid'><i
								style='border-bottom: 4px solid'></i></span><strong
								style='color:; font-weight: bold'>알뜰 장보기</strong><small
								style='color:; font-weight: normal'>지금 이 순간 만날 수 있는 특가</small>
						</h2>
						<div class='swiper-container timesaleswiper'>
							<div class='swiper-wrapper'>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='null'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[커피빈] 파우치 3종');GA_DpDawnEcomm('S02205102506','[커피빈] 파우치 3종','커피빈(온라인)','배송/F＆B/베이커리.디저트/케이크_디저트','','135384_커피빈(온라인)','A11706_(주)커피빈코리아 ','일반상품','조리식품(1301)','새벽투홈 메인', '', '');fnProductDetailMove('S02205102506','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/6/0/5/S02205102506_00.jpg?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>15%</strong></span></span><strong
										class='txt-ti ellipsis'>[커피빈] 파우치 3종</strong><span
										class='txt-price'><strong><em>1,190</em>원</strong> <del>1,400</del></span>
									</a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[커피빈] 파우치 3종');GA_DpDawnEcomm('S02205102506','[커피빈] 파우치 3종','커피빈(온라인)','배송/F＆B/베이커리.디저트/케이크_디저트','','135384_커피빈(온라인)','A11706_(주)커피빈코리아 ','일반상품','조리식품(1301)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02205102506', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='2022/09/30 22:50:59'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[만전식품] 도리포 곱창 돌김(생김) 50매(125g)');GA_DpDawnEcomm('S02006002070','[만전식품] 도리포 곱창 돌김(생김) 50매(125g)','만전식품(주)','배송/건식품/김_미역/김','8802241131947','112182_만전식품(주)','A10139_만전식품(주)','일반상품','건식(1501)','새벽투홈 메인', '', '');fnProductDetailMove('S02006002070','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/7/4/9/8802241131947_00.jpg?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>20%</strong></span></span><strong
										class='txt-ti ellipsis'>[만전식품] 도리포 곱창 돌김(생김)
											50매(125g)</strong><span class='txt-price'><strong><em>18,400</em>원</strong>
											<del>23,000</del></span> </a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[만전식품] 도리포 곱창 돌김(생김) 50매(125g)');GA_DpDawnEcomm('S02006002070','[만전식품] 도리포 곱창 돌김(생김) 50매(125g)','만전식품(주)','배송/건식품/김_미역/김','8802241131947','112182_만전식품(주)','A10139_만전식품(주)','일반상품','건식(1501)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02006002070', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='2022/09/18 22:50:59'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[남도분식] 국물 자작한 시래기떡볶이 (2~3인분,640g)');GA_DpDawnEcomm('S02006001468','[남도분식] 국물 자작한 시래기떡볶이 (2~3인분,640g)','남도분식','배송/F＆B/델리.식당가/한식_분식','8809731460006','123982_남도분식','A10002_주식회사 오버플로우','일반상품','조리식품(1301)','새벽투홈 메인', '', '');fnProductDetailMove('S02006001468','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/6/0/0/8809731460006_00.jpg?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>10%</strong></span></span><strong
										class='txt-ti ellipsis'>[남도분식] 국물 자작한 시래기떡볶이
											(2~3인분,640g)</strong><span class='txt-price'><strong><em>6,210</em>원</strong>
											<del>6,900</del></span> </a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[남도분식] 국물 자작한 시래기떡볶이 (2~3인분,640g)');GA_DpDawnEcomm('S02006001468','[남도분식] 국물 자작한 시래기떡볶이 (2~3인분,640g)','남도분식','배송/F＆B/델리.식당가/한식_분식','8809731460006','123982_남도분식','A10002_주식회사 오버플로우','일반상품','조리식품(1301)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02006001468', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='2022/09/18 22:50:59'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[놉스 nops] 수비드 스테이크 소스');GA_DpDawnEcomm('S02112095391','[놉스 nops] 수비드 스테이크 소스','홈이디어(D)','배송/F＆B/델리.식당가/아시안_멕시칸_패스트푸드','8809769200193','131528_홈이디어(D)','A10384_주식회사 홈이디어 ','일반상품','조리식품(1301)','새벽투홈 메인', '', '');fnProductDetailMove('S02112095391','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/3/9/1/8809769200193_00.jpg?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>50%</strong></span></span><strong
										class='txt-ti ellipsis'>[놉스 nops] 수비드 스테이크 소스</strong><span
										class='txt-price'><strong><em>2,500</em>원</strong> <del>5,000</del></span>
									</a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[놉스 nops] 수비드 스테이크 소스');GA_DpDawnEcomm('S02112095391','[놉스 nops] 수비드 스테이크 소스','홈이디어(D)','배송/F＆B/델리.식당가/아시안_멕시칸_패스트푸드','8809769200193','131528_홈이디어(D)','A10384_주식회사 홈이디어 ','일반상품','조리식품(1301)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02112095391', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='null'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[에어데이즈] KF-94 보건용 마스크 소형 유아용 (50매/블랙)');GA_DpDawnEcomm('S02105046653','[에어데이즈] KF-94 보건용 마스크 소형 유아용 (50매/블랙)','에어데이즈','배송/생활용품/마스크_기타/마스크','','133109_에어데이즈','A11236_(주)디더블유바이오 ','일반상품','생활용품(1201)','새벽투홈 메인', '', '');fnProductDetailMove('S02105046653','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/3/5/6/S02105046653_00.JPG?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>21%</strong></span></span><strong
										class='txt-ti ellipsis'>[에어데이즈] KF-94 보건용 마스크 소형 유아용
											(50매/블랙)</strong><span class='txt-price'><strong><em>22,900</em>원</strong>
											<del>29,000</del></span> </a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[에어데이즈] KF-94 보건용 마스크 소형 유아용 (50매/블랙)');GA_DpDawnEcomm('S02105046653','[에어데이즈] KF-94 보건용 마스크 소형 유아용 (50매/블랙)','에어데이즈','배송/생활용품/마스크_기타/마스크','','133109_에어데이즈','A11236_(주)디더블유바이오 ','일반상품','생활용품(1201)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02105046653', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='2022/12/31 23:59:59'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[아덱수] 그릴드 피쉬페이스트 (220g)');GA_DpDawnEcomm('S02105046351','[아덱수] 그릴드 피쉬페이스트 (220g)','주식회사 트릿지','배송/공산품/오일_장류_소스/기타조미료','9555422215200','132848_주식회사 트릿지','A11161_주식회사 트릿지 ','일반상품','가공식품(1101)','새벽투홈 메인', '', '');fnProductDetailMove('S02105046351','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/0/0/2/9555422215200_00.JPG?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>30%</strong></span></span><strong
										class='txt-ti ellipsis'>[아덱수] 그릴드 피쉬페이스트 (220g)</strong><span
										class='txt-price'><strong><em>3,430</em>원</strong> <del>4,900</del></span>
									</a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[아덱수] 그릴드 피쉬페이스트 (220g)');GA_DpDawnEcomm('S02105046351','[아덱수] 그릴드 피쉬페이스트 (220g)','주식회사 트릿지','배송/공산품/오일_장류_소스/기타조미료','9555422215200','132848_주식회사 트릿지','A11161_주식회사 트릿지 ','일반상품','가공식품(1101)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02105046351', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='null'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[루지에] 푸아그라 2종');GA_DpDawnEcomm('S02109090668','[루지에] 푸아그라 2종','구르메FB코리아','배송/공산품/오일_장류_소스/소스','','100924_구르메FB코리아','A10109_구르메에프앤드비코리아(주)','일반상품','가공식품(1101)','새벽투홈 메인', '', '');fnProductDetailMove('S02109090668','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/8/6/6/S02109090668_00.jpg?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>54%</strong></span></span><strong
										class='txt-ti ellipsis'>[루지에] 푸아그라 2종</strong><span
										class='txt-price'><strong><em>43,000</em>원</strong> <del>93,900</del></span>
									</a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[루지에] 푸아그라 2종');GA_DpDawnEcomm('S02109090668','[루지에] 푸아그라 2종','구르메FB코리아','배송/공산품/오일_장류_소스/소스','','100924_구르메FB코리아','A10109_구르메에프앤드비코리아(주)','일반상품','가공식품(1101)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02109090668', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='2022/09/18 22:50:59'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[용호낙지] 낙지 볶음 (500g)');GA_DpDawnEcomm('S02112095507','[용호낙지] 낙지 볶음 (500g)','스푼디쉬','배송/F＆B/델리.식당가/한식_분식','8809684510155','133260_스푼디쉬','A11305_주식회사 스푼디쉬 ','일반상품','조리식품(1301)','새벽투홈 메인', '', '');fnProductDetailMove('S02112095507','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/5/5/1/8809684510155_00.jpg?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>11%</strong></span></span><strong
										class='txt-ti ellipsis'>[용호낙지] 낙지 볶음 (500g)</strong><span
										class='txt-price'><strong><em>14,000</em>원</strong> <del>15,800</del></span>
									</a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[용호낙지] 낙지 볶음 (500g)');GA_DpDawnEcomm('S02112095507','[용호낙지] 낙지 볶음 (500g)','스푼디쉬','배송/F＆B/델리.식당가/한식_분식','8809684510155','133260_스푼디쉬','A11305_주식회사 스푼디쉬 ','일반상품','조리식품(1301)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02112095507', '', '100411','');return false;">장바구니
										담기</button>
								</div>
								<div class='swiper-slide' data-time-start='2022/09/18 15:01:28'
									data-time-end='2022/09/19 23:59:59'>
									<a
										href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[용호낙지] 쭈꾸미 볶음 (500g)');GA_DpDawnEcomm('S02205102829','[용호낙지] 쭈꾸미 볶음 (500g)','스푼디쉬','배송/F＆B/델리.식당가/한식_분식','8809684510216','133260_스푼디쉬','A11305_주식회사 스푼디쉬 ','일반상품','조리식품(1301)','새벽투홈 메인', '', '');fnProductDetailMove('S02205102829','','100411','','','dwMainTS')"><span
										class='thumb'><img
											src='https://tohomeimage.thehyundai.com/PD/PDImages/S/6/1/2/8809684510216_00.jpg?RS=720x864'
											alt=''
											onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
											class='badge'><strong>11%</strong></span></span><strong
										class='txt-ti ellipsis'>[용호낙지] 쭈꾸미 볶음 (500g)</strong><span
										class='txt-price'><strong><em>14,000</em>원</strong> <del>15,800</del></span>
									</a>
									<button type='button' class='btn-cart'
										onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[용호낙지] 쭈꾸미 볶음 (500g)');GA_DpDawnEcomm('S02205102829','[용호낙지] 쭈꾸미 볶음 (500g)','스푼디쉬','배송/F＆B/델리.식당가/한식_분식','8809684510216','133260_스푼디쉬','A11305_주식회사 스푼디쉬 ','일반상품','조리식품(1301)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02205102829', '', '100411','');return false;">장바구니
										담기</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>

			<!-- 제일 저렴한 상품! -->
			<!-- 			<div class="innercon">
			    <h2><span class="bl" style="border-top:4px solid "><i style="border-bottom:4px solid "></i></span><strong
			            style="color:;font-weight:bold">알뜰 장보기</strong><small style="color:;font-weight:normal">지금 이 순간 만날 수 있는
			            특가</small></h2>
			    <div class="swiper-container timesaleswiper swiper-container-horizontal">
			        <div class="swiper-wrapper" style="transform: translate3d(-602px, 0px, 0px); transition-duration: 0ms;">
			            <div class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-time-start="2022/09/18 15:01:28"
			                data-time-end="2022/09/19 23:59:59" data-swiper-slide-index="8" style="width: 602px;"><a
			                    href="javascript:GA_Event('PC_새벽투홈_메인','타임세일','[용호낙지] 쭈꾸미 볶음 (500g)');GA_DpDawnEcomm('S02205102829','[용호낙지] 쭈꾸미 볶음 (500g)','스푼디쉬','배송/F＆B/델리.식당가/한식_분식','8809684510216','133260_스푼디쉬','A11305_주식회사 스푼디쉬 ','일반상품','조리식품(1301)','새벽투홈 메인', '', '');fnProductDetailMove('S02205102829','','100411','','','dwMainTS')"><span
			                        class="thumb"><img
			                            src="https://tohomeimage.thehyundai.com/PD/PDImages/S/6/1/2/8809684510216_00.jpg?RS=720x864"
			                            alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
			                            class="badge"><strong>11%</strong></span></span><strong class="txt-ti ellipsis">[용호낙지] 쭈꾸미
			                        볶음 (500g)</strong><span
			                        class="txt-price"><strong><em>14,000</em>원</strong><del>15,800</del></span> </a><button
			                    type="button" class="btn-cart"
			                    onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[용호낙지] 쭈꾸미 볶음 (500g)');GA_DpDawnEcomm('S02205102829','[용호낙지] 쭈꾸미 볶음 (500g)','스푼디쉬','배송/F＆B/델리.식당가/한식_분식','8809684510216','133260_스푼디쉬','A11305_주식회사 스푼디쉬 ','일반상품','조리식품(1301)','새벽투홈 메인', '', 'Y');fnProductBasketAdd('01','S02205102829', '', '100411','');return false;">장바구니
			                    담기</button> </div>
			        </div><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
			    </div>
			</div> -->

			<!-- 신상품 칸 -->
			<section class="innercon aos-init aos-animate" data-aos="fade-up">
				<h2>
					<span class="bl" style="border-top: 4px solid"><i
						style="border-bottom: 4px solid"></i></span><strong
						style="color:; font-weight: bold">신상품</strong><small
						style="color:; font-weight: normal">새벽투홈의 신상품을 만나보세요</small><a
						href="TohomeServlet?command=latest_productList&top_num=0&filter=0"
						class="btn all">전체보기</a>
				</h2>
				<ul class="product-list">
					<c:forEach items="${latest4Product}" var="productDTO">
						<li><a
							href="TohomeServlet?command=product_detail&prod_no=${productDTO.prod_no}">
								<span class="thumb"> <img src="${productDTO.prod_img}"
									alt=""
									onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'">
									<div class="badgewrap"></div> <!-- 여기 추가하면 일시품절같은거 넣을 수 있겠다 -->
							</span> <span class="state" style="color: #ff6913">NEW</span> <strong
								class="txt-ti ellipsis">${productDTO.prod_name}</strong>
						</a> <span class="info"> <span class="txt-price"> <strong><em>${productDTO.price}</em>원</strong>
							</span>
						</span> <span class="tag"> <span>신상품</span>
						</span></li>
					</c:forEach>
				</ul>
			</section>
			<!-- 전체상품 -->
			<section class="innercon aos-init aos-animate" data-aos="fade-up">
				<h2>
					<span class="bl" style="border-top: 4px solid"><i
						style="border-bottom: 4px solid"></i></span><strong
						style="color:; font-weight: bold">투홈 전체상품</strong><small
						style="color:; font-weight: normal">투홈의 여러 상품들을 만나보세요</small><a
						href="TohomeServlet?command=all_productList&top_num=0&filter=0"
						class="btn all">전체보기</a>
				</h2>
				<ul class="product-list">
					<c:forEach items="${allProduct}" var="productDTO">
						<li><a
							href="TohomeServlet?command=product_detail&prod_no=${productDTO.prod_no}">
								<span class="thumb"> <img src="${productDTO.prod_img}"
									alt=""
									onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'">
									<div class="badgewrap"></div> <!-- 여기 추가하면 일시품절같은거 넣을 수 있겠다 -->
							</span> <strong class="txt-ti ellipsis">${productDTO.prod_name}</strong>
						</a> <span class="info"> <span class="txt-price"> <strong><em>${productDTO.price}</em>원</strong>
							</span>
						</span> <span class="tag"> </span></li>
					</c:forEach>
				</ul>
			</section>
			<!-- 뭔가 이벤트 정보칸! -->
			<section class="innercon exhibition aos-init aos-animate"
				data-aos="fade-up">
				<ul class="exhibition-ban">
					<li><a
						href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=902638&amp;ga_param=dwMainSq"
						onclick="GA_Event('PC_새벽투홈_메인', '직각배너','발뮤다 브랜드위크');"><img
							src="https://tohomeimage.thehyundai.com/DP/DP034/2022/09/08/110637/zsjen.jpg?RS=1204x160"
							alt=""></a></li>
					<li><a
						href="https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=220902100385001&amp;ga_param=dwMainSq"
						onclick="GA_Event('PC_새벽투홈_메인', '직각배너','도시미식탐험 홍콩BR 이벤트');"><img
							src="https://tohomeimage.thehyundai.com/DP/DP034/2022/09/02/111509/vmjde.jpg?RS=1204x160"
							alt=""></a></li>
				</ul>
			</section>
			<!-- contents// -->
		</div>
		<!-- //contents -->


    <!-- footer// -->
	<jsp:include page="Common/footer.jsp"/>
    <!-- //footer -->

	</div>

</body>
</html>
