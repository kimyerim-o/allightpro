<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head title="회원가입">
<script
	src="${pageContext.request.contextPath}/resources/js/join.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
</script>
</head>
<body>
	<iframe id="joinFrm" style="position: absolute; z-index: 1; visibility: hidden;"></iframe>
	<h2>회원가입</h2>
	<hr />
	${result}
	<form action="./join.com" id="join" method="post">
		<input type="hidden" id="reqMethod" name=reqMethod value="">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="mid" name="mid" value="${param.mid}">
					<button id="idCheck" type="button">중복확인</button>
					<input type="hidden" id="idChecked" value="0" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="mname" name="mname" value="${param.mname}"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" id="mnick" name="mnick" value="${param.mnick}">
					<button id="nickCheck" type="button">중복확인</button>
					<input type="hidden" id="nickChecked" value="0" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="mpw" name="mpw" value="${param.mpw}"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="mpw2" name="mpw2" value="${param.mpw2}"></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" id="mbirth" name="mbirth" value="${param.mbirth}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="memail" name="memail" style="width: 80px" value="${param.memail}">&nbsp;@
					<select id="memail2" name="memail2">
						<option value="">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
					</select>
					<button type="button" class="btn btn-outline-secondary" id="check_mail">이메일인증</button>
					</td>
				<td id="checkCODE" style="display:none;">
					<input type="text" id="usercode" name="usercode" style="width:200px;" placeholder="인증번호를 입력하세요"/>
					<button type="button" class="btn btn-secondary" id="check_code">인증하기</button>
				</td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td><select id="mtel" name="mtel" value="${param.mtel}" style="height: 20">
						<option selected>선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
				</select>&nbsp;- <input id="mtel1" type="text" name="mtel1" maxlength="4" size="5" value="${param.mtel1}">
				&nbsp;- <input id="mtel2" type="text" name="mtel2" maxlength="4" size="5" value="${param.mtel2}"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><select name="msex" id="msex" required="required">
						<option value="">선택</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" class="center">
					<input type="reset" value="취소" onclick="location.href='${pageContext.request.contextPath}/main.com'" />&nbsp;
					<a href="#" onclick="frmChk('this.form');return false;">
					<input type="submit" value="가입" /></a></td>
			</tr>
		</table>
	</form>
</body>
</html>