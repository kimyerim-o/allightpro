<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>All Light</title>

<style type="text/css">
.dataRow:hover{
	background: #eee;
	cursor: pointer;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	// 데이터의 한줄 클릭 이벤트 처리 -> 글보기로 이동
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		location="../detailview/admin.com?no=" + no;
	});
});
</script>
</head>
<body>




<div class="container">
<h1>상품 등록 리스트222</h1>
		<div class="searchDiv">
			<select name="search" class="selectCss">
				<option>제목</option>
				<option>내용</option>
			</select> <input type="text" name="content" /> 
			<input type="submit" value="검색" class="btn" />
		</div>
		<div align="left">
			<input type="button" value="상품추가" onClick="location.href='../insert/admin.com'">
		</div>
	

		
		<!-- 목록출력 -->
		<table class="table">
			<tbody>
				<tr>
					<th>상품번호</th>
					<th>이름</th>
		  			<th>카테고리</th>
					<th>가격</th>
					<th>기업명</th>
					<th>재고</th>
					
					
					<th>판매량</th>

				</tr>
				
				<c:forEach items="${LIST}" var="list">
				<tr class="dataRow">
					<td class="no">${list.ino}</td>
					<td>${list.iname}</td>
		  			<td>${list.icategory}</td>
					<td>${list.iprice}</td>
					<td>${list.icorp}</td>
					<td>${list.istock}</td>
					
					
					<td>${list.isellamount}</td>

				</tr>
				</c:forEach>
				
			
			</tbody>
		</table>
		
		
		<div class="center">
         <ul class="pagination">
            <li>
               <c:if test="${PINFO.nowPage > 3}">
                  <a href="${pageContext.request.contextPath}/item/list/admin.com?nowPage=${PINFO.nowPage-3}">«</a>
               </c:if>
               <c:if test="${PINFO.nowPage <= 3}">
                  <a href="${pageContext.request.contextPath}/item/list/admin.com?nowPage=1">«</a>
               </c:if>
            </li>
            <!-- 현재 페이지일때 active --> 
            <c:forEach begin="${PINFO.startPage}" end="${PINFO.endPage}" var="i">
               <li id="li"><!-- 스크립트 적용해야 할것같아요 -->
                  <a href="${pageContext.request.contextPath}/item/list/admin.com?nowPage=${i}">${i}</a>
               </li>
            </c:forEach>            
            <li>
               <c:if test="${PINFO.nowPage < PINFO.endPage-3}">
                  <a href="${pageContext.request.contextPath}/item/list/admin.com?nowPage=${PINFO.nowPage+3}">»</a>
               </c:if>
               <c:if test="${PINFO.nowPage >= PINFO.endPage-2}">
                  <a href="${pageContext.request.contextPath}/item/list/admin.com?nowPage=${PINFO.endPage}">»</a>
               </c:if>
            </li>
         </ul>
      </div>
		
	</div>


</body>

</html>