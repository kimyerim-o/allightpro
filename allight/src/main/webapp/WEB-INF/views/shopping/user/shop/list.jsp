<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑</title>
<!-- 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
-->

</head>
<body>
	<div class="container">
		<div class="shopSearchDiv">
		    <input type="text" name="content" class="shopTxt"/>
		    <button type="button" class="shopBtn">
		    	<img src="${pageContext.request.contextPath}/resources/img/search.png" class="shopSearchImg"/>
	    	</button>
	    </div>
		<a class="title2">카테고리명</a>
		<ul class="sort">
			<li><a href="#">높은가격순</a></li>
			<li>|</li>
			<li><a href="#">낮은가격순</a></li>
			<li>|</li>
			<li><a href="#">인기순</a></li>
		</ul>

		<!-- for문 -->
		<div class="row">
			<div class="col-md-3">
				<div class="product-grid">
					<div class="product-image">
						<a href="#"> <img class="pic"
							src="http://bestjquery.com/tutorial/product-grid/demo9/images/img-1.jpg">
						</a> <span class="product-new-label">품절</span>
					</div>
					<div class="product-content">
						<div class="title">상품명</div>
						<div class="price">가격</div>
						<div class="brand">브랜드</div>
						<a class="brand">리뷰(</a><a class="review">개수</a><a class="brand">)</a>
					</div>
				</div>
			</div>
		</div>		
		<div class="center">
			<ul class="pagination">
				<li>
					<a href="#">«</a>
				</li>
				<!-- 현재 페이지일때 active -->
				<li class="active"> 
					<a href="#">1</a>
				</li>
				<li>
					<a href="#">2</a>
				</li>
				<li>
					<a href="#">3</a>
				</li>
				<li>
					<a href="#">4</a>
				</li>
				<li>
					<a href="#">5</a>
				</li>
				<li>
					<a href="#">»</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
