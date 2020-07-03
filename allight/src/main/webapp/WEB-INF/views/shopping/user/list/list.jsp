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
		<a class="title2">카테고리명</a>
		<ul class="sort">
			<li></li>
			<li><a href="#">낮은가격순</a></li>
			<li>|</li>
			<li><a href="#">등록순</a></li>
			<li>|</li>
			<li><a href="#">인기순</a></li>
		</ul>

		<!-- for문 -->
		<div class="row">
			<div class="col-md-3 col-sm-6">
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
						<div class="review">리뷰(개수)</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
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
						<div class="review">리뷰(개수)</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
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
						<div class="review">리뷰(개수)</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
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
						<div class="review">리뷰(개수)</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
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
						<div class="review">리뷰(개수)</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="insertFavorite">
		    <select name="search" class="selectCss">
		        <option value="ftitle">제목</option>
		        <option value="fcontent">내용</option> 
		    </select>
		    <input type="text" name="content" />
		    <input type="submit" value="검색" class="btn"/>
	    </div>
		<table class="table">
			<tr>
				<th>John</th>
				<th>Doe</th>
				<th>john@example.com</th>
			</tr>
			<tr>
				<td>Mary</td>
				<td>Moe</td>
				<td>mary@example.com</td>
			</tr>
			<tr>
				<td>July</td>
				<td>Dooley</td>
				<td>july@example.com</td>
			</tr>
	
		</table>
		<div class="right">
			<a class="btn">글쓰기</a>
		</div>
		
		<div class="center">
		  <ul class="pagination">
		  	<!-- disabled가 있으면 마우스 커서가 금지표시로 바뀐다. -->
		    <li class=disabled>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">«</span>
		      </a>
		    </li>
		    <!-- 현재 페이지 -->
		    <li class="active"><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">»</span>
		      </a>
		    </li>
		  </ul>
		</div>
		
		
		<!-- 검색창  -->
		<div class="boardContent">
			<div class="boardContent-buttons">
				<input type="button" value="목록" class="btn">
				<input type="button" value="수정" class="btn" >
				<input type="button" value="삭제" class="btn">
			</div>
			
			<!-- 테이블  -->
			<table>
				<tr>
					<td class="board-title">제목(수정필요)</td>
				</tr>
				<tr>
					<td class="board-info"><a class="board-info-nick">닉네임(수정필요)</a>
						| <a class="board-info-others">조회</a> 
						<a style="color: #ff5656; font-size: 1.4rem;">조회수(수정필요)</a> 
						<a class="board-info-others"> | 업로드날짜(수정필요)</a>
					</td>
				</tr>
				<tr>
					<td class="board-content"><div class="board-content-div">내용(수정필요)</div></td>
				</tr>
			</table>
			
		
			
			<div class="boardContent-Comment-Table">
					<table width="100%" style="border-top: 1px solid gray;">
						<!-- for문으로 댓글 가져오기 -->
						<tr>
							<td colspan="100%" class="board-comment-info"><a
								class="board-info-nick">닉네임(수정필요)</a>&nbsp;&nbsp; <a
								class="board-info-others">업데이트날짜(수정필요)</a></td>
						</tr>
						<tr>
							<td width="80%">댓글내용(수정필요)</td>
							<td style="padding: 0; text-align: center;">
								<a href="#" class="aNone"> 
									<img class="likeandhate" src="#" />
								</a>
								<a class="aNone">좋아요수(수정필요)</a>
							</td>
							<td style="padding: 0; text-align: center;">
								<a href="#" style="color: #ff5656;">삭제</a>
							</td>
						</tr>
						<!-- for문 끝~ -->
		
					</table>
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
		</div>
	</div>



</body>
</html>
