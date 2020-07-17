<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content=width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js">
</script>
<script>
function checks(){ 
	if($("#sample4_roadAddress").val() == ""){ 
		alert("주소 입력바람"); 
		$("#sample4_roadAddress").focus(); 
		return false; 
		}
	if($("#sample4_detailAddress").val() == ""){ 
		alert("주소 입력바람"); 
		$("#sample4_detailAddress").focus(); 
		return false; 
		}
		
	return true;
}
</script>
<script>
$(function(){
	//삭제하기 버튼 클릭시
	$("#dBtn").click(function(){
		$("#imsiFrm").attr("action","../user/addressdelete.com");
		$("#imsiFrm").submit(); 
	});
});
</script>

</head>
<body>
<form id="addressinsert" action="../user/addressinsert.com" method="post">
	<table class="table" border="1">
		<tbody>
		<tr>
			<th>
				<div>	
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<input type="text" name="aname" placeholder="수령인">
					<input type="text" name="aphone" placeholder="연락처"><br>
				</div>
			</th>
		</tr>
		<tr>
			<th>			
					<input type="text" name="aaddno" id="sample6_postcode" placeholder="우편번호">
					<input type="text" name="aaddress1" id="sample6_address" placeholder="주소">
					<input type="text" name="aaddress2" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" name="aaddress3" id="sample6_extraAddress" placeholder="참고항목">
			</th>
		</tr>
		<tr>
			<th>
				<input type="submit" value="추가">
			</th>
		</tr>
		</tbody>
	</table>
</form> 

		<!-- 목록출력 -->
		<table class="table">
			<tbody>
				<tr>
					<th>수령인</th>
					<th>연락처</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>삭제</th>
				</tr>
				
				<c:forEach items="${LIST}" var="list">
				<tr class="dataRow">
					<td>${list.aname}</td>
					<td>${list.aphone}</td>
					<td>${list.aaddno}</td>
					<td>${list.aaddress1}${list.aaddress2}</td>
		  			<td><input type="button" id="dBtn" value="삭제"></td>
					<td class="no" hidden>
						<form id="imsiFrm"	method="POST">
							<input type="text" name="no" value="${list.ano}"/>
						</form>
					</td>
				

				</tr>
				</c:forEach>
			</tbody>
		</table>




<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
		

</body>
</html>