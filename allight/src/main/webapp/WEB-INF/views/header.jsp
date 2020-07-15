<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<title>ALLIGHT - 다이어트 관리 홈페이지</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/shopping.css">
<!-- 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    -->
</head>

<body>
   <!-------------------- header -------------------->
   <!-- login/join -->
   <div class="header-top">
      <div class="container">
         <div class="ht-right">
            <c:if test="${empty sessionScope.COID and empty sessionScope.MID}">
               <a href="${pageContext.request.contextPath}/login.com" class="login-panel"><i class="fa fa-user"></i>Login</a>
               <a href="#" class="join-panel">join</a>
            </c:if>
            <c:if test="${!empty sessionScope.MID}">
               <a href="${pageContext.request.contextPath}/logout.com" class="logined-panel">로그아웃</a>
               <a href="#" class="logined-panel">장바구니()</a>
               <a href="${pageContext.request.contextPath}/order/list.com" class="logined-panel">주문/배송조회</a>
               <a href="#" class="logined-panel">마이페이지</a>
               <a href="#" class="logined-nick-panel">${sessionScope.MID} 님</a>
            </c:if>
            <c:if test="${!empty sessionScope.COID}">
               <a href="${pageContext.request.contextPath}/corlogout.com" class="logined-panel">로그아웃</a>
               <a href="#" class="logined-nick-panel">${sessionScope.COID} 님</a>
            </c:if>
         </div>
      </div>
   </div>

   <!-- logo -->
   <div class="container">
      <a href="${pageContext.request.contextPath}/main.com"> 
         <img src="${pageContext.request.contextPath}/resources/img/allight_logo.jpg"
         class="logo" onclick="" />
      </a>
   </div>

   <!-- navigation bar -->
   <nav
      class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
      id="ftco-navbar">
      <div class="container-fluid">
         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav m-auto">
               <li class="nav-item active">
               <li class="nav-item"><a href="${pageContext.request.contextPath}/main.com" class="nav-link">다이어리</a></li>
               <li class="nav-item"><a href="#" class="nav-link">칼로리 사전</a></li>
               <li class="nav-item"><a href="#" class="nav-link">칼로리 처방</a></li>
               <li class="nav-item"><a href="#" class="nav-link">커뮤니티</a></li>
               <li class="nav-item"><a href="${pageContext.request.contextPath}/shopping/list.com" class="nav-link">쇼핑</a>
	        		<ul class="dropdown">
                        <li><a href="${pageContext.request.contextPath}/shopping/list.com?icategory=식단">식단</a></li>
                        <li><a href="${pageContext.request.contextPath}/shopping/list.com?icategory=간식">간식</a></li>
                        <li><a href="${pageContext.request.contextPath}/shopping/list.com?icategory=운동복">운동복</a></li>
                        <li><a href="${pageContext.request.contextPath}/shopping/list.com?icategory=기타">기타</a></li>
                        <li><a href="${pageContext.request.contextPath}/shopping/brand.com">브랜드관</a></li>
                    </ul>
	        	</li>
               <!-- 회원 로그인시  -->
               <c:if test="${sessionScope.MTYPE eq 0 }"></c:if>
               <li class="nav-item"><a href="#" class="nav-link">마이페이지</a>
                  <ul class="dropdown">
                     <li><a href="${pageContext.request.contextPath}/order/list.com">주문/배송조회</a></li>
                     <li><a href="${pageContext.request.contextPath}/order/back.com">취소/반품조회</a></li>
                     <li><a href="#">장바구니</a></li>
                     <li><a href="#">배송지 관리</a></li>
                     <li><a href="#">상품 문의</a></li>
                     <li><a href="#">내 정보</a></li>
                  </ul></li>

               <!-- 기업 로그인시   -->
               <c:if test="${sessionScope.MTYPE eq 1 }"></c:if>
               <li class="nav-item"><a href="#" class="nav-link">기업</a>
                  <ul class="dropdown">
                     <li><a href="${pageContext.request.contextPath}/order/list/corp.com">주문 관리</a></li>
                     <li><a href="#">상품 관리</a></li>
                     <li><a href="#">상품리뷰/문의</a></li>
                     <li><a href="#">기업 정보 관리</a></li>
                     <li><a href="${pageContext.request.contextPath}/question/list/corp.com">문의사항</a></li>
                  </ul></li>

               <!-- 관리자 로그인시   -->
               <c:if test="${sessionScope.MTYPE eq null}"></c:if>
               <li class="nav-item"><a href="${pageContext.request.contextPath}/admin.com" class="nav-link">관리자</a>
                  <ul class="dropdown">
                     <li><a href="${pageContext.request.contextPath}/admin.com">기업/회원 관리</a></li>
                     <li><a href="${pageContext.request.contextPath}/question/list/admin.com">기업 문의 관리</a></li>
                     <li><a href="#">커뮤니티 관리</a></li>
                     <li><a href="#">칼로리 사전 관리</a></li>
                  </ul></li>
            </ul>
         </div>
      </div>
   </nav>
   <hr/>
</body>
</html>