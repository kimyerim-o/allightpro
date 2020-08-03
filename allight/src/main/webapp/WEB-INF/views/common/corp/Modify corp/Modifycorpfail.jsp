<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head title="기업정보 수정 실패">
</head>
<body>
<form
		action="<%=request.getContextPath()%>/corporation/modify/corp.com"
		method="POST">
		
	<h2>기업정보 확인/수정</h2>
	<hr/>
	<table>
		<tr>
			<td>"기업정보 수정 실패!"</td>
		</tr>
		<tr class="center">
			<td>
				<input type="button" value="이전" onclick="location.href='http://localhost:9000/allight/corporation/modify/corp.com?cono=5'">
			</td>
			<a href="<%=request.getContextPath()%>/corporation/modify/corp.com?search=${param.search}&nowPage=${param.nowPage}&">
		</tr>
	</table>	
</body>
</html>