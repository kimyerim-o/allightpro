<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑상세</title>
<script type="text/javascript">
$(function(){
	$(window).scroll(function(){  //스크롤하면 아래 코드 실행
	       var num = $(this).scrollTop();  // 스크롤값
	       if( num > 890 ){  // 스크롤을 900이상 했을 때
	           $(".pdt_detai_tabinner_vn").attr("class","pdt_detai_tabinner_vn2");
	       }else{
	    	   $(".pdt_detai_tabinner_vn2").attr("class","pdt_detai_tabinner_vn");
	       }
	  })
	})
</script>
</head>
<body>
	<div class="container">
		<div class="shop-head-title">식단 > </div>
		<div class="card">
			<div class="card-img">
				<img src="${pageContext.request.contextPath}/resources/img/allight_logo.jpg"/>
			</div>
			<div class="card-txt">
				<h1 class="info-name">name</h1>
				<p class="info-detail">상품 설명~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
				<table>
					<tr>
						<td class="card-info-td">판매가격</td>
						<td class="card-info-td0">20,000원</td>
					</tr>
					<tr>
						<td class="card-info-td">배송방법</td>
						<td class="card-info-td1">업체배송</td>
					</tr>
					<tr>
						<td class="card-info-td">배송비</td>
						<td class="card-info-td0">0원</td>
					</tr>
				</table>
				<div style="height:10px;"></div>
				<hr/>
				<a class="left-how-many">수량:
					<input type="number" min="1" value="1">
				</a>
				<a class="right-one">원</a>
				<a class="right-total-price">30,000</a>
				<a class="right-total">총 상품금액</a>
				
				<input type="button" value="장바구니" class="in-cart-btn"/>
				<input type="button" value="구매하기" class="purchase-btn"/>
			</div>
			<div id="details"></div>
		</div>
		<div class="pdt_detai_tabinner_vn">
			<ul>
				<li class="pdt_item fir on"><a href="#details" style="cursor:pointer;">상세설명<span id="tete"></span></a></li>
				
				<li class="pdt_item"><a href="#reviews" style="cursor:pointer;">상품후기<span class="v_n_numb">(9)</span></a></li>
				
				<li class="pdt_item"><a href="#questions" style="cursor:pointer;">상품문의<span class="tab_detail_qna_count  v_n_numb">(0)</span></a></li>
			</ul>
		</div>
		
		<div class="details">
			<div class="detail-imgs">
				<img src="${pageContext.request.contextPath}/resources/img/allight_logo.jpg"/>
				<img src="${pageContext.request.contextPath}/resources/img/allight_logo.jpg"/>
				<img src="${pageContext.request.contextPath}/resources/img/allight_logo.jpg"/>
				
			</div>
		</div>
		
		<!-- 검색창  -->
		<div class="review-qustion-div">
			<!-- 상품후기   -->
			<div id="reviews" style="height:65px;"></div>
			<div class="shop-mini-title">
				상품후기(9)
			</div>
	
			<div class="boardContent-Comment-Table">
				<table style="border-top: 2px solid #444;">
					<!-- for문으로 댓글 가져오기 -->
					<tr>
						<td colspan="100%" class="board-comment-info"><a
							class="board-info-nick">★★★★☆</a>&nbsp;&nbsp; 
							<a class="board-info-others">|&nbsp;&nbsp;닉네임</a>
						</td>
					</tr>
					<tr>
						<td width="80%">댓글내용(수정필요)</td>
						<td style="padding: 0; text-align: center;">
							<a href="#"> 
								<img class="likeandhate" src="#" />
							</a>
							<a class="aNone">좋아요수(수정필요)</a>
						</td>
					</tr>
					
					<tr>
						<td colspan="100%" class="board-comment-info"><a
							class="board-info-nick">★★★★☆</a>&nbsp;&nbsp; 
							<a class="board-info-others">|&nbsp;&nbsp;닉네임</a>
						</td>
					</tr>
					<tr>
						<td width="80%">댓글내용(수정필요)</td>
						<td style="padding: 0; text-align: center;">
							<a href="#"> 
								<img class="likeandhate" src="#" />
							</a>
							<a class="aNone">좋아요수(수정필요)</a>
						</td>
					</tr>
					
					<tr>
						<td colspan="100%" class="board-comment-info"><a
							class="board-info-nick">★★★★☆</a>&nbsp;&nbsp; 
							<a class="board-info-others">|&nbsp;&nbsp;닉네임</a>
						</td>
					</tr>
					<tr>
						<td width="80%">댓글내용(수정필요)</td>
						<td style="padding: 0; text-align: center;">
							<a href="#"> 
								<img class="likeandhate" src="#" />
							</a>
							<a class="aNone">좋아요수(수정필요)</a>
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
			
			
			<!-- 상품문의   -->
			<div id="questions" style="height:65px;"></div>
			<div class="shop-mini-title">
				상품문의(10)
			</div>
			
			<table>
				<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="20%">작성일</th>
					<th width="20%">닉네임</th>
				</tr>
				<tr>
					<td class="center">1</td>
					<td class="center">f</td>
					<td class="center">20.07.07</td>
					<td class="center">dsfsdfd</td>
				</tr>
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

</body>
</html>