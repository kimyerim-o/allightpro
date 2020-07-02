<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title/></title>
</head>

<body>
	<div id="wrap">
		<div class="wrap-left">
			<div class="left_menu">
				<p class="left_tit">
					<a href="">관리자</a>
				</p>
				<ul class="left_menu_box">
					<li class="left_menu_m1"><a href="#">회원/기업관리</a></li>
					<li class="on"><a href="#">회원관리</a></li>
					<li><a href="#">기업관리</a></li>
				</ul>

				<ul class="left_menu_box">
					<li class="left_menu_m1">칼로리 사전 관리</li>
					<li><a href="#">칼로리 사전 관리</a></li>
				</ul>

				<ul class="left_menu_box">
					<li class="left_menu_m1">커뮤니티 관리</li>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">문의사항</a></li>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">FAQ</a></li>
				</ul>

				<ul class="left_menu_box last">
					<li class="left_menu_m1">기업 문의 관리</li>
					<li><a href="#">기업 문의</a></li>
				</ul>
			</div>
		</div>

		<div class="wrap-right">
			<decorator:body />
		</div>

	</div>
</body>

</html>