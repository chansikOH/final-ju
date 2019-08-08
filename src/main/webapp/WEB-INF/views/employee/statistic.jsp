<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap Example</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style>
	 a{color: #000;}
     a:hover{text-decoration: none;}
    .student-search .title{margin: 20px 0;}
    .student-search .title h1{font-size: 26px;}
    


    
	</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div class="container-fluid">
		<div class="row student-search">
			<div class="col-sm-2">
				<%@include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-sm-10">
				<div class="col-sm-12 title">
				  <h1>학사통계</h1>
				</div>

				<ul class="nav nav-tabs" role="tablist" id="statisticTab">
				  <li role="presentation" class="active"><a href="#studnet-statistic" aria-controls="studnet-statistic" role="tab" data-toggle="tab">학사통계</a></li>
				  <li role="presentation"><a href="#employee-statistic" aria-controls="employee-statistic" role="tab" data-toggle="tab">교원통계</a></li>
				</ul>
				
				<div class="tab-content">
				  <div role="tabpanel" class="tab-pane active" id="studnet-statistic">
				  	<html>
					  <head>
					    <!--Load the AJAX API-->
					    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					    <script type="text/javascript">
					
					      // Load the Visualization API and the corechart package.
					      google.charts.load('current', {'packages':['corechart']});
					
					      // Set a callback to run when the Google Visualization API is loaded.
					      google.charts.setOnLoadCallback(drawChart);
					
					      // Callback that creates and populates a data table,
					      // instantiates the pie chart, passes in the data and
					      // draws it.
					      function drawChart() {
					
					        // Create the data table.
					        var data = new google.visualization.DataTable();
					        data.addColumn('string', 'Topping');
					        data.addColumn('number', 'Slices');
					        data.addRows([
					          ['Mushrooms', 3],
					          ['Onions', 1],
					          ['Olives', 1],
					          ['Zucchini', 1],
					          ['Pepperoni', 2]
					        ]);
					
					        // Set chart options
					        var options = {'title':'How Much Pizza I Ate Last Night',
					                       'width':400,
					                       'height':300};
					
					        // Instantiate and draw our chart, passing in some options.
					        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
					        chart.draw(data, options);
					      }
					    </script>
					  </head>
					
					  <body>
					    <!--Div that will hold the pie chart-->
					    <div id="chart_div"></div>
					  </body>
					</html>
				  </div>
				  
				  
				  <div role="tabpanel" class="tab-pane" id="employee-statistic">
				  	왜 안될까 ..? 
				  </div>
				  
				</div>
				
				<script>
				  $(function () {
				    $('#statisticTab a:last').tab('show')
				  })
				</script>
			</div>
		</div>
	</div>
    

</body>
</html>