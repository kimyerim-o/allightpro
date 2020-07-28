<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>상품주문</h3>
<hr/>
<form action="./buy.com" id="buy" method="post">
	<div class="customer">
		<h2 class="customer_info">구매자 정보</h2>
		<table class="customer_info">
			<tbody>
				<tr>
					<td class="customer_name">이름</td>
					<td >${sessionScope.MNAME }</td>
				</tr>
				<tr>
					<td class="customer_email">이메일</td>
					<td >${sessionScope.MEMAIL }</td>
				</tr>
				<tr>
					<td class="customer_tel">휴대폰 번호</td>
					<td >${sessionScope.MTEL }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="delivery_address">
		<h2 class="delivery_address_head">받는사람 정보</h2>
		<table class="receiver-info">
			<tbody>
				<tr>
					<td>이름</td>
					<td>${sessionScope.MNAME }</td>
				</tr>
				<tr>
					<td>배송주소</td>
					<td>${sessionScope.OADDRESS1 }</td>
				</tr>
				<tr>	
					<td>연락처</td>
					<td>${sessionScope.MTEL }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<div data-component="deliveryRequestMessage">
			<div class="delivery-requst-message-container">
				<table class="delivery_request_msg">
					<tbody>
						<tr>
							<th><span>배송 요청사항</span></th>
							<td>
								<span>택배함!!!!!!!!!!</span>
								<button type="button">변경</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
</form>
</body>
</html>