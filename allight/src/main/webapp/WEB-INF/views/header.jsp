<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>ALLIGHT - 다이어트 관리 홈페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    </head>
    
    
  <body>
  	<!-- login/join -->
	<div class="header-top">
        <div class="container">
            <div class="ht-right">
                <a href="./login.com" class="login-panel"><i class="fa fa-user"></i>Login</a>
                <a href="#" class="join-panel">join</a>
                <c:if test="${empty sessionScope.MID}">
	                <a href="./login.com" class="login-panel"><i class="fa fa-user"></i>Login</a>
	                <a href="#" class="join-panel">join</a>
	            </c:if>
            	<c:if test="${!empty sessionScope.MID}">
            		<a href="./logout.com" class="logined-panel">로그아웃</a>
            		<a href="#" class="logined-panel">장바구니()</a>
            		<a href="#" class="logined-panel">주문/배송조회</a>
            		<a href="#" class="logined-panel">마이페이지</a>
            		<a href="#" class="logined-nick-panel">${sessionScope.MNICK} 님</a>
            	</c:if>
            </div>
        </div>
    </div>
    
    <!-- logo -->
  	<div class="container">
  		<a href="#" target="_blank">
			<img src="${pageContext.request.contextPath}/resources/img/allight_logo.jpg" class="logo" onclick=""/>
		</a>
	</div>
	
	<!-- navigation bar -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid">
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav m-auto">
	        	<li class="nav-item active">
	        	<li class="nav-item"><a href="#" class="nav-link">다이어리</a></li>
	        	<li class="nav-item"><a href="#" class="nav-link">칼로리 사전</a></li>
	        	<li class="nav-item"><a href="#" class="nav-link">칼로리 처방</a></li>
	        	<li class="nav-item"><a href="#" class="nav-link">커뮤니티</a></li>
	        	<li class="nav-item"><a href="#" class="nav-link">쇼핑</a>
	        		<ul class="dropdown">
                        <li><a href="#">식단</a></li>
                        <li><a href="#">간식</a></li>
                        <li><a href="#">운동기구</a></li>
                        <li><a href="#">운동복</a></li>
                        <li><a href="#">브랜드관</a></li>
                    </ul>
	        	</li>
	        	<li class="nav-item"><a href="#" class="nav-link">마이페이지</a></li>
	        	<c:if test="">
	          		<li class="nav-item"><a href="#" class="nav-link">관리자</a></li>
	          	</c:if>
	        </ul>
	      </div>
	    </div>
    </nav>
    <hr/>
  </body>
</html>