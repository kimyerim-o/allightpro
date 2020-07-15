<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head title="회원가입">
<script
	src="${pageContext.request.contextPath}/resources/memberjs/join.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	$(function() {
		$("#idCheck").click(function() {
			var mid = $("#mid").val();
			//alert(mid);
			// JSON.parse(제이슨데이터); 수신
			// JSON.stringfy(자바스크립트오브젝트); 송신

			$.ajax({
				url : "./idChk.com",
				type : "POST",
				//dataType: "json"인 경우 해당 컨트롤러(idChk)에 @ResponceBody 어노테이션을 추가해야한다
				dataType : "text",
				async : false,
				data : {
					mid : $("#mid").val()
				},
				success : function(data) {
					if (data == "fail") {
						alert("이미 등록된 아이디입니다.");
						$("#mid").val("");
						$("#mid").focus();
					} else {

						alert("사용 가능한 아이디입니다.");
					}
				}
			});
		});
	});

</script>
</head>
<body>
	<iframe id="joinFrm"
		style="position: absolute; z-index: 1; visibility: hidden;"></iframe>
	<h2>회원가입</h2>
	<hr />
	<!-- req.setAttribute("RESULT", result); -->
	${result}
	<form action="./join.com" id="join" method="post">
		<input type="hidden" id="reqMethod" name=reqMethod value="">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="mid" name="mid" value="${param.mid}">
					<button id="idCheck" type="button">중복확인</button> <span>${RESULT}</span></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="mname" name="mname"
					value="${param.mname}"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" id="mnick" name="mnick"
					value="${param.mnick}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="mpw" name="mpw"
					value="${param.mpw}"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="mpw2" name="mpw2"
					value="${param.mpw2}"></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" id="mbirth" name="mbirth"
					value="${param.mbirth}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="memail" name="memail"
					style="width: 80" value="${param.memail}">&nbsp;@ <select
					id="memail2" name="memail2">
						<option value="">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
				</select>
					<button type="button" id="mverify" onclick="sendMail()">이메일
						인증</button> <input type="hidden" id="authCode" /></td>
			</tr>
			<tr>
				<td></td>
				<td id="auth" class="hidden"><input type="text" id="authCode2" />
					<button type="button" id="mverify2" onclick="checkAuthCode()">인증하기</button>
					<span id="checkAuthCodeResult"></span></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td><select id="mtel" name="mtel" value="${param.mtel}"
					style="height: 20">
						<option selected>선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
				</select>&nbsp;- <input id="mtel1" type="text" name="mtel1" maxlength="4"
					size="5" value="${param.mtel1}">&nbsp;- <input id="mtel2"
					type="text" name="mtel2" maxlength="4" size="5"
					value="${param.mtel2}"></td>
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
				<td colspan="2" class="center"><input type="reset" value="취소"
					onclick="location.href='${pageContext.request.contextPath}/main.com'" />&nbsp;
					<a href="#" onclick="frmChk('this.form');return false;"> <input
						type="submit" value="가입" /></a></td>
			</tr>
		</table>
	</form>
</body>
</html>