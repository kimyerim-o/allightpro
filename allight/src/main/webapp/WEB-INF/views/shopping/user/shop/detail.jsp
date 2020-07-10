<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑상세</title>
<script type="text/javascript">
$(function(){
	// 네비게이션
	$(window).scroll(function(){  //스크롤하면 아래 코드 실행
       	var num = $(this).scrollTop();  // 스크롤값
        if( num > 890 ){  // 스크롤을 900이상 했을 때
        	$(".pdt_detai_tabinner_vn").attr("class","pdt_detai_tabinner_vn2");
        }else{
    	    $(".pdt_detai_tabinner_vn2").attr("class","pdt_detai_tabinner_vn");
        }
  	});
	
	/*
	$('.rNowPage').click(function(){
		var i = $(this).text();
		alert(i)
		
		${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${i}
		
		$.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/shopping/detail.com", 
		    data : "ino=${param.ino}&rNowPage=2"/*{
		    	ino : "${param.ino}",
		    	rNowPage : i,
		    	detail : "${DETAIL}",
		    	repreImg : "${REPREIMG}",
		    	imgs : "${IMGS}",
		    	rList : "${RLIST}"
		    },
		    dataType : 'json',
		    error : function(data) {
		    	console.log("error");
		    },
		    success : function(data) {
			console.log("success");
			
		    }
		});
	}); */
		
});
</script>
</head>
<body>
	<div class="container">
		<div class="shop-head-title">${DETAIL.icategory} > </div>
		<div class="card">
			<div class="card-img">
				<img src="${REPREIMG}"/>
			</div>
			<div class="card-txt">
				<h1 class="info-name">${DETAIL.iname}</h1>
				<p class="info-detail">${DETAIL.idetail}</p>
				<table>
					<tr>
						<td class="card-info-td">판매가격</td>
						<td class="card-info-td0">
							<fmt:formatNumber value="${DETAIL.iprice}" pattern="#,###"/>원
						</td>
					</tr>
					<tr>
						<td class="card-info-td">브랜드</td>
						<td class="card-info-td1">${DETAIL.icorp}</td>
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
			<div id="detail"></div>
		</div>
			
		<div class="pdt_detai_tabinner_vn">
			<ul>
				<li class="pdt_item fir on"><a href="#detail" style="cursor:pointer;">상세설명<span id="tete"></span></a></li>
				
				<li class="pdt_item"><a href="#review" style="cursor:pointer;">상품후기(${RSIZE})</a></li>
				
				<li class="pdt_item"><a href="#question" style="cursor:pointer;">상품문의(0)</a></li>
			</ul>
		</div>
		
		<div class="details">
			<div class="detail-imgs">
				<c:forEach var="img" items="${IMGS}">
					<img src="${img}"/>
					<br/>
				</c:forEach>
			</div>
		</div>
		
		<!-- 검색창  -->
		<div class="review-qustion-div">
			<!-- 상품후기   -->
			<div id="review" style="height:75px;"></div>
			<div style="height:100px;"></div>
			<div class="shop-mini-title">
				상품후기(${RSIZE})
			</div>
	
			<div class="boardContent-Comment-Table">
				<table>
					<!-- for문으로 댓글 가져오기 -->
					<c:forEach var="list" items="${RLIST}">
						<tr>
							<td colspan="100%" class="board-comment-info">
								<a class="board-info-nick">
									<c:forEach begin="1" end="${list.rgrade}">★</c:forEach><c:forEach begin="1" end="${5-list.rgrade}">☆</c:forEach>
								</a>&nbsp;&nbsp; 
								<a class="board-info-others">|&nbsp;&nbsp;${list.rnick}</a>
							</td>
						</tr>
						<tr>
							<td width="80%">${list.rcontent}</td>
							<td style="padding: 0; text-align: center;">
								<a href="./reviewLike.com?ino=${DETAIL.ino}&rno=${list.rno}&rNowPage=${RPINFO.nowPage}"> 
									<c:if test="${list.isLiked}">
										<img class="like" src="${pageContext.request.contextPath}/resources/img/liked.png" />
									</c:if>
									<c:if test="${!list.isLiked}">
										<img class="like" src="${pageContext.request.contextPath}/resources/img/like.png" />
									</c:if>
								</a>
								<a class="aNone">${list.rlamount}</a>
							</td>
						</tr>
					</c:forEach>
					<!-- for문 끝~ -->
					<c:if test="${empty RLIST}">
						<tr>
							<td colspan="100%" class="center">
								상품후기가 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
				</table>
				<c:if test="${!empty RLIST}">
					<div class="center">
						<ul class="pagination">
				            <li>
				               <c:if test="${RPINFO.nowPage > 3}">
				                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${RPINFO.nowPage-3}#review">«</a>
				               </c:if>
				               <c:if test="${RPINFO.nowPage <= 3}">
				                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=1#review">«</a>
				               </c:if>
				            </li>
				            <!-- 현재 페이지일때 active --> 
				            <c:forEach begin="${RPINFO.startPage}" end="${RPINFO.endPage}" var="i">
				               <li id="li"><!-- 스크립트 적용해야 할것같아요 -->
				                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${i}#review">${i}</a>
				               </li>
				            </c:forEach>            
				            <li>
				               <c:if test="${RPINFO.nowPage < RPINFO.endPage-3}">
				                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${RPINFO.nowPage+3}#review">»</a>
				               </c:if>
				               <c:if test="${RPINFO.nowPage >= RPINFO.endPage-3}">
				                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${RPINFO.endPage}#review">»</a>
				               </c:if>
				            </li>
				        </ul>
					</div>
				</c:if>
			</div>
			
			
			<!-- 상품문의   -->
			<div id="question" style="height:75px;"></div>
			<div style="height:100px;"></div>
			<div class="float-right">
				<a class="btn">문의하기</a>
			</div>
			<div class="shop-mini-title">
				상품문의(10)
			</div>
			<table>
				<tr>
					<th style="border-bottom:1px solid gray; width:10%">번호</th>
					<th style="border-bottom:1px solid gray; width:50%">제목</th>
					<th style="border-bottom:1px solid gray; width:20%">작성일</th>
					<th style="border-bottom:1px solid gray; width:20%">닉네임</th>
				</tr>
				<tr>
					<td class="center">1</td>
					<td class="center">f</td>
					<td class="center">20.07.07</td>
					<td class="center">dsfsdfd</td>
				</tr>
			</table>
			<c:if test="${!empty RLIST}">
				<div class="center">
					<ul class="pagination">
			            <li>
			               <c:if test="${RPINFO.nowPage > 3}">
			                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${RPINFO.nowPage-3}#review">«</a>
			               </c:if>
			               <c:if test="${RPINFO.nowPage <= 3}">
			                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=1#review">«</a>
			               </c:if>
			            </li>
			            <!-- 현재 페이지일때 active --> 
			            <c:forEach begin="${RPINFO.startPage}" end="${RPINFO.endPage}" var="i">
			               <li id="li"><!-- 스크립트 적용해야 할것같아요 -->
			                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${i}#review">${i}</a>
			               </li>
			            </c:forEach>            
			            <li>
			               <c:if test="${RPINFO.nowPage < RPINFO.endPage-3}">
			                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${RPINFO.nowPage+3}#review">»</a>
			               </c:if>
			               <c:if test="${RPINFO.nowPage >= RPINFO.endPage-3}">
			                  <a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${param.ino}&rNowPage=${RPINFO.endPage}#review">»</a>
			               </c:if>
			            </li>
			        </ul>
				</div>
			</c:if>
			
		</div>
	</div>
	
</body>
</html>