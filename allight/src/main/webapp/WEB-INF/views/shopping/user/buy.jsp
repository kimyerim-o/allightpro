<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript">
		//취소버튼 누르면 뒤로가기
		function goBack(){
			window.history.back();
		}
		
		//모달창 시작
		$(function(){
			//닫기 버튼을 눌렀을 때
		    $('.create_modal .close').click(function(e) {
		       //링크 기본동작은 작동하지 않도록 한다.
		       e.preventDefault();
		       $('#mask_create, .create_modal').hide();
		       $('body').css("overflow", "scroll");
		    });
		 
		    //검은 막을 눌렀을 때
		    $('#mask_create').click(function() {
		       $(this).hide();
		       $('.create_modal').hide();
		       $('body').css("overflow", "scroll");
		    });
		    
		    //모달창 띄울 버튼
		    $('#delivradio2').click(function(){
				wrapCreateByMask();
			    $('body').css("overflow", "hidden");
			})
		})
		
    	function wrapCreateByMask() {
    	   // 화면의 높이와 너비를 구한다.
    	   var maskHeight = $(document).height();
    	   var maskWidth = $(window).width();

    	   // 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    	   $('#mask_create').css({
    	      'width' : maskWidth,
    	      'height' : maskHeight
    	   });

    	   $('#mask_create').fadeTo("slow", 1);

    	   $('.create_modal').show();
    	};
    	
    	function goAddress(aname,aphone,aaddno,aaddress1,aaddress2){
    		$('#name1').val(aname);
    		$('#tel').val(aphone)
    		$('#sample4_postcode').val(aaddno);
    		$('#sample4_roadAddress').val(aaddress1);
    		$('#sample4_detailAddress').val(aaddress2);
    		$('#mask_create, .create_modal').hide();
	       $('body').css("overflow", "scroll");
    	}
    	//모달창 끝
    	
	</script>
</head>
<body>
<h3>상품주문</h3>
<hr/>
<form action="#" id="buy" method="post">

	<!--  어두워지는 부분1  -->
	<div id="mask_create"></div>
	<!-- 모달 부분1 (칼로리 상세) -->
	<div class="create_modal">
		<div class="top" style="">
		   <div class="close" >x</div>
		</div>
		<div class="bottom">
			<!-- 배송지 팝업 -->
			<div>
				<!-- 목록출력 -->
				<table class="table">
					<tbody>
						<tr>
							<th>수령인</th>
							<th>연락처</th>
							<th>우편번호</th>
							<th>주소</th>
							<th>선택</th>
						</tr>
						<c:forEach items="${LIST}" var="list">
							<tr class="dataRow">
								<td>${list.aname}</td>
								<td>${list.aphone}</td>
								<td>${list.aaddno}</td>
								<td>${list.aaddress1} , ${list.aaddress2}</td>
					  			<td>
									<input type="button" id="cBtn" value="선택" onclick="goAddress('${list.aname}','${list.aphone}','${list.aaddno}','${list.aaddress1}','${list.aaddress2}')">	<!-- 선택누르면 js이용해서 view단 배송지로 보내기 -->
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="contents">	
		<!-- 주문페이지에서 장바구니 > 주문 > 결제 이 부분 
		<div class="order_top_wrap">
			<div class="order_top">
				<div class="order_title1">주문/결제</div>
				<ul class="order_subtitle_list">
					<li>
						<div class="order_subtitle1"><h2>장바구니</h2></div>
					</li>
					<li>
						<div class="order_subtitle2 on"><h2>주문/결제</h2></div>
					</li>
					<li>
						<div class="order_subtitle3"><h2>결제완료</h2></div>
					</li>
				</ul>
			</div>
		</div> -->

		<!-- 주문페이지 상품 상세 시작 -->
		<table class="order_tbl" border="1" summary="주문 리스트">
			<thead>
				<tr>
					<th class="order_amount" colspan="3" scope="col">주문 상품 정보</th>
					<th class="order_amount" colspan="1"scope="col">수량</th>
					<th class="order_amount" colspan="2" scope="col">주문 금액</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sum0" value="0" /><!-- 수량 set -->
				<c:forEach var="list" items="${clist}">
					<tr>
						<td class="order_thmb" colspan="1"><!-- 상품이미지 -->
							<a><img src="${list.imgimages}" style="height:200px; width:200px; overflow:hidden;" onerror="this.src='${pageContext.request.contextPath}/resources/img/no-img.png'" /></a>
						</td>
						<td colspan="2"><!-- 상품정보 -->
							<div style="height:200px; line-height:200px;"><a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${list.ino}">${list.iname}</a></div>
						</td>
						<td class="iamount" scope="col" colspan="1"> <!-- 장바구니 수량 -->
							<input type="hidden" id="origin_qty" value="${list.caamount}" maxlength="3"/>
							<input type="text" id="number" class="numBox" value="${list.caamount}" readonly="readonly" 
								style="font-size:16px; width:50px; padding:5px; margin:0; border:1px solid #eee;"/>
						</td>
						<td scope="col" colspan="2"><!-- 판매가 -->
							<div class="tb-center">
								<p class="price" style="height:200px; line-height:200px;margin:0;">
									<fmt:formatNumber pattern="#,###" value="${list.iprice}" />원
								</p>
							</div>
						</td>
					</tr>
				<c:set var="sum0" value="${sum0 + (list.iprice*list.caamount)}" />
				</c:forEach>
			</tbody>
		</table>

		<!-- 구매자 정보 영역 시작 -->
		<div class="order_detail mt80">
			<h3 class="order_detail_tit">주문자 정보</h3>
			<table>
				<tbody>
					<tr>
						<th style="width:150px" class="center">이름</th>
						<td>${sessionScope.MNAME}</td>
					</tr>
					<tr>
						<th style="width:150px" class="center">휴대폰 번호</th>
						<td>${sessionScope.MTEL}</td>
					</tr>
					<tr>
						<th style="width:150px" class="center">이메일</th>
						<td>${sessionScope.MEMAIL}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!--    배송지 정보 영역 시작 -->
		<div class="order_detail mt80">
			<h3 class="order_detail_tit">배송지 정보</h3>
			<table class="tbl" border="1" summary="정보">
				<tbody>
				<tr>
					<th>배송지선택</th>
					<td>
						<div id="addrradio">
							<input id="delivradio1" class="order_rdo" type="radio" onclick="" checked="checked" value="" name="delivaddradio">
							<label style="margin-right:15px">신규 배송지</label>
							<input id="delivradio2" class="order_rdo" type="button" onclick="" value="기본 배송지" name="delivaddradio">
						</div>
					</td>
				</tr>

				<tr>
					<th>받으실분</th><!-- 자바스크립트로  체크박스 선택하면 이름,연락처 받아오게 처리-->
					<td><input type="text" style="width:130px" name="name1" id="name1" value="" maxlength="20" placeholder="받으실 분 성함 입력">&nbsp;&nbsp;
						<input type="checkbox" name="namecheck" id="namecheck"> 구매자 정보와 동일하게 입력
					</td>
				</tr>
				<tr>
					<th>
					<span>연락처</span>
					</th>
					<td>
						<input class="order_txt order_dimmed" style="width:200px" type="tel" name="tel" id="tel" value="" maxlength="">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						<input type="text" id="sample4_postcode" placeholder="우편번호" style="width:100px"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width:250px">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width:250px">
						
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
						    function sample4_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var roadAddr = data.roadAddress; // 도로명 주소 변수
						                var extraRoadAddr = ''; // 참고 항목 변수
						
						                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                    extraRoadAddr += data.bname;
						                }
						                // 건물명이 있고, 공동주택일 경우 추가한다.
						                if(data.buildingName !== '' && data.apartment === 'Y'){
						                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                }
						                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                if(extraRoadAddr !== ''){
						                    extraRoadAddr = ' (' + extraRoadAddr + ')';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample4_postcode').value = data.zonecode;
						                document.getElementById("sample4_roadAddress").value = roadAddr;
						                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
						                
						                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						                if(roadAddr !== ''){
						                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						                } else {
						                    document.getElementById("sample4_extraAddress").value = '';
						                }
						
						                var guideTextBox = document.getElementById("guide");
						                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						                if(data.autoRoadAddress) {
						                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
						                    guideTextBox.style.display = 'block';
						
						                } else if(data.autoJibunAddress) {
						                    var expJibunAddr = data.autoJibunAddress;
						                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
						                    guideTextBox.style.display = 'block';
						                } else {
						                    guideTextBox.innerHTML = '';
						                    guideTextBox.style.display = 'none';
						                }
						            }
						        }).open();
						    }
						</script>
					</td>
				</tr>
				<tr class="last">
					<th>
					<span>배송요청사항</span><!-- 자바스크립트로 select하면 textbox에 보이게 -->
					</th>
					<td>
						<div class="order_select_box" style="width:300px">
							<select class="order_select" style="width:300px" name="delivreq1" id="delivreq1">
								<option value="0" selected="selected">선택하세요</option>
								<option value="4">부재시 핸드폰으로 연락바랍니다.</option>
								<option value="5">부재시 경비실에 맡겨주세요.</option>
								<option value="6">빠른 배송 부탁드립니다.</option>
								<option value="7">배송전 핸드폰으로 연락바랍니다.</option>
								<option value="8">직접 입력</option>
							</select>
							<span class="order_select_arr"></span>
						</div>
						<p class="mt5">
						<textarea class="tbl_addr_txt placeholder" style="width:392px" maxlength="50" cols="50" rows="5" placeholder="(직접입력)최대 50자까지 입력가능합니다." name="req1" id="req1"></textarea>
						<span class="s fc999 byteCnt">(최대 50자)</span>
						</p><div class="order">
							<p class="order_notice">※ "배송요청사항"은 택배기사님들이 확인하는 메시지로써, 배송 연기 요청 등<br> 판매자에게 전달할 요청사항은 꼭! 고객센터로 연락주세요.</p>
						</div>
						<p></p>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		
		<!--결제 정보 영역 시작 -->
		<!--결제금액박스-->
		<div>
			<h3>총 주문금액</h3>
		</div>
		<table>
			<thead>
				<tr>
					<th colspan="2">주문금액</th>
					<th colspan="1"></th>
					<th colspan="1">배송비</th>
					<th colspan="1"></th>
					<th colspan="2">총 결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr id="list" class="list">
					<td class="sum" colspan="2" ><h3><fmt:formatNumber pattern="#,###" value="${sum0}" />원</h3></td>
					<td colspan="1" ><h3>+</h3></td>
					<td colspan="1" ><h3>무료</h3></td>
					<td colspan="1" ><h3>=</h3></td>
					<td class="sum" colspan="2" ><h3><fmt:formatNumber pattern="#,###" value="${sum0}" />원</h3></td>
				</tr>
			</tbody>
		</table>

		<!--   주문동의 영역 시작 -->
		<div>
			<h3>주문동의 </h3>
			<label>
				<input type="checkbox" id="aggchk">
				</label><em>주문할 상품의 상품, 가격, 배송정보 등을 최종 확인하였으며, 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며, 이에 동의합니다.</em>
				<div></div><div></div><hr/>
		</div>
		<div></div>
		<div></div>
		<!--  결제하기/ 취소 버튼 영역 시작 -->
		<div class="center">
			<input type="button" id="cacbtn" value="취소" onclick="goBack();" />
			<input type="submit" id="paybtn" value="결제는 아직" />
		</div>
</div>
</form>
</body>
</html>