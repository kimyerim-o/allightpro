<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(function(){
	$('#check').click(function(){
		$("#check").attr('href','${pageContext.request.contextPath}/calorie_recipe.com');
	});
})
</script>
</head>
<body>
	<div class="container">
		<table class="table">
			<tr>
				<th>총 감량기간</th>
				<td>${LIST.crterm}${LIST.type}</td>
			</tr>
			<tr>
				<th>현제 체중</th>
				<td>${LIST.crweight}kg</td>
			</tr>
			<tr>
				<th>목표 체중</th>
				<td>${LIST.crgoalweight}kg</td>
			</tr>
			<tr>
				<th>BMI</th>
				<td>${LIST.crbmi}</td>
			</tr>
			<tr>
				<th>평소 활동량</th>
				<td><c:if test="${LIST.cractive ==1}">111</c:if>
					<c:if test="${LIST.cractive ==2}">211</c:if>
					<c:if test="${LIST.cractive ==3}">311</c:if>
					<c:if test="${LIST.cractive ==4}">411</c:if>
					<c:if test="${LIST.cractive ==5}">511</c:if>
				</td>
			</tr>
			<tr>
				<th>기초대사량</th>
				<td>${LIST.crbmr}</td>
			</tr>
			<tr>
				<th>다이어트를 위한 하루 칼로리</th>
				<td>${LIST.crcal}
					<c:if test="${LIST.crcal <= 1000}">하루 1000kcal이하의 섭취량은 권장하지 않습니다.</c:if>
				</td>
			</tr>
		</table>
		<div>
			<a class="btn" id="check">칼로리 처방 다시 받기</a>
			<c:if test="${!empty sessionScope.MID}">
				<a href="javascript:;" id="kakao-link-btn">
				<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" width="10px" />
				</a>
			</c:if>
		</div>
	</div>

<script type="text/javascript">
    Kakao.init('52ee84c11b882c5898d68b339bf4f9d0');
    alert(document.location.href);
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        description: '칼로리 처방',
        imageUrl: "${pageContext.request.contextPath}/resources/img/allight_logo.jpg",
        link: {
          webUrl: document.location.href
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: 'Open!',
          link: {
            mobileWebUrl: document.location.href,
            webUrl: document.location.href
          }
        }  
      ]
    });
  //]]>
</script>
</body>
</html>