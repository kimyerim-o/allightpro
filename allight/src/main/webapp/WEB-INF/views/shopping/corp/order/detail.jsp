<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(
			function() {
				//목록 버튼 클릭 시
				$("#list").click(function() {
					$(location).attr("href","${pageContext.request.contextPath}/order/list/corp.com?nowPage=${NOW}");
				 });
				//변경
				$("#serb").click(function() {
					$("#statfrm").submit();
				});
				//택배
				$("#delib").click(function() {
					$("#delifrm").submit();
				});
			})
</script>
</head>
<body>
	<div class="mem_right">
		<div class="mem_top_wrap noto_sans">
			<div class="mem_top_new">
				<div class="mem_title">주문상세보기</div>
				<input type="button" value="목록" class="btn" id="list">
			</div>
			<div class="mem_order_checkmn_wrap_new">
				<p class="order_num_view_2">
					<em class="order_fcT2">주문번호 </em>${ORDER.odto1.ordernum}<em
						class="order_view_line"> l </em><em class="order_fcT2">주문일</em>
					${ORDER.odto1.odate}
				</p>
			</div>
		</div>

		<table class="order_tbl2 mt13 font_ng" cellspacing="0" border="1"
			summary="주문 리스트" style="width: 99%;">
			<colgroup>
				<col width="120">
				<col width="auto">
				<col width="140">
				<col width="200">
			</colgroup>
			<thead>
				<tr>
					<th class="order_amount" scope="col">상품정보</th>
					<th class="order_amount" scope="col">수량</th>
					<th class="order_amount" scope="col">주문 금액</th>
					<th class="order_amount" scope="col">진행 상태</th>
				</tr>
			</thead>
			<tbody>
				<tr class="last">
					<td class="order_thmb"><a href="#?"
						onclick="hitRecentLog('12189');"> <img alt="temp_thmb"
							src="${ORDER.sdto1.imgimage}" class="product-image"></a></td>
					<td class="order_info" colspan="2"><a class="order_deal"
						href="/goods/view.asp?g=12189" onclick="hitRecentLog('12189');">${ORDER.sdto1.iname}</a>
						<p class="order_deal_info">${ORDER.sdto1.idetail}</p> <!-- 옵션명 노출-->
						<ul class="order_option_area">

							<li><span class="order_option">${ORDER.sdto1.iprice}
									X </span> <span class="order_option_cnt"> <span
									class="order_option_input">${ORDER.oddto1.odamount} = </span>
							</span> <span class="order_option_amounts"> <em>${ORDER.oddto1.odprice}</em>원
							</span></li>

						</ul></td>
					<td class="order_amount">
						<ul>
							<li class="order_pay_info qq-9">${ORDER.oddto1.ostatus}</li>
							<li><form id="statfrm" action="${pageContext.request.contextPath}/order/change/corp.com">
									<input type="hidden" name="odno" value="${ORDER.oddto1.odno}">
									<input type="hidden" name="ino" value="${ORDER.oddto1.ino}">
									<select name="ostatus" class="selectCss">
										<option selected="selected">상태변경</option>
										<option value="배송준비중">배송준비중</option>
										<option value="배송시작">배송시작</option>
										<option value="배송완료">배송완료</option>
										<option value="주문취소">주문취소</option>
									</select> <input type="button" id="serb" value="변경" />
								</form></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>

		<!-- 주문자정보 -->
		<div class="order_detail mt60">
			<h3 class="order_detail_tit">주문자 정보</h3>
			<table class="tbl" cellspacing="0" border="1" summary="정보">
				<caption>정보</caption>
				<colgroup>
					<col width="140">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>보내는사람</th>
						<td>${ORDER.mdto1.mname}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${ORDER.mdto1.mtel}</td>
					</tr>
					<tr class="last">
						<th>Email</th>
						<td>${ORDER.mdto1.memail}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 배송지정보 -->
		<div class="order_detail mt60">
			<h3 class="order_detail_tit">배송지 정보</h3>
			<table class="tbl" cellspacing="0" border="1" summary="정보">
				<caption>정보</caption>
				<colgroup>
					<col width="140">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>받으실분</th>
						<td>${ORDER.odto1.oreceiver}</td>
					</tr>

					<tr>
						<th>배송지 주소</th>
						<td>(${ORDER.odto1.oaddno})${ORDER.odto1.oaddress1}&nbsp;${ORDER.odto1.oaddress2}</td>
					</tr>

					<tr>
						<th><span>연락처</span></th>
						<td>${ORDER.odto1.otel}</td>
					</tr>
					<tr>
						<th><span>배송요청사항</span></th>
						<td>${ORDER.odto1.orequirethings}</td>
					</tr>
					<form id="delifrm"
						action="${pageContext.request.contextPath}/order/delivery/corp.com">
						<tr>
							<input type="hidden" name="odno" value="${ORDER.oddto1.odno}">
							<td><span>택배회사</span></td>
							<td><input type="text" name="ocouriercompany" value="${ORDER.oddto1.ocouriercompany}"></td>
						</tr>
						<tr>
							<td><span>송장번호</span></td>
							<td><input type="text" name="oinvoicenumber" value="${ORDER.oddto1.oinvoicenumber}"> <input
								type="button" id="delib" value="확인"></td>
						</tr>
					</form>
				</tbody>
			</table>
		</div>

		<!-- 결제정보 -->
		<div class="order_detail mt60" id="div_cost_info">
			<h3 class="order_detail_tit">결제 정보</h3>
			<table class="tbl" cellspacing="0" border="1" summary="정보">
				<caption>정보</caption>
				<colgroup>
					<col width="140">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>결제 수단</th>
						<td>신용카드 () <span class="receipt"><a
								onclick="$.viewReceipt();" href="javascript:">영수증보기</a></span></td>
					</tr>
					<!--<tr>
							<th>카드번호</th>
							<td>
							472**********141 (00개월)
							</td>
						</tr>-->
					<tr>
						<th>승인일시</th>
						<td>2020-04-05 오후 10:17:32</td>
					</tr>

					<tr>
						<th>적립금</th>
						<td><strong class="fctah">130</strong>원</td>
					</tr>

				</tbody>
			</table>
		</div>

		<!-- 결제금액 -->
		<div class="order_calculate_area">
			<div class="order_deal_price">
				<div class="order_h_area">
					<strong>구매 금액</strong>
				</div>
				<div class="order_result_area">
					<em>${ORDER.odto1.sum}</em> <span class="won">원</span>
				</div>
			</div>

			<span class="order_minus">-</span>

			<div class="order_deal_dis">
				<div class="order_h_area">
					<strong><span>할인금액</span></strong>
				</div>
				<div class="order_result_area">
					<em><span>- 2,500</span></em> <span class="won">원</span>
				</div>
			</div>

			<span class="order_plus">+</span>

			<div class="order_deal_delivery">
				<div class="order_h_area">
					<strong>총 배송비</strong>
				</div>
				<div class="order_result_area">
					<em>+ 2,500</em> <span class="won">원</span>
				</div>
			</div>

			<span class="order_equal">=</span>

			<div class="order_deal_payment">
				<div class="order_h_area">
					<strong><span>총 결제 금액</span></strong>
				</div>
				<div class="order_result_area">
					<em><span>${ORDER.odto1.sum}</span></em> <span class="won"><span>원</span></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>