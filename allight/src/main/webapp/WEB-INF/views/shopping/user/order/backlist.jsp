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
			//검색
			$("#searb").click(
					function() {
						var form = $("#searchF").serialize();
						$.ajax({
							url : "${pageContext.request.contextPath}/order/mypage/back.com?term=${param.term}",
							type : 'get',
							data : form,
							success : function(data) {
								location.href = "${pageContext.request.contextPath}/order/mypage/back.com?term=${param.term}&"
										+ form;
							},
							error : function(xhr, status) {
								alert(xhr + " : " + status);
							}
					});
			});
		})
</script>
</head>
<body>
	<div class="mem_right">
		<!--마이페이지 내용 영역-->
		<!--타이틀-->
		<div class="mem_top_wrap noto_sans">
			<div class="mem_top_new">
				<div class="mem_title">주문 취소/반품 조회</div>
			</div>

			<div class="searchDiv">
				<!-- 검색전 -->
				<c:if test="${empty param.type}">
					<form id="searchF">
						<select name="type" class="selectCss">
							<option value="cancel">주문 취소</option>
							<option value="back">반품</option>
						</select> <input type="button" id="searb" value="검색">
					</form>
				</c:if>
				<!-- 검색후 -->
				<c:if test="${!empty param.type}">
					<form id="searchF">
						<c:if test="${param.type eq 'cancel'}">
							<select name="type" class="selectCss">
								<option value="cancel" selected="selected">주문 취소</option>
								<option value="back">반품</option>
							</select>
						</c:if>
						<c:if test="${param.type eq 'back'}">
							<select name="type" class="selectCss">
								<option value="cancel">주문 취소</option>
								<option value="back" selected="selected">반품</option>
							</select>
						</c:if>
						<input type="button" id="searb" value="검색">
					</form>
				</c:if>
			</div>

			<div class="order_checkmn_wrap">
				<!--기간설정-->
				<ul class="order_checkmn">
					<li id="liw"><a href="?term=w" class="order_checkmn_a">1주일</a></li>
					<li id="lim1"><a href="?term=m1" class="order_checkmn_a">1개월</a></li>
					<li id="lim3"><a href="?term=m3" class="order_checkmn_a">3개월</a></li>
					<li class="order_checkmn_on" id="lim6"><a href="?term=m6"
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
				<c:if test="${ORDER.odto == null}">
					<tr>
						<td colspan="5" style="text-align: center;"><div
								class="listno_tab noto_sans">주문내역이 없습니다.</div></td>
					</tr>
				</c:if>
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
			<c:forEach items="${ORDER.odto}" var="odto">
				<thead>
					<tr>
						<th colspan="5" scope="col">
							<div>
								<strong>주문번호&nbsp;<a href="./detail.com?no=${odto.ono}"
									class="order_num"><em class="order_fcT1">${odto.ordernum}</em></a></strong><em
									class="fc999 fs12 ml13">(${odto.sodate})</em> <span
									class="order_r"><a href="./detail.com?no=${odto.ono}"
									class="order_btn_view">주문상세보기 &gt;</a></span>
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ORDER.oddto}" var="oddto">
						<c:if test="${odto.ono eq oddto.ono}">
							<tr class="last">
								<c:set var="done" value="false" />
								<c:forEach items="${ORDER.sdto}" var="sdto">
									<c:if test="${not done}">
										<c:if test="${sdto.ino eq oddto.ino}">
											<td class="order_thmb"><a href="#?"
												onclick="hitRecentLog('12189');"> <img alt="temp_thmb"
													src="${sdto.imgimage}" class="product-image"></a></td>
											<td class="order_info" colspan="3"><a class="order_deal"
												href="/goods/view.asp?g=12189"
												onclick="hitRecentLog('12189');">${sdto.iname}</a>
												<p class="order_deal_info">${sdto.idetail}</p> <!-- 옵션명 노출-->
												<ul class="order_option_area">

													<li><span class="order_option">${sdto.iprice} X
													</span> <span class="order_option_cnt"> <span
															class="order_option_input">${oddto.odamount} = </span>
													</span> <span class="order_option_amounts"> <em>${oddto.odprice}</em>원
													</span></li>

												</ul> <!-- //옵션명 노출--></td>
											<form id="frm">
												<input type="hidden" name="no" value="${oddto.odno}" /> <input
													type="hidden" name="type" id="type" />
											</form>
											<!-- 결제완료, 배송준비중 -->
											<td class="order_amount">
												<ul>
													<li class="order_pay_info qq-9">${oddto.ostatus}</li>
												</ul>
											</td>
											<c:set var="done" value="true" />
										</c:if>
									</c:if>
								</c:forEach>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>