<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	// 음식 칼로리 추가
	$('#insertFoodBtn').click(function(){
		document.myForm.action='./insertMyFoodFrm.com';
		$('#myForm').submit();
	})
	
	// 운동 칼로리 추가
	$('#insertExerBtn').click(function(){
		document.myForm.action='./insertMyExerFrm.com';
		$('#myForm').submit();
	})
	
	// 뒤로가기
	$('.goBack').click(function(){
		document.location.href='./main.com';
	})
	
	// 몸무게 업데이트
	$('#dweight').change(function(){
		if('${DATE}'!=''){
			$.ajax({
	            type : 'post',
	            url : './updateDweight.com',
	            data : {"num":${num},
	            		"ddate":"${DATE}",
	            		"dweight":$('#dweight').val()},
	            error: function(xhr, status, error){
	                alert(error);
	            },
	            success : function(data){
	                $('#num').val(Number(data));
	                if(${num}==0){
	        			location.href="./myFAE.com?num="+data;
	        		}
	            }
	        });
		}else {
			$.ajax({
	            type : 'post',
	            url : './updateDweight.com',
	            data : {"num":${num},
	            		"dweight":$('#dweight').val()},
	            error: function(xhr, status, error){
	                alert(error);
	            },
	            success : function(data){
	                $('#num').val(Number(data));
	                if(${num}==0){
	        			location.href="./myFAE.com?num="+data;
	        		}
	            }
	        });
		}
	})
	
	// 일기 업데이트
	$('#ddiary').change(function(){
		if('${DATE}'!=''){
			$.ajax({
	            type : 'post',
	            url : './updateDdiary.com',
	            data : {"num":${num},
	            		"ddate":"${DATE}",
	            		"ddiary":$('#ddiary').val()},
	            error: function(xhr, status, error){
	                alert(error);
	            },
	            success : function(data){
	            	num = Number(data);
	            	if(${num}==0){
	        			location.href="./myFAE.com?num="+data;
	        		}
	            }
	        });
		}else {
			$.ajax({
	            type : 'post',
	            url : './updateDdiary.com',
	            data : {"num":${num},
	            		"ddiary":$('#ddiary').val()},
	            error: function(xhr, status, error){
	                alert(error);
	            },
	            success : function(data){
	                $('#num').val(Number(data));
	                if(${num}==0){
	        			location.href="./myFAE.com?num="+data;
	        		}
	            }
	        });
		}
	})
	
	// 섭취칼로리 모두 지우기
	$('#deleteFoodAll').click(function(){
		if(${!empty FLIST}){
			if(confirm("정말 모두 삭제하시겠습니까?\n삭제하면 다시 복구할 수 없습니다.")){
				$.ajax({
		            type : 'post',
		            url : './myFoodDeleteAll.com',
		            data : {"dno":${num}},
		            error: function(xhr, status, error){
		                alert(error);
		            },
		            success : function(data){
		            	location.reload();
		            },
		        });
			}
		}else{
			alert('삭제할 섭취 칼로리가 존재하지 않습니다.');
		}
	})
	
	// 소비칼로리 모두 지우기
	$('#deleteExerAll').click(function(){
		if(${!empty ELIST}){
			if(confirm("정말 모두 삭제하시겠습니까?\n삭제하면 다시 복구할 수 없습니다.")){
				$.ajax({
		            type : 'post',
		            url : './myExerDeleteAll.com',
		            data : {"dno":${num}},
		            error: function(xhr, status, error){
		                alert(error);
		            },
		            success : function(data){
		            	location.reload();
		            },
		        });
			}
		}else{
			alert('삭제할 소비 칼로리가 존재하지 않습니다.');
		}
	})
	
	// 다이어리 삭제
	$('#deleteAll').click(function(){
		if(${!empty DIARY.dno}){
			if(confirm("다이어리를 삭제하시겠습니까?\n삭제하면 다시 복구할 수 없습니다.")){
				document.location.href="./myDiaryDelete.com?dno="+${num};
			}
		}else{
			alert('삭제할 내용이 존재하지 않습니다.')
		}
	})
	
	
})

function mfdel(dno,mfno){
	if(confirm("삭제하시겠습니까?\n삭제하면 다시 복구할 수 없습니다.")){
		document.location.href="./myFoodDelete.com?dno="+dno+"&mfno="+mfno;
	}
}

function medel(dno,meno){
	if(confirm("삭제하시겠습니까?\n삭제하면 다시 복구할 수 없습니다.")){
		document.location.href="./myExerDelete.com?dno="+dno+"&meno="+meno;
	}
}

function updateDimage(input){
	//var dimage = input.value.substring(input.value.lastIndexOf('\\')+1)
	var formData = new FormData();
	var inputFile = $("#uploadImgBtn");
	var files = inputFile[0].files;
	
	formData.append("num",${num});
	formData.append("dimageFile", files[0]);
	
	$.ajax({
        type : 'post',
        url : './updateDimage.com',
        processData : false,
		contentType : false,
		data : formData,
        error: function(xhr, status, error){
            alert(error);
        },
        success : function(data){
        	//data = decodeURI(data);
			//alert(data)
        	location.href="./myFAE.com?num="+data;
       },
  	});
	
}

</script>
</head>
<body>
<div id="wrap2">
	<div class="title2">다이어리
		<div class="f-right" style="margin:0 20px 0 0">
			<input type="button" value="뒤로 가기" class="goBack">
		</div>
	</div>
	<div class="diary-content">
		<div class="title3">몸무게
			<a>
				<c:if test="${DIARY.dweight eq 0}">
					<input type="text" name="dweight" id="dweight"/>kg
				</c:if>
				<c:if test="${DIARY.dweight ne 0}">
					<input type="text" name="dweight" id="dweight" value="${DIARY.dweight}"/>kg
				</c:if>
			</a>
		</div>
		
		<div class="title3">음식
			<div class="f-right">
				<input type="button" value="모두 지우기" id="deleteFoodAll"/>
				<input type="button" value="추가" id="insertFoodBtn"/>
			</div>
		</div>
		<table id="myFood">
			<tr>
				<th width="10%">구분</th>
				<th width="45%">이름</th>
				<th width="15%">수량(회)</th>
				<th width="25%">칼로리</th>
				<th width="5%"></th>
			</tr>
			<c:forEach var="list" items="${FLIST}">
				<tr>
					<td class="center">${list.mftype}</td>
					<td class="center">${list.mfname}&nbsp;(${list.mfgram}g)</td>
					<td class="center">${list.mfamount}</td>
					<td class="center">${list.mftotalcal}</td>
					<td class="center" onclick="mfdel(${list.dno},${list.mfno});">X</td>
				</tr>
			</c:forEach>
			<c:if test="${empty FLIST}">
				<tr>
					<td colspan="5" class="center">섭취한 칼로리 정보가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<div class="right">총 섭취 칼로리: <a class="mTotal">${DIARY.dfoodcal}<c:if test="${empty DIARY.dfoodcal}">0</c:if></a>kcal</div>
		
		<div class="title3">운동
			<div class="f-right">
				<input type="button" value="모두 지우기" id="deleteExerAll"/>
				<input type="button" value="추가" id="insertExerBtn"/>
			</div>
		</div>
		<table id="myExer">
			<tr>
				<th width="55%">이름</th>
				<th width="15%">시간(분)</th>
				<th width="25%">칼로리</th>
				<th width="5%"></th>
			</tr>
			<c:forEach var="list" items="${ELIST}">
				<tr>
					<td class="center">${list.mename}</td>
					<td class="center">${list.metime}</td>
					<td class="center">${list.metotalcal}</td>
					<td class="center" onclick="medel(${list.dno},${list.meno});">X</td>
				</tr>
			</c:forEach>
			<c:if test="${empty ELIST}">
				<tr>
					<td colspan="5" class="center">소비한 칼로리 정보가 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<div class="right">총 소비 칼로리: <a class="fTotal">${DIARY.dexercal}<c:if test="${empty DIARY.dexercal}">0</c:if></a>kcal</div>
		
		<div class="title3">일기</div>
		<textarea name="ddiary" id="ddiary" placeholder="내용을 입력해주세요" style="width:100%; min-height:100px;">${DIARY.ddiary}</textarea>
		
		<div class="title3">변화사진
			<a style="color:gray">사진 등록은 한 장만 가능합니다.</a>
			<div class="f-right">
				<input type="file" title="사진등록" id="uploadImgBtn" onchange="updateDimage(this);"/>
				<input type="button" value="삭제" id="deleteImgBtn"/>
			</div>
		</div>
		<div class="center">
			<img src="${DIARY.dimage}" id="imgPreview" class=""  style="height:auto;width:400px;margin:20px 0 0;">
		</div>
		<div class="center" style="margin:50px 0 0;">
			<input type="button" value="게시판등록" id="toBoard"/>
			<input type="button" value="모두 지우기" id="deleteAll"/>
			<input type="button" value="뒤로가기" class="goBack"/>
		</div>
	</div>
</div>


<form method="post" id="myForm" name="myForm">
	<input type="hidden" name="num" value="${num}" id="num"/>
	<c:if test="${!empty DATE}">
		<input type="hidden" name="ddate" value="${DATE}"/>
	</c:if>
</form>
</body>
</html>