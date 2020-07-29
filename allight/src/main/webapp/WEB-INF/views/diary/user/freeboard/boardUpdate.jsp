<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		//확인 버튼 클릭 시
		$("#update")
				.click(
						function() {
							$("#form")
									.attr("action",
											"${pageContext.request.contextPath}/freeboard/update.com?no=${DETAIL.fno}");
							$("#form").submit();
						});
		//목록 버튼 클릭 시
		$("#list")
				.click(
						function() {
							$(location)
									.attr("href",
											"${pageContext.request.contextPath}/freeboard/list.com")
						});
		//취소 버튼 클릭 시
		$("#back")
				.click(
						function() {
							$(location)
									.attr("href",
											"${pageContext.request.contextPath}/freeboard/detail.com?no=${DETAIL.fno}");
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
					<input type="button" value="목록" class="btn" id="list"> <input
						type="hidden" value="${DETAIL.fno}" name="qno">
					<c:if test="${DETAIL.fid eq sessionScope.MID}">
						<input type="button" value="확인" class="btn" id="update">
					</c:if>
					<input type="button" value="취소" class="btn" id="back">
				</div>

				<!-- 테이블  -->
				<table>
					<tr>
						<td class="board-title">제목</td>
						<td class="board-title" colspan="3"><input type="search"
							value="${DETAIL.qtitle}" name="qtitle"></td>
					</tr>
					<tr>
						<td class="board-info"><a class="board-info-nick">작성자</a></td>
						<td class="board-info"><a class="board-info-nick">${DETAIL.fid}</a></td>
						<input type="hidden" value="${DETAIL.fid}" name="qid">
						<td class="board-info"><a class="board-info-others">수정일 </a></td>
						<td class="board-info"><a class="board-info-others"><input
								type="text" disabled="disabled" value="${sessionScope.DATE}"
								name="qdate"></a></td>
					</tr>
					<tr>
						<td class="board-content" colspan="4">
							<div class="board-content-div">
								내용 <br />
								<br />
								<textarea rows="12" cols="100" name="qcontent"
									required="required" placeholder="내용을 입력하세요">${DETAIL.fcontent}</textarea>
							</div>
						</td>
					</tr>
					<tr>
	 				<th>첨부파일</th>
	 				<td><input type="file" name="files" id="files"/></td>
	 			</tr>
	 			<tr id="copy">
	 				<td colspan="2"><input type="button" value="글쓰기" class="btn" id="ok"></td>
	 			</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>