<%@ page language="java" contentType="text/html" 
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function myFAE(day,dno){
	$('#num').val(dno);
	$('#year').val(${today_info.search_year});
	$('#month').val(${today_info.search_month});
	$('#day').val(day);
	$('#myFAEFrm').submit();
};

</script>

</head>

<body>
<div id="wrap">
	<a class="title">다이어리 <%=session.getAttribute("MID") %> / <%=session.getAttribute("COID") %>
		<input type="button" value="월별 다이어트 추이  &gt;" class="goto"/>
	</a>
	
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">
	
		<div class="calendar" id="calendar">
		
			<!--날짜 네비게이션  -->
			<div class="main-nav">
				<!-- 이전해 -->
				<a class="before_after_year" href="./main.com?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
					&lt;&lt;
				</a> 
				<!-- 이전달 -->
				<a class="before_after_month" href="./main.com?year=${today_info.before_year}&month=${today_info.before_month}">
					&lt;
				</a> 
				<!-- 이번달 -->
				<span class="this_month">
					&nbsp;&nbsp;${today_info.search_year}. 
					<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}&nbsp;&nbsp;
				</span>
				<!-- 다음달 -->
				<a class="before_after_month" href="./main.com?year=${today_info.after_year}&month=${today_info.after_month}">
					&gt;
				</a> 
				<!-- 다음해 -->
				<a class="before_after_year" href="./main.com?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
					&gt;&gt;
				</a>
			</div>
		
			<table class="calendar_body">
			<thead>
				<tr bgcolor="#CECECE" class="main-thead-tr">
					<td class="day sun" >일</td>
					<td class="day" >월</td>
					<td class="day" >화</td>
					<td class="day" >수</td>
					<td class="day" >목</td>
					<td class="day" >금</td>
					<td class="day sat" >토</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<td class="today" onclick="myFAE(${dateList.day},${dateList.dno});">
									<div class="date">
										${dateList.day}
									</div>
									<c:if test="${dateList.day!=''}">
										<div class="main-imgs-div">
											<c:if test="${dateList.dfoodcal ne 0 or dateList.dexercal ne 0 or dateList.dweight ne 0 or !empty dateList.ddiary or !empty dateList.dimage}">
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/cutlery.png">
													<div class="main-text-div">${dateList.dfoodcal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/dumbbell.png">
													<div class="main-text-div">${dateList.dexercal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/scale.png">
													<div class="main-text-div">${dateList.dweight}</div>
												</div>
											</c:if>
										</div>
									</c:if>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat">
										${dateList.day}
									</div>
									<c:if test="${dateList.day!=''}">
										<div class="main-imgs-div">
											<c:if test="${dateList.dfoodcal ne 0 or dateList.dexercal ne 0 or dateList.dweight ne 0 or !empty dateList.ddiary or !empty dateList.dimage}">
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/cutlery.png">
													<div class="main-text-div">${dateList.dfoodcal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/dumbbell.png">
													<div class="main-text-div">${dateList.dexercal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/scale.png">
													<div class="main-text-div">${dateList.dweight}</div>
												</div>
											</c:if>
										</div>
									</c:if>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==0}">
				</tr>
				<tr>
								<td class="sun_day">
									<div class="sun">
										${dateList.day}
									</div>
									<c:if test="${dateList.day!=''}">
										<div class="main-imgs-div">
											<c:if test="${dateList.dfoodcal ne 0 or dateList.dexercal ne 0 or dateList.dweight ne 0 or !empty dateList.ddiary or !empty dateList.dimage}">
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/cutlery.png">
													<div class="main-text-div">${dateList.dfoodcal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/dumbbell.png">
													<div class="main-text-div">${dateList.dexercal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/scale.png">
													<div class="main-text-div">${dateList.dweight}</div>
												</div>
											</c:if>
										</div>
									</c:if>
								</td>
							</c:when>
							<c:otherwise>
								<td class="normal_day">
									<div class="date">
										${dateList.day}
									</div>
									<c:if test="${dateList.day!=''}">
										<div class="main-imgs-div">
											<c:if test="${dateList.dfoodcal ne 0 or dateList.dexercal ne 0 or dateList.dweight ne 0 or !empty dateList.ddiary or !empty dateList.dimage}">
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/cutlery.png">
													<div class="main-text-div">${dateList.dfoodcal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/dumbbell.png">
													<div class="main-text-div">${dateList.dexercal}</div>
												</div>
												<div>
													<img src="${pageContext.request.contextPath}/resources/img/scale.png">
													<div class="main-text-div">${dateList.dweight}</div>
												</div>
											</c:if>
										</div>
									</c:if>
								</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tbody>
			</table>
		</div>
	</form>
</div>

<form action="./myFAE.com" method="post" id="myFAEFrm">
	<input type="hidden" name="num" id="num"/>
	<input type="hidden" name="year" id="year"/>
	<input type="hidden" name="month" id="month"/>
	<input type="hidden" name="day" id="day"/>
</form>
</body>
</html>
