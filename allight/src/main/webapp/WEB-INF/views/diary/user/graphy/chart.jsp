<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    위 차트를 통하여 매달 변화된 체중(kg)과 성공률(%)을 확인하고, 지속적인 계획을 수립하여 다이어트를 계속 할 것 인지 여부를 파악할 수 있습니다.
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
    zoomType: 'xy'
  },
  title: {
    text: '월별 다이어트 추이 그래프'
  },
  subtitle: {
    text: ''
  },
  xAxis: [{
    categories: ['1월', '2월', '3월', '4월', '5월', '6월',
      '7월', '8월', '9월', '10월', '11월', '12월'],
    crosshair: true
  }],
  yAxis: [{ // Primary yAxis
    labels: {
      format: '{value} kg',
      style: {
        color: Highcharts.getOptions().colors[1]
      }
    },
    title: {
      text: '체중(kg)',
      style: {
        color: Highcharts.getOptions().colors[1]
      }
    }
  }, { // Secondary yAxis
    title: {
      text: '성공률(%)',
      style: {
        color: Highcharts.getOptions().colors[0]
      }
    },
    labels: {
      format: '{value} %',
      style: {
        color: Highcharts.getOptions().colors[0]
      }
    },
    opposite: true
  }],
  tooltip: {
    shared: true
  },
  legend: {
    layout: 'vertical',
    align: 'left',
    x: 120,
    verticalAlign: 'top',
    y: 100,
    floating: true,
    backgroundColor:
      Highcharts.defaultOptions.legend.backgroundColor || // theme
      'rgba(255,255,255,0.25)'
  },
  series: [{
    name: '성공률(%)',
    type: 'column',
    yAxis: 1,
    data: [50, 55, 60, 70, 60, 60, 65, 70, 80, 82, 85, 90],
    tooltip: {
      valueSuffix: ' %'
    }

  }, {
    name: '체중(kg)',
    type: 'spline',
    data: [87, 86, 85, 83, 85, 85, 84, 83, 81, 80, 79, 77],
    tooltip: {
      valueSuffix: ' kg'
    }
  }]
});

</script>
</body>
</html>