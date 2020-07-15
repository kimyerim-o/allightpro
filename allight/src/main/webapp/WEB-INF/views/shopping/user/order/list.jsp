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
	$(function(){
		//취소 버튼 클릭 시
		$(".cancel").click(function() {
			if (confirm("해당 상품을 주문 취소 하시겠습니까?")) {
				var odno = $(event.target).attr('data-no');
				var ostatus = "주문취소";
				var param = { "odno" : odno , "ostatus" : ostatus };
				alert(JSON.stringify(param));
				$.ajax({
					url : "${pageContext.request.contextPath}/order/change.com",
					type : 'post',
					data : param,
					success : function(data) {
						location.href = "${pageContext.request.contextPath}/order/list.com";
					},
					error : function(request,status,error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
			}
		});
		//반품 버튼 클릭 시
		$(".confirm").click(function() {
			if (confirm("해당 상품을 구매확정 하시겠습니까? 구매확정 후에는 주문 취소 및 반품을 할 수 없습니다.")) {
				var odno =  $(event.target).attr('data-no');
				var ostatus = "구매확정";
				var param = { "odno" : odno , "ostatus" : ostatus };
				alert(JSON.stringify(param));
				$.ajax({
					url : "${pageContext.request.contextPath}/order/change.com",
					type : 'post',
					data : param,
					success : function(data) {
						location.href = "${pageContext.request.contextPath}/order/list.com";
					},
					error : function(request,status,error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
			}
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
				<div class="mem_title">주문/배송 조회</div>
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
			<c:if test="${empty ORDER}">
				<div class="listno_tab noto_sans">주문내역이 없습니다.</div>
			</c:if>
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
						<c:set var="done" value="false"/>
							<c:forEach items="${ORDER.sdto}" var="sdto">
							<c:if test="${not done}">
							<c:if test="${sdto.ino eq oddto.ino}">
							<td class="order_thmb"><a href="#?"
								onclick="hitRecentLog('12189');"> <img alt="temp_thmb"
									src="${sdto.imgimage}" class="product-image"></a></td>
								<td class="order_info" colspan="3"><a class="order_deal"
									href="/goods/view.asp?g=12189" onclick="hitRecentLog('12189');">${sdto.iname}</a>
									<p class="order_deal_info">${sdto.idetail}</p> <!-- 옵션명 노출-->
									<ul class="order_option_area">

										<li><span class="order_option">${sdto.iprice} X </span>
										<span class="order_option_cnt"> <span class="order_option_input">${oddto.odamount} = </span>
										</span> <span class="order_option_amounts"> <em>${oddto.odprice}</em>원
										</span></li>

									</ul></td>
									<td class="order_amount">
									<c:if test="${oddto.ostatus eq '주문취소' or oddto.ostatus eq '반품'}">
										<li class="order_pay_info qq-9">${oddto.ostatus}</li>
									</c:if>
									<!-- 결제완료, 배송준비중 -->
										<c:if test="${oddto.ostatus eq '배송준비중' or oddto.ostatus eq '결제완료'}">
											<ul>
											<li class="order_pay_info qq-9">${oddto.ostatus}</li>
											<li class="mb5"><a class="cancel"
												class="order_btn_write" style="cursor: pointer;" data-no="${oddto.odno}">주문취소</a></li>
											</ul>
										</c:if>
									<!-- 배송시작, 배송완료 -->
									<c:if test="${oddto.ostatus eq '배송시작' or oddto.ostatus eq '배송완료'}">
											<ul>
												<li class="order_pay_info qq-9">${oddto.ostatus}</li>
		
												<li class="mb5"><a
													onclick="delivery_view('택배회사','송장번호');"
													class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>
		
												<li class="mb5"><a class="confirm"
													class="order_btn_write" style="cursor: pointer;" data-no="${oddto.odno}">구매확정</a></li>
											</ul>
									</c:if>	
									<!-- 구매확정 -->							
									<c:if test="${oddto.ostatus eq '구매확정'}">
											<ul>
												<li class="order_pay_info qq-9">${oddto.ostatus}</li>
		
												<li class="mb5"><a
													onclick="delivery_view('택배회사','송장번호');"
													class="order_btn_delcheck" style="cursor: pointer;">배송조회</a></li>
		
												<li class="mb5"><a
													href="mem_goods_review_write.asp?orderno=202004052091881&amp;g=12189&amp;vtab=O"
													class="order_btn_write" style="cursor: pointer;">상품 리뷰 쓰기</a></li>
											</ul>
									</c:if>
									</td>
									<c:set var="done" value="true"/>
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