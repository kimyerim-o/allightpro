<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드관</title>
<script type="text/javascript">
	$(function(){ 
		//브랜드 목록에서 현재 페이지 브랜드명의 클래스 변경
		$('a:contains("<c:out value="${BRAND}"/>")').attr('class','brand-a-on');
		
		//정렬
		if(${SORT}==2){
			$('.sort li:nth-child(1)').addClass('sort-on');
		}else if(${SORT}==1){
			$('.sort li:nth-child(3)').addClass('sort-on');
		}else if(${SORT}==0){
			$('.sort li:nth-child(5)').addClass('sort-on');
		}
	})
</script>
</head>
<body>
	<div class="container">
		<a class="title2">브랜드관</a>
		
		<!-- 브랜드 목록 -->
		<div class="brand-row">
			<c:forEach var="brand" items="${BRANDS}">
				<div class="brands">
					<a href="${pageContext.request.contextPath}/shopping/brand.com?brand=${brand}" class="brand-a">
						${brand}
					</a>
				</div>
			</c:forEach>
		</div>
		
		<%-- 정렬(인기순/낮은가격순/높은가격순) --%>
		<c:if test="${empty SEARCHWORD}">
			<ul class="sort">
				<li><a href="${pageContext.request.contextPath}/shopping/brand.com?sort=2&brand=${BRAND}">높은가격순</a></li>
				<li>|</li>
				<li><a href="${pageContext.request.contextPath}/shopping/brand.com?sort=1&brand=${BRAND}">낮은가격순</a></li>
				<li>|</li>
				<li><a href="${pageContext.request.contextPath}/shopping/brand.com?sort=0&brand=${BRAND}">인기순</a></li>
			</ul>
		</c:if>
		
		<div class="row">
			<c:forEach var="list" items="${LIST}">
				<div class="col-md-3">
					<div class="product-grid">
						<div class="product-image">
							<a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${list.ino}"> <img class="pic"
								src="${list.imgimage}">
							</a> <span class="product-new-label">품절</span>
						</div>
						<div class="product-content">
							<div class="title">${list.iname}</div>
							<div class="price">${list.iprice}</div>
							<div class="brand">${list.icorp}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</body>
</html>
