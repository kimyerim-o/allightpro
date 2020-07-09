<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form
		action="<%=request.getContextPath()%>/notice/modify/admin.com?nno=${param.nno}"
		method="POST">
		<table>
			<tr>
				<td>제목 :</td>
				<td><input type="text" id="ntitle" name="ntitle" value="${LIST.ntitle }"/></td>
			</tr>
			<tr>
				<td>내용 :</td>
				<td><textarea width="80%" height="50%" id="ncontent" name="ncontent" value="${LIST.ncontent }"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center"><input type="submit"
					value="완료"> <a
					href="<%=request.getContextPath()%>/notice.com"><input
						type="button" value="취소"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>