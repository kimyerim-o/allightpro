<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/member/modify/admin.com?mno=${param.mno}"
		method="post">
		<table>
			<tr>
				<td>아이디 :</td>
				<td>${MEMINFO.mid}</td>
			</tr>
			<tr>
				<td>닉네임 :</td>
				<td>${MEMINFO.mnick}</td>
			</tr>
			<tr>
				<td>가입일 :</td>
				<td>${MEMINFO.mjoindate}</td>
			</tr>
			<tr>
				<td>최근접속일 :</td>
				<td>${MEMINFO.mlogdate}</td>
			</tr>
			<tr>
				<td>성별 :</td>
				<td>${MEMINFO.msex}</td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" id="mpw" name="mpw"
					value="${MEMINFO.mpw}" /></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" id="mname" name="mname"
					value="${MEMINFO.mname}" /></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" id="memail" name="memail"
					value="${MEMINFO.memail}" /></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" id="mtel" name="mtel"
					value="${MEMINFO.mtel}" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center"><input type="submit" value="수정"> <a
					href="<%=request.getContextPath()%>/member/admin.com"><input
						type="button" value="취소"></a></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>