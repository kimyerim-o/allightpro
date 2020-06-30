<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<div>
<form action="./log.com" method="post">
	<table>
		<tr>
			<td>일반회원</td>
		</tr>
		<tr>
			<td><input type="text" id="mid" name="mid" placeholder="아이디" required="required"/></td>
		</tr>
		<tr></tr>
		<tr>
			<td><input type="password" id="mpw" name="mpw" placeholder="비밀번호" required="required"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</div>

<div>
<form action="./corlog.com" method="post">
	<table>
		<tr>
			<td>기업회원</td>
		</tr>
		<tr>
			<td><input type="text" id="coid" name="coid" placeholder="아이디" required="required"/></td>
		</tr>
		<tr></tr>
		<tr>
			<td><input type="password" id="copw" name="copw" placeholder="비밀번호" required="required"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</div>

<div>
<form>
<a id="kakao-login-btn"></a>
<input type="hidden" name="id" >
  <script type='text/javascript'>
   Kakao.init('52ee84c11b882c5898d68b339bf4f9d0');  
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     success: function(authObj) {
    	 Kakao.API.request({
    	        url: '/v2/user/me',
    	        success: function(res) {
    	          //alert(JSON.stringify(res)),
    	          console.log(res);
    	          var id=res.id;
    	          var nickname=res.properties.nickname;
    	          var email=res.kakao_account.email;
					
    	          
    	          Kakao.Auth.authorize({
				   redirectUri: 'http://localhost:9000/light/login'
				 })
    	        },
    	        fail: function(error) {
    	          /*alert(
    	            'login success, but failed to request user information: ' +
    	              JSON.stringify(error)
    	          )*/
    	          Kakao.Auth.authorize({
   				   redirectUri: 'http://localhost:9000/light/log'
   				 })
    	        },
    	      })
     },
     fail: function(err) {
    	 console.log(JSON.stringify(err));
     }
   });
   </script>
   

<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>

<script type="text/javascript">
  // input your appkey
  Kakao.init('52ee84c11b882c5898d68b339bf4f9d0')
  function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return
    }
    Kakao.Auth.logout(function() {
      alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
    })
  }
</script>
</form>



<a id="login-form-btn" href="javascript:loginFormWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<script type="text/javascript">
  // input your appkey
  Kakao.init('52ee84c11b882c5898d68b339bf4f9d0')
  function loginFormWithKakao() {
	  
    Kakao.Auth.loginForm({
      success: function(authObj) {
     	 Kakao.API.request({
 	        url: '/v2/user/me',
 	        success: function(res) {
 	          alert(JSON.stringify(res)),
 	        	Kakao.Auth.authorize({
 				   redirectUri: 'http://localhost:9000/light/log'})  
 	        },
 	        fail: function(error) {
 	          alert('login success, but failed to request user information:'JSON.stringify(error))
 	        },
 	      })
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    }),
    
    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
       	 Kakao.API.request({
       	        url: '/v2/user/me',
       	        success: function(res) {
       	          alert(JSON.stringify(res)),
       	          Kakao.Auth.authorize({
   				   redirectUri: 'http://localhost:9000/light/login'
   				 })
       	        },
       	        fail: function(error) {
       	          /*alert(
       	            'login success, but failed to request user information: ' +
       	              JSON.stringify(error)
       	          )*/
       	          Kakao.Auth.authorize({
      				   redirectUri: 'http://localhost:9000/light/log'
      				 })
       	        },
       	      })
        },
        fail: function(err) {
       	 console.log(JSON.stringify(err));
        }
      });
  }
</script>
</div>
</body>
</html>