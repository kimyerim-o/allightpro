<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mem_right">
		<!--마이페이지 내용 영역-->
		<!--타이틀-->
		<div class="mem_top_wrap noto_sans">
			<h2>상단타이틀</h2>
			<div class="mem_top_new">
				<div class="mem_title">(일반) 주문/배송 조회</div>
			</div>

			<div class="order_checkmn_wrap">
				<h2>기간설정</h2>
				<!--기본선택
						 <ul class="order_checkmn">
							 <li class="order_checkmn_on"><a href="#" class="order_checkmn_a">1주일</a></li>
							 <li><a href="#" class="order_checkmn_a">1개월</a></li>
							 <li><a href="#" class="order_checkmn_a">3개월</a></li>
							 <li><a href="#" class="order_checkmn_a">6개월</a></li>
							 <li><a href="#" class="order_checkmn_aa">기간설정</a></li>
						 </ul>
						 <!--//기본선택-->

				<!--기간설정-->
				<ul class="order_checkmn">
					<li id="liw"><a href="?term_type=w" class="order_checkmn_a">1주일</a></li>
					<li id="lim1"><a href="?term_type=m1" class="order_checkmn_a">1개월</a></li>
					<li id="lim3"><a href="?term_type=m3" class="order_checkmn_a">3개월</a></li>
					<li class="order_checkmn_on" id="lim6"><a href="?term_type=m6"
						class="order_checkmn_a">6개월</a></li>
					<li><a onclick="$.searchtoggle();" class="order_checkmn_aa"
						style="cursor: pointer">기간설정</a></li>

					<li id="datesearch" style="display: none;">
						<div class="order_check_setup" id="calendar">
							<ul>
								<li><input id="start_date"
									class="order_input_new hasDatepicker" type="text"
									style="width: 80px" name="start_date" value="2020-01-10"
									placeholder="2020-01-10" readonly=""></li>
								<li>~</li>
								<li><input id="end_date"
									class="order_input_new hasDatepicker" type="text"
									style="width: 80px" name="end_date" value="2020-07-10"
									placeholder="2020-07-10" readonly=""></li>
								<li><a onclick="chkdatenew();"
									class="order_check_setup_btn" style="cursor: pointer">검색</a></li>
							</ul>
						</div>
					</li>
				</ul>
				<!--기간설정-->
			</div>
		</div>
		<!--//타이틀-->


		<!------------- order form -->
		<form name="oform" method="POST"
			action="/api/goods/api_reorder_new.asp">
			<input type="hidden" name="o" value="">
		</form>
		<!------------- order form -->

		<table class="mem_tbl" cellspacing="0" border="1" summary="주문 리스트">
			<caption>주문 리스트</caption>
			<colgroup>
				<col width="120">
				<col width="auto">
				<col width="60">
				<col width="140">
				<col width="200">
			</colgroup>
			<thead>
				<tr>
					<th class="order_amount" colspan="2" scope="col">상품정보</th>
					<th class="order_amount" scope="col">수량</th>
					<th class="order_amount" scope="col">주문 금액</th>
					<th class="order_amount" scope="col">진행 상태</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>


		<table class="order_tbl2 mt13 font_ng" cellspacing="0" border="1"
			summary="주문 리스트" style="width: 99%;">
			<caption>주문 리스트</caption>
			<colgroup>
				<col width="120">
				<col width="auto">
				<col width="60">
				<col width="140">
				<col width="200">
			</colgroup>
			<thead>
				<tr>
					<th colspan="5" scope="col">
						<div>
							<strong>주문번호&nbsp;<a
								href="mem_order_detail_view.asp?orderno=202004052091881&amp;vtab=O"
								class="order_num"><em class="order_fcT1">202004052091881</em></a></strong><em
								class="fc999 fs12 ml13">(2020-04-05)</em>
							<button
								onclick="document.oform.o.value=2091881;document.oform.submit();"
								style="padding: 5px;">동일상품주문</button>
							<span class="order_r"><a
								href="mem_order_detail_view.asp?orderno=202004052091881&amp;vtab=O"
								class="order_btn_view">주문상세보기 &gt;</a></span>
						</div>
					</th>
				</tr>
			</thead>
			<tbody>

				<tr class="last"2091881="">
					<td class="order_thmb"><a href="/goods/view.asp?g=12155"
						onclick="hitRecentLog('12155');"> <img alt="temp thmb"
							src="https://data.0app0.com/diet/shop/goods/20180207/m_20180207223500_1475154474.jpg">
					</a></td>
					<td class="order_info" colspan="3"><a class="order_deal"
						title="" href="/goods/view.asp?g=12155"
						onclick="hitRecentLog('12155');">성수동 스무디 클렌즈 </a>
						<p class="order_deal_info">*대국민식단지원* 세상 쉬운 단기 집중 관리! 클렌즈와 보식까지
							한번에 해결!</p> <!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option"><strong> 01.</strong>
									*특가*Every-Day 상쾌한 아침 7일 패키지 (과일야채 5개 + 곡물 2개)</span> <span
								class="order_option_cnt"> <span
									class="order_option_input">1</span>
							</span> <span class="order_option_amounts"> <em>27,500</em>원
							</span></li>

						</ul> <!-- //옵션명 노출--></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">구매확정</li>

							<li class="mb5"><a
								onclick="delivery_view('202004052091881','4004660');"
								class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>


						</ul>
					</td>
				</tr>

				<tr class="last"2091881="">
					<td class="order_thmb"><a href="/goods/view.asp?g=12874"
						onclick="hitRecentLog('12874');"> <img alt="temp thmb"
							src="https://data.0app0.com/diet/shop/goods/20190930/m_20190930154033_5777044664.jpg">
					</a></td>
					<td class="order_info" colspan="3"><a class="order_deal"
						title="" href="/goods/view.asp?g=12874"
						onclick="hitRecentLog('12874');">다신현미밥상 다이어트 도시락 </a>
						<p class="order_deal_info">*대국민식단지원* 비타민&amp;미네랄까지 꼼꼼하게 설계했어요.</p>

						<!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option"><strong> 01.</strong>
									*추가할인* 다신현미밥상 2주 식단세트 (10팩)</span> <span class="order_option_cnt">
									<span class="order_option_input">1</span>
							</span> <span class="order_option_amounts"> <em>39,800</em>원
							</span></li>

						</ul> <!-- //옵션명 노출--></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">구매확정</li>

							<li class="mb5"><a
								onclick="delivery_view('202004052091881','4004659');"
								class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>

							<li class="mb5"><a
								href="mem_goods_review_write.asp?orderno=202004052091881&amp;g=12874&amp;vtab=O"
								class="order_btn_write" style="cursor: pointer;">상품후기 쓰기</a></li>


						</ul>
					</td>
				</tr>

				<tr class="last"2091881="">
					<td class="order_thmb"><a href="/goods/view.asp?g=12468"
						onclick="hitRecentLog('12468');"> <img alt="temp thmb"
							src="https://data.0app0.com/diet/shop/goods/20200601/m_20200601173241_2646781141.jpg">
					</a></td>
					<td class="order_info" colspan="3"><a class="order_deal"
						title="" href="/goods/view.asp?g=12468"
						onclick="hitRecentLog('12468');">[아임닭] 간편 한끼 닭가슴살 만두 3종 </a>
						<p class="order_deal_info">맛있다고 소문난 닭가슴살 만두! 간편하게 한끼해결~</p> <!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option"><strong> 01.</strong>
									만두 3종 혼합 10팩(만두4,김치3,갈비3)</span> <span class="order_option_cnt">
									<span class="order_option_input">1</span>
							</span> <span class="order_option_amounts"> <em>25,200</em>원
							</span></li>

						</ul> <!-- //옵션명 노출--></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">구매확정</li>

							<li class="mb5"><a
								onclick="delivery_view('202004052091881','4004658');"
								class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>


						</ul>
					</td>
				</tr>

				<tr class="last"2091881="">
					<td class="order_thmb"><a href="/goods/view.asp?g=13037"
						onclick="hitRecentLog('13037');"> <img alt="temp thmb"
							src="https://data.0app0.com/diet/shop/goods/20200206/m_20200206173638_9761392669.jpg">
					</a></td>
					<td class="order_info" colspan="3"><a class="order_deal"
						title="" href="/goods/view.asp?g=13037"
						onclick="hitRecentLog('13037');">곤약상회 곤약닭가슴살 순대 (무료배송) </a>
						<p class="order_deal_info">국내 최초 출시! 단백질 18g, 칼로리를 확 낮췄어요.</p> <!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option"><strong> 01.</strong>
									곤약닭가슴살 순대 7팩</span> <span class="order_option_cnt"> <span
									class="order_option_input">1</span>
							</span> <span class="order_option_amounts"> <em>16,100</em>원
							</span></li>

						</ul> <!-- //옵션명 노출--></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">구매확정</li>

							<li class="mb5"><a
								onclick="delivery_view('202004052091881','4004657');"
								class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>


						</ul>
					</td>
				</tr>

				<tr class="last"2091881="">
					<td class="order_thmb"><a href="/goods/view.asp?g=12189"
						onclick="hitRecentLog('12189');"> <img alt="temp thmb"
							src="https://data.0app0.com/diet/shop/goods/20191127/m_20191127115952_2425702501.jpg">
					</a></td>
					<td class="order_info" colspan="3"><a class="order_deal"
						title="" href="/goods/view.asp?g=12189"
						onclick="hitRecentLog('12189');">노밀가루면 저칼로리 곤약이면 5종 </a>
						<p class="order_deal_info">면+소스포함 28kcal ! 조리없이 바로 먹어요.</p> <!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option"><strong> 01.</strong>
									*특가* 곤약이면 10종 혼합 세트 (녹차비빔 2개+귀리짜장 2개+보리우동 2개+해물볶음 2개+메밀냉면 2개)</span> <span
								class="order_option_cnt"> <span
									class="order_option_input">1</span>
							</span> <span class="order_option_amounts"> <em>25,900</em>원
							</span></li>

						</ul> <!-- //옵션명 노출--></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">구매확정</li>

							<li class="mb5"><a
								onclick="delivery_view('202004052091881','4004656');"
								class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>

							<li class="mb5"><a
								href="mem_goods_review_write.asp?orderno=202004052091881&amp;g=12189&amp;vtab=O"
								class="order_btn_write" style="cursor: pointer;">상품후기 쓰기</a></li>


						</ul>
					</td>
				</tr>

				<tr class="last"2091881="">
					<td class="order_thmb"><a href="/goods/view.asp?g=12776"
						onclick="hitRecentLog('12776');"> <img alt="temp thmb"
							src="https://data.0app0.com/diet/shop/goods/20200212/m_20200212135653_1541861139.jpg">
					</a></td>
					<td class="order_info" colspan="3"><a class="order_deal"
						title="" href="/goods/view.asp?g=12776"
						onclick="hitRecentLog('12776');">곤약상회 곤약 현미 떡볶이 </a>
						<p class="order_deal_info">국내최초! 당, 나트륨 걱정없이 즐기는 리얼 현미떡볶이!</p> <!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option"><strong> 01.</strong>
									*특가* 곤약 현미 떡볶이 4개</span> <span class="order_option_cnt"> <span
									class="order_option_input">1</span>
							</span> <span class="order_option_amounts"> <em>11,900</em>원
							</span></li>

						</ul> <!-- //옵션명 노출--></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">구매확정</li>

							<li class="mb5"><a
								onclick="delivery_view('202004052091881','4004655');"
								class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>


						</ul>
					</td>
				</tr>

				<tr class="last"2091881="">
					<td class="order_thmb"><a href="/goods/view.asp?g=12773"
						onclick="hitRecentLog('12773');"> <img alt="temp thmb"
							src="https://data.0app0.com/diet/shop/goods/20200512/m_20200512202100_8034286148.jpg">
					</a></td>
					<td class="order_info" colspan="3"><a class="order_deal"
						title="" href="/goods/view.asp?g=12773"
						onclick="hitRecentLog('12773');">[첫구매 이벤트] 배불리 5종 맛보기 세트 </a>
						<p class="order_deal_info">첫구매 고객을 위한, 다신샵의 스테디셀러 배불리 맛보기 세트~</p>

						<!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option"><strong> 01.</strong>
									*첫구매 이벤트* 배불리 맛보기세트 (깔라만시 1팩 + 풋사과 1팩 + 자몽 1팩 + 포도 1팩 + 체리 1팩)</span>
								<span class="order_option_cnt"> <span
									class="order_option_input">1</span>
							</span> <span class="order_option_amounts"> <em>100</em>원
							</span></li>

						</ul> <!-- //옵션명 노출--></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">구매확정</li>

							<li class="mb5"><a
								onclick="delivery_view('202004052091881','4004654');"
								class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>


						</ul>
					</td>
				</tr>

			</tbody>
		</table>

		<!--주문상품-->

	</div>
</body>
</html>