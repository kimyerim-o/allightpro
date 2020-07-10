<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="mem_right">
		<!--마이페이지 내용 영역-->
		<!--타이틀-->
		<div class="mem_top_wrap noto_sans">
			<div class="mem_top_new">
				<div class="mem_title">주문/배송 조회</div>
			</div>

			<div class="order_checkmn_wrap">
				<!--기간설정-->
				<ul class="order_checkmn">
					<li id="liw"><a href="?term_type=w" class="order_checkmn_a">1주일</a></li>
					<li id="lim1"><a href="?term_type=m1" class="order_checkmn_a">1개월</a></li>
					<li id="lim3"><a href="?term_type=m3" class="order_checkmn_a">3개월</a></li>
					<li class="order_checkmn_on" id="lim6"><a href="?term_type=m6"
						class="order_checkmn_a">6개월</a></li>
				</ul>
			</div>
		</div>
		<!--//타이틀-->

		<table class="mem_tbl" cellspacing="0" border="1" summary="주문 리스트">
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
								class="fc999 fs12 ml13">(2020-04-05)</em> <span class="order_r"><a
								href="mem_order_detail_view.asp?orderno=202004052091881&amp;vtab=O"
								class="order_btn_view">주문상세보기 &gt;</a></span>
						</div>
					</th>
				</tr>
			</thead>

			<tbody>
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

			</tbody>
		</table>
	</div>
</body>
</html>