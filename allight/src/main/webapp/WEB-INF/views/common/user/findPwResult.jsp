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
	<script src="${pageContext.request.contextPath}/memberjs/findPwResult.js"></script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	<hr />
	<form id="findPwResult" action="findPwResult.com" method="post">
		<table>
			<tr>
				<td>새로운 비밀번호를 입력하세요</td>
				<td><input type="hidden" name="mid" value="${mid}" /></td>
			</tr>
			<tr>
				<td><input id="mpw1" type="password" name="mpw1" placeholder="새로운 비밀번호" /></td>
			</tr>
			<tr>
				<td><input id="mpw2" type="password" name="mpw2" placeholder="비밀번호확인" /></td>
			</tr>
			<tr>
				<td>${fail}</td>
			</tr>
			<tr>
				<td class="center">
					<button id="pre" type="button" value="${pageContext.request.contextPath}/login.com">이전</button>&nbsp;
					<input id="next" type="submit" value="다음" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>