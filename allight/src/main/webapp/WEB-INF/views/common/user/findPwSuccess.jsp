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
	<script src="${pageContext.request.contextPath}/memberjs/findPwSuccess.js"></script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	<hr />
	<table>
		<tr>
			<td>비밀번호 변경이 완료되었습니다</td>
		</tr>
		<tr class="center">
			<td>
				<button id="login" type="button" value="${pageContext.request.contextPath}/login.com">로그인</button>&nbsp;
				<button id="home" type="button" value="${pageContext.request.contextPath}/main.com">&nbsp;홈&nbsp;</button>
			</td>
		</tr>
	</table>
</body>
</html>