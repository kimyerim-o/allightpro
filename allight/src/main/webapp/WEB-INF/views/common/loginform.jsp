<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<form action="./log.com" method="post">
	<table>
		<tr>
			<td><input type="text" id="mid" name="mid" placeholder="아이디" required="required"/></td>
		</tr>
		<tr>
			<td><input type="password" id="mpw" name="mpw" placeholder="비밀번호" required="required"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="reUrl" value="${reUrl}"></td>
		</tr>
	</table>
</form>

<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<script type="text/javascript">
  // input your appkey
  Kakao.init('52ee84c11b882c5898d68b339bf4f9d0')
 function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
        //alert(JSON.stringify(authObj)),
   	 Kakao.API.request({
	        url: '/v2/user/me',
	        success: function(res) {
	          console.log(res);
 			  $.ajax({
				  url:'./kakao.com',
				  type:'post',
				  dataType:'text',//받을때
				  data:res,
				  success:function(check){
					  alert(check);
					  if(check=="check"){
					  	location.href = "http://localhost:9000/allight/join.com";
					  }else{
						  location.href = "http://localhost:9000/allight/main.com";
					  }
				  },
				  fail:function(error){
					  console.log("error")
				  }
			  });
	        },
	        fail: function(error) {
	        	console.log("errorrrrr")
	        },
	      })
      },
      fail: function(err) {
    	  console.log("er")
      },
    })
  }
</script>

   

<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
<script type="text/javascript">
  // input your appkey
  function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return
    }
    Kakao.Auth.logout(function() {
    	$.ajax({
			  url:'./kakaout.com',
			  dataType:'text',//받을때
			  type:'post',
			  success:function(check){
				  alert(check);
				  if(check=="out"){
				  	location.href = "http://localhost:9000/allight/main.com";
				  }else{
					  alert("카카오 로그아웃 실패")
					  location.href = "http://localhost:9000/allight/main.com";
				  }
			  },
			  fail:function(error){
				  console.log("error")
			  }
		  });
      	alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
    })
  }
</script>
<form action="./corlog.com" method="post">
<input type="hidden" name="cnt" value="${sessionScope.cnt}"/>
${sessionScope.cnt}
	<table>
		<tr>
			<td><input type="text" id="coid" name="coid" placeholder="아이디" required="required"/></td>
		</tr>
		<tr>
			<td><input type="password" id="copw" name="copw" placeholder="비밀번호" required="required"/></td>
		</tr>
		<c:if test="${sessionScope.cnt > 3}">
			<tr>
				<td>자동방지</td>
			</tr>
			<tr>
				<td><input type="text" id="auto" name="auto" placeholder="자동입력 방지문자"/></td>
			</tr>
		</c:if>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
		<tr class="center">
			<td colspan="2">
				<a href="${pageContext.request.contextPath}/findIdFrm.com">아이디 찾기 |</a>&nbsp;
				<a href="${pageContext.request.contextPath}/findPwFrm.com">비밀번호 찾기 |</a>&nbsp;
				<a href="${pageContext.request.contextPath}/joinFrm.com">회원가입</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>