<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head title="개인정보 수정 완료">
</head>
<body>
<form
		action="<%=request.getContextPath()%>/corporation/modify/corp.com"
		method="POST">
		
	<h2>개인정보 확인/수정</h2>
	<hr/>
	<table>
		<tr>
			<td>"개인정보 수정 완료!"</td>
		</tr>
		<tr class="center">
			<td>
				<input type="button" value="확인" onclick="location.href='http://localhost:9000/allight/main.com'">
				<input type="button" value="이전" onclick="location.href='http://localhost:9000/allight/mypage/member/modify.com'">
			</td>
			<a href="<%=request.getContextPath()%>/corporation/modify/corp.com?search=${param.search}&nowPage=${param.nowPage}&">
		</tr>
	</table>	
</body>
</html>