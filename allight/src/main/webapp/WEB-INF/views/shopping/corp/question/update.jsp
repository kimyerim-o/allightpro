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
		$("#update").click(function(){
			$("#form").attr("action","${pageContext.request.contextPath}/question/update/corp.com");
			$("#form").submit();
		});
		//목록 버튼 클릭 시
		$("#list").click(function(){
			$(location).attr("href","${pageContext.request.contextPath}/question/list/corp.com")
		});
		//취소 버튼 클릭 시
		$("#back").click(function(){
			$(location).attr("href","${pageContext.request.contextPath}/question/detail/corp.com?no=${DETAIL.qno}");
		});
	})
</script>
</head>
<body>
<form id="form" method="post">
	<div class="container">
		<!-- 검색창  -->
		<div class="boardContent">
			<div class="boardContent-buttons">
					<input type="button" value="목록" class="btn" id="list">
					<input type="hidden" value="${DETAIL.qno}" name="qno">
					<c:if test="${DETAIL.qid eq sessionScope.MID}">
					<input type="button" value="확인" class="btn" id="update">
					</c:if>
					<input type="button" value="취소" class="btn" id="back">
			</div>
			
			<!-- 테이블  -->
			<table>
				<tr>
					<td class="board-title">제목</td>
					<td class="board-title" colspan="3"><input type="search" value="${DETAIL.qtitle}" name="qtitle"></td>
				</tr>
				<tr>
					<td class="board-info"><a class="board-info-nick">작성자</a></td>
					<td class="board-info"><a class="board-info-nick">${DETAIL.qid}</a></td>
					<input type="hidden" value="${DETAIL.qid}" name="qid">
					<td class="board-info"><a class="board-info-others">수정일 </a></td>
					<td class="board-info"><a class="board-info-others"><input type="text" disabled="disabled" value="${sessionScope.DATE}" name="qdate"></a></td>
				</tr>
				<tr>
					<td class="board-content" colspan="4">
						<div class="board-content-div">내용 <br/><br/>
							<textarea rows="12" cols="100" name="qcontent" required="required" placeholder="내용을 입력하세요">${DETAIL.qcontent}</textarea></div></td>
				</tr>
			</table>
		</form>
			<!-- 댓글  -->
			<div class="boardContent-Comment">
				<div class="boardContent-Comment-input">
					<form action="#" method="post" style="text-align: left">
						<a colspan="100%" class="board-comment-info"><a class="board-info-nick">작성자${sessionScope.MID}</a>&nbsp;&nbsp; 
								<a class="board-info-others">작성일 ${sessionScope.DATE}</a></a>
						<input type="textarea" class="input" placeholder="댓글을 입력하세요" /> 
						<input type="submit" class="button" value="등록" />
					</form>
				</div>
		
				<div class="boardContent-Comment-comment"
					style="padding: 10px; font-size: 1.5rem;">
					댓글(<a style="color: #ff5656;">${DETAIL.qcount}개</a>)
				</div>
		
				<div class="boardContent-Comment-Table">
					<table width="100%" style="border-top: 1px solid gray;">
						<c:forEach items="${COMM}" var="c">
						<tr>
							<td colspan="100%" class="board-comment-info"><a class="board-info-nick">${c.qcid}</a>&nbsp;&nbsp; 
								<a class="board-info-others">작성일 ${c.qcdate}</a></td>
						</tr>
						<tr>
							<td width="80%">${c.qccontent}</td>
							<td style="padding: 0; text-align: center;">
								<c:if test="${c.qcid eq sessionScope.MID}"></c:if>
									<a href="#" style="color: #ff5656;">수정</a>
									<a href="#" style="color: #ff5656;">삭제</a>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>