<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		if (document.getElementById("searchWord").value == "") {
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
	<h3>회원 상세 페이지</h3>

	<hr />
	<form id="sFrm" method="get" action="#">
		<table border="1" width="800" class="center">
			<tbody>
				<tr class="center">
					<td style="text-align: right"><input type="text"
						id="searchWord" placeholder="회원 아이디 검색" /> <input type="submit"
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
					<td><a href="#">${mem.MID}</a></td>
					<td>${mem.MNAME}</td>
					<td>${mem.MADDRESS}</td>
					<td>${mem.MJOINDATE}</td>
					<td><a href="<%=request.getContextPath()%>&mno=${mem.MNO}">
							<input type="button" id="modMem" value="수정">
					</a> <a href="<%=request.getContextPath()%>&mno=${mem.MNO}"> <input
							type="button" value="삭제" id="delMem"
							onclick="return checkDelete();"></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<%-- 페이징 처리 --%>
	<table border="1" width="800" class="center">
		<tbody>
			<tr class="center">
				<td><c:if test="${PINFO.nowPage eq 1}">
					</c:if> <c:if test="${PINFO.nowPage ne 1}">
						<a href="../member/admin.com?nowPage=${PINFO.nowPage-1}">[prev]</a>
					</c:if> <c:forEach var="pg" begin="${PINFO.startPage}"
						end="${PINFO.endPage}">
						<a href="../member/admin.com?nowPage=${pg}">[${pg}]</a>
					</c:forEach> <c:if test="${PINFO.nowPage eq PINFO.totalPage}">
					</c:if> <c:if test="${PINFO.nowPage ne PINFO.totalPage}">
						<a href="../member/admin.com?nowPage=${PINFO.nowPage+1}">[next]</a>
					</c:if></td>
			</tr>
		</tbody>
	</table>

</body>
</html>