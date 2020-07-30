<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">
        This chart shows how data labels can be added to the data series. This
        can increase readability and comprehension for small datasets.
    </p>
</figure>



<style>
.highcharts-figure, .highcharts-data-table table {
  min-width: 310px;
  max-width: 800px;
  margin: 1em auto;
}

#container {
  height: 400px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-data-table tr:hover {
  background: #f1f7ff;
}
</style>




<script>






													



Highcharts.chart('container', {
	  chart: {
	    type: 'line'
	  },
	  title: {
	    text: 'Allight'
	  },
	  subtitle: {
	    text: '월별 다이어트 현황판'
	  },
	  xAxis: {
	    categories: [<c:forEach var="list" items="${LIST}" varStatus="status">${list.ddate},</c:forEach>]
	  
	  
	  
	  },
	  yAxis: {
	    title: {
	      text: 'Weight (Kg)'
	    }
	  },
	  plotOptions: {
	    line: {
	      dataLabels: {
	        enabled: true
	      },
	      enableMouseTracking: false
	    }
	  },
	  series: [{
	    name: '몸무게',
	    data: [<c:forEach var="list" items="${LIST}" varStatus="status">${list.dweight},</c:forEach>]
	  }]
	});



</script>
</body>
</html>