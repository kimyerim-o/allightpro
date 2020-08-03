<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("MID");
    if(id==null){
    	response.sendRedirect("loginForm.jsp");
    }else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
<script type="text/javascript">
	window.onload=function(){
		document.myForm.id.focus();
	};
	function checkIt(){
		var user = document.myForm;
		if(user.id.value==''){
			alert('아이디를 입력하세요!');
			user.id.focus();
			return false;
		}
		if(user.passwd.value==''){
			alert('비밀번호를 입력하세요!');
			user.passwd.focus();
			return false;
		}
	}
</script>

</head>
<body>
<form name="myForm" action="./delete.com" method="post" onsubmit="return checkIt()">
	아이디${MEMINFO.mid}<input type="hidden" name="mid" value="${MEMINFO.mid}">
	<br>
	비밀번호<input type="password" name="mpw" size="15" maxlength="12">
	<br>
	<input type="submit" value="회원 탈퇴">
	<input type="reset" value="초기화">
	<input type="button" value="홈으로" onclick="location.href='http://localhost:9000/allight/main.com'">
	</form>

</body>
</html>
<%
    }
    %>