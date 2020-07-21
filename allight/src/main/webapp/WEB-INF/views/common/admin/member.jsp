<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	System.out.println("member.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function checkForm() {
		if (document.getElementById("search").value == "") {
			alert("검색어를 입력해주세요")
			return false;
		}
	}
	function checkDelete() {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			document.sFrm.submit();
		} else { //취소
			return false;
		}
	}
</script>
</head>
<body>
	<h3>회원 페이지</h3>

	<hr />
	<form id="sFrm" method="get"
		action="<%=request.getContextPath()%>/member/admin.com">
		<table border="1" width="800" class="center">
			<tbody>
				<tr class="center">
					<td style="text-align: right"><input type="text" id="search"
						name="search" placeholder="회원 아이디 검색" /> <input type="submit"
						value="검 색" onclick="return checkForm();" /></td>
				</tr>
			</tbody>
		</table>
	</form>

	<%-- 목록 출력 --%>
	<table border="1" width="800" class="center">
		<tbody>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>주소</th>
				<th>가입일</th>
				<th></th>
			</tr>
			<%-- 반복문을 이용하여 줄출력 예정 --%>
			<c:forEach items="${LIST}" var="mem">
				<tr>
					<td>${mem.MID}<c:if test="${mem.MTYPE==1}"><h5 style="display: inline;"> (관리자)</h5></c:if></td>
					<td>${mem.MNAME}</td>
					<td>${mem.MADDRESS}</td>
					<td><fmt:formatDate value="${mem.MJOINDATE}" pattern="yyyy-MM-dd"/></td>
					<td><a
						href="<%=request.getContextPath()%>/member/modify/admin.com?search=${param.search}&nowPage=${param.nowPage}&mno=${mem.MNO}">
							<input type="button" id="modMem" value="수정">
					</a> <a
						href="<%=request.getContextPath()%>/member/delete/admin.com?search=${param.search}&nowPage=${param.nowPage}&mno=${mem.MNO}">
							<input type="button" value="삭제" id="delMem"
							onclick="return checkDelete();">
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<%-- 페이징 처리 --%>
	<table border="1" width="800" class="center">
		<tbody>
			<tr class="center">
				<td>
					<div class="center">
						<ul class="pagination">
							<li><c:if test="${PINFO.nowPage > 3}">
									<a
										href="${pageContext.request.contextPath}/member/admin.com?search=${param.search}&nowPage=${PINFO.nowPage-3}">«</a>
								</c:if> <c:if test="${PINFO.nowPage <= 3}">
									<a
										href="${pageContext.request.contextPath}/member/admin.com?search=${param.search}&nowPage=1">«</a>
								</c:if></li>
							<c:forEach begin="${PINFO.startPage}" end="${PINFO.endPage}"
								var="pg">
								<li id="li">
									<!-- 스크립트 적용해야 할것같아요 --> <a
									href="${pageContext.request.contextPath}/member/admin.com?search=${param.search}&nowPage=${pg}">${pg}</a>
								</li>
							</c:forEach>
							<li><c:if test="${PINFO.nowPage < PAGEINFO.endPage-3}">
									<a
										href="${pageContext.request.contextPath}/member/admin.com?search=${param.search}&nowPage=${PINFO.nowPage+3}">»</a>
								</c:if> <c:if test="${PINFO.nowPage >= PAGEINFO.endPage-2}">
									<a
										href="${pageContext.request.contextPath}/member/admin.com?search=${param.search}&nowPage=${PINFO.endPage}">»</a>
								</c:if></li>
						</ul>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

</body>
</html>