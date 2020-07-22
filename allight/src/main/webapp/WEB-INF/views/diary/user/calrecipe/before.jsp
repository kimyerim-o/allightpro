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
	
	var mbirth='${LIST.mbirth}';
	if(mbirth!=""){
		$('#d').attr('value',mbirth);
	}
	
	$('#check').click(function(){
		if($('#he').val()==""){
			alert('키를 입력하세요');
			$('#he').focus();
			return false;
		}
		if($('#we').val()==null){
			alert('현재 체중을 입력하세요');
			$('#we').focus();
			return false;
		}
		if($('#gwe').val()==null){
			alert('목표 체중을 입력하세요');
			$('#gwe').focus();
			return false;
		}
		if($('#bi').val().length==0){
			alert('생년월일을 입력하세요');
			$('#bi').focus();
			return false;
		} 
		if($('#te').val()==null){
			alert('제충 감량 기간을 입력하세요');
			$('#te').focus();
			return false;
		}
		$("#form").submit();
	});
})
</script>
</head>
<body>
<form id="form" action="./recipeCheck.com" method="post">
	<div class="container">
		<table class="table">
			<tr>
				<th>성별</th>
				<td><label><input type="radio" id="w" name="sex" value="F"/>여자</label>
					<label><input type="radio" id="m" name="sex" value="M"/>남자</label></td>
			</tr>
			<tr>
				<th>키</th>
				<td><input type="text" name="crheight" id="he" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">cm</td>
			</tr>
			<tr>
				<th>현재 체중</th>
				<td><input type="text" name="crweight" id="we" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">kg</td>
			</tr>
			<tr>
				<th>목표 체중</th>
				<td><input type="text" name="crgoalweight" id="gwe" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">kg</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" id="d" name="birth" id="bi" required="required"></td>
			</tr>
			<tr>
				<th>체중 감량 기간</th>
				<td><input type="text" name="crterm" id="te" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<input type="radio" name="type" value="개월" checked="checked"/>개월
					<input type="radio" name="type" value="주"/>주
					<input type="radio" name="type" value="일"/>일</td>
			</tr>
			<tr>
				<th>평소 활동량</th>
				<td><label><input type="radio" name="cractive" value="1" checked="checked"/>활동안함 (운동을 전혀 안 해요.)</label><br/>
					<label><input type="radio" name="cractive" value="2"/>가벼운 활동 (평소 가벼운 운동이나 스포츠를 즐겨요)</label><br/>
					<label><input type="radio" name="cractive" value="3"/>보통 활동 (평소 적당한 운동이나 스포츠를 즐겨요.)</label><br/>
					<label><input type="radio" name="cractive" value="4"/>많은 활동 (평소 강렬한 운동이나 스포츠를 즐겨요.)</label><br/>
					<label><input type="radio" name="cractive" value="5"/>격심한 활동 (평소 매우 심한 운동을 하거나 육체를 쓰는 직업이예요.)</label></td>
			</tr>
		</table>
		<div>
			<a class="btn" id="check">칼로리 처방 받기</a>
		</div>
	</div>
</form>
</body>
</html>