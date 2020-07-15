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
	<script src="${pageContext.request.contextPath}/memberjs/findPwEmail.js"></script>
</head>
<body>
	<h2>비밀번호 찾기 </h2>
	<hr />
	<form action="findPwEmail.com" method="post">
		<table>
			<tr>
				<td>인증번호를 발송하고 수신한 인증번호를 입력하세요</td>
			</tr>
			<tr>
				<td>${MEM.memail}</td>
			</tr>
			<tr>
				<td><input type="button" id="sendMail" value="인증번호 발송" /></td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="mid" name="mid" value="${mid}" />
					<input type="hidden" id="memail" name="memail" value="${memail}" />
					<input type="hidden" id="authCode" name="authCode" value="${authCode}" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="authCodeCheck" name="authCodeCheck" value="" placeholder="인증번호를 입력하세요" />
				</td>
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