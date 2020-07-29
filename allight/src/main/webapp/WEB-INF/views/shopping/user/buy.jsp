<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript">
		function goBack(){
			window.history.back();
		}
	</script>
</head>
<body>
<h3>상품주문</h3>
<hr/>
<form action="./buy.com" id="buy" method="post">
	<div class="contents">	
		<!-- <div class="order_top_wrap">
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

		<!-- 주문페이지 상품 상세 시작 -------------->
		<table class="order_tbl" border="1" summary="주문 리스트">
			<thead>
				<tr>
					<th class="order_amount" colspan="3" scope="col">주문 상품 정보</th>
					<th class="order_amount" colspan="1"scope="col">수량</th>
					<th class="order_amount" colspan="2" scope="col">주문 금액</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sum0" value="0" />
				<c:forEach var="list" items="${clist}">
					<tr>
						<td class="order_thmb" colspan="1"><!-- 상품이미지 -->
							<a><img src="${list.imgimages}" style="height:200px; width:200px; overflow:hidden;" onerror="this.src='${pageContext.request.contextPath}/resources/img/no-img.png'" /></a>
						</td>
						<td colspan="2"><!-- 상품정보 -->
							<div style="height:200px; line-height:200px;"><a href="${pageContext.request.contextPath}/shopping/detail.com?ino=${list.ino}">${list.iname }</a></div>
						</td>
						<td class="iamount" scope="col" colspan="1">
							<input type="hidden" id="origin_qty" value="${list.caamount }" maxlength="3"/>
							<input type="text" id="number" class="numBox" value="${list.caamount }" readonly="readonly" 
								style="font-size:16px; width:50px; padding:5px; margin:0; border:1px solid #eee;"/>
						</td>
						<td scope="col" colspan="2"><!-- 판매가 -->
							<div class="tb-center">
								<p class="price" style="height:200px; line-height:200px;margin:0;">
								<fmt:formatNumber pattern="#,###" value="${list.iprice }" />원
								</p>
							</div>
						</td>
					</tr>
				<c:set var="sum0" value="${sum0 + (list.iprice*list.caamount)}" />
				</c:forEach>
			</tbody>
		</table>

		<!--    구매자 정보 영역 시작 -------------->
		<div class="order_detail mt80">
			<h3 class="order_detail_tit">주문자 정보</h3>
			<div>
				<ul>
					<li><span>이름</span> : ${sessionScope.MNAME }</li>
					<li><span>휴대폰 번호</span> : ${sessionScope.MTEL }</li>
					<li>이메일 : ${sessionScope.MEMAIL }</li>
				</ul>
			</div>
		</div>

		<!--    배송지 정보 영역 시작 -------------->
		<div class="order_detail mt80">
		<h2>정보</h2>
			<h3 class="order_detail_tit">배송지 정보</h3>
			<table class="tbl" border="1" summary="정보">
				<tbody>
				<tr>
					<th>배송지선택</th>
					<td>
						<div id="addrradio">
							<input id="delivradio1" class="order_rdo" type="radio" onclick="" checked="checked" value="" name="delivaddradio">
							<label style="margin-right:15px">기본 배송지</label>
							<input id="delivradio2" class="order_rdo" type="radio" onclick="" value="user" name="delivaddradio">
							<label style="margin-right:15px" for="">신규 배송지</label>
						</div>
					</td>
				</tr>

				<tr>
					<th>받으실분</th>
					<td><input type="text" style="width:130px" name="name1" id="name1" value="" maxlength="20" placeholder="받으실 분 성함 입력">&nbsp;&nbsp;
						<input type="checkbox" name="namecheck" id="namecheck"> 구매자 정보와 동일하게 입력
					</td>
				</tr>

				<tr>
					<th>주소</th>
					<td>
						<p>
							<input class="order_txt2" style="width:130px" type="text" name="newzipcode" id="newzipcode" value="" maxlength="3" disabled="disabled" data-oval="">
							<input class="order_txt2" style="width:55px" type="hidden" name="post11" id="post11" value="" maxlength="3" disabled="disabled" data-oval="">&nbsp;&nbsp;
							<input class="order_txt2" style="width:54px" type="hidden" name="post12" id="post12" value="" maxlength="3" disabled="disabled" data-oval="">
							<a href="javascript:execDaumPostcode();" alt="우편번호"><span class="order_btn_cmn"></span></a>
							<span class="order_default_ch">
								<input id="dchk1" type="checkbox">
								<label for="">기본 배송지로 선택</label>
							</span>
						</p>
						<p>
							<input class="order_txt2" style="width:400px" type="text" name="address11" id="address11" value="" disabled="disabled" data-sido="" data-oval="" data-ovalsido=""><span id="addressspan1">&nbsp;기본 주소<br></span>
							<span id="seladdr1" style="display:none;" data-sido="">
							<input id="seljibun" class="order_txt2" type="text" onclick="" style="width:400px" value="" disabled="disabled">&nbsp;<span class="ads_input"><input type="radio" name="seladdrradio" id="saradio1" value="" oninput=""></span>지번 기본주소<br>
							<input id="selroad" class="order_txt2" type="text" onclick="" style="width:400px" value="" disabled="disabled">&nbsp;<span class="ads_input"><input type="radio" name="seladdrradio" id="saradio2" value="" oninput=""></span>도로명 기본주소<br>
							</span>
							<input class="order_txt placeholder" type="text" style="width:400px" name="address12" id="address12" value="" placeholder="상세주소 입력" data-oval="">&nbsp;나머지 주소 <span class="delivery_option" id="deliveryinfo"></span>
						</p>
					</td>
				</tr>
				<tr>
					<th>
					<span>연락처</span>
					</th>
					<td>
						<select class="order_select" style="width:60px" name="tel11" id="tel11" data-oval="">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="070">070</option>
							<option value="0503">0503</option>
							<option value="0504">0504</option>
							<option value="0505">0505</option>
						</select><span class="order_select_arr"></span>
						&nbsp;-&nbsp;
						<input class="order_txt order_dimmed" style="width:110px" type="tel" name="tel12" id="tel12" value="" maxlength="4">
						&nbsp;-&nbsp;
						<input class="order_txt order_dimmed" style="width:110px" type="tel" name="tel13" id="tel13" value="" maxlength="4">
					</td>
				</tr>
				
				<tr class="last">
					<th>
					<span>배송요청사항</span>
					</th>
					<td>
						<div class="order_select_box" style="width:400px">
							<select class="order_select" style="width:400px" name="delivreq1" id="delivreq1">
								<option value="0" selected="">선택하세요</option>
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
						<span class="s fc999 byteCnt">(<span>0</span>/50자)</span>
						</p><div class="order">
							<p class="order_notice">※ "배송요청사항"은 택배기사님들이 확인하는 메시지로써, 배송 연기 요청 등<br> 판매자에게 전달할 요청사항은 꼭! 고객센터로 연락주세요.</p>
						</div>
						<p></p>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		
		<!--결제 정보 영역 시작 -------------->
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

		<!--   주문동의 영역 시작 -------------->
		<div>
			<h3>주문동의 </h3><hr/>
			<label>
				<input type="checkbox" id="aggchk">
				</label><em>주문할 상품의 상품, 가격, 배송정보 등을 최종 확인하였으며, 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며, 이에 동의합니다.</em>
				<div></div><div></div><hr/>
		</div>
		<div></div>
		<div></div>
		<!--  결제하기/ 취소 버튼 영역 시작 -------------->
		<div class="center">
			<input type="button" id="cacbtn" value="취소" onclick="goBack();" />
			<input type="button" id="paybtn" value="결제는 아직" onclick="location.href='${pageContext.request.contextPath}#'"/>
		</div>
</div>
</form>
</body>
</html>