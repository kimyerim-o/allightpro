<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		//취소 버튼 클릭 시
		$(".cancel").click(function() {
			if (confirm("해당 상품을 주문 취소 하시겠습니까?")) {
				var odno = $(event.target).attr('data-no');
				var ostatus = "주문취소";
				var param = { "odno" : odno , "ostatus" : ostatus };
				//alert(JSON.stringify(param));
				$.ajax({
					url : "${pageContext.request.contextPath}/order/mypage/check.com",
					type : 'post',
					data : param,
					success : function(data) {
						location.href = "${pageContext.request.contextPath}/order/mypage/check.com?odno="+odno+"&ostatus="+ostatus
					},
					error : function(request,status,error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
			}
		});
		//반품 버튼 클릭 시
		$(".back").click(function() {
			if (confirm("해당 상품을 반품 하시겠습니까?")) {
				var odno = $(event.target).attr('data-no');
				var ostatus = "반품";
				var param = { "odno" : odno , "ostatus" : ostatus };
				//alert(JSON.stringify(param));
				$.ajax({
					url : "${pageContext.request.contextPath}/order/mypage/check.com",
					type : 'post',
					data : param,
					success : function(data) {
						location.href = "${pageContext.request.contextPath}/order/mypage/check.com?odno="+odno+"&ostatus="+ostatus
					},
					error : function(request,status,error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
			}
		});
		//구매확정 버튼 클릭 시
		$(".confirm").click(function() {
			if (confirm("해당 상품을 구매확정 하시겠습니까? \n 구매확정 후에는 주문 취소 및 반품을 할 수 없습니다.")) {
				var odno =  $(event.target).attr('data-no');
				var ostatus = "구매확정";
				var param = { "odno" : odno , "ostatus" : ostatus };
				$.ajax({
					url : "${pageContext.request.contextPath}/order/change.com",
					type : 'post',
					data : param,
					success : function(data) {
						location.href = "${pageContext.request.contextPath}/order/mypage/detail.com?no=${ORDER.odto1.ono}"
					},
					error : function(request,status,error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
			}
		});

	})
	function delivery_view(com,tel) {
		var $target = $(event.target);
		var com = com;
		var tel = tel;
		alert("com"+com+"tel"+tel);
		$('#order_pop_wrap').css('display', 'block');
		$('#com').text(com);
		$('#tel').text(tel);
	}
	function delivery_layer_view() {
		var $target = $(event.target);
		$target.closest('td').attr('class', 'hidden');
		$target.closest('td').next('td').attr('class', 'show');
	}
	
	function wrapCreateByMask() {
		   // 화면의 높이와 너비를 구한다.
		   var maskHeight = $(document).height();
		   var maskWidth = $(window).width();

		   // 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		   $('#mask_create').css({
		      'width' : maskWidth,
		      'height' : maskHeight
		   });

		   $('#mask_create').fadeTo("slow", 1);

		   $('.create_modal').show();
		};

		$(function() {
		   //검은 막 띄우기
		   //기본 모달창
		   $('.openMask_create').click(function(e) {
		      //클릭 시 이벤트
		      console.log("모달 켭니다.");
		      e.preventDefault();
		      wrapCreateByMask();
		      $('body').css("overflow", "hidden");
		   });

		   //닫기 버튼을 눌렀을 때
		   $('.create_modal .close').click(function(e) {
		      //링크 기본동작은 작동하지 않도록 한다.
		      e.preventDefault();
		      $('#mask_create, .create_modal').hide();
		      $('body').css("overflow", "scroll");
		   });

		   //검은 막을 눌렀을 때
		   $('#mask_create').click(function() {
		      $(this).hide();
		      $('.create_modal').hide();
		      $('body').css("overflow", "scroll");
		   });

		});
</script>
</head>
<body>
<!--  어두워지는 부분 -->
<div id="mask_create"></div>
<!--  모달 부분 -->
<div class="create_modal">

<div class="bottom">
	<!-- 배송 팝업 -->
	<div id="order_pop_wrap" class="order_pop_wrap" style="display: none;">
		<div class="order_pop_bg">
			<div class="order_pop_box2">
				<div id="delivery_info_view" class="order_detail">
					<table class="tbl" cellspacing="0" border="1" summary="정보">
						 
						<colgroup>
							<col width="120">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>택배회사</th>
								<td><strong id="com"></strong></td>
							</tr>
							<tr class="last">
								<th>송장번호</th>
								<td><em class="order_fcT2" id="tel"></em></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="center">
					<a onclick="delivery_layer_view();" class="close"
						style="cursor: pointer;">닫기</a>
				</p>
			</div>
		</div>
	</div>
</div>
</div>

	<div class="mem_right">
		<div class="mem_top_wrap noto_sans">
			<div class="mem_top_new">
				<div class="mem_title">주문상세보기</div>
			</div>
			<div class="mem_order_checkmn_wrap_new">
				<p class="order_num_view_2">
					<em class="order_fcT2">주문번호 </em>${ORDER.odto1.ordernum}<em
						class="order_view_line">l</em><em class="order_fcT2">주문일</em>
					${ORDER.odto1.sodate}
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
				<c:forEach items="${ORDER.oddto}" var="oddto">
					<tr class="last">
						<c:set var="done" value="false" />
						<c:forEach items="${ORDER.sdto}" var="sdto">
							<c:if test="${not done}">
								<c:if test="${sdto.ino eq oddto.ino}">
									<td class="order_thmb"><a href="#?"
										onclick="hitRecentLog('12189');"> <img alt="temp_thmb"
											src="${sdto.imgimage}" class="product-image"></a></td>
									<td class="order_info" colspan="2"><a class="order_deal"
										href="/goods/view.asp?g=12189"
										onclick="hitRecentLog('12189');">${sdto.iname}</a>
										<p class="order_deal_info">${sdto.idetail}</p> <!-- 옵션명 노출-->
										<ul class="order_option_area">

											<li><span class="order_option">${sdto.iprice} X </span>
												<span class="order_option_cnt"> <span
													class="order_option_input">${oddto.odamount} = </span>
											</span> <span class="order_option_amounts"> <em>${oddto.odprice}</em>원
											</span></li>
										</ul></td>
									<td class="order_amount">
									<!-- 결제완료, 배송준비중 -->
									<c:if test="${oddto.ostatus eq '배송준비중' or oddto.ostatus eq '결제완료'}">
											<ul>
												<li class="order_pay_info qq-9">${oddto.ostatus}</li>
												<li class="mb5"><a class="cancel" class="order_btn_write"
													style="cursor: pointer;" data-no="${oddto.odno}" >주문취소</a></li>
											</ul>
										</c:if> <!-- 배송시작, 배송완료 --> <c:if
											test="${oddto.ostatus eq '배송시작' or oddto.ostatus eq '배송완료'}">
											<ul>
												<li class="order_pay_info qq-9">${oddto.ostatus}</li>

												<li class="mb5"><a onclick="delivery_view('${oddto.ocouriercompany}','${oddto.oinvoicenumber}');"
															class="openMask_create" style="cursor: pointer;">배송조회</a></li>

												<li class="mb5"><a class="confirm" class="order_btn_write"
													style="cursor: pointer;" data-no="${oddto.odno}">구매확정</a></li>
												
												<li class="mb5"><a class="back" class="order_btn_write"
													style="cursor: pointer;" data-no="${oddto.odno}" >반품</a></li>
											</ul>
										</c:if> 
										<!-- 구매확정 --> 
										<c:if test="${oddto.ostatus eq '구매확정'}">
											<ul>
												<li class="order_pay_info qq-9">${oddto.ostatus}</li>

												<li class="mb5"><a onclick="delivery_view('${oddto.ocouriercompany}','${oddto.oinvoicenumber}');"
															class="openMask_create" style="cursor: pointer;">배송조회</a></li>

												<c:if test="${oddto.okreview ==0}">
													<li class="mb5"><a
														href="review.com?no=${sdto.ino}&num=${oddto.odno}"
														class="order_btn_write" style="cursor: pointer;">상품 리뷰 쓰기</a></li>
												</c:if>
											</ul>
										</c:if> <c:if
											test="${oddto.ostatus eq '주문취소' or oddto.ostatus eq '반품'}">
											<li class="order_pay_info qq-9">${oddto.ostatus}</li>
										</c:if></td>
									<c:set var="done" value="true" />
								</c:if>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 주문자정보 -->
		<div class="order_detail mt60">
			<h2>정보</h2>
			<h3 class="order_detail_tit">주문자 정보</h3>
			<table class="tbl" cellspacing="0" border="1" summary="정보">
				 
				<colgroup>
					<col width="140">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>보내는분</th>
						<td>${sessionScope.MNAME}</td>
					</tr>
					<tr class="last">
						<th>연락처</th>
						<td>${sessionScope.MTEL}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 배송지정보 -->
		<div class="order_detail mt60">
			<h2>정보</h2>
			<h3 class="order_detail_tit">배송지 정보</h3>
			<table class="tbl" cellspacing="0" border="1" summary="정보">
				 
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
					<tr class="last">
						<th><span>배송요청사항</span></th>
						<td>${ORDER.odto1.orequirethings}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 결제정보 -->
		<div class="order_detail mt60" id="div_cost_info">
			<h2>정보</h2>
			<h3 class="order_detail_tit">결제 정보</h3>
			<table class="tbl" cellspacing="0" border="1" summary="정보">
				 
				<colgroup>
					<col width="140">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>결제 수단</th>
						<td>${ORDER.odto1.opayment}</span></td>
					</tr>
					<tr>
						<th>승인일시</th>
						<td>${ORDER.odto1.odate}</td>
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
					<em>${ORDER.odto1.osum}</em> <span class="won">원</span>
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
					<em><span>${ORDER.odto1.osum}</span></em> <span class="won"><span>원</span></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>