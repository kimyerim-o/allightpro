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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style2.css">
    </head>
    
    
  <body>
  	<!-- login/join -->
	<div class="header-top">
        <div class="container">
            <div class="ht-right">
                <a href="#" class="login-panel"><i class="fa fa-user"></i>Login</a>
                <a href="#" class="join-panel">join</a>
            </div>
        </div>
    </div>
    
    <!-- logo -->
  	<div class="container">
		<img src="${pageContext.request.contextPath}/resources/img/allight_logo.jpg" class="logo"/>
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
	        	<li class="nav-item"><a href="#" class="nav-link">쇼핑</a></li>
	        	<li class="nav-item"><a href="#" class="nav-link">마이페이지</a></li>
	          	<li class="nav-item"><a href="#" class="nav-link">관리자</a></li>
	        </ul>
	      </div>
	    </div>
    </nav>
    <hr/>
  </body>
</html>