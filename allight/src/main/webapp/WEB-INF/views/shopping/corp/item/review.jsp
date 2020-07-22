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

// 로그인 여부 확인/로그인창 보내기
function loginCheck (){
	if('${sessionScope.MID}'==''){
		if(confirm('로그인 후 이용가능한 서비스입니다.\n로그인하시겠습니까?')){
			$('#reUrlFrm').submit();
		}
	}
}

// 천단위 콤마
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 상문 문의 삭제
function iqDelete(iqno) {
	if(confirm('정말 삭제하시겠습니까?')){
		var iqno = iqno;
		
		$.ajax({
	    	url: '${pageContext.request.contextPath}/shopping/iqDelete.com',
	        data: {iqno:iqno},
	        method: 'post',
	        success: function(data){
	        	alert('삭제 완료했습니다.');
	        	location.reload();
	        },
			error:function(request,status,error){
            	alert('삭제 실패했습니다.\n잠시 후 다시 시도해주세요.')
            	location.reload();
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	    })
	}
};

//상문 문의 삭제
function iqaDelete(iqcno) {
	if(confirm('정말 삭제하시겠습니까?')){
		var iqcno = iqcno;
		
		$.ajax({
	    	url: '${pageContext.request.contextPath}/item/answer/delete/corp.com',
	        data: {iqcno:iqcno},
	        method: 'post',
	        success: function(data){
	        	alert('삭제 완료했습니다.');
	        	location.reload();
	        },
			error:function(request,status,error){
            	alert('삭제 실패했습니다.\n잠시 후 다시 시도해주세요.')
            	location.reload();
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	    })
	}
};


$(function(){	
	// 상품문의 제목 클릭시 내용 보이기
	$('.iqtitle').click(function(){
		if($(this).parent().parent().next('.hidden').attr('class')=='hidden'){
			$(this).parent().parent().next('.hidden').attr('class','show');
			$(this).parent().parent().next('.hidden').next('.hidden').attr('class','show');
			return false;
		}else {
			$(this).parent().parent().next('.show').attr('class','hidden');
		}
	});
});
</script>
</head>

<body>
	
		
		<!-- 상품후기/상품문의  -->
		<div class="review-qustion-div">
		
			<!-- 상품문의   -->
			<div id="question" style="height:75px;"></div>
			<div style="height:100px;"></div>

			<div class="shop-mini-title">
				상품문의(${QSIZE})
			</div>
			
			<form action="${pageContext.request.contextPath}/shopping/iqWrite.com" method="post" id="iqWriteFrm" class="hidden">
				<div class="shop-mini-title">
					상품문의 작성
				</div>
				<table>
					<tbody>	
						<tr>
							<td width="15%">제목</td>
							<td>
								<input type="text" name="iqtitle" id="iqtitle"/>
							</td>	
						</tr>
						<tr>
							<td>비밀글 설정</td>
							<td>
								<input type="checkbox" name="iqsecret" value="1" />
							</td>
						</tr>
						<tr>								
							<td colspan="2">
								<textarea name="iqcontent" id="iqcontent" rows="10" cols="200" 
									style="margin:10px 0;padding:10px;width:100%;height:300px;"></textarea>
							</td>
						</tr>					
					</tbody>
				</table>
				<input type="hidden" name="ino" value="${param.ino}"/>
				<input type="hidden" name="iqid" value="${sessionScope.MID}"/>
				<input type="hidden" name="iqnick" value="${sessionScope.MNICK}"/>
				<input type="button" value="등록" id="writeSubmit"/>
				<input type="button" value="취소" id="writeCancel"/>
			</form>
			
			<div id="qTable">
			<table>
				<tr>
					<th style="border-bottom:1px solid gray; width:7%">번호</th>
					<th style="border-bottom:1px solid gray; width:43%" colspan="2">제목</th>
					<th style="border-bottom:1px solid gray; width:20%">작성일</th>
					<th style="border-bottom:1px solid gray; width:20%">닉네임</th>
					<th style="border-bottom:1px solid gray; width:10%">상품이동</th>
				</tr>
				<c:forEach var="list" items="${QLIST}">
					<tr>
						<td class="center">${list.iqno}</td>
						<td colspan="2">
							<c:if test="${list.iqsecret==1}">
								<img class="like" src="${pageContext.request.contextPath}/resources/img/secret.png" />
							</c:if>
							<c:if test="${list.iqsecret==1}">
								<a class="iqtitle" onclick="isWriter('${list.iqid}')">
									&nbsp;${list.iqtitle}&nbsp;
									<c:if test="${!empty list.iqccontent}">[답변완료]</c:if>
								</a>
							</c:if>
							<c:if test="${list.iqsecret!=1}">
								<a class="iqtitle">
									&nbsp;${list.iqtitle}&nbsp;
									<c:if test="${!empty list.iqccontent}">[답변완료]</c:if>
								</a>
							</c:if>
						</td>
						<td class="center">${list.iqdate}</td>
						<td class="center">${list.iqnick}</td>
						<td class="center">
						<a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${list.ino}">${list.ino}번 상품</a></td>
					</tr>
					<c:if test="${!empty list.iqcontent}">
						<tr class="hidden">
							<td colspan="6" style="padding:0 0 5px;">
								<table>
									<tr>
										<td colspan="5" style="padding:40px 20px">
											
												<div class="float-right-box">
													
													
													<a onclick="iqDelete(${list.iqno});">삭제</a>
												</div>
											
											<pre>${list.iqcontent}</pre>
											
											<div style="text-align:center;">
												
												
												<!-- 기업 답변 -->
												<form action="${pageContext.request.contextPath}/item/answer/corp.com" method="post" id="answercorp" >						
													<input type="hidden" name="iqno" value="${list.iqno}" />
													<input type="hidden" name="iqcid" value="${sessionScope.COID}" />
													<input type="text" name="iqccontent" style="width:300px; height:100px;">
													<input type="hidden" name="iqcnick" value="${sessionScope.COID}" />
													<input type="submit" value="답변등록"/>
												</form>
												
											</div>
										</td>
										<td colspan="5" style="padding:0;" class="hidden">
											<form action="./iqModify.com" class="modifyFrm">
												<table class="ques-mody-table">
													<tr>
														<td width="10%" class="modi-table-th">제목</td>
														<td><input type="text" name="iqtitle" class="iqModititle" value="${list.iqtitle}"></td>
													</tr>
													<tr>
														<td class="modi-table-th">비밀글 설정</td>
														<td>
															<c:if test="${list.iqsecret==1}">
																<input type="checkbox" name="iqsecret" value="1" checked="checked"/>
															</c:if>
															<c:if test="${list.iqsecret!=1}">
																<input type="checkbox" name="iqsecret" value="1" />
															</c:if>
														</td>
													</tr>
													<tr>
														<td colspan="2" style="text-align:center;">
															<textarea name="iqcontent" class="iqModicontent" rows="5" cols="200"
															>${list.iqcontent}</textarea>
															<input type="button" value="취소" class="modifyCancel"/>
														</td>
														
													</tr>
												</table>
												<input type="hidden" name="ino" value="${DETAIL.ino}" />
												<input type="hidden" name="iqno" value="${list.iqno}" />
											</form>
										</td>
									</tr>
									
									<c:if test="${!empty list.iqccontent}">
										<tr>
											<td colspan="2" style="padding:30px 20px">${list.iqcnick}</td>
											<td colspan="2" style="padding:30px 20px;width:65%;">${list.iqccontent}</td>
											<td class="center" style="padding:30px 20px">${list.iqcdate}</td>
											<td><a onclick="iqaDelete(${list.iqcno});">삭제</a></td>
											
											
										</tr>
									</c:if>
								</table>
							</td>
						</tr>	
					</c:if>
				</c:forEach>
				<c:if test="${empty QLIST}">
					<tr><td colspan="6" class="center">상품문의가 존재하지 않습니다.</td></tr>
				</c:if>
			</table>
			<c:if test="${!empty QLIST}">
				<div class="center">
					<ul class="pagination" id="qPage">
			            <li>
			               <c:if test="${QPINFO.nowPage > 3}">
			                  <a href="${pageContext.request.contextPath}/item/review/list.com?ino=${param.ino}&qNowPage=${QPINFO.nowPage-3}#question">«</a>
			               </c:if>
			               <c:if test="${QPINFO.nowPage <= 3}">
			                  <a href="${pageContext.request.contextPath}/item/review/list.com?ino=${param.ino}&qNowPage=1#question">«</a>
			               </c:if>
			            </li>
			            <!-- 현재 페이지일때 active --> 
			            <c:forEach begin="${QPINFO.startPage}" end="${QPINFO.endPage}" var="i">
			               <li><!-- 스크립트 적용해야 할것같아요 -->
			                  <a href="${pageContext.request.contextPath}/item/review/list.com?ino=${param.ino}&qNowPage=${i}#question">${i}</a>
			               </li>
			            </c:forEach>            
			            <li>
			               <c:if test="${QPINFO.nowPage < QPINFO.endPage-3}">
			                  <a href="${pageContext.request.contextPath}/item/review/list.com?ino=${param.ino}&qNowPage=${QPINFO.nowPage+3}#question">»</a>
			               </c:if>
			               <c:if test="${QPINFO.nowPage >= QPINFO.endPage-3}">
			                  <a href="${pageContext.request.contextPath}/item/review/list.com?ino=${param.ino}&qNowPage=${QPINFO.endPage}#question">»</a>
			               </c:if>
			            </li>
			        </ul>
				</div>
			</c:if>
			</div>
		</div>


</body>
</html>