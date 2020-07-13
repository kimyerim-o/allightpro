<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){//안되요ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
		$('#li').click(function(){
			$('#li').addClass("active");
		});
	})
</script>
</head>
<body>
<form>
	<div class="container">
		<table class="table">
			<tr>
				<th>NO</th>
				<th width="70%">제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${LIST}" var="list">
				<tr>
					<td>${list.qno}</td>
					<td><a href="${pageContext.request.contextPath}/question/detail/corp.com?no=${list.qno}&nowPage=${PINFO.nowPage}">${list.qtitle}</a></td>
					<td>${list.qdate}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="right">
			<a class="btn" href="${pageContext.request.contextPath}/question/write/corp.com">글쓰기</a>
		</div>
	</div>
</form>
</body>
</html>