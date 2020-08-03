<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head title="탈퇴 화면">
</head>
<body>
<form
		action="<%=request.getContextPath()%>/corporation/modify/corp.com"
		method="POST">
		
	<h2>탈퇴</h2>
	<hr/>
	<table>
		<tr>
			<td>"탈퇴 실패!"</td>
		</tr>
		<tr class="center">
			<td>
				<input type="button" value="이전" onclick="location.href='http://localhost:9000/allight/mypage/member/delete.com'">
			</td>
			<a href="<%=request.getContextPath()%>/corporation/modify/corp.com?search=${param.search}&nowPage=${param.nowPage}&">
		</tr>
	</table>	
</body>
</html>