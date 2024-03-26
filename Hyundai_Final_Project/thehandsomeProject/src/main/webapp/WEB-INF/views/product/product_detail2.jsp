<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/common/header.jspf"%>
<!-- 광고 유입 끝 -->
<!-- Loading -->
<div class="loading_bar" id="loadingBarDiv" style="display: none;">
	<img src="/_ui/desktop/common/images/common/loading.gif" alt="loading">
	<span>�로딩중</span>
</div>
<!-- //Loading -->

<div id="bodyWrap" class="item_detail">
	<div id="oneEventLayer"></div>

	<div class="adaptive_wrap">
		<div class="clearfix prd_detail1905" id="clearfix">
			<div class="clearfix image_view3">
				<!-- 버튼 클릭시 item_visual 에 zoom 클래스 추가 -->
				<!-- 2021.08.18 동영상 재생 수정, 상품 imageDivisionCode에 VOD가 있는 경우 동영상 url 세팅 -->
				<c:forEach items="${colorVOList}" var="colorVO">
					<div class="image_view_${colorVO.ccolorcode}"
						id="image_view_${colorVO.ccolorcode}" style="display: none">
						<div class="item_visual" id="imageDiv" style="margin-top: 20px;">
							<ul>
								<c:if test="${not empty colorVO.cimage1}">
									<li><img src="${colorVO.cimage1}" class="respon_image" alt=""
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'">
									</li>
								</c:if>
								<c:if test="${not empty colorVO.cimage2}">
									<li><img src="${colorVO.cimage2}" class="respon_image" alt=""
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'">
									</li>
								</c:if>
								<c:if test="${not empty colorVO.cimage3}">
									<li><img src="${colorVO.cimage3}" class="respon_image" alt=""
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'">
									</li>
								</c:if>
								<c:if test="${not empty colorVO.cimage4}">
									<li><img src="${colorVO.cimage4}" class="respon_image" alt=""
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'">
									</li>
								</c:if>
								<c:if test="${not empty colorVO.cimage5}">
									<li><img src="${colorVO.cimage5}" class="respon_image" alt=""
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'">
									</li>
								</c:if>
								<c:if test="${not empty colorVO.cimage6}">
									<li><img src="${colorVO.cimage6}" class="respon_image" alt=""
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'">
									</li>
								</c:if>
								<c:if test="${not empty colorVO.cimage7}">
									<li><img src="${colorVO.cimage7}" class="respon_image" alt=""
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'">
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</c:forEach>

				<!-- 				<div class="item_visual" id="imageDivW" style="display: none">
					<ul>
						<li><img
							src="http://newmedia.thehandsome.com/TH/2C/FW/TH2CBKPC033M_BK_W01.jpg"
							class="respon_image" alt="[SET] 울 조거 팬츠"
							onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"></li>
					</ul>
				</div> -->
			</div>
			<script type="text/javascript" src="/_ui/desktop/common/js/wpay.js"></script>
			<!-- 품절상품포함 여부 -->
			<div class="item_detail_info float_right" id="contentDiv"
				style="margin-top: 20px; top: 0px; left: 699px;">
				<div class="info">
					<div class="info_sect">
						<h4 class="item_name">
							<div class="brand-name">
								<a href="javascript:void(0);">${productVO.bname}</a>
							</div>
							<span class="name ko_fir_spel">${productVO.pname}<input
								type="hidden" id="brandName" value="${productVO.bname}">
								<input type="hidden" id="productName" value="${productVO.pname}">
								<input type="hidden" id="productCode" value="${productVO.pid}">
							</span>
						</h4>

						<div class="flag"></div>

						<p class="price">
							<span id="pricespan">₩${productVO.pprice}</span> <input
								type="hidden" id="productPrice" value="${productVO.pprice}">
						</p>
						<!-- 상품추가설명 -->
						<p class="selling_point"></p>
						<!-- 20200914이후 추가 상품설명 (신) -->
						<div class="prod-detail-con-box">
							<strong class="number-code">상품품번 : <span id="pcscode">${curColorCode}<!-- 처음 로드될때 jqery로  --></span></strong>
							<div class="round-style">
								<p>${productVO.pdetail}</p>
							</div>
							<div class="fit-info">
								<p class="size-text">${productVO.p_info}</p>
							</div>
						</div>
						<!-- 20200914 이전 상품설명(구) -->
					</div>

					<!-- //20200904 더보기 -->
					<div class="info_sect">
						<ul class="point_delivery">
							<li><span class="title">한섬마일리지</span> <span class="txt"
								id="hsm"></span></li>

							<li><span class="title">H.Point</span> <span class="txt"
								id="hspoint"></span>
							<li><span class="title">배송비</span> <span class="txt">전
									상품 무료배송</span> <a href="javascript:fn_popupDelivery();"
								class="etc_info">배송안내</a> <!-- onclick="GA_Event('상품_상세','배송안내','클릭');" -->
								<div class="popwrap w_type_2" id="popupDelivery"
									style="display: none;">
									<div class="pop_tltwrap2">
										<h3>배송비안내</h3>
									</div>
									<div class="pop_cnt">
										<table class="cnt_type1">
											<caption>배송비안내</caption>
											<colgroup>
												<col style="width: 155px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">배송기간</th>
													<td>평균 입금완료일 기준 2-4일 소요됩니다.<br>(토/일/공휴일 제외)
													</td>
												</tr>
												<tr>
													<th scope="row">배송비</th>
													<td>
														<ul class="bul_sty01_li">
															<li>30,000원 이상 결제 시 <em class="ft_point01">무료배송</em></li>
															<li>30,000원 미만 결제 시 <em class="ft_point01">2,500원</em></li>
														</ul>
														<p class="bul_sty02">도서산간 지역은 3,000원의 별도 배송비가 부과됩니다.</p>
														<p class="bul_sty02">쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을
															제외한 실결제금액 기준입니다.</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<a href="javascript:fn_popdownDelivery();" class="btn_close"><img
										src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
										alt="닫기"></a>
								</div></li>
						</ul>
					</div>

					<div class="info_sect" id="color_size">
						<ul class="color_size_qty">
							<li><span class="title">색상</span>
								<div class="txt">
									<ul class="color_chip clearfix">
										<c:forEach items="${colorVOList}" var="colorVO">
											<input type="hidden" id="colorName" value="${colorVO.cname}">
											<li id="${colorVO.ccolorcode}"><input type="hidden"
												class="colorNameVal" > 
											<a href="javascript:void(0);" class="colorBtn" value="${colorVO.cname}"
												colorcode="${colorVO.ccolorcode}"
												style="background: #000000 url('${colorVO.ccolorimage})"
												onmouseover="setColorName('${colorVO.cname}');"
												onmouseout="setColorName('');"> </a>
											</li>
										</c:forEach>
									</ul>
								</div> <span class="cl_name" id="colorNameContent"></span></li>
							<li><span class="title">사이즈<!-- 사이즈 --></span> <span
								class="txt">
									<div class="popwrap w_type_2" id="sizeQuickReferenceLayer"
										style="display: none;">
										<div class="pop_tltwrap2">
											<h3>사이즈조견표</h3>
										</div>
										<div class="pop_cnt">
											<div class="size_chart">
												<div class="tab_a m6" id="size_tab">
													<ul>
														<li><a href="#;" class="active">WOMEN<br>TOP
														</a></li>
														<li><a href="#;">WOMEN<br>BOTTOMS
														</a></li>
														<li><a href="#;">WOMEN<br>SHOES
														</a></li>
														<li><a href="#;">MEN<br>TOP
														</a></li>
														<li><a href="#;">MEN<br>BOTTOMS
														</a></li>
														<li><a href="#;">MEN<br>SHOES
														</a></li>
													</ul>
												</div>
												<div class="size_tab_container">
													<div>
														<table class="cnt_type2">
															<caption>사이즈조견표</caption>
															<colgroup>
																<col>
																<col style="width: 16%">
																<col style="width: 16%">
																<col style="width: 16%">
																<col style="width: 16%">
																<col style="width: 16%">
															</colgroup>
															<thead>
																<tr class="al_middle">
																	<th scope="col">BRAND/<br>SIZE
																	</th>
																	<th scope="col">XS</th>
																	<th scope="col">S</th>
																	<th scope="col">M</th>
																	<th scope="col">L</th>
																	<th scope="col">FREE</th>
																</tr>
															</thead>
															<tbody>
																<tr class="al_middle">
																	<th scope="row">TIME</th>
																	<td>76</td>
																	<td>82</td>
																	<td>88</td>
																	<td>94</td>
																	<td>90</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">MINE</th>
																	<td>76</td>
																	<td>82</td>
																	<td>88</td>
																	<td>94</td>
																	<td>90</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">SYSTEM</th>
																	<td>76</td>
																	<td>82</td>
																	<td>88</td>
																	<td>-</td>
																	<td>90</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">SJSJ</th>
																	<td>76</td>
																	<td>82</td>
																	<td>88</td>
																	<td>-</td>
																	<td>90</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row" rowspan="2">KOREA</th>
																	<td>85</td>
																	<td>90</td>
																	<td>95</td>
																	<td>100</td>
																	<td>-</td>
																</tr>
																<tr class="al_middle">
																	<td>44</td>
																	<td>55</td>
																	<td>66</td>
																	<td>77</td>
																	<td>-</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">US</th>
																	<td>2</td>
																	<td>4</td>
																	<td>6</td>
																	<td>8</td>
																	<td>-</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">EUROPE</th>
																	<td>34</td>
																	<td>36</td>
																	<td>38</td>
																	<td>40</td>
																	<td>-</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">CHINA</th>
																	<td>160/<br>80A
																	</td>
																	<td>165/<br>84A
																	</td>
																	<td>170/<br>88A
																	</td>
																	<td>175/<br>92A
																	</td>
																	<td>-</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div style="display: none;">
														<table class="cnt_type2">
															<caption>사이즈조견표</caption>
															<colgroup>
																<col>
																<col style="width: 19%">
																<col style="width: 19%">
																<col style="width: 19%">
																<col style="width: 19%">
															</colgroup>
															<thead>
																<tr class="al_middle">
																	<th scope="col">BRAND/<br>SIZE
																	</th>
																	<th scope="col">XS</th>
																	<th scope="col">S</th>
																	<th scope="col">M</th>
																	<th scope="col">L</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<th scope="row">TIME</th>
																	<td>61</td>
																	<td>64</td>
																	<td>67</td>
																	<td>70</td>
																</tr>
																<tr>
																	<th scope="row">MINE</th>
																	<td>61</td>
																	<td>64</td>
																	<td>67</td>
																	<td>70</td>
																</tr>
																<tr>
																	<th scope="row">SYSTEM</th>
																	<td>61</td>
																	<td>64</td>
																	<td>67</td>
																	<td>-</td>
																</tr>
																<tr>
																	<th scope="row">SJSJ</th>
																	<td>61</td>
																	<td>64</td>
																	<td>67</td>
																	<td>-</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row" rowspan="2">KOREA</th>
																	<td>24</td>
																	<td>26</td>
																	<td>28</td>
																	<td>30</td>
																</tr>
																<tr>
																	<td>44</td>
																	<td>55</td>
																	<td>66</td>
																	<td>77</td>
																</tr>
																<tr>
																	<th scope="row">US</th>
																	<td>2</td>
																	<td>4</td>
																	<td>6</td>
																	<td>8</td>
																</tr>
																<tr>
																	<th scope="row">EUROPE</th>
																	<td>34</td>
																	<td>36</td>
																	<td>38</td>
																	<td>40</td>
																</tr>
																<tr>
																	<th scope="row">CHINA</th>
																	<td>160/<br>66A
																	</td>
																	<td>165/<br>68A
																	</td>
																	<td>170/<br>70A
																	</td>
																	<td>175/<br>72A
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div style="display: none;">
														<table class="cnt_type2">
															<caption>사이즈조견표</caption>
															<colgroup>
																<col>
																<col style="width: 19%">
																<col style="width: 19%">
																<col style="width: 19%">
																<col style="width: 19%">
															</colgroup>
															<thead>
																<tr class="al_middle">
																	<th scope="col">BRAND/<br>SIZE
																	</th>
																	<th scope="col">XS</th>
																	<th scope="col">S</th>
																	<th scope="col">M</th>
																	<th scope="col">L</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<th scope="row">TIME</th>
																	<td>230</td>
																	<td>235</td>
																	<td>240</td>
																	<td>245</td>
																</tr>
																<tr>
																	<th scope="row">MINE</th>
																	<td>230</td>
																	<td>235</td>
																	<td>240</td>
																	<td>245</td>
																</tr>
																<tr>
																	<th scope="row">SYSTEM</th>
																	<td>230</td>
																	<td>235</td>
																	<td>240</td>
																	<td>245</td>
																</tr>
																<tr>
																	<th scope="row">SJSJ</th>
																	<td>230</td>
																	<td>235</td>
																	<td>240</td>
																	<td>245</td>
																</tr>
																<tr>
																	<th scope="row">KOREA</th>
																	<td>230</td>
																	<td>235</td>
																	<td>240</td>
																	<td>245</td>
																</tr>
																<tr>
																	<th scope="row">US</th>
																	<td>6</td>
																	<td>6.5</td>
																	<td>7</td>
																	<td>7.5</td>
																</tr>
																<tr>
																	<th scope="row">EUROPE</th>
																	<td>36</td>
																	<td>36.5</td>
																	<td>37</td>
																	<td>37.5</td>
																</tr>
																<tr>
																	<th scope="row">CHINA</th>
																	<td>36</td>
																	<td>37</td>
																	<td>38</td>
																	<td>39</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div style="display: none;">
														<table class="cnt_type2">
															<caption>사이즈조견표</caption>
															<colgroup>
																<col>
																<col style="width: 16%">
																<col style="width: 16%">
																<col style="width: 16%">
																<col style="width: 16%">
																<col style="width: 16%">
															</colgroup>
															<thead>
																<tr class="al_middle">
																	<th scope="col">BRAND/<br>SIZE
																	</th>
																	<th scope="col">S</th>
																	<th scope="col">M</th>
																	<th scope="col">L</th>
																	<th scope="col">XL</th>
																	<th scope="col">XXL</th>
																</tr>
															</thead>
															<tbody>
																<tr class="al_middle">
																	<th scope="row">TIME<br>HOMME
																	</th>
																	<td>90</td>
																	<td>95</td>
																	<td>100</td>
																	<td>105</td>
																	<td>110</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">SYSTEM<br>HOMME
																	</th>
																	<td>90</td>
																	<td>95</td>
																	<td>100</td>
																	<td>105</td>
																	<td>110</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">CLUB<br>MONACO
																	</th>
																	<td>XS</td>
																	<td>S</td>
																	<td>M</td>
																	<td>L</td>
																	<td>XL</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">KOREA</th>
																	<td>90</td>
																	<td>95</td>
																	<td>100</td>
																	<td>105</td>
																	<td>110</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">US</th>
																	<td>36</td>
																	<td>38</td>
																	<td>40</td>
																	<td>42</td>
																	<td>44</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">EUROPE</th>
																	<td>46</td>
																	<td>48</td>
																	<td>50</td>
																	<td>52</td>
																	<td>54</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">CHINA</th>
																	<td>165/<br>80-90
																	</td>
																	<td>170/<br>96-98
																	</td>
																	<td>175/<br>108-110
																	</td>
																	<td>180/<br>118-122
																	</td>
																	<td>185/<br>126-130
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div style="display: none;">
														<table class="cnt_type2">
															<caption>사이즈조견표</caption>
															<colgroup>
																<col>
																<col style="width: 9.5%">
																<col style="width: 9.5%">
																<col style="width: 9.5%">
																<col style="width: 9.5%">
																<col style="width: 9.5%">
																<col style="width: 9.5%">
																<col style="width: 9.5%">
																<col style="width: 9.5%">
																<col style="width: 9.5%">
															</colgroup>
															<thead>
																<tr class="al_middle">
																	<th scope="col">BRAND/<br>SIZE
																	</th>
																	<th scope="col">S</th>
																	<th scope="col" colspan="2">M</th>
																	<th scope="col" colspan="2">L</th>
																	<th scope="col" colspan="2">XL</th>
																	<th scope="col" colspan="2">XXL</th>
																</tr>
															</thead>
															<tbody>
																<tr class="al_middle">
																	<th scope="row">TIME<br>HOMME
																	</th>
																	<td>74</td>
																	<td colspan="2">78</td>
																	<td>82</td>
																	<td>84</td>
																	<td>86</td>
																	<td>88</td>
																	<td>90</td>
																	<td>92</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">SYSTEM<br>HOMME
																	</th>
																	<td>74</td>
																	<td colspan="2">78</td>
																	<td>82</td>
																	<td>84</td>
																	<td>86</td>
																	<td>88</td>
																	<td>90</td>
																	<td>92</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">CLUB<br>MONACO
																	</th>
																	<td>29</td>
																	<td>30</td>
																	<td>31</td>
																	<td>32</td>
																	<td>33</td>
																	<td colspan="2">34</td>
																	<td colspan="2">36</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">KOREA</th>
																	<td>29</td>
																	<td colspan="2">30</td>
																	<td>32</td>
																	<td>33</td>
																	<td>34</td>
																	<td>35</td>
																	<td>35.5</td>
																	<td>36</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">US</th>
																	<td>44T</td>
																	<td colspan="2">46T</td>
																	<td colspan="2">48T</td>
																	<td colspan="2">50T</td>
																	<td colspan="2">52T</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">EUROPE</th>
																	<td>44</td>
																	<td colspan="2">46</td>
																	<td colspan="2">48</td>
																	<td colspan="2">50</td>
																	<td colspan="2">52</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">CHINA</th>
																	<td>44</td>
																	<td colspan="2">46</td>
																	<td colspan="2">48</td>
																	<td colspan="2">50</td>
																	<td colspan="2">52</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div style="display: none;">
														<table class="cnt_type2">
															<caption>사이즈조견표</caption>
															<colgroup>
																<col>
																<col style="width: 23%">
																<col style="width: 23%">
																<col style="width: 23%">
															</colgroup>
															<thead>
																<tr class="al_middle">
																	<th scope="col">BRAND<br>SIZE
																	</th>
																	<th scope="col">S</th>
																	<th scope="col">M</th>
																	<th scope="col">L</th>
																</tr>
															</thead>
															<tbody>
																<tr class="al_middle">
																	<th scope="row">TIME HOMME</th>
																	<td>260</td>
																	<td>270</td>
																	<td>280</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">SYSTEM HOMME</th>
																	<td>260</td>
																	<td>270</td>
																	<td>280</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">KOREA</th>
																	<td>260</td>
																	<td>270</td>
																	<td>280</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">US</th>
																	<td>8</td>
																	<td>9</td>
																	<td>10</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">EUROPE</th>
																	<td>41</td>
																	<td>42</td>
																	<td>43.5</td>
																</tr>
																<tr class="al_middle">
																	<th scope="row">CHINA</th>
																	<td>43</td>
																	<td>45</td>
																	<td>47</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<a href="javascript:fn_popdownSizeQuickReference();"
											class="btn_close"><img
											src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
											alt="닫기"></a>
									</div>
									<ul class="size_chip clearfix sizeChipKo1901">
										<c:forEach items="${sizelist}" var="size">
											<li value="${size}"><a href="javascript:void(0);"
												class="sizeBtn">${size}</a></li>
										</c:forEach>
									</ul>
							</span> <!-- 2021.08.10 화장품 상품인 경우 사이즈조견표 영역 미노출 --> <a
								href="javascript:fn_popupSizeQuickReference();" class="etc_info">사이즈
									조견표</a> <!-- 재입고알림 툴팁 --> <!-- //재입고알림 툴팁 -->
								<div id="vs-placeholder-cart">
									<div id="vs-inpage" class="handsome" style="display: none;"></div>
								</div> <!-- 버츄사이즈 --></li>
							<li><span class="title">수량</span> <span class="txt">
									<span class="qty_sel num"> <a
										href="javascript:fn_qtySubtraction();" class="left">이전 버튼</a>
										<input type="text" id="txtqty" title="수량" value="1"
										class="mr0" readonly="readonly" style="text-indent: 0;">
										<a href="javascript:fn_qtyAdd();" class="right">다음 버튼</a>
								</span>
							</span> <span class="txt" id="popularProudct" style="display: none">
									<span class="deliveryPlanDate"> 해당 상품은 전국 매장을 통해 수급하여 배송
										될 예정입니다. <br> 불량 등의 이유로 수급이 어려울 경우, 취소될 수 있습니다. <br>(평일
										기준 5일 이상 소요 예정)
								</span>
							</span> <input type="hidden" id="erpWorkOrderNumber"> <input
								type="hidden" id="reserveSalesStockpile"> <input
								type="hidden" id="erpWorkOrderProdCode"></li>
						</ul>
					</div>
					<div class="total_price clearfix">
						<div class="title float_left" style="width: auto;">총 합계</div>
						<div class="pirce float_right">
							<span id="sumPrice">₩${productVO.pprice}</span>
						</div>
					</div>
					<!-- //st_store_wrap -->
					<div class="btnwrap clearfix"
						style="position: absolute; width: 473px; /* margin-top: -153.979px; */ margin-bottom: 153.979px;">
						<input type="button" value="" class="btn wishlist1803 float_left ml0  " onclick="addWishListClick();">

						<div class="toast_popup">
							<p style="display: none; top: -4.12381px; opacity: 0.031172;">위시리스트에서 삭제했습니다.</p>
						</div>

						<!--190508 추가 -->
						<div class="toast_popup_pre_order1905">
							<!-- 토스트팝업 190507 -->
							<p>
								예약 주문이 가능한 옵션(컬러/사이즈)가 있습니다. <br>옵션 선택 후 배송 예정일을 확인해 주세요.
							</p>
							<span class="arr">위치아이콘</span>
						</div>
						<!--//190508 추가 -->

						<form id="addToCartForm" name="addToCartForm" action="/쇼핑백 등록 url" method="post">
							<input type="hidden" name="cart_prev_colorcode" id="cart_prev_colorcode" value="${curcolorcode}" /> 
							<input type="hidden" name="cart_size" id="cart_size" value="" /> 
							<input type="hidden" name="cart_sumprice" id="cart_sumprice" value="" />
							<input type="hidden" name="hsm" id="hsm" value="" /> 
							<input type="hidden" name="hspoint" id="hspoint" value="" />
							<input type="button" value="쇼핑백 담기" class="btn cart1803 float_left ml0" id="addToCartButton">
							<!-- onclick="addToCart();GA_Event('상품_상세','하단 고정 버튼','쇼핑백담기');" -->
							<div>
								<input type="hidden" name="CSRFToken" value="7399b544-9191-4d49-af3a-9a782a52adc4">
							</div>
						</form>

						<form id="addToCartBuynowForm" name="addToCartBuynowForm" action="/order/order_page" method="post">
							<input type="hidden" name="orders[0].pid" id="pid" value="${ productVO.pid}"/>
							<input type="hidden" name="orders[0].oamount" id="oamount" value="" /> 
							<input type="hidden" name="orders[0].ccolorcode" id="ccolorcode" value="" /> 
							<input type="hidden" name="orders[0].ssize" id="ssize" value="" />
							<input type="button" value="바로주문" class="btn order float_right mr0" id="addToCartBuyNowButton">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>

					<dl class="toggle_type1" style="margin-top: 80px;">
						<!-- 상품상세 정보창 변경 211027 S -->
						<!-- 상품상세 정보창 변경 211027 E -->
						<dt>
							<a href="javascript:void(0);" id="DETAIL_INFO_EVT"> 상품정보제공고시</a>
						</dt>
						<!-- 상품정보제공고시 -->
						<dd style="display: none;">
							<strong>상품품번 :</strong> ${productVO.pid}<br> <strong>품목
								:</strong> ${productVO.p_item}<br> <strong>소재 :</strong>
							${productVO.p_material}<br> <strong>색상 :</strong>
							${productVO.pprice}<br> <strong>사이즈 :</strong>
							${productVO.p_size}<br> <strong>제조국 :</strong>
							${productVO.p_country}<br> <strong>제조사 :</strong>
							${productVO.p_manufacturer}<br> <strong>제조연월 :</strong>
							${productVO.p_madedate}<br> <strong>세탁방법 및 취급 시
								주의사항</strong>
							<div class="howToWash renew1907" id="newHowToWash">
								<ul>
									<li><img
										src="http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/003.png"
										onmouseover="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko2/003_.png'"
										onmouseout="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/003.png'"
										onerror="javascript:onErrorImg(this);" alt="003"> <span
										class="code_num">003</span></li>
									<li><img
										src="http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/029.png"
										onmouseover="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko2/029_.png'"
										onmouseout="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/029.png'"
										onerror="javascript:onErrorImg(this);" alt="029"> <span
										class="code_num">029</span></li>
									<li><img
										src="http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/049.png"
										onmouseover="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko2/049_.png'"
										onmouseout="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/049.png'"
										onerror="javascript:onErrorImg(this);" alt="049"> <span
										class="code_num">049</span></li>
									<li><img
										src="http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/005.png"
										onmouseover="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko2/005_.png'"
										onmouseout="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/005.png'"
										onerror="javascript:onErrorImg(this);" alt="005"> <span
										class="code_num">005</span></li>
									<li><img
										src="http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/019.png"
										onmouseover="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko2/019_.png'"
										onmouseout="this.src='http://cdn.thehandsome.com/pc/laundryMark/pc_ko1/019.png'"
										onerror="javascript:onErrorImg(this);" alt="019"> <span
										class="code_num">019</span></li>
								</ul>
								본 제품은 반드시 드라이크리닝 하십시오. 세탁 시 이염, 변색, 탈색될 수 있으니 유의하시기 바랍니다. 단추나
								악세서리는 세탁 시 손상될 수 있으므로 은박지로 싸거나 분리하여 주십시오. 특성상 마찰에 의해 올 뜯김 등 원단
								손상이 발생할 수 있으니 취급 시 주의하시기 바랍니다.<br> <br>
							</div>
							<br> <strong>품질보증기준</strong><br> 1. 본 제품은 정부 고시 소비자
							분쟁해결 기준에 의거 고객의 정당한 피해를 보상해드립니다. <br> - 원단 불량, 부자재 불량, 봉제
							불량, 사이즈 부정확, 부당 표시(미표시 및 부실표시) 및 소재 구성 부적합으로 인한 세탁 사고 : 구입일로부터 1년
							이내분은 무상수리, 교환, 구입가 환불함. (단, 봉제 불량은 1년 경과 후에도 무상 수선 가능) <br>
							- 사이즈가 맞지 않거나 디자인, 색상 불만 제품 : 구입 후 7일 이내로서 제품에 손상이 없는 경우 동일 가격,
							동일 제품으로 교환 가능. <br> - 상하의 한 벌(세트/일착)인 경우 한 쪽에만 이상이 있어도 한
							벌(세트/일착)로 처리함. 단, 소재 및 디자인이 다른 경우에는 해당 의류만 교환 가능. <br>2. 소비자
							부주의에 의한 제품 훼손, 세탁 잘못으로 인한 변형 및 품질 보증기간(1년)이 경과한 제품에 대해서는 보상의 책임을
							지지 않으며, 수선 가능시에는 실비로 수선해드립니다. <br>3. 제품에 이상이 있는 경우 바로 본사로
							연락주시면 수선/교환/환불이 가능하나, 타업체(일반 수선실 등)에서 수선했을 경우는 불가능합니다.<br> <br>
							<div style="margin-bottom: 20px;">
								<p style="float: left;">
									<strong>AS 책임자와 연락처</strong><br> ㈜한섬/1800-5700
								</p>
								<!-- 20200218 마크 추가 -->
								<div class="sft_ksdt"></div>
								<!-- // 20200218 마크 추가 -->
							</div>
							<br> <br> 위 내용은 상품정보제공 고시에 따라 작성되었습니다.
						</dd>
						<!-- 2021.08.10 화장품 상품인 경우 실측사이즈 영역 미노출 -->
						<dt>
							<a href="javascript:void(0);" id="REAL_SIZE_EVT">실측사이즈</a>
						</dt>
						<!-- 실측사이즈 -->
						<dd>
							<!-- <dl class="info_tbl">
								
							</dl> -->
							<img src="/resources/image/actualsize/${productVO.pid}.png">
							<!-- <p class="info2">실측 사이즈 (82) 기준</p>
							<br>
							//numlist
							<font color="red"> <strong> 원단, 측정방법에 따라 약간의 오차
									가능성이 있습니다.</strong>
							</font> -->

							<div class="timehomme_pants_fit" style="display: none"></div>
						</dd>
						<dt>
							<a href="#" id="DELI_RETURN_EVT">배송 및 교환/반품</a>
						</dt>
						<!-- 배송 및 교환/반품 -->
						<dd>
							<p class="tit">배송안내</p>
							<dl class="info_tbl">
								<dt>배송방식 :</dt>
								<dd>우체국택배, CJ대한통운, 로젠택배</dd>
								<!-- 210728 oera 신규 추가  -->
								<dt>배송지역 :</dt>
								<dd>전국 (일부 지역 제외)</dd>
								<dt>배송정보 :</dt>
								<dd>평균 입금완료일 기준 2-4일 소요됩니다 (토/일/공휴일 제외)</dd>
								<dt>배송비 :</dt>
								<dd>
									실결제금액 기준 30,000원 이상 결제 시 무료배송<br>30,000원 미만 결제 시 2,500원(기본
									배송비)<br>* 실결제금액이란, 쿠폰/바우처 할인액 및 <br>&nbsp;
									한섬마일리지/H.Point 사용 금액을 제외한 금액입니다. <br> &nbsp;&nbsp;(e-money
									사용은 실결제금액에 포함)<br>* 도서산간 지역은 3,000원의 별도 배송비가 부과됩니다.<br>*
									일부 도서지역은 도선료가 부가될 수 있습니다.
								</dd>
							</dl>
							<p class="tit mt20">교환 및 반품안내</p>
							<!-- info_tbl -->
							<dl class="info_tbl">
								<dt>교환/반품 기간 :</dt>
								<dd>상품 수령 후, 7일 이내</dd>
								<dt>교환절차 :</dt>
								<dd style="letter-spacing: -0.2px;">
									사이즈 및 상품불량 교환만 가능(색상교환 불가)하며 교환을 원하실 경우<br> 고객센터로 문의해주시기
									바랍니다. (교환 재고가 없을 경우, 환불로 안내예정)<br> - 교환은 배송비 입금 및 상품 입고 확인
									이후에 진행됩니다. <br> 화장품은 상품 불량만 교환 가능하며(상품 개봉 후 교환 불가), 고객센터로<br>
									문의해주시기 바랍니다.
									<!-- 210728 oera 신규 추가  -->
								</dd>
								<dt>반품절차 :</dt>
								<dd>
									[배송완료] 7일 이내에 마이페이지 주문/배송/취소/반품 메뉴에서<br> [반품신청] 버튼을 클릭 시
									가능합니다.
								</dd>
								<dt>교환/반품 배송비 :</dt>
								<dd style="letter-spacing: -0.4px;">
									배송비는 5,000원 이며(반품비는 주문시 배송비 결제 유무에 따라 변동)<br>상품 불량 등의 이유로
									교환/반품하실 경우, 배송비는 무료입니다.
								</dd>
								<dt>교환/반품 불가사유</dt>
								<dd>
									다음의 경우에는 교환/반품이 불가합니다.
									<ol class="numlist">
										<li><span class="num sum">-</span> <span class="txt">교환/반품
												기간(상품 수령 후 7일 이내)을 초과하였을 경우</span></li>
										<li><span class="num sum">-</span> <span class="txt">고객님의
												요청에 의해 제품 사양이 변경(이니셜 제품, 사이즈 맞춤 제품 등)된 경우</span></li>
										<li><span class="num sum">-</span><span class="txt">제품을
												이미 사용하였거나, 제품 일부를 소비하였을 경우</span></li>
										<!-- 210728 oera 신규 추가  -->
										<li><span class="num sum">-</span> <span class="txt">화장품
												: 상품 개봉 후 교환/반품 불가. 단 상품 불량(내용물 불량) 혹은 피부 트러블로 인한 반품은 가능(용량
												1/3 미만 사용 및 의사소견서 1:1문의 첨부 필수)</span></li>
										<!-- // 210728 oera 신규 추가  -->
										<li><span class="num sum">-</span> <span class="txt">식기류
												: 제품 수령 후, 비닐포장을 개봉한 경우</span></li>
										<li><span class="num sum">-</span> <span class="txt">고객님의
												귀책사유로 인해 회수가 지연될 경우</span></li>
										<li><span class="num sum">-</span> <span class="txt">국내외
												환율 변동 등에 의해 가격이 변동되는 제품의 경우</span></li>
										<li><span class="num sum">-</span> <span class="txt">문제소지가
												있는 제품을 본사가 아닌, 타 업체(일반 수선실 등)에서 선처리가 된 경우</span></li>
									</ol>
								</dd>
								<!-- 210728 oera 신규 추가  -->
								<dt>교환/반품건 배송</dt>
								<dd>
									교환/반품 시 배송 받으신 박스로 반송하셔야 합니다. <br>(한섬/오에라/리퀴드퍼퓸바 상품 함께 주문
									후 교환/반품 시 각각의 박스에 나눠서 반송해주세요. 한 박스에 함께 동봉하여 반송 시 교환/반품 처리가 불가할
									수 있습니다)
								</dd>
								<!-- // 210728 oera 신규 추가  -->
							</dl>
							<p class="tit mt20">환불안내</p>
							<p>환불은 반송제품 확인 후 진행됩니다.</p>
							<br>
						</dd>
						<!--상품평 btn-->
						<div class="popup_customer_review1807" id="customerReview">
							<a href="javascript:fn_popupCustomerReview();">상품평(<span
								id="customerReviewCnt">0</span>)
								<div class="star_score1807" id="prodTotalStarScoreWrapper"
									style="display: none;">
									<span class="cmt_star"> <!-- 별점에 따라 class명 변경 (star1, star2 ,star3, star4, star5) -->
										<span class="cmt_per" id="prodTotalStarScore">별점</span>
									</span>
								</div>
							</a>
						</div>
						<!--//상품평 btn-->

					</dl>
				</div>

				<div class="clearfix mt30">
					<div class="btnwrap float_left">
						<a href="javascript:fn_popupProductQnA();" class="btn arrow mr0" r>Q&amp;A(<span
							class="data" id="productQnACnt">0</span>)
						</a>
					</div>
					<div class="float_right">
						<!-- AddToAny BEGIN -->
						<div class="a2a_kit a2a_kit_size_32 a2a_default_style"
							data-a2a-url="http://www.thehandsome.com/ko/HANDSOME/MEN/PANTS/%EC%A1%B0%EA%B1%B0-%ED%8A%B8%EB%9E%99/%5BSET%5D-%EC%9A%B8-%EC%A1%B0%EA%B1%B0-%ED%8C%AC%EC%B8%A0/p/TH2CBKPC033M_BK?lang=ko"
							data-a2a-title="[TIME HOMME] 
                            [SET] 울 조거 팬츠"
							style="line-height: 32px;">
							<a class="a2a_button_facebook"
								onclick="GA_Event('상품_상세','공유_SNS','FACEBOOK');" target="_blank"
								href="/#facebook" rel="nofollow noopener"><span
								class="a2a_svg a2a_s__default a2a_s_facebook"
								style="background-color: rgb(24, 119, 242);"><svg
										focusable="false" aria-hidden="true"
										xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
										<path fill="#FFF"
											d="M17.78 27.5V17.008h3.522l.527-4.09h-4.05v-2.61c0-1.182.33-1.99 2.023-1.99h2.166V4.66c-.375-.05-1.66-.16-3.155-.16-3.123 0-5.26 1.905-5.26 5.405v3.016h-3.53v4.09h3.53V27.5h4.223z"></path></svg></span><span
								class="a2a_label">Facebook</span></a> <a class="a2a_button_twitter"
								onclick="GA_Event('상품_상세','공유_SNS','TWITTER');" target="_blank"
								href="/#twitter" rel="nofollow noopener"><span
								class="a2a_svg a2a_s__default a2a_s_twitter"
								style="background-color: rgb(29, 155, 240);"><svg
										focusable="false" aria-hidden="true"
										xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
										<path fill="#FFF"
											d="M28 8.557a9.913 9.913 0 01-2.828.775 4.93 4.93 0 002.166-2.725 9.738 9.738 0 01-3.13 1.194 4.92 4.92 0 00-3.593-1.55 4.924 4.924 0 00-4.794 6.049c-4.09-.21-7.72-2.17-10.15-5.15a4.942 4.942 0 00-.665 2.477c0 1.71.87 3.214 2.19 4.1a4.968 4.968 0 01-2.23-.616v.06c0 2.39 1.7 4.38 3.952 4.83-.414.115-.85.174-1.297.174-.318 0-.626-.03-.928-.086a4.935 4.935 0 004.6 3.42 9.893 9.893 0 01-6.114 2.107c-.398 0-.79-.023-1.175-.068a13.953 13.953 0 007.55 2.213c9.056 0 14.01-7.507 14.01-14.013 0-.213-.005-.426-.015-.637.96-.695 1.795-1.56 2.455-2.55z"></path></svg></span><span
								class="a2a_label">Twitter</span></a> <a
								href="javascript:fnSharePin(&quot;http://www.thehandsome.com/ko/HANDSOME/MEN/PANTS/%EC%A1%B0%EA%B1%B0-%ED%8A%B8%EB%9E%99/%5BSET%5D-%EC%9A%B8-%EC%A1%B0%EA%B1%B0-%ED%8C%AC%EC%B8%A0/p/TH2CBKPC033M_BK&quot;);"
								class="pinterest"
								onclick="GA_Event('상품_상세','공유_SNS','PRINTEREST');"></a> <input
								type="hidden" id="url"
								value="http://www.thehandsome.com/ko/HANDSOME/MEN/PANTS/%EC%A1%B0%EA%B1%B0-%ED%8A%B8%EB%9E%99/%5BSET%5D-%EC%9A%B8-%EC%A1%B0%EA%B1%B0-%ED%8C%AC%EC%B8%A0/p/TH2CBKPC033M_BK">
							<div style="clear: both;"></div>
						</div>



					</div>
				</div>

				<input type="hidden" id="viewExhibitionPageCode" value=""> <input
					type="hidden" id="viewExhibitionPageName" value=""> <input
					type="hidden" id="vs-product-id" value="TH2CBKPC033M_BK"> <input
					type="hidden" id="vs-product-version" value="1"> <input
					type="hidden" id="vs-product-image-url"
					value="http://newmedia.thehandsome.com/TH/2C/FW/TH2CBKPC033M_BK_T01.jpg">
			</div>

		</div>
		<div class="product-detail-img"></div>
		<div class="matches_items" id="productDetailEtc"></div>
	</div>

	<!--상품평 리스트 팝업-->
	<div class="popwrap w_type_4" id="customerReviewDiv"
		style="display: none;">
		<!--마일리지 안내영역 1906 -->
		<div class="mileage_info_wrap1906">
			<p class="wrap_heading">상품평 작성 시 추가 마일리지를 드려요!</p>
			<div class="mileage_info_box">
				<div class="review_w">
					<p class="review_w_tit">• 온라인 구매 상품평 작성 시</p>
					<ul>
						<li>
							<div class="ico_mileage1906">정상상품</div>
							<p>
								<strong>정상상품</strong><br>구매금액의 <b>0.5%</b>
							</p>
						</li>
						<li>
							<div class="ico_mileage1906">아울렛상품</div>
							<p>
								<strong>아울렛상품</strong><br>구매금액의 <b>0.1%</b>
							</p>
						</li>
						<li>
							<div class="ico_mileage1906">포토상품평</div>
							<p>
								<strong>포토상품평</strong><br>(상품별 최초)<br> <b>2,000마일리지</b>
							</p>
						</li>
					</ul>
				</div>
				<div class="best_review">
					<p class="review_w_tit">• 온라인/오프라인 구매</p>
					<ul>
						<li>
							<div class="ico_mileage1906">베스트리뷰</div>
							<p>
								<strong>베스트리뷰</strong><br>매월 5명 <b>10만원</b> 바우처
							</p>
						</li>
					</ul>
				</div>
			</div>
			<div class="noti_box" style="display: none;">
				<ul class="bul_sty01_li">
					<li>마일리지는 배송 완료일로부터 30일 이내, 작성한 상품평에 한하여 제공됩니다.</li>
					<li>상품평 작성 시, 제공되는 추가 마일리지는 온라인에서 구입한 상품에 한하여 제공됩니다.</li>
					<li>베스트 리뷰는 온라인/오프라인에서 구매한 상품의 상품평 전체를 대상으로 선정합니다.</li>
					<li>할인, 쿠폰 적용 후 실결제금액이 5,000원 이상인 상품에 한하여 지급됩니다.</li>
					<li>판매가 종료된 상품의 경우, 상품 상세페이지가 소멸되어 상품평 작성 및 마일리지 적립이 불가능합니다.</li>
				</ul>
			</div>
			<div class="btn_noti_box">
				<span>자세히 보기</span>
			</div>
		</div>
		<!--//마일리지 안내영역 1906 -->
		<div class="pop_tltwrap2 pb0 customerreviewdiv1905">

			<h3>
				상품평(<span id="review_cnt" class="review_cnt">0</span>)
			</h3>
			<div class="star_score1807" id="totalStarScoreWrapper">
				<span class="cmt_star"> <!-- 별점에 따라 class명 변경 (star1, star2 ,star3, star4, star5) -->
					<span class="cmt_per" id="totalStarScore">별점</span>
				</span>
			</div>
			<a href="javascript:fn_popupCustomerReviewWrite();"
			class="btn_evaluation1905" id="customerReviewWrite">상품평 작성하기</a>
		</div>
		<!-- pop_cnt-->
		<div class="pop_cnt evaluation_list1807 options">
			<div class="tab_a m3 mt20">
				<input type="hidden" id="review_tab_active" value="ALL">
				<ul id="review_tab">
					<li id="ALL"><a href="#;" class="active"
						onclick="GA_Event('상품평','탭','전체');">전체 (0)</a></li>
					<li id="PHOTO"><a href="#;" class=""
						onclick="GA_Event('상품평','탭','포토상품평');">포토 상품평 (0)</a></li>
					<li id="TEXT"><a href="#;"
						onclick="GA_Event('상품평','탭','일반상품평');">일반 상품평 (0)</a></li>
				</ul>
			</div>
			<div class="clearfix review_tab1_1807">
				<ul>
					<!-- 상품평 리스트 띄우기 -->
					<c:forEach items="${reviewList}" var="review" varStatus="reviewStatus">
							<input type="hidden" name="reviewIndex" class="reviewIndex">
							<li class="evaluation_view" id="evaluation_view${reviewStatus.index}}">
							<div class="member_info_top">
									<ul>
										<li class="name">${review.mid}</li>
										<li class="grade">${review.mgrade}</li>
										<li class="date">${review.rdate}</li>
										<li class="stars">
											<div class="star_score1807">
												<span class="cmt_star"> <span class="cmt_per star${review.rcontentMap.rating}">별점</span>
												</span>
											</div>
										</li>
									</ul>
								</div>
								<div class="member_info_bottom">
									<ul>
										<li class="choice">• <span>${review.rcontentMap.age}</span> / <span>${review.rcontentMap.height}</span>
											/ <span>${review.rcontentMap.bodyType}</span> / 평소 사이즈 : <span>${review.rcontentMap.enjoySize}</span>
										</li>
										<li class="must">• 구매 정보 : <span>${review.pcolor}</span> / <span>${review.psize}</span>
											/ <span>더한섬닷컴</span>
										</li>
									</ul>
								</div>
								<div class="review_represent_img1912">
								  <img
								    src="${review.rcontentMap.thumbnailImage}"
								    alt="리뷰 이미지"
								  />
								</div>
								<%-- 상품평 사진 슬라이더 --%>
								<div class="review_img_wrap review_img_cont191216" id="reviewImg_${reviewStatus.index}">
									<ul class="slides">
									<c:forEach items="${review.rcontentMap.imagesPath}" var="image">
										<li>											
											<img src="${image}" alt="리뷰 이미지"  />
										</li>
									</c:forEach>
									</ul>
								</div>
								
								<div class="review_txt_wrap">
									<p class="review_txt">${review.rcontentMap.headline}</p>
								</div>
								<%-- 카테고리별 사이즈, 컬러 평가 다르게 출력   --%>
								<%-- 아우터, 탑, 수트-드레스셔츠, 수트재킷 --%>
								<c:choose>
									<c:when test="${productVO.cmedium == '아우터' || productVO.cmedium == '탑' || productVO.csmall == '드레스셔츠' || productVO.csmall == '수트재킷'}">
										<div class="sizecolor clearfix">
											<div class="real_fit_size1905">
												<strong>• 실 착용 사이즈</strong>
												<div class="evaluation_wrap1905">
													<p>어깨너비 :</p>
													<div class="clearfix">
														
														<span class="${review.rcontentMap.realWearSize1 eq '1' ? 'on' : '' }">타이트함</span> 
														<span class="${review.rcontentMap.realWearSize1 eq '2' ? 'on' : '' }">적당함</span> 
														<span class="${review.rcontentMap.realWearSize1 eq '3' ? 'on' : '' }">여유있음</span>
													</div>
												</div>
												
												<div class="evaluation_wrap1905">
													<p>가슴둘레 :</p>
													<div class="clearfix">
														<span class="${review.rcontentMap.realWearSize2 eq '1' ? 'on' : '' }">타이트함</span> 
														<span class="${review.rcontentMap.realWearSize2 eq '2' ? 'on' : '' }">적당함</span> 
														<span class="${review.rcontentMap.realWearSize2 eq '3' ? 'on' : '' }">여유있음</span>
													</div>
												</div>
												<div class="evaluation_wrap1905">
													<p>총길이 :</p>
													<div class="clearfix">
														<span class="${review.rcontentMap.realWearSize3 eq '1' ? 'on' : '' }">타이트함</span> 
														<span class="${review.rcontentMap.realWearSize3 eq '2' ? 'on' : '' }">적당함</span> 
														<span class="${review.rcontentMap.realWearSize3 eq '3' ? 'on' : '' }">여유있음</span>
													</div>
												</div>
											</div> 
											<div class="real_color1905">
												<strong>• 실 제품 색상</strong>
												<div class="clearfix">
													<span class="${review.rcontentMap.realProductColor eq '1' ? 'on' : '' }">어두워요</span>
													<span class="${review.rcontentMap.realProductColor eq '2' ? 'on' : '' }">화면과 같아요</span>
													<span class="${review.rcontentMap.realProductColor eq '3' ? 'on' : '' }">밝아요</span>
												</div>
											</div>
										</div>
									</c:when>
									
									<%-- 드레스, 팬츠, 스커트 --%>
									<c:when test="${productVO.cmedium == '드레스' || productVO.cmedium == '팬츠' || productVO.cmedium == '스커트'}">
										 <div class="sizecolor clearfix">
											<div class="real_fit_size1905">
												<strong>• 실 착용 사이즈</strong>
												<div class="evaluation_wrap1905">
													<p>허리둘레 :</p>
													<div class="clearfix">
													
														<span class="${review.rcontentMap.realWearSize1 eq '1' ? 'on' : '' }">타이트함</span> 
														<span class="${review.rcontentMap.realWearSize1 eq '2' ? 'on' : '' }">적당함</span> 
														<span class="${review.rcontentMap.realWearSize1 eq '3' ? 'on' : '' }">여유있음</span>
													</div>
												</div>
												
												<div class="evaluation_wrap1905">
													<p>엉덩이둘레 :</p>
													<div class="clearfix">
														<span class="${review.rcontentMap.realWearSize2 eq '1' ? 'on' : '' }">타이트함</span> 
														<span class="${review.rcontentMap.realWearSize2 eq '2' ? 'on' : '' }">적당함</span> 
														<span class="${review.rcontentMap.realWearSize2 eq '3' ? 'on' : '' }">여유있음</span>
													</div>
												</div>
												<div class="evaluation_wrap1905">
													<p>총길이 :</p>
													<div class="clearfix">
														<span class="${review.rcontentMap.realWearSize3 eq '1' ? 'on' : '' }">타이트함</span> 
														<span class="${review.rcontentMap.realWearSize3 eq '2' ? 'on' : '' }">적당함</span> 
														<span class="${review.rcontentMap.realWearSize3 eq '3' ? 'on' : '' }">여유있음</span>
													</div>
												</div>
											</div>
											<div class="real_color1905">
												<strong>• 실 제품 색상</strong>
												<div class="clearfix">
													<span class="${review.rcontentMap.realProductColor eq '1' ? 'on' : '' }">어두워요</span>
													<span class="${review.rcontentMap.realProductColor eq '2' ? 'on' : '' }">화면과 같아요</span>
													<span class="${review.rcontentMap.realProductColor eq '3' ? 'on' : '' }">밝아요</span>
												</div>
											</div>
										</div>
										</c:when>		
								</c:choose>	
								<div class="review_more_1807">
									<a class="review_plus" href="javascript:void(0);" itemnum="${reviewStatus.index}">리뷰 더보기</a>
								</div>
							</li>
						</c:forEach>
				</ul>
			</div>
			<!-- paging -->
			<div class="paging mt30" id="reviewPagingDiv"></div>
			<!-- //paging -->
			<!--// pop_cnt-->

		</div>
		<a href="javascript:void(0);" class="btn_close"><img
			src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
			alt="닫기"></a>
	</div>
	<!--//상품평 리스트 팝업 -->

	<!--상품평 쓰기 팝업 -->
	<div class="popwrap w_type_4" id="customerReviewWriteDiv"
		style="display: none;">
		<div class="pop_tltwrap2 customerreviewwritediv1807">
			<h3 id="review_title">상품평 작성하기</h3>
			<p class="reqd_txt float_right">
				<strong class="reqd">*</strong> 표시는 필수항목입니다.
			</p>
		</div>
		<div class="pop_cnt evaluation_write1905 options1811">
			<form id="reviewForm" name="reviewForm"
				action="http://www.thehandsome.com/ko/HANDSOME/MEN/PANTS/%EC%A1%B0%EA%B1%B0-%ED%8A%B8%EB%9E%99/%5BSET%5D-%EC%9A%B8-%EC%A1%B0%EA%B1%B0-%ED%8C%AC%EC%B8%A0/p/TH2CBKPC033M_BK"
				method="post" enctype="multipart/form-data">
				<!-- 주문번호 저장 -->
				<input type="hidden" name="reviewOrderId" value="">
				<input type="hidden" name="productCode"> <input
					type="hidden" name="productCodeType"> <input type="hidden"
					name="orderNumber" id="orderNumber" value=""> <input
					type="hidden" name="purchaseColor" id="purchaseColor" value="">
				<input type="hidden" name="purchaseColorName" id="purchaseColorName"
					value=""> <input type="hidden" name="purchaseSize"
					id="purchaseSize" value=""> <input type="hidden"
					name="purchaseProdYN" id="purchaseProdYN" value=""> <input
					type="hidden" name="orderWriteChk" id="orderWriteChk" value="">
				<input type="hidden" name="closeWriteChk" id="closeWriteChk"
					value=""> <input type="hidden" name="productId"
					id="productId" value=""> <input type="hidden"
					name="fileDeleteYN" id="fileDeleteYN">

				<!-- 상품평활성화 -->
				<input type="hidden" name="categoryCode" id="categoryCode"
					value="SZ11"> <input type="hidden" name="shoulderWidth"
					id="shoulderWidth" value=""> <input type="hidden"
					name="chestSize" id="chestSize" value=""> <input
					type="hidden" name="waistSize" id="waistSize" value=""> <input
					type="hidden" name="buttSize" id="buttSize" value=""> <input
					type="hidden" name="totalSize" id="totalSize" value=""> <input
					type="hidden" name="photoAccumulationRightYn"
					id="photoAccumulationRightYn" value=""> <input
					type="hidden" name="offlineOrdDt" id="offlineOrdDt" value="">
				<input type="hidden" name="offlineShpCd" id="offlineShpCd" value="">
				<input type="hidden" name="offlineShpNm" id="offlineShpNm" value="">
				<input type="hidden" name="tempProductId" id="tempProductId"
					value=""> <input type="hidden" name="reviewFileCd"
					id="reviewFileCd" value=""> <input type="hidden"
					name="reviewFileCd1" id="reviewFileCd1" value=""> <input
					type="hidden" name="reviewFileCd2" id="reviewFileCd2" value="">
				<input type="hidden" name="reviewFileCd3" id="reviewFileCd3"
					value=""> <input type="hidden" name="reviewFileCd4"
					id="reviewFileCd4" value="">
				<fieldset>
					<legend>상품평쓰기</legend>
					<div class="tblwrap">
						<table class="tbl_wtype1">
							<caption>상품평쓰기 입력항목</caption>
							<colgroup>
								<col style="width: 135px">
								<col>
								<col style="width: 130px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="th_space">상품명</th>
									<td colspan="3" style="padding: 15px;">
										<div class="item_box" id="reviewProductDiv">
											<div class="pt_list_all">
												<a href="javascript:void(0);">
												<img src="${colorVOList[0].cimage1}" id="reviewProducImg"
																alt="상품 이미지"
																onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"
																style="object-fit: cover">
													</a>
												<div class="tlt_wrap review_header_wrapper">
													<!-- <div class="tlt_wrap review_header_wrapper nodata"> -->
													<a href="#;" class="basket_tlt"> 
													<span class="tlt" id="reviewProductBrandName">${productVO.bname}</span> 
													<span class="sb_tlt" id="reviewProductProductName">${productVO.pname}</span>
												  / <span id="reviewProducPrice">${productVO.pprice}</span></a>
													</a>
													<!-- 주문조회에서 넘어올시 이거 보여줌<p class="color_op" id="purchased_color_size" style="display:none;">COLOR : <span id="review_color_name"></span>   <span class="and_line">/</span>  SIZE : <span id="review_size"></span></p> -->
													<div class="select_options_wrap" style="display: none;">
														<ul class="select_options">
															<li class="select_colors">
																<p>
																	<span class="compulsory">*</span> 색상
																	<!-- 색상 -->
																</p>
																<ul class="color_chip clearfix">
																	<input type="hidden" id="colorName" value="BLACK">
																	<li id="TH2CBKPC033M_BK">
																		<input type="hidden" class="colorNameVal" value="BLACK"> 
																		<a href="#;" class="beige" data-color="BLACK"
																		style="background: #000000 url('http://newmedia.thehandsome.com/TH/2C/FW/TH2CBKPC033M_BK_C01.jpg/dims/resize/24x24');"
																		onclick="javascript:fn_clickColorCode('TH2CBKPC033M_BK', 'BLACK');"
																		onmouseover="setColorName('BLACK');" onmouseout="setColorName('');"></a></li>
																	<li id="TH2CBKPC033M_TG">
																		<input type="hidden" class="colorNameVal" value="Taupe Grey"> 
																		<a class="beige" data-color="Taupe Grey"
																		style="background: #9b9595 url('http://newmedia.thehandsome.com/TH/2C/FW/TH2CBKPC033M_TG_C01.jpg/dims/resize/24x24');"
																		onclick="javascript:fn_clickColorCode('TH2CBKPC033M_TG', 'Taupe Grey');"
																		onmouseover="setColorName('Taupe Grey');" onmouseout="setColorName('');"></a></li>
																	<li><span class="cl_name" id="colorNameContent"></span>
																	</li>
																</ul>
															</li>
															<li class="select_size">
																<p>
																	<span class="compulsory">*</span> 사이즈
																	<!-- 사이즈 -->
																</p>
																<ul class="size_chip clearfix" id="review_size_btn_area">
																	<li id="TH2CBKPC033M_BK_78"><a
																		onclick="javascript:fn_clickSizeCode('TH2CBKPC033M_BK_78');">78</a>
																		<productdetails:popupsizequickreference>
																		</productdetails:popupsizequickreference></li>
																	<li id="TH2CBKPC033M_BK_82"><a
																		onclick="javascript:fn_clickSizeCode('TH2CBKPC033M_BK_82');">82</a>
																	</li>
																	<li id="TH2CBKPC033M_BK_86"><a
																		onclick="javascript:fn_clickSizeCode('TH2CBKPC033M_BK_86');">86</a>
																	</li>
																</ul> <!-- <ul class="size_chip clearfix">
                                                                    <li id="MN1IBKTO483W_MB_90">
                                                                        <a href="javascript:fn_detailProductAjax('MN1IBKTO483W_MB_90')">90</a>
                                                                    </li>
                                                         </ul> -->
															</li>
														</ul>
													</div>

													<!-- <div class="select_checkbox">
                                                        <input type="checkbox" name="" value="" id="storePickTFC">
                                                        <label for="storePickTFC">상품을 매장에서 구매하셨나요?</label>
                                                    </div> -->
												</div>
												<!--20190529_selelct_group -->
												<div class="select_group" id="productOption"
													style="display: none;"></div>
												<!--//20190529_selelct_group -->
												<div class="select_checkbox" style="display: none;">
													<input type="checkbox" id="packopt" name="packopt">
													<label for="purchaseYN"> 매장에서 구매한 상품입니다.</label>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr class="tbl_blank1807">
									<td colspan="4">&nbsp;</td>
								</tr>
								<tr class="radio_btn_1905 bk">
									<th scope="row" class="th_space">연 령</th>
									<td colspan="3">
										<input id="ageG1" type="radio" name="age" value="18세 이하"> 
										<label for="ageG1">18세 이하</label> 
										<input id="ageG2" type="radio" name="age" value="20대"> 
										<label for="ageG2">20대</label> 
										<input id="ageG3" type="radio" name="age" value="30대"> 
										<label for="ageG3">30대</label>
										<input id="ageG4" type="radio" name="age" value="40대">
										<label for="ageG4">40대</label> 
										<input id="ageG5" type="radio" name="age" value="50대"> 
										<label for="ageG5">50대</label>
										<input id="ageG6" type="radio" name="age" value="60대 이상">
										<label for="ageG6">60대 이상</label>
									</td>
								</tr>
								<tr class="input_txt_1905">
									<th scope="row" class="th_space" id="thHeight">
										<strong class="reqd">*</strong> 키</th>
									<td><input type="text" name="height" id="height" style="width: 75%; margin-right: 10px">cm</td>
									<th scope="row" class="th_space" id="thEnjoySize">
										<strong class="reqd">*</strong> 평소 사이즈</th>
									<td><input type="text" name="enjoySize" id="enjoySize"></td>
								</tr>
								<tr class="radio_btn_1905">
									<th scope="row" class="th_space" id="thBodyType">
										<strong class="reqd">*</strong> 체 형</th>
									<td colspan="3">
										<input id="dark1" type="radio" name="bodyType" value="마른 체형"> 
										<label for="dark1">마른 체형</label> 
										<input id="dark2" type="radio" name="bodyType" value="보통">
										<label for="dark2">보통</label> 
										<input id="dark3" type="radio" name="bodyType" value="통통한 체형"> 
										<label for="dark3">통통한 체형</label>
									</td>
								</tr>
								<tr class="tbl_blank1807">
									<td colspan="4">&nbsp;</td>
								</tr>
								<tr class="write_star_wrap">
									<th colspan="4">
										<div class="write_star_score1807">
											<span class="cmt_star"> <span class="cmt_per star5">별점</span>
											</span>
											<ul class="btn_star_score">
												<li><a href="#;" value="1">1점</a></li>
												<li><a href="#;" value="2">2점</a></li>
												<li><a href="#;" value="3">3점</a></li>
												<li><a href="#;" value="4">4점</a></li>
												<li><a href="#;" value="5">5점</a></li>
												<input type="hidden" id="rating" name="rating" value="5">
											</ul>
											<p>평점을 선택해 주세요.</p>
										</div>
									</th>
								</tr>
								<tr>
									<th scope="row" class="th_space"><strong class="reqd">*</strong>실
										착용 사이즈</th>
									<td colspan="3">
										<!--20190529_상품평활성화-->
										<div class="cont_detail">
											<p class="left_txt">허리둘레 :</p>
											<ul class="rd_box_radio_list">
												<li><input id="realWearSize1_01" type="radio"
													name="realWearSize1" value="1"> <label
													for="realWearSize1_01">타이트함</label></li>
												<li><input id="realWearSize1_02" type="radio"
													name="realWearSize1" value="2"> <label
													for="realWearSize1_02">적당함</label></li>
												<li><input id="realWearSize1_03" type="radio"
													name="realWearSize1" value="3"> <label
													for="realWearSize1_03">여유있음</label></li>
											</ul>
										</div>
										<div class="cont_detail">
											<p class="left_txt">엉덩이둘레 :</p>
											<ul class="rd_box_radio_list">
												<li><input id="realWearSize2_01" type="radio"
													name="realWearSize2" value="1"> <label
													for="realWearSize2_01">타이트함</label></li>
												<li><input id="realWearSize2_02" type="radio"
													name="realWearSize2" value="2"> <label
													for="realWearSize2_02">적당함</label></li>
												<li><input id="realWearSize2_03" type="radio"
													name="realWearSize2" value="3"> <label
													for="realWearSize2_03">여유있음</label></li>
											</ul>
										</div>
										<div class="cont_detail">
											<p class="left_txt">총길이 :</p>
											<ul class="rd_box_radio_list">
												<li><input id="realWearSize3_01" type="radio"
													name="realWearSize3" value="1"> <label
													for="realWearSize3_01">짧은 편</label></li>
												<li><input id="realWearSize3_02" type="radio"
													name="realWearSize3" value="2"> <label
													for="realWearSize3_02">적당함</label></li>
												<li><input id="realWearSize3_03" type="radio"
													name="realWearSize3" value="3"> <label
													for="realWearSize3_03">긴 편</label></li>
											</ul>
										</div> <!--//20190529_상품평활성화-->
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_space"><strong class="reqd">*</strong>실
										제품 색상</th>
									<td colspan="3"><input id="dark" type="radio"
										name="realProductColor" value="1"> <label for="dark">어두워요</label>
										<input id="same" type="radio" name="realProductColor"
										class="ml20" value="2"> <label for="same">화면과
											같아요</label> <input id="light" type="radio" name="realProductColor"
										class="ml20" value="3"> <label for="light">밝아요</label>
									</td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd"
										style="margin-top: 6px;">*</strong> <label for="lb1"
										style="margin-top: 6px;">상품평<br> <span
											class="subtxt_1905"> (20자 이상<br>&nbsp;200자 이하)
										</span>
									</label></th>
									<td colspan="3"><textarea id="reviewHeadline"
											name="headline" cols="30" rows="5"
											style="width: 98%; height: 78px" maxlength="200"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row" id="thFile" class="th_space"><label
										for="file">사진등록</label></th>
									<td colspan="3">
										<!-- File upload -->
										<div class="file_upload hs_input_file_wrap2003">
											<div class="upload_wrap2003">
												<input type="text" id="textReviewFile" class="text"
													title="파일 첨부하기" readonly="readonly" name="fileText">
												<div class="upload_btn">
													<input type="file" name="reviewFile" id="reviewFile"
														class="btn add_s" title="파일찾기" multiple> <label
														for="reviewFile"> <!-- 	 <button type="button" id="uploadFile1" class="img_upload" title="파일찾기">  -->
														<span id="uploadFile1" class="img_upload">파일찾기</span> <!--	 </button> -->
													</label>

												</div>
											</div>
											<ul class="file_image_wrap2003">

											</ul>
											<p class="txt_guide">10MB 미만의 jpg,gif,png 파일만 첨부하실 수
												있습니다.</p>
											<!-- //File upload -->
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<p class="txt_guide">
							<span style="color: #e46764; font-weight: bold;">- 상품평과
								무관한 내용이거나 상품 재판매, 광고, 동일 문자의 반복 및 기타 불법적인 내용은 통보 없이 삭제되며,<br>&nbsp;&nbsp;해당
								글 작성자 ID는 글쓰기 권한이 제한됩니다.
							</span><br>- 반품, 취소 등의 CS관련 글은 고객센터&gt;1:1문의로 이동될 수 있습니다.<br>
							<span>- 더한섬닷컴에서 구매한 상품의 상품평을 배송완료 30일 이내 작성 시, 추가 마일리지를
								지급합니다.</span><br> - 마일리지 지급에 대한 상세 내용은 마이페이지&gt;내 상품평 페이지에서 확인
							부탁드립니다.<br> &nbsp;&nbsp;(마일리지 적립은 오프라인 구매 및 간편회원 제외)
						</p>
					</div>
					<div class="btnwrap mt40">
						<input type="button" id="reviewCancle" value="취소하기" class="btn wt">
						<input type="button" id="reviewWriteSend" value="등록하기"
							class="btn gray mr0">
					</div>

				</fieldset>
				<div>
					<input type="hidden" name="CSRFToken"
						value="7399b544-9191-4d49-af3a-9a782a52adc4">
				</div>
			</form>
		</div>
		<a href="javascript:void(0);" id="reviewCloseBtn"
			style="position: absolute; top: 20px; right: 20px; width: 20px; height: 20px;"><img
			src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
			alt="닫기"></a>
	</div>
	<!--//상품평 쓰기 팝업 -->
	<style>
#delQnAFile {
	display: inline;
	position: absolute;
	top: 9px;
	right: 115px;
}

#textQnAFile {
	padding: 0 30px 0 6px;
	width: calc(100% - 24px);
	text-overflow: ellipsis;
}
</style>

	<div class="popwrap w_type_4" id="productQnADiv" style="display: none;">

		<div class="pop_tltwrap2 pb0">
			<h3>Q&amp;A</h3>
		</div>
		<div class="pop_cnt evaluation_list">
			<a href="javascript:fn_popupProductQnAWrite();" class="btn_evaluation"
				id="productQnAWrite">상품문의하기</a>
			<div class="clearfix">
				<table class="pop_tbl_ltype1">
					<caption>Q&amp;A</caption>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">Q&amp;A</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<!-- paging -->
			<div class="paging mt30" id="qnAPagingDiv"></div>
			<!-- //paging -->
		</div>
		<a href="javascript:fn_closeProductQnA();" id="qnAcloseBtn"
			class="btn_close"><img
			src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
			alt="닫기"></a>
	</div>


	<div class="popwrap w_type_3" id="productQnAWriteDiv"
		style="display: none;">
		<div class="pop_tltwrap2">
			<h3>상품문의하기</h3>
		</div>
		<div class="pop_cnt evaluation_write">
			<form id="productQnAForm" name="productQnAForm"
				action="http://www.thehandsome.com/ko/HANDSOME/MEN/PANTS/%EC%A1%B0%EA%B1%B0-%ED%8A%B8%EB%9E%99/%5BSET%5D-%EC%9A%B8-%EC%A1%B0%EA%B1%B0-%ED%8C%AC%EC%B8%A0/p/TH2CBKPC033M_BK"
				method="post" enctype="multipart/form-data">
				<input type="hidden" id="productCode" name="productCode"> <input
					type="hidden" id="productQnaCode" name="productQnaCode"> <input
					type="hidden" id="delAttach" name="delAttach" value="N">
				<fieldset>
					<legend>상품문의하기</legend>
					<div class="tblwrap">
						<p class="reqd_txt float_right">
							<strong class="reqd">*</strong> 표시는 필수항목입니다.
						</p>
						<table class="tbl_wtype1">
							<caption>상품문의하기 입력항목</caption>
							<colgroup>
								<col width="140px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><strong class="reqd">*</strong><label
										for="inquiryTitle">문의제목</label></th>
									<td><input type="text" id="inquiryTitle"
										name="inquiryTitle" title="input" style="width: 100%">
									</td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong><label
										for="inquiryContents">문의내용</label><span class="com_txt_p">(300자
											이하)</span></th>
									<td><textarea name="inquiryContents" id="inquiryContents"
											cols="30" rows="5" style="width: 98%; height: 200px"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_space"><label for="file">파일
											첨부하기</label></th>
									<td>
										<!-- File upload -->
										<div class="file_upload">
											<input type="text" id="textQnAFile" class="text" title="파일찾기"
												readonly="readonly" name="fileText"> <a
												href="javascript:void(0);" id="delQnAFile"> <img
												src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
												alt="파일삭제">
											</a>
											<div class="upload_btn">
												<label for="qnaFile"><button type="button"
														id="uploadFile" class="img_upload" title="파일찾기">
														<span>파일찾기</span>
													</button></label> <input type="file" id="qnaFile" name="uploadFile"
													class="btn add_s" title="파일찾기">
											</div>
										</div> <!-- //File upload -->
										<p class="txt_guide">10MB 미만의 jpg,gif,png 파일만 첨부하실 수 있습니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_space"><label
										for="inquiryMobileNo2">SMS 알림받기</label></th>
									<td>
										<div style="position: relative;">
											<input type="hidden" id="smsMobileNo" name="smsMobileNo">
											<select id="inquiryMobileNo1" title="휴대폰 번호 앞자리"
												style="width: 80px; margin-top: 0; vertical-align: middle; padding: 3px 8px 3px 8px;">
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											<div class="form_hyphen">-</div>
											<input type="text" id="inquiryMobileNo2"
												name="inquiryMobileNo2" title="휴대폰 번호 가운데자리"
												style="width: 80px;" maxlength="4">
											<div class="form_hyphen">-</div>
											<input type="text" id="inquiryMobileNo3"
												name="inquiryMobileNo3" title="휴대폰 번호 뒷자리"
												style="width: 80px;" maxlength="4"> <span
												class="sms_alm_2006_chk"
												style="display: block; position: absolute; top: 3px; right: 14px;">
												<input type="hidden" id="smsNoticeYN" name="smsNoticeYN"
												value="N"> <input type="checkbox"
												id="inquirySmsNoticeYn" name="inquirySmsNoticeYn"
												style="margin-top: 1px;"> <label
												for="inquirySmsNoticeYn">SMS 알람고지</label>
											</span>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="inquiryEmailAddress"><strong
											class="reqd">*</strong><label for="inquiryMobileNo2">이메일
												답변받기</label></label></th>
									<td><input type="hidden" id="replyToEmail"
										name="replyToEmail"> <input type="text"
										id="inquiryEmailAddress" name="inquiryEmailAddress"
										title="이메일아이디" style="width: 120px;"> <span
										class="andmail">@</span> <input type="text"
										id="inquiryEmailDomain" name="inquiryEmailDomain"
										title="이메일계정 입력란" style="width: 120px;"> <select
										id="inquiryEmailSel" title="이메일계정"
										style="width: 140px; padding: 3px 8px 3px 8px;">
											<option value="" selected="selected">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
											<option value="nate.com">nate.com</option>
											<option value="empas.com">empas.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="msn.com">msn.com</option>
											<option value="hanmir.com">hanmir.com</option>
											<option value="chol.net">chol.net</option>
											<option value="korea.com">korea.com</option>
											<option value="netsgo.com">netsgo.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="hanafos.com">hanafos.com</option>
											<option value="freechal.com">freechal.com</option>
											<option value="hitel.net">hitel.net</option>
									</select></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="guide_txt clearfix" style="border-top: 0;">
						<span class="float_left"><strong>상품에 관한 배송, 교환, 취소
								등의 자세한 문의사항은 고객센터를 이용해 주시기 바랍니다.</strong></span> <span class="float_right">
							<input type="checkbox" name="securitySentenceYn"
							id="securitySentenceYn" value="Y"> <label
							for="securitySentenceYn">비밀글 설정</label>
						</span>
					</p>
					<div class="btnwrap mt40">
						<input type="button" id="qnaCancle" value="취소하기" class="btn wt">
						<input type="button" id="qnaWriteSend" value="등록하기"
							class="btn gray mr0">
					</div>
				</fieldset>
				<div>
					<input type="hidden" name="CSRFToken"
						value="7399b544-9191-4d49-af3a-9a782a52adc4">
				</div>
			</form>
		</div>
		<a href="javascript:fn_closeProductQnAWrite();" class="btn_close"><img
			src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
			alt="닫기"></a>
	</div>

	
</div>
<div id="criteo-tags-div" style="display: none;"></div>

<!-- 장바구니 담겼을때 계속 쇼핑할지 말지  -->
<div class="layerArea" id="productLayer" style="display: none;">
	<div class="layerBg"></div>
	<div class="popwrap w_type_1" id="putCart"
		style="z-index: 150; margin-top: 853px; display: none;" tabindex="-1">
		<div class="pop_cnt">
			<h3 class="pop_tlt copy">
				쇼핑백에 담겼습니다.<br>확인하시겠습니까?
			</h3>
			<div class="btnwrap">
				<input type="button" id="clsBtn" class="btn wt_s mr5"
					value="계속 쇼핑하기"> <input type="button" id="cfBtn"
					class="btn gray_s mr0" value="쇼핑백 바로가기">
			</div>
		</div>
		<a href="javascript:void(0);" class="btn_close"><img
			src="/resources/images/ico_close.png" alt="닫기"></a>
	</div>
	<div class="popwrap w_type_1 " id="Order_confirm" style="z-index: 150; margin-top: 753px; display:none;"
		tabindex="-1">
		<div class="pop_cnt">
			<h3 class="pop_tlt copy">사이즈를 선택해 주세요.</h3>
			<div class="btnwrap">
				<input type="button" class="btn gray_s mr0" onclick="sizeConfirm();" value="확인">
			</div>
		</div>
		<a href="javascript:void(0);" class="btn_close"> <img
			src="/resources/images/ico_close.png" alt="닫기"></a>
	</div>
	<!-- 로그인 물어보는 창 -->
	<div
		id = "AskLogin"
	    class="popwrap w_type_1"
	    style="z-index: 150; display:none; margin-top: 337.5px"
	    tabindex="-1"
	    >
	    <div class="pop_cnt">
	      <h3 class="pop_tlt copy">로그인 하시겠습니까?</h3>
	      <div class="btnwrap">
	        <input
	          type="button"
	          id="clslogin"
	          class="btn wt_s mr5"
	          value="취소"
	        /><input type="button" id="cfBtn" class="btn gray_s mr0" value="확인" onclick="location.href='/member/loginForm'" />
	      </div>
	    </div>
	    <a href="javascript:void(0);" class="btn_close"
	      ><img src="/resources/images/ico_close.png" alt="닫기"
	    /></a>
  </div>
  <div
  		id = "alreadyInsert"
	  class="popwrap w_type_1"
	  style="z-index: 150; margin-top: 1072px"
	  tabindex="-1">
	  <div class="pop_cnt">
	    <h3 class="pop_tlt copy">
		      이미 쇼핑백에 담겨있습니다.<br />
		      <p style="color: gray; font-size: 14px; margin-top: 8px">
		        (동일 상품은 최대 2개까지 구매 가능)
		      </p>
		    </h3>
	    <div class="btnwrap">
	      <input type="button" class="btn gray_s mr0" onclick="sizeConfirm();" value="확인" />
	    </div>
	  </div>
	  <a href="javascript:void(0);" class="btn_close"
	    ><img src="/resources/images/ico_close.png" alt="닫기"
	  /></a>
	</div>
</div>

<form id="productOneCLickDeliveryForm"
	action="http://www.thehandsome.com/ko/mypage/myDeliveryList">
	<input type="hidden" name="code" id="code" value="">
</form>
<input type="hidden" id="chkToastFirstYn" name="chkToastFirstYn"
	value="N">
<!--beshow conversion starts-->
<!--beshow conversion ends-->
<iframe style="display: none" id="fileFrame" title="fileFrame" scr=""></iframe>

<!-- footerWrap -->
<script>
	//리------------------------------------------------------------------뷰
	let fileObject = new Object();

	// 상품평 작성 처리
	function fn_reviewWriteSend() {
		if (!confirm("작성 하시겠습니까?"))
			return false;
		//입력 값 rcontent 컬럼에 삽입 위해 map에 넣기

		let rcontent = new Map();
		rcontent.set('age', $("input[type=radio][name=age]:checked").val()); // 연령대
		rcontent.set('height', $('#height').val()); // 키
		rcontent.set('enjoySize', $('#enjoySize').val()); //실 착용 사이즈
		rcontent.set('bodyType', $("input[type=radio][name=bodyType]:checked")
				.val()); //체형
		rcontent.set('rating', $('#rating').val()); //평점
		rcontent.set('realWearSize1', $(
				"input[type=radio][name=realWearSize1]:checked").val()); //리뷰 옵션
		rcontent.set('realWearSize2', $(
				"input[type=radio][name=realWearSize2]:checked").val()); //리뷰옵션
		rcontent.set('realWearSize3', $(
				"input[type=radio][name=realWearSize3]:checked").val()); //리뷰옵션
		rcontent.set('realProductColor', $(
				"input[type=radio][name=realProductColor]:checked").val()); //색감
		rcontent.set('headline', $("#reviewHeadline").val()); //내용
		rcontent.set('fileText', $('#fileText').val()); //파일이름
	
		rcontent.set('thumbnailImage',fileObject.thumbPath);
		rcontent.set('imagesPath',fileObject.imagesPath);
		rcontent.set('oid', $('input[name=reviewOrderId]').val());
		//console.log("rcontent : " + rcontent);
	
		//map 직렬화
		let serializedMap = JSON.stringify(Object.fromEntries(rcontent));
	
		//console.log(serializedMap);
	
		// 아들아~! 토큰을 가져가야지 ~~!
		let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
	
		// ajax에 삽입 위해서 pid,mid,rcontent 컬럼 삽입
		const params = {
			pid : "${productVO.pid}",
			mid : "${member}",
			rcontent : serializedMap,
		};

		$.ajax({
			url : '/review/reviewWrite',
			type : 'POST',
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data : JSON.stringify(params), //직렬화
			dataType : 'text',
			contentType : 'application/json; charset=utf-8',
			success : function(result) {
				//작성 성공시 작성창 닫기
				if (result == "Success") {
					alert("리뷰가 작성되었습니다.");
					console.log("리뷰가 작성되었습니다.");
					reviewReset();
					$("#customerReviewWriteDiv").hide();
					viewPopup("#customerReviewDiv");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				// 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
				alert("통신 실패.");
			},
		});
	
	};
	
	// 상품평 등록하기 버튼 눌렀을 때
	$('#reviewWriteSend').on("click", function() {
		fn_reviewWriteSend();
	});
	
	//상품평 버튼 클릭시 상품평 리스트 띄워지게 하기
	function fn_popupCustomerReview() {
		viewPopup("#customerReviewDiv");
	}
	
	//x 버튼을 누르면 상품평 리스트 닫기
	function fn_closeProductReview() {
		console.log("fn");
		//.btn_close 버튼의 click 동작 이벤트를 강제로 실행시킴
		$(".btn_close").trigger("click");
	}
	
	// 상품평 작성 폼 이동전에 가능 여부 확인
	function fn_reviewWriteCheck() {
		// ajax에 삽입 위해서 pid,mid,rcontent 컬럼 삽입
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
	
		const params = {
			pid : "${productVO.pid}",
			mid : "${member}",
		};
	
		console.log("params :" + JSON.stringify(params));
	
		$.ajax({
			url : '/review/reviewWriteCheck',
			type : 'POST',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data : JSON.stringify(params), //직렬화
			dataType : 'text',
			contentType : 'application/json; charset=utf-8',
			success : function(result) {
				console.log("result : " + result);
				let resultMsg = result.split(',');
				console.log("resultMsg[1] : " + resultMsg[1]);
				
				$('input[name=reviewOrderId]').val(resultMsg[1]);
				console.log("$('input[name=reviewOrderId]').val : " + $('input[name=reviewOrderId]').val());
				
				// 리뷰 작성 가능 여부 확인
				if (resultMsg[0] == "pass") {
					console.log("리뷰 작성 가능");
					//상품평 리스트를 숨긴다.
					$("#customerReviewDiv").hide();
					//상품평 작성란을 띄운다.
					viewPopup("#customerReviewWriteDiv");
				} else if (resultMsg[0] == "exist") { // 이미 작성했을 때
					alert("리뷰를 이미 작성하셨습니다.");
					console.log("리뷰를 이미 작성하셨습니다.");
				} else if (resultMsg[0] == "empty") { // 구매내역이 없을 때
					alert("구매내역이 없습니다.");
					console.log("구매내역이 없습니다.");
				} else if (resultMsg[0] == "fail") { // 작성 실패시
					alert("작성에 실패했습니다.");
					console.log("작성이 불가능합니다.");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				// 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
				alert("통신 실패.");
			},
		});
	}
	
	//후기 작성란 띄우기
	function fn_popupCustomerReviewWrite() {
	<%if ((String) session.getAttribute("member") == null) {%>
	//세션에 값이 없으면 로그인 폼으로 이동
		location.href = '/member/loginForm';
	<%} else {%>
	fn_reviewWriteCheck();
	<%}%>
	}
	
	//x버튼을 눌렀을때 상품평 작성 취소하기
	$("#reviewCancle").on('click', function() {
	
		//취소를 원하면 상품평 작성란을 숨기고 상품평 리스트를 보여줌
		if (confirm("취소하시겠습니까?")) {
			reviewReset();
			$("#customerReviewWriteDiv").hide();
			viewPopup("#customerReviewDiv");
			if(Object.keys(fileObject).length > 0){
				let csrfHeaderName = "${_csrf.headerName}";
				let csrfTokenValue = "${_csrf.token}";

				$.ajax({
					url : "/review/reviewCancle",
					data :  JSON.stringify(fileObject),
					type : "post",
					contentType: "application/json; charset=utf-8",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success : function(result) {
						console.log(fileObject);
						console.log("올린 이미지 잘 삭제 됨");
					}//end suce..			
				});//end ajax	
			}
		}
	
	});
	
	//상품평 작성 취소하기
	$("#reviewCloseBtn").on('click', function() {
	
		//취소를 상품평 작성란을 숨기고 상품평 리스트를 보여줌
		if (confirm("취소하시겠습니까?")) {
			reviewReset();
			$("#customerReviewWriteDiv").hide();
			viewPopup("#customerReviewDiv");
		}
	
	});
	
	// 상품평 평점 선택
	$(".btn_star_score li a").on(
			"click",
			function() {
				var idx = $(this).parent('li').index() + 1;
				for (var i = 1; i < 6; i++) {
					$('.write_star_score1807 .cmt_star .cmt_per').removeClass(
							'star' + i);
				}
				// 선택한 별의 css 수정
				$('.write_star_score1807 .cmt_star .cmt_per').addClass(
						'star' + idx);
				// 선택한 요소의 value 값 가져오기
				$("#rating").val($(this).attr('value'));
			});
	
	
	
	
	
	
	// 상품평 내용 초기화
	function reviewReset() {
		//연령
		$("#customerReviewWriteDiv input[name=age]").prop("checked", false);
		//키
		$("#customerReviewWriteDiv #height").val("");
		//체형
		$("#customerReviewWriteDiv input[name=bodyType]")
				.prop("checked", false);
		//평소 사이즈
		$("#customerReviewWriteDiv #enjoySize").val("");
	
		//실 착용 사이즈
		$("#realWearSize1_01").prop("checked", false);
		$("#realWearSize1_02").prop("checked", false);
		$("#realWearSize1_03").prop("checked", false);
	
		$("#realWearSize2_01").prop("checked", false);
		$("#realWearSize2_02").prop("checked", false);
		$("#realWearSize2_03").prop("checked", false);
	
		$("#realWearSize3_01").prop("checked", false);
		$("#realWearSize3_02").prop("checked", false);
		$("#realWearSize3_03").prop("checked", false);
	
		//실착용
		$("#customerReviewWriteDiv input[name=realWearSize]").prop("checked",
				false);
		//실 제품 색상
		$("#customerReviewWriteDiv input[name=realProductColor]").prop(
				"checked", false);
		//상품평
		$("#customerReviewWriteDiv #reviewHeadline").val("");
		//평점
		var idx = $("#customerReviewWriteDiv .btn_star_score li:eq(4) > a")
				.parent('li').index() + 1;
		for (var i = 1; i < 6; i++) {
			$('.write_star_score1807 .cmt_star .cmt_per').removeClass(
					'star' + i);
		}
		// 선택한 별의 css 수정
		$('.write_star_score1807 .cmt_star .cmt_per').addClass('star' + idx);
		// 선택한 요소의 value 값 가져오기
		$("#rating").val($(this).attr('value'));
	
		//사진등록
	
	}
	
	// 마일리지 설명란 펼치기 버튼
	function mileageInfoView(){
	    $('.mileage_info_wrap1906 .btn_noti_box > span').on('click',function(){
	        if($(this).parents('.mileage_info_wrap1906').find('.noti_box').css("display") == "none"){
	            $(this).parents('.mileage_info_wrap1906').find('.noti_box').stop().slideDown('fast');
	            $(this).closest('.btn_noti_box').addClass('on');
	            $(this).text('닫기');
	        }else{
	            $(this).parents('.mileage_info_wrap1906').find('.noti_box').stop().slideUp('fast');
	            $(this).closest('.btn_noti_box').removeClass('on');
	            $(this).text('자세히 보기');
	        }
	    });
	};
	
	//리------------------------------------------------------------------뷰
	//가격에 3자리마다 컴마
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

	//배송안내버튼 클릭시 보여지게
	function fn_popupDelivery() {
		//fn_parentLayer();
		$("#popupDelivery").show();
	}
	//배송안내버튼 클릭시 안보여지게
	function fn_popdownDelivery() {
		$("#popupDelivery").hide();
	}
	// 사이즈 조견표클릭시 보여지게
	function fn_popupSizeQuickReference() {
		$("#sizeQuickReferenceLayer").show();
	}
	// 사이즈 조견표클릭시 보여지게
	function fn_popdownSizeQuickReference() {
		$("#sizeQuickReferenceLayer").hide();
	}
	//컬러버튼 이미지 올릴때 오른쪽에 컬러이름 띄워지게하기
	function setColorName(colorName) {
		$("#colorNameContent").text(colorName);
	}

	//QnA 버튼 클릭시 QnA 리스트 띄워지게 하기
	function fn_popupProductQnA() {
		viewPopup("#productQnADiv");
	}

	//x 버튼을 누르면 QnA 리스트 닫기
	function fn_closeProductQnA() {
		console.log("fn");
		//.btn_close 버튼의 click 동작 이벤트를 강제로 실행시킴
		$(".btn_close").trigger("click");
	}
	
	//사이즈 확인 모달 창 버튼의 class에 스타일이 적용되있으ㅓㅅ
	/* function fn_Order_confirm() {
		console.log("fn");
		//.btn_close 버튼의 click 동작 이벤트를 강제로 실행시킴
		$(".btn_close").trigger("click");
	} */
	
	//btn_close라는 클래스 이름을 가진 버튼을 클릭시 닫기 적용
	$(".btn_close").on("click", function() {
		$('#productLayer').hide();
		$(".popwrap").hide();
	});
	
	//QnA 작성란 띄우기
	function fn_popupProductQnAWrite() {
		
		//QnA 리스트를 숨긴다.
		$("#productQnADiv").hide();
		//작성란을 띄운다.
		viewPopup("#productQnAWriteDiv");
	}
	
	
	//x 버튼을 누르면 QnA 작성창 닫기
	function fn_closeProductQnAWrite() {
		//.btn_close 버튼의 click 동작 이벤트를 강제로 실행시킴
		$(".btn_close").trigger("click");
		//QnA 작성 리스트를 띄운다.
		viewPopup("#productQnADiv");
	}

	//QnA 작성 취소하기
	$("#qnaCancle").on('click', function() {

		//취소를 원하면 QnA 작성란을 숨기고 상품 QnA 리스트를 보여줌
		if (confirm("취소하시겠습니까?")) {
			$("#productQnAWriteDiv").hide();
			viewPopup("#productQnADiv");
		}

	});
	
	//사이즈 체크 확인 창이 뜨고 확인버튼을 누르면 확인 모달창에 사라짐
	function sizeConfirm(){
		$('#productLayer').hide();
		$("#Order_confirm").hide();
	}
	
	//QnA 팝업 창의 크기를 조절하고 띄우는 함수(공홈을 참고함)
	function viewPopup(v, n) {

		var obj = $("#" + v.split("#")[1]);
		var lp = ($(window).width() - obj.outerWidth()) / 2;
		var tp = ($(window).height() - obj.outerHeight()) / 2
				+ $(window).scrollTop();
		var scrollTop = $(window).scrollTop();
		if (lp < 0)
			lp = 0;
		if (tp < 0)
			tp = 0;
		$('#productLayer').show();
		if ($(window).height() < obj.outerHeight()) {
			obj.css("top", scrollTop).css("position", "absolute").css(
					"z-index", 101);
		} else {
			obj.css("top", tp).css("position", "absolute").css("z-index", 101);
		}
		obj.show();
		return false;
	}

	//수량버튼 내렸을때! 무조건 1개 이상이여야겠지?
	function fn_qtySubtraction() {
		let qty = parseInt($("#txtqty").val());
		if (qty - 1 > 0) {
			qty--;
			$("#txtqty").val(qty + "");
			const sumprice = parseInt($("#productPrice").val()) * qty;
			$("#sumPrice").text("₩" + priceComma(sumprice));

			//마일리지, 포인트 알맞게 값 넣기
			let hsm = parseInt("${productVO.pprice}") * 5 / 100 * qty;
			let hspoint = parseInt("${productVO.pprice}") * 0.1 / 100 * qty;
			$("#hsm").text(priceComma(hsm) + " M (%5)")
			$("#hspoint").text(priceComma(hspoint) + " P (%0.1)")
		}
	}
	
	//수량버튼 올렸을때! 3개면 안된다고 경고!
	function fn_qtyAdd() {
		let qty = parseInt($("#txtqty").val());
		if (qty + 1 > 2) {
			alert("2개까지만 가능해요 ^^");
		} else {
			qty++;
			$("#txtqty").val(qty + "");
			const sumprice = parseInt($("#productPrice").val()) * qty;
			$("#sumPrice").text("₩" + priceComma(sumprice));

			//마일리지, 포인트 알맞게 값 넣기
			let hsm = parseInt("${productVO.pprice}") * 5 / 100 * qty;
			let hspoint = parseInt("${productVO.pprice}") * 0.1 / 100 * qty;
			$("#hsm").text(priceComma(hsm) + " M (%5)")
			$("#hspoint").text(priceComma(hspoint) + " P (%0.1)")
		}
	}
	
	let isWishList = "${isWishList}";
	//좋아요 지우는 ajax처리
	function deleteajaxRequest(params){
		//스프링 보안 설정 CSRF 토큰값
		let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
		
		$.ajax({
			type : "POST",
			url : "/member/deleteWishList",
			beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data : params,// json 형태의 데이터
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				console.log(data);
				isWishList=data;

				$('.toast_popup p').text('위시리스트에서 삭제했습니다.');
				$('.toast_popup').stop().removeClass('on');
				$('.wishlist1803').stop().toggleClass('on');
				$("#wishlistCount").text((parseInt($("#wishlistCount").text())-1)+'')

			},
			error : function(jqXHR, textStatus, errorThrown){
            	console.log(jqXHR);  //응답 메시지
            	console.log(textStatus); //"error"로 고정인듯함
            	console.log(errorThrown);
            }
		});
	}
	
	
	// 좋아요 눌렀을 때 
	function addWishListClick() {
		// 로그인 안했으면 로그인 했는지 물어보기
		<%
			if ((String)session.getAttribute("member") == null) {
				// 세션에 값이 없으면 로그인 페이지로
		%>
			$(".layerArea").show();
			$("#AskLogin").show();
		<%
			} else {
		%>	
			let selectSize = "";
			let selectColor = "";
			let prev_colorcode = "${curColorCode}"; //colorcode

			selectColor = $('a[colorcode='+prev_colorcode+']').attr('value');	
			selectSize = "${productVO.p_info}";
			console.log("prev_colorcode -------------- " + prev_colorcode);
			console.log("selectColor -------------- " + selectColor);
			
			let itemMap = new Map();
			itemMap.set('member_mid',"${member}");
			itemMap.set('pid', "${productVO.pid}");
			itemMap.set('psize', selectSize);
			itemMap.set('pcolor', selectColor);
			
			$('.toast_popup').stop().toggleClass('on');
            $('.toast_popup p').stop().show();
			
            $('.toast_popup p').stop().animate({
                'top' : '-42px',
                'opacity' : 1
             });
            
            
             setTimeout(function() {
                $('.toast_popup p').stop().animate({
                   'top' : 0,
                   'opacity' : 0
                });
             }, 1750);
             setTimeout(function() {
                $('.toast_popup p').stop().fadeOut();
             }, 2000);

            
				if(isWishList != "0"){//이미 등록된 상태 일때

					const deleteList = [];

					deleteList.push(Object.fromEntries(itemMap));
					deleteajaxRequest(JSON.stringify(deleteList));
				}else{
					//등록하고싶을때
					let params = {
						member_mid : "${member}",
						pid : "${productVO.pid}",
						psize : selectSize,
						pcolor : selectColor
					}
					//스프링 보안 설정 CSRF 토큰값
					let csrfHeaderName ="${_csrf.headerName}";
					let csrfTokenValue="${_csrf.token}";

					$.ajax({
						type : "POST",
						url : "/member/insertWishList",
						beforeSend: function(xhr) {
					          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
						data : params,					// json 형태의 데이터
						success : function(data) {
							console.log("삽입성공");
							isWishList="1";
							console.log(isWishList);
							$('.toast_popup p').text('위시리스트에 담았습니다.');
	                        $('.toast_popup').stop().addClass('on');

							$('.wishlist1803').stop().toggleClass('on');
							$("#wishlistCount").text((<%= (int)session.getAttribute("wsCount") %>+1)+'');
						},
						error : function(jqXHR, textStatus, errorThrown){
			            	console.log(jqXHR);  //응답 메시지
			            	console.log(textStatus); //"error"로 고정인듯함
			            	console.log(errorThrown);
			            }
					});
				}

		<%
			}
		%>
	}
	
	(function($){$(document).ready(
					function() {
						//사진등록						
						var maxSize = 5242880; //한 이미지당 5MB를 넘을 수 없음

						function checkExtension(fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}//end if

							return true;
						}

						function uploadImages() {//등록하기 버튼 눌렀을때 이미지 업로드 되게 하기!
							let formData = new FormData();
							
							formData.append('pid', '${productVO.pid}');

							let csrfHeaderName = "${_csrf.headerName}";
							let csrfTokenValue = "${_csrf.token}";

							let inputFile = $("input[name='reviewFile']");
							let files = inputFile[0].files;

							//파일 formdata에 추가
							for (var i = 0; i < files.length; i++) {
								// 크기 체크
								if (!checkExtension(files[i].size)) {
									return false;
								}
								formData.append("uploadFile", files[i])
							}//end for

							$.ajax({
								url : "/review/uploadAjaxAction",
								processData : false,
								contentType : false,
								data : formData,
								type : "post",
								dataType : 'json',
								beforeSend : function(xhr) {
									xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
								},
								success : function(result) {
									alert("Upload");
									fileObject = result;
								}//end suce..			
							});//end ajax	
						}
				
						$("#reviewFile").change(function() {//input으로 파일을 첨부하면 무슨 파일이 첨부됐는지 바뀐거 보여주기 !
							let inputFile = $("input[name='reviewFile']");
							let files = inputFile[0].files
							let filenames = '';

							for (i = 0; i < files.length; i++) {
								// 크기 체크
								if (!checkExtension(files[i].size)) {
									return false;
								}
								filenames += files[i]['name'] + ' ';
							}

							$("#textReviewFile").val(filenames);
							
							uploadImages();
						});
						
						//--------------------------------- 사진등록
						//페이지 로드될때 좋아요 누른거면 좋아요 처리를 합시다
						if(isWishList !== "0"){
							$('.wishlist1803').stop().toggleClass('on');
						}
						//쇼핑백에 담을 변수 선언
						let CartorOrder_size = "";
						let CartorOrder_sumprice = "";
						let selectColor = "";
						let selectSize = "";
						//페이지 로드할때 선택된 이미지로 상세보기이미지가 띄워지고 
						let prev_colorcode = "${curColorCode}";
						$(".image_view_" + prev_colorcode).css('display',
								'block');
						// 선택된 컬러버튼 클릭된 상태로 만들기
						$('a[colorcode=${curColorCode}]').addClass('on');
						selectColor = $('a[colorcode='+prev_colorcode+']').attr('value');
						
						//마일리지, 포인트 알맞게 값 넣기
						let hsm = parseInt("${productVO.pprice}") * 5 / 100
						let hspoint = parseInt("${productVO.pprice}") * 0.1 / 100
						$("#hsm").text(priceComma(hsm) + " M (%5)")
						$("#hspoint").text(priceComma(hspoint) + " P (%0.1)")

						//COLOR 버튼 눌리면 왼쪽 이미지들 바뀌고 제품코드고 바뀜
						$(".colorBtn").on("click",
							function(e) {
								$(".image_view_" + prev_colorcode).css('display', 'none');
								$(".image_view_" + $(this).attr("colorcode")).css('display', 'block');
								prev_colorcode = $(this).attr("colorcode");
								$("#pcscode").text($(this).attr("colorcode"));
								//일단 모든 버튼 on 지우고
								$(".colorBtn").removeClass('on');
								//또한 누르면 그버튼이 계속 눌렸다는걸 표시
								$(this).addClass('on');
								selectColor = $(this).attr("value");
							});

						//사이즈버튼 눌리면 사이즈 공백 제거후 상품코드 변경
						$(".sizeBtn").on(
								"click",
								function(e) {
									const sizeText = $.trim($(this).text());
									selectSize = sizeText;
									$("#pcscode").text(
											prev_colorcode + "_" + sizeText);

									//일단 모든 버튼 on 지우고
									$(".sizeBtn").removeClass('on');
									//또한 누르면 그버튼이 계속 눌렸다는걸 표시
									$(this).addClass('on');
									//쇼핑백에 size에 담음
									CartorOrder_size = sizeText;
								});

						//처음 로드될때 가격에 3자리마다 콤마찍음
						const num = $("#productPrice").val().replace(
								/\B(?=(\d{3})+(?!\d))/g, ',');
						//콤마찍은 숫자를 가격, 총합계 태그에 뿌림
						$("#pricespan").text("₩" + num);
						$("#sumPrice").text("₩" + num);
						
/* 						//로그인 확인버튼 누르면 로그인 페이지로
						$("#cfBtn").on("click", function(){
							location.href="member/loginForm";
						}); */
						//상품상세 같은 dt눌렀을때를 공홈꺼 그대로 가져옴
						$('.toggle_type1>dt')
								.click(
										function() {

											$(this).addClass('on');
											$(this).siblings('dt').removeClass(
													'on');

											var beforeHeight = $(
													".toggle_type1").height();
											var afterHeight = 0;
											var scrolltop = $(window)
													.scrollTop();

											var checkElement = $(this).next();

											if ((checkElement.is('dd'))
													&& (checkElement
															.is(':visible'))) {
												$(this).removeClass('on');
												checkElement
														.slideUp(
																'fast',
																function() {
																	afterHeight = $(
																			".toggle_type1")
																			.height();
																	//		 	 					bodyScroll();
																});

											}
											var fitGuide = false;
											if ((checkElement.is('dd'))
													&& (!checkElement
															.is(':visible'))) {
												var v_label = "";
												var v_type = $(this).children()
														.attr("id");
												//21.11.03 상품상세 정보 영역 변경 관련 GA이벤트태깅 추가 및 변경
												if (v_type == "NEW_DETAIL_INFO_EVT") {
													v_label = "상품상세정보";
												} else if (v_type == "DETAIL_INFO_EVT") {
													if ('ko' == 'ko') {
														v_label = "상품정보제공고시";
													} else {
														v_label = "상품상세정보";
													}
												} else if (v_type == "REAL_SIZE_EVT") {
													v_label = "실측사이즈";
												} else if (v_type == "DELI_RETURN_EVT") {
													v_label = "배송 및 반품";
												} else if (v_type == "FIT_GUIDE_EVT") {
													fitGuide = true;
												}

												if (!fitGuide) {
													//GA_Event('상품_상세','정보',v_label);
													console.log("뭐고 이거");
												}

												$('.toggle_type1>dd:visible')
														.slideUp('fast');

												checkElement
														.slideDown(
																'fast',
																function() {
																	afterHeight = $(
																			".toggle_type1")
																			.height();
																	//		 					bodyScroll();
																});
											}

											if (fitGuide) {
												fitGuide_Swiper_Slide(1);
											}

											var bodyScroll = function() {

												$('body,html')
														.animate(
																{
																	scrollTop : parseFloat(scrolltop
																			+ (beforeHeight - afterHeight))
																},
																function() {
																	bodyReSize();
																});
											}

											if ($(this).next('dd').length == 0) {
												return true;
											} else {
												return false;
											}
										});

						$("#clslogin").on("click",function(){
							$(".layerArea").hide();
							$("#AskLogin").hide();
						});
						//장바구니버튼 눌렀을때
						$("#addToCartButton").on("click", function(e){
							console.log("selectColor" + selectColor);
							//우선 싸이즈 선택 했는지 물어봐
							if(selectSize === ""){
								$(".layerArea").show();
								$("#Order_confirm").show();
							}
							else{
								//로그인 안했으면 로그인 했는지 물어보고
								if("${member}" == ""){
									$(".layerArea").show();
									$("#AskLogin").show();
								}
								else{
									let csrfHeaderName ="${_csrf.headerName}";
									let csrfTokenValue="${_csrf.token}";

									const params = {
											mid: "${member}",
											pid: "${productVO.pid}",
											psize: selectSize,
											pcolor: selectColor,
											pamount: $("#txtqty").val()
									}
									console.log(params);
									//ajax 호출!
									$.ajax({
							                type : "POST",            // HTTP method type(GET, POST) 형식
							                url : "/member/insertShoppingbag",      // 컨트롤러에서 대기중인 URL 주소
							                data : params,            // Json 형식의 데이터
							                beforeSend: function(xhr) {
							                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
							                },
							                success : function(data){ // 비동기통신의 성공일경우 success콜백으로 들어옴 'data'는 응답받은 데이터
							                    // 응답코드 > 0000
							                    console.log(data);
							                    const isfail = data.split(':')[0];
							                    const count = parseInt(data.split(':')[1]);
							                    
							                    //만약 세션의 장바구니 갯수와 반환받은 data와 다르면 성공 ! 같으면 안된거니까 실패 !
							                    if(isfail === 'success' ){
							                    	$("#cartCount").text(count);
							                    	$(".layerArea").show();
													$("#putCart").show();	
							                    }else{
							                    	$(".layerArea").show();
													$("#alreadyInsert").show();
							                    }
							                },
							                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옴
							                    alert("통신 실패.");
							                }
							            });
									} 
								}
						});
						//계속 쇼핑하기 버튼을 눌렀을 경우
						$("#clsBtn").on("click", function() {
							//밖에 있는 layerArea 태그를 숨긴다.
							$(".layerArea").hide();
							//그중 Cart 모달을 나타내는 태그를 숨긴다
							$("#putCart").hide();
						});

						//쇼핑백으로 바로가기를 눌렀을 경우
						$("#cfBtn").on("click", function() {
							location.href = "/member/shoppingbag?mid=${member}";
						});
						
						//바로 주문하기 버튼을 클릭했을 경우 실행
						$("#addToCartBuyNowButton").on(
								"click",
								function() {
									console.log("addToCartBuyNowButton");
									

									//사이즈를 클릭했는지 확인한다.
									if (CartorOrder_size == "") {
										$(".layerArea").show();
										$("#Order_confirm").show();
										return;
									} else {
										$('#order_size').val(CartorOrder_size);
									}

									//pcscode를 가지고 ccolorcode를 만든다.
									let colorcodeArr=$('#pcscode').text().split("_");
									let ccolorcode=colorcodeArr[0]+"_"+colorcodeArr[1];
									$('#addToCartBuynowForm').find("input[name='orders[0].oamount']").val($('#txtqty').val());
									$('#addToCartBuynowForm').find("input[name='orders[0].ccolorcode']").val(ccolorcode);
									$('#addToCartBuynowForm').find("input[name='orders[0].ssize']").val(CartorOrder_size);
									

									$('#addToCartBuynowForm').submit();
								});
					//리뷰 더보기 버튼
					$(".review_plus").click(function(){
						const reviewIndex = $(this).attr('itemnum');
						console.log("reviewIndex : "+reviewIndex);
						$(this).closest(".evaluation_view").toggleClass("on");
						
						//리뷰 사진 슬라이더
						if($('#'+'reviewImg_'+reviewIndex).length >0){
							$('#'+'reviewImg_'+reviewIndex+' .slides').bxSlider({
								mode:"horizontal",
								speed:500,
								pager:true,
								moveSlides:1,
								minSlides:1,
								maxSlides:1,
								slideMargin:5,
								auto:false,
								autoHover:false,
								infiniteLoop:true,
							});
						}
						//$(this).toggleClass("evaluation_view");
					});


					});
	mileageInfoView();
	})(jQuery);
</script>
<%@include file="/WEB-INF/views/common/footer.jspf"%>
	<li class="evaluation_view" id="evaluation_view0">
		<div class="member_info_top">
			<ul>
				<li class="name"></li>
				<li class="grade"></li>
				<li class="date"></li>
				<li class="stars">
					<div class="star_score1807">
						<span class="cmt_star"> <span class="cmt_per">별점</span>
						</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="member_info_bottom">
			<ul>
				<li class="choice">• <span></span> / <span></span>
					/ <span></span> / 평소 사이즈 : <span></span>
				</li>
				<li class="must">• 구매 정보 : <span></span> / <span></span>
					/ <span>더한섬닷컴</span>
				</li>
			</ul>
		</div>
			<div class="review_represent_img1912">
			  <img
			    src=""
			    alt=""
			  />
			</div>
		<div class="review_img_wrap review_img_cont191216 wlength" id="reviewImg_2">
		  <ul class="slides">
		    <li>
		      <div class="review_img_cont_inner191216">
		        <div class="img_wrap">
		          <img
		            src=""
		            alt="리뷰 이미지"
		          />
		        </div>
		      </div>
		    </li>
		  </ul>
		</div>
		<div class="review_txt_wrap">
			<p class="review_txt"></p>
		</div>
		<div class="sizecolor clearfix">
			<div class="real_fit_size1905">
				<strong>• 실 착용 사이즈</strong>
				<div class="evaluation_wrap1905">
					<p>허리둘레 :</p>
					<div class="clearfix">
						<span class="">타이트함</span> <span class=" on">적당함</span> <span
							class="">여유있음</span>
					</div>
				</div>
				<div class="evaluation_wrap1905">
					<p>엉덩이둘레 :</p>
					<div class="clearfix">
						<span class="">타이트함</span> <span class=" on">적당함</span> <span
							class="">여유있음</span>
					</div>
				</div>
				<div class="evaluation_wrap1905">
					<p>총길이 :</p>
					<div class="clearfix">
						<span class="">짧은 편</span> <span class=" on">적당함</span> <span
							class="">긴 편</span>
					</div>
				</div>
			</div>
			<div class="real_color1905">
				<strong>• 실 제품 색상</strong>
				<div class="clearfix">
					<span class="">어두워요</span> <span class=" on">화면과 같아요</span> <span
						class="">밝아요</span>
				</div>
			</div>
		</div>
		<div class="review_more_1807">
			<a class="review_plus" href="javascript:void(0);" >리뷰 더보기</a>
		</div>
	</li>
