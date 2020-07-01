<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원 상세 페이지</h3>

	<hr/>
	<%-- 검색부분 --%>
	<form id="sFrm" method="get" action="#">
		<table border="1" width="800" class="center">
			<tbody>
				<tr class="center">
					<td>
						<%-- 검색대상 --%>
						<%-- 검색키워드 --%>
						<input type="text" name="word" id="word" required="required" value="회원 아이디 검색"/>
						<input type="submit" value="검 색"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<%-- 목록 출력 --%>
	<table border="1" width="800" class="center">
		<tbody>
			<tr>
				<th>번호</th>
				<th width="220">아이디</th>
				<th width="160">이름</th>
				<th>주소</th>
				<th width="150">가입일</th>
			</tr>
			<%-- 반복문을 이용하여 줄출력 예정 --%>
			<c:forEach  items="${memberList}" var="dto">
				<tr>
					<td>${dto.no}</td>
					<td width="220"><a href="#">${dto.id}</a></td>
					<td width="160">${dto.name}</td>
					<td>${dto.address}</td>
					<td width="150">${dto.joindate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>		
	
	<%-- 페이징 처리 --%>
	<table border="1" width="800" class="center">
		<tbody>
			<tr class="center">
				<td>
					<c:if test="${PINFO.nowPage eq 1}">
					[prev] 
					</c:if>
				
					<c:if test="${PINFO.nowPage ne 1}">
					<a href="../fileBoard/listView.co?nowPage=${PINFO.nowPage-1}">[prev]</a> 
					</c:if>
					
					<c:forEach var="pg"	 begin="${PINFO.startPage}" end="${PINFO.endPage}">
					<a href="../fileBoard/listView.co?nowPage=${pg}">[${pg}]</a> 
					</c:forEach>
					
					<c:if test="${PINFO.nowPage eq PINFO.totalPage}">
					[next]
					</c:if>
					
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
					<a href="../fileBoard/listView.co?nowPage=${PINFO.nowPage+1}">[next]</a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	
	
	<%-- 기타 기능 : 글쓰기 --%>
	<table border="1" width="800" class="center">
		<tbody>
			<tr class="center">
				<td><input type="button" id="wBtn" value="글쓰기"/></td>
			</tr>
		</tbody>
	</table>
</body>
</html>