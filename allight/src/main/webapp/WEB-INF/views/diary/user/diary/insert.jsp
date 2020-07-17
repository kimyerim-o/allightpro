<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
<form action="" class="diary-div">

	<div class="title2">다이어리</div>
	
	<div class="title3">몸무게
		<a><input type="text"/>kg</a>
	</div>
	
	<div class="title3">음식
		<input type="button" value="추가" />
	</div>
	<table>
		<tr>
			<th>구분</th>
			<th>이름</th>
			<th>수량</th>
			<th>칼로리</th>
			<th></th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<div>총 섭취 칼로리 <a>kcal</a></div>
	
	<div class="title3">운동
		<input type="button" value="추가" />
	</div>
	<table>
		<tr>
			<th>이름</th>
			<th>시간</th>
			<th>칼로리</th>
			<th></th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<div>총 소비 칼로리 <a>kcal</a></div>
	
	<div class="title3">일기</div>
	<input type="textarea" placeholder="내용을 입력해주세요"/>
	
	<div class="title3">변화사진
		<input type="button" value="사진등록" />
		<input type="button" value="취소" />
	</div>
	<img alt="" src="">
	
	<input type="button" value="게시판등록" />
	<input type="button" value="저장" />
	<input type="button" value="취소" />
</form>
</div>
</body>
</html>