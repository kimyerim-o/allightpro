<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
<form action="./login" method="post">
	<table>
		<tr>
			<td><input type="text" id="id" name="id" placeholder="아이디" required="required"/></td>
		</tr>
		<tr></tr>
		<tr>
			<td><input type="password" id="pw" name="pw" placeholder="비밀번호" required="required"/></td>
		</tr>
		<!-- <tr>비밀번호를 입력하세요</tr> -->
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</body>
</html>