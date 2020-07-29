<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
	$(function(){
		
	});
	</script>
</head>
<body>
	<form action="./bill.com" id="bill" method="post">
		<!--    결제 수단선택 영역 시작 -------------->
		<div class="order_detail mt80">
		<h3 class="order_detail_tit">결제 수단 선택</h3>
		<table class="tbl" border="1">
			<tbody>
			<tr class="last">
				<th>결제 수단</th>
				<td>
					<div class="order_del_sel">
						<input id="payment1" class="order_rdo" type="radio" checked="checked" value="2" name="paymentradio">
						<label style="margin-right:15px" class="order_selected" for="">카드 결제</label>
					
						<input id="payment2" class="order_rdo" type="radio" value="1" name="paymentradio">
						<label style="margin-right:15px" for="">휴대폰 결제</label>
						
						<input id="payment3" class="order_rdo" type="radio" value="10" name="paymentradio">
						<label for="">실시간 계좌이체</label>
												
						<input id="payment4" class="order_rdo" type="radio" value="10" name="paymentradio">
						<label for="">무통장입금</label>
						
						<input id="payment5" class="order_rdo" type="radio" value="10" name="paymentradio">
						<label for="">카카오페이</label>
					</div>
				</td>
			</tr>
			</tbody>
			</table>
		</div>
	</form>
</body>
</html>