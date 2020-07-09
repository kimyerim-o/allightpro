<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function checkForm() {
		if (document.getElementById("search").value == "") {
			alert("검색어를 입력해주세요")
			return false;
		}
	}
	</script>
</head>
<body>
	<div class="container">
	<form id="sFrm" method="get"
		action="<%=request.getContextPath()%>/notice.com">
		<div class="searchDiv">
			<select name="type" class="selectCss">
				<option value="nall">제목+내용</option>
				<option value="ntitle">제목</option>
				<option value="ncontent">내용</option>
			</select> <input type="text" id="search" name="search" placeholder="검색어를 입력하세요"/> <input type="submit"
				value="검색" onclick="return checkForm();"/>
		</div>
		</form>
		<table class="table">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${LIST}" var="notice">
				<tr class="center">
					<td class="center">${notice.NNO}</td>
					<td class="center">${notice.NNICK}</td>
					<td class="center"><a
						href="${pageContext.request.contextPath}/noticedetail.com?type=${param.type}&search=${param.search}&nowPage=${PINFO.nowPage}&nno=${notice.NNO}">
							${notice.NTITLE}</a></td>
					<td class="center"><fmt:formatDate value="${notice.NDATE}" pattern="yyyy-MM-dd HH시 mm분"/></td>
					<td class="center">${notice.NHIT}</td>
				</tr>
			</c:forEach>
		</table>
		
		<c:if test = "${sessionScope.MID == 'admin'}">
		<div class="right">
			<a href="<%=request.getContextPath() %>/notice/write/admin.com" class="btn">글쓰기</a>
		</div>
		</c:if>

		<div class="center">
			<ul class="pagination">
				<li><c:if test="${PINFO.nowPage > 3}">
						<a
							href="${pageContext.request.contextPath}/notice.com?type=${param.type}&search=${param.search}&nowPage=${PINFO.nowPage-3}">«</a>
					</c:if> <c:if test="${PINFO.nowPage <= 3}">
						<a
							href="${pageContext.request.contextPath}/notice.com?type=${param.type}&search=${param.search}&nowPage=1">«</a>
					</c:if></li>
				<!-- 현재 페이지일때 active -->
				<c:forEach begin="${PINFO.startPage}" end="${PINFO.endPage}" var="i">
					<li id="li">
						<!-- 스크립트 적용해야 할것같아요 --> <a
						href="${pageContext.request.contextPath}/notice.com?type=${param.type}&search=${param.search}&nowPage=${i}">${i}</a>
					</li>
				</c:forEach>
				<li><c:if test="${PINFO.nowPage < PINFO.endPage-3}">
						<a
							href="${pageContext.request.contextPath}/notice.com?type=${param.type}&search=${param.search}&nowPage=${PINFO.nowPage+3}">»</a>
					</c:if> <c:if test="${PINFO.nowPage >= PINFO.endPage-2}">
						<a
							href="${pageContext.request.contextPath}/notice.com?type=${param.type}&search=${param.search}&nowPage=${PINFO.endPage}">»</a>
					</c:if></li>
			</ul>
		</div>
	</div>
</body>
</html>