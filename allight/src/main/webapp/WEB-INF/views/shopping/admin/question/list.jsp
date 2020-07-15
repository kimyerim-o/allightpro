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
		//검색
		$("#searb").click(function(){
			$("#searchF").submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="searchDiv">
			<form id="searchF" method="get" action="${pageContext.request.contextPath}/question/search/admin.com">
				<select name="type" class="selectCss">
					<option value="title">제목</option>
					<option value="id">작성자</option>
				</select>
				<div class="shopSearchDiv">
				    <input type="text" name="word" class="shopTxt" required="required"/>
				    <button type="button" id="searb" class="shopBtn">
				    	<img src="${pageContext.request.contextPath}/resources/img/search.png" class="shopSearchImg"/>
			    	</button>
		    	</div>
	    	</form>
		</div>
		<table class="table">
			<tr>
				<th>NO</th>
				<th width="60%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>댓글수</th>
			</tr>
			<c:forEach items="${LIST}" var="list">
				<tr>
					<td>${list.qno}</td>
					<td><a href="${pageContext.request.contextPath}/question/detail/admin.com?no=${list.qno}&nowPage=${PINFO.nowPage}">${list.qtitle}</a></td>
					<td>${list.qid}</td>
					<td>${list.qdate}</td>
					<td>${list.qcount}</td>
				</tr>
			</c:forEach>
		</table>

		<div class="center">
			<ul class="pagination">
				<li>
					<c:if test="${PINFO.nowPage > 3}">
						<a href="${pageContext.request.contextPath}/question/list/admin.com?nowPage=${PINFO.nowPage-3}">«</a>
					</c:if>
					<c:if test="${PINFO.nowPage <= 3}">
						<a href="${pageContext.request.contextPath}/question/list/admin.com?nowPage=1">«</a>
					</c:if>
				</li>
				<!-- 현재 페이지일때 active --> 
				<c:forEach begin="${PINFO.startPage}" end="${PINFO.endPage}" var="i">
					<li id="li"><!-- 스크립트 적용해야 할것같아요 -->
						<a href="${pageContext.request.contextPath}/question/list/admin.com?nowPage=${i}">${i}</a>
					</li>
				</c:forEach>				
				<li>
					<c:if test="${PINFO.nowPage < PINFO.endPage-3}">
						<a href="${pageContext.request.contextPath}/question/list/admin.com?nowPage=${PINFO.nowPage+3}">»</a>
					</c:if>
					<c:if test="${PINFO.nowPage >= PINFO.endPage-2}">
						<a href="${pageContext.request.contextPath}/question/list/admin.com?nowPage=${PINFO.endPage}">»</a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>