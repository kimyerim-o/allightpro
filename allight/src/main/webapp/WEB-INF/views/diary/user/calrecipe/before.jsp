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
	var msex='${LIST.msex}';
	if(msex=='여자' || msex==""){
		$('#w').attr('checked','checked');
	}else if(msex=='남자'){
		$('#m').attr('checked','checked');
	}
})
</script>
</head>
<body>
${LIST}
<form action="">
	<div class="container">
		<table class="table">
			<tr>
				<th>성별</th>
				<td><input type="radio" id="w" name="nsex" value="여자"/>여자
					<input type="radio" id="m" name="nsex" value="남자"/>남자</td>
			</tr>
			<tr>
				<th>키</th>
				<td><input type="text" name="nheight" required="required">cm</td>
			</tr>
			<tr>
				<th>몸무계</th>
				<td><input type="text" name="nweight" required="required">kg</td>
			</tr>
			<tr>
				<th>목표 체중</th>
				<td><input type="text" name="aweight" required="required">kg</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="nbirth" required="required"></td>
			</tr>
			<tr>
				<th>체중 감량 기간</th>
				<td><select name="ndate" class="selectCss">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select>주
				</td>
			</tr>
			<tr>
				<th>평소 활동량</th>
				<td><input type="radio" name="nsex" value="여자" checked="checked"/>
					<input type="radio" name="nsex" value="남자"/>
					<input type="radio" name="nsex" value="남자"/>
					<input type="radio" name="nsex" value="남자"/>
					<input type="radio" name="nsex" value="남자"/></td>
			</tr>
		</table>
		<div>
			<a class="btn">칼로리 처방 받기</a>
		</div>
	</div>
</form>
</body>
</html>