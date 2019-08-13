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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<style>
		.side-padding{padding-left: 0;}
		.panel-heading{font-size: 20px;}
		.yaer-select{width: 200px; margin-top: 20px}
		.search-option p{font-size: 14px; margin: 15px; text-align: right;}
	</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div class="container-fluid">
		<div class="row student-search">
			<div class="col-sm-2 side-padding">
				<%@include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-sm-10">
				<div class="form-group yaer-select">
					<select class="form-control" name="option" >
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                    </select>
				</div>
				<ul class="nav nav-tabs" role="tablist" id="statisticTab">
				  <li role="presentation" class="active"><a href="#studnet-statistic" aria-controls="studnet-statistic" role="tab" data-toggle="tab">학사통계</a></li>
				  <li role="presentation"><a href="#employee-statistic" aria-controls="employee-statistic" role="tab" data-toggle="tab">교원통계</a></li>
				</ul>
				
				<div class="tab-content" style="margin-top:10px;">
				  <div role="tabpanel" class="tab-pane active" id="studnet-statistic">
				  	<div class="row">
				  		<div class="col-sm-6">
				  			<div class="panel panel-default">
				  				<div class="panel-heading"> 2019 입학생 성비</div>
				  				<div class="panel-body">
				  					<div id="chart-div1"></div>
				  				</div>
				  			</div>
				  		</div>
				  		<div class="col-sm-6">
				  			<div class="panel panel-default">
				  				<div class="panel-heading">2019 재ㆍ편입생 비율</div>
				  				<div class="panel-body">
				  					<div id="chart-div2"></div>
				  				</div>
				  			</div>
				  		</div>
				  	</div>
				  	<div class="row">
				  		<div class="col-sm-6">
				  			<div class="panel panel-default">
				  				<div class="panel-heading">2019 학과별 신입생</div>
				  				<div class="panel-body">
				  					<div id="chart-div3"></div>
				  				</div> 
				  			</div>
				  		</div>
				  		<div class="col-sm-6">
				  			<div class="panel panel-default">
				  				<div class="panel-heading">2019 신입생 연령비</div>
				  				<div class="panel-body">
				  					<div id="chart-div4"></div>
				  				</div> 
				  			</div>
				  		</div>
				  	
				  	</div>
				  	<div class="search-option">
				  		<p><strong>※ 언젠가 쓰이겠지</strong></p>
				  	</div>
				  </div> 
				  <div role="tabpanel" class="tab-pane active" id="employee-statistic">
				  	
				  </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
      
      var chart1Data = [];
      var chart2Data = [];
      var chart3Data = [];
      var chart4Data = [];
      
      function drawChart1() {
          var data1 = new google.visualization.DataTable();
          data1.addColumn('string', 'Topping');
          data1.addColumn('number', 'Slices');
          data1.addRows(chart1Data);
          
          var options1 = {'width':700,
                         'height':300};
          
          var chart1 = new google.visualization.PieChart(document.getElementById('chart-div1'));
          chart1.draw(data1, options1);
      } 
                  
      function drawChart2() {
      
          var data2 = new google.visualization.DataTable();
          data2.addColumn('string', 'Topping');
          data2.addColumn('number', 'Slices');
          data2.addRows(chart2Data);
          
          var options2 = {'width':700,
                         'height':300};
          
          var chart2 = new google.visualization.PieChart(document.getElementById('chart-div2'));
          chart2.draw(data2, options2);
      }
      function drawChart3() {
      
          var data3 = new google.visualization.DataTable();
          data3.addColumn('string', 'Topping');
          data3.addColumn('number', 'Slices');
          data3.addRows(chart3Data);
          
          var options3 = {'width':700,
                         'height':300};
          
          var chart3 = new google.visualization.PieChart(document.getElementById('chart-div3'));
          chart3.draw(data3, options3);
      }
      function drawChart4() {
      
          var data4 = new google.visualization.DataTable();
          data4.addColumn('string', 'Topping');
          data4.addColumn('number', 'Slices');
          data4.addRows(chart4Data);
          
          var options4 = {'width':700,
                         'height':300};
          
          var chart4 = new google.visualization.PieChart(document.getElementById('chart-div4'));
          chart4.draw(data4, options4);
      }
      
      /*검색년도별 정보*/
      function searchStudentStatistic(year){
    	  chart1Data = [];
          chart2Data = [];
          chart3Data = [];
          chart4Data = [];
    	  
    	  $.ajax({
    		  type:"GET",
    		  url:"searchstudentstatistic.json",
    		  data: {year:year},
    		  dataType:"json",
    		  success:function(data){
    			  /*chart1*/
    			  var male = 0;         // 남성
    			  var female = 0;		// 여성
    			  /*chart2*/
    			  var transferY = 0;	// 편입생
    			  var transferN = 0		// 재학생
    			  /*chart3*/
    			  var departments = {}; // 부서{이름:숫자}
    			  /*chart4*/
    			  var two = 0;			// 20대
    			  var three = 0;		// 30대 
    			  var four = 0;			// 40대 
    			  var five = 0;			// 50대 
    			  
    			  $.each(data, function(index, item) {
    				  if (item.gender == 'F') {
    					  female++;
    				  } else {
    					  male++;
    				  }
    				  
    				  if (item.transferYn == 'Y'){
    					  transferY++;
    				  } else {
    					  transferN++; 
    				  }
    				  
    				  var name = item.major.name;
    				  if (!departments[name] ) {
    					  departments[name] = 1;
    				  } else {
    					  departments[name] = departments[name] + 1;
    				  }
    				  
    				  var age = item.birthStr
    				  
    				  var birthday = new Date(age);
    				  var today = new Date();
    				  var years = today.getFullYear() - birthday.getFullYear();
    				   
    				  birthday.setFullYear(today.getFullYear());
    				   
    				  if (today < birthday){
    				      years--;
    				  } 
    				      
   				      if(20 <= years && years < 30 ){
   				    	  two ++; 
   				      } else if(30 <= years && years < 40){
   				    	  three ++; 
   				      } else if(40 <= years && years < 50){
   				    	  four ++; 
   				      } else {
   				    	  five ++; 
   				      }
    			  })
    			  
    			  chart1Data.push(['남성', male]);
    			  chart1Data.push(['여성', female]);
    			  
    			  chart2Data.push(['신입생', transferN]);
    			  chart2Data.push(['편입생', transferY]);
    			  
    			  for (var prop in departments) {
    				  chart3Data.push([prop, departments[prop]]);
    			  }
    			  
    			  chart4Data.push(['20대', two]);
    			  chart4Data.push(['30대', three]);
    			  chart4Data.push(['40대', four]);
    			  chart4Data.push(['50대 이상', five]);
    			  
    			  google.charts.load('current', {'packages':['corechart']});
    		      google.charts.setOnLoadCallback(drawChart1);
    		      google.charts.setOnLoadCallback(drawChart2);
    		      google.charts.setOnLoadCallback(drawChart3);
    		      google.charts.setOnLoadCallback(drawChart4);
    		  }
    	  })
    	  
      }
      
      /*검색년도가 바뀔 때 실행*/
      $("[name=option]").change(function(){
    	  var year = $("[name=option]").val();
    	  searchStudentStatistic(year);
      })
      
      searchStudentStatistic(new Date().getFullYear());

    </script>
</body>
</html>