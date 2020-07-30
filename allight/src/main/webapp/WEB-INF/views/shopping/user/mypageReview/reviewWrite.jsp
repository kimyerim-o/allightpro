<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		//확인 버튼 클릭 시
		$("#ok").click(function(){
			confirm("리뷰를 등록하시겠습니까?");
			$("#form").submit();
		});
	})
</script>
</head>
<body>
<form id="form" action="${pageContext.request.contextPath}/order/reviewr.com" method="post">
<input type="hidden" name="ino" value="${ino}">
<input type="hidden" name="odno" value="${odno}">
	<div class="container">
		<div class="boardContent">
			<table>
				<tr>
					<td>별점</td>
					<td> <select name="rgrade" class="selectCss">
						<option value="5">★★★★★</option>
						<option value="4">★★★★☆</option>
						<option value="3">★★★☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="1">★☆☆☆☆</option>
					</select></td>
				</tr>
				<tr>
					<td>
					<textarea rows="12" cols="100" name="rcontent" required="required" placeholder="내용을 입력하세요"></textarea></div></td>
				</tr>
				<tr>
					<td class="board-content" ><input type="button" value="확인" class="btn" id="ok"></td>
				</tr>
			</table>
		</div>
	</div>
</form>
</body>
</html>