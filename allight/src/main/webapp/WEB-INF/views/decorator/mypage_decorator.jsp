<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<decorator:head/>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div id="wrap">
	<div class="wrap-left">
		<div class="left_menu">
			<p class="left_tit">
				<a href="">마이페이지</a>
			</p>
			<ul class="left_menu_box">
				<li class="left_menu_m1">주문관리</li>
				<li class="on"><a href="#">주문/배송조회</a></li>
				<li><a href="#">취소/반품조회</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/cart.com">장바구니</a></li>
			</ul>

			<ul class="left_menu_box">
				<li class="left_menu_m1">활동관리</li>
				<li><a href="#">상품 문의</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/review/list.com">상품 리뷰</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/freeboard/list.com">자유게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/question/list.com">문의사항</a></li>
			</ul>

			<ul class="left_menu_box last">
				<li class="left_menu_m1">정보관리</li>
				<li><a href="${pageContext.request.contextPath}/mypage/member/modify.com">개인정보 확인/수정</a></li>
				<li><a href="${pageContext.request.contextPath}/member/mypage/address.com">배송지 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/member/delete.com">회원탈퇴</a></li>
			</ul>
		</div>
	</div>

	<div class="wrap-right">
		<decorator:body />
	</div>

</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
