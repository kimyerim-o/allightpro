<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//작성 버튼 클릭 시
	$("#up").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/mypage/review/write.com?no=${list.INO}");
	});
	//삭제 버튼 클릭 시
	$("#del").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			$("#form").attr("action","${pageContext.request.contextPath}/mypage/review/delete.com?no=${list.INO}");
			$("#form").submit();
		}
	});
})
</script>
</head>
<body>
	<div class="container">
		<table class="table">
			<tr>
				<th>NO</th>
				<th width="70%">상품명</th>
				<th>리뷰작성일</th>
				<th>별점</th>
				<th>리뷰내용</th>
				<th></th>
			</tr>
			<c:forEach items="${LIST}" var="list">
				<tr>
					<td>${list.NUM}</td>
					<td>${list.INAME}</td>
					<td>${list.RDATE}</td>
					<td>${list.RGRADE}</td>
					<td>${list.RCONTENT}</td>
					<td><a href="${pageContext.request.contextPath}/mypage/review/write.com?nowPage=${param.nowPage}&no=${list.INO}">
					<input type="button" id="wbtn" name="wbtn" value="리뷰 작성">
					</a>
					<a href="${pageContext.request.contextPath}/mypage/review/update.com?nowPage=${param.nowPage}&no=${list.INO}">
					<input type="button" id="wbtn" name="ubtn" value="리뷰 수정">
					</a>
					<a href="${pageContext.request.contextPath}/mypage/review/delete.com?nowPage=${param.nowPage}&no=${list.INO}">
					<input type="button" id="dbtn" name="dbtn" value="리뷰 삭제"></a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="center">
			<ul class="pagination">
				<li>
					<c:if test="${PINFO.nowPage > 3}">
						<a href="${pageContext.request.contextPath}/mypage/review/list.com?nowPage=${PINFO.nowPage-3}">«</a>
					</c:if>
					<c:if test="${PINFO.nowPage <= 3}">
						<a href="${pageContext.request.contextPath}/mypage/review/list.com?nowPage=1">«</a>
					</c:if>
				</li>
				<!-- 현재 페이지일때 active --> 
				<c:forEach begin="${PINFO.startPage}" end="${PINFO.endPage}" var="i">
					<li id="li"><!-- 스크립트 적용해야 할것같아요 -->
						<a href="${pageContext.request.contextPath}/mypage/review/list.com?nowPage=${i}">${i}</a>
					</li>
				</c:forEach>				
				<li>
					<c:if test="${PINFO.nowPage < PINFO.endPage-3}">
						<a href="${pageContext.request.contextPath}/mypage/review/list.com?nowPage=${PINFO.nowPage+3}">»</a>
					</c:if>
					<c:if test="${PINFO.nowPage >= PINFO.endPage-3}">
						<a href="${pageContext.request.contextPath}/mypage/review/list.com?nowPage=${PINFO.endPage}">»</a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>