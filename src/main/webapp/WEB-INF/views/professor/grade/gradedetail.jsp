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
  	<script src="https://www.gstatic.com/charts/loader.js"></script>
  	
  	<style>
        .wrapper {
        	margin-top: 20px;
            padding: 20px;
        }
        /* .wrapper a, #opinion a{color: #000;} */
        
        .wrapper table {
            padding: 20px;
            text-align: center;
        }
        
        .wrapper th {
            background-color: #faf6f0;
            text-align: center;
        }
        
        #search-course-term {
            width: 150px;
            height: 30px;
        }
        
	    .center {
	        text-align: center;
	    }
	
	    .bg-color-gray {
	        background-color: #eee;
	    }
	
	    .table th {
	        background-color: #faf6f0;
	    }
	    
	    .course-opinion-table {
	        padding: 30px;
	    }
	    
	    .score-check {
	        margin-top: 20px;
	        margin-bottom: 20px;
	    }
	    
	    .course-opinion-table th {
	        text-align: center;
	    }
	    
	    .course-info td {
	        text-align: center;
	    }
	    .course-opin{
	    	
	    }
	    .course-opin td{
	        text-align: center;
	        line-height: 30px !important;
	    }
	    
	    .modal-lg {
	    	width: 1000px;
	    }
	    
	    textarea {
	    	resize: none;
	    }
		#opinion .modal-body {height: 100%;}
		.table{border: 1px solid #ccc;}
		.grade-tab{width: 200px; height: 30px; padding: 0; border: 1px solid #ccc; border-bottom: none;}
		.grade-tab li:first-child{border-right: 1px solid #ccc;}
		.grade-wrap{height: 30px; box-sizing: border-box;}
		.grade-tab li{width:50%; float: left; text-align: center; line-height: 30px; cursor: pointer; background: #eee;}
		.grade-tab li.active {background: #fff; font-weight: bold;}
		.grade-detail {display: none;}
		.graph{margin-top: 40px;}
		h4{font-weight: bold;}
		.side-padding{padding-left: 0;}
    </style>
  	
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 shadow side-padding">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10 wrapper">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>강의정보</h4>               
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <table class="table">
                        	<colgroup>
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="30%">
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="10%">
                        	</colgroup>
                            <thead>
                                <tr>
                                    <th>교과목번호</th>
                                    <th>강의년도</th>
                                    <th>학기</th>
                                    <th>교과목명</th>
                                    <th>강의학점</th>
                                    <th>수강인원</th>
                                    <th>필수/선택</th>
                                </tr>
                            </thead>
                            <tbody>
                            		<tr>
	                                    <td>${course.no}</td>
	                                    <td>${course.year }</td>
	                                    <td>${course.term }</td>
	                                    <td>${course.name }</td>
	                                    <td>${course.credit}</td>
	                                    <td>${course.count}</td>
	                                    <c:choose>
                                       		<c:when test="${course.mustYn eq 'Y'}">
                                       			<c:choose>
	                                       			<c:when test="${course.major.no ne 40 }">
	                                       				<td>전공필수</td>
	                                       			</c:when>
	                                       			<c:otherwise>
		                                       			<td>교양필수</td>
	                                       			</c:otherwise>
                                       			</c:choose>
                                       		</c:when>
                                       		<c:otherwise>
                                       			<c:choose>
	                                       			<c:when test="${course.major.no ne 40 }">
	                                       				<td>전공선택</td>
	                                       			</c:when>
	                                       			<c:otherwise>
		                                       			<td>교양선택</td>
	                                       			</c:otherwise>
                                       			</c:choose>
                                       		</c:otherwise>
                                       	</c:choose>
                                	</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <h4>성적 상세조회</h4>               
                    </div>
                </div>
                <div class="row">
                	<div class="col-sm-6  grade-wrap">
                		<ul class="grade-tab">
                			<li class="active" id="list">성적내역</li>
                			<li id="graph">성적분포도</li>
                		</ul>
                	</div>
                </div>
                <div class="row ">
                	<div class="col-sm-12 grade-detail detail-list">
                		<table class="table">
                			<colgroup>
                				<col width="10%"> 
                				<col width="22%"> 
                				<col width="22%"> 
                				<col width="22%"> 
                				<col width="22%"> 
                			</colgroup>
                			<tbody>
                				<tr>
                					<th>순번</th>
                					<th>학번</th>
                					<th>성명</th>
                					<th>점수</th>
                					<th>성적</th>
                				</tr>
                				<c:forEach var="grade" items="${grades.students }" varStatus="loop">
	                				<tr>
	                					<td>${loop.count }</td>
	                					<td>${grade.NO }</td>
	                					<td>${grade.NAME }</td>
	                					<td>${grade.SCORE }</td>
	                					<td class="record" data-value="${grade.RECORD }">${grade.RECORD }</td>
	                				</tr>
                				</c:forEach>
                			</tbody>
                		</table>
                	</div>
                	<div class="col-sm-12 grade-detail detail-graph">
                		<table class="table .table-bordered">
                			<colgroup>
                				<col width="15%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				<col width="8.5%">
                				
                			</colgroup>
                			<thead>
                				<tr>
                					<th colspan="11">성적분포</th>
                				</tr>
                			</thead>
                			<tbody>
                				<tr>
									<th>성적</th>
									<td>A+</td>
									<td>A</td>
									<td>B+</td>
									<td>B</td>
									<td>C+</td>
									<td>C</td>
									<td>D+</td>
									<td>D</td>
									<td>F</td>
									<td>합계</td>
								</tr>
                				<tr class="students">
									<th>학생수</th>
									<td class="aplus"></td>
									<td class="a"></td>
									<td class="bplus"></td>
									<td class="b"></td>
									<td class="cplus"></td>
									<td class="c"></td>
									<td class="dplus"></td>
									<td class="d"></td>
									<td class="f"></td>
									<td class="student-total"></td>
								</tr>
                				<tr>
									<th>비율(%)</th>
									<td class="aplus-avg"></td>
									<td class="a-avg"></td>
									<td class="bplus-avg"></td>
									<td class="b-avg"></td>
									<td class="cplus-avg"></td>
									<td class="c-avg"></td>
									<td class="dplus-avg"></td>
									<td class="d-avg"></td>
									<td class="f-avg"></td>
									<td class="percent-total"></td>
								</tr>
                			</tbody>
                		</table>
                		<div class="graph">
	                		<h4>성적 그래프</h4>
	                		<div id="chart_div">
	                		</div>
                		</div>
                	</div>
                </div>
               
            </div>
		</div>
	</div>
	<script type="text/javascript">
		var count = {
				Aplus : 0,
				A : 0,
				Bplus : 0,
				B : 0,
				Cplus : 0,
				C : 0,
				Dplus : 0,
				D : 0,
				F : 0
		}
		$(".detail-list").show();
		$(".grade-tab").on("click","li", function(){
			count.Aplus = 0;
			count.A= 0;
			count.Bplus = 0;
			count.B= 0;
			count.Cplus = 0;
			count.C= 0;
			count.Dplus = 0;
			count.D = 0;
			count.F = 0;
			
			$(this).addClass("active").siblings().removeClass('active');
			var id = $(this).attr("id");
			$('.detail-'+id).show().siblings().hide();
			
			$('.record').each(function(index,value){
				var result = $(this).attr('data-value');
				console.log(result);
				
				if(result == 'A+'){
					count.Aplus++;
				}else if(result == 'A'){
					count.A++;
				}else if(result == 'B+'){
					count.Bplus++;
				}else if(result == 'B'){
					count.B++;
				}else if(result == 'C+'){
					count.Cplus++;
				}else if(result == 'C'){
					count.C++;
				}else if(result == 'D+'){
					count.Dplus++;
				}else if(result == 'D'){
					count.D++;
				}else if(result == 'F'){
					count.F++;
				}
			})
			var plus = count.Aplus + count.A + count.Bplus + count.B + count.Cplus + count.C + count.Dplus + count.D + count.F;
			var percent = 100/plus;
			
			var Aplusavg = percent * count.Aplus;
			var Aplusavg1 = Aplusavg.toFixed(1);
			
			var Aavg = percent * count.A;
			var Aavg1 = Aavg.toFixed(1);
			
			var Bplusavg = percent * count.Bplus;
			var Bplusavg1 = Bplusavg.toFixed(1);
			
			var Bavg = percent * count.B;
			var Bavg1 = Bavg.toFixed(1);
			
			var Cplusavg = percent * count.Cplus;
			var Cplusavg1 = Cplusavg.toFixed(1);
			
			var Cavg = percent * count.C;
			var Cavg1 = Cavg.toFixed(1);
			
			var Dplusavg = percent * count.Dplus;
			var Dplusavg1 = Dplusavg.toFixed(1);
			
			var Davg = percent * count.D;
			var Davg1 = Davg.toFixed(1);
			
			var Favg = percent * count.F;
			var Favg1 = Favg.toFixed(1);
			
			$(".aplus").text(count.Aplus);
			$(".a").text(count.A);
			$(".bplus").text(count.Bplus);
			$(".b").text(count.B);
			$(".cplus").text(count.Cplus);
			$(".c").text(count.C);
			$(".dplus").text(count.Dplus);
			$(".d").text(count.D);
			$(".f").text(count.F);
			
			$(".aplus-avg").text(Aplusavg1);
			$(".a-avg").text(Aavg1);
			$(".bplus-avg").text(Bplusavg1);
			$(".b-avg").text(Bavg1);
			$(".cplus-avg").text(Cplusavg1);
			$(".c-avg").text(Cavg1);
			$(".dplus-avg").text(Dplusavg1);
			$(".d-avg").text(Davg1);
			$(".f-avg").text(Favg1); 
			
			var percenttotal = Aplusavg+Aavg+Bplusavg+Bavg+Cplusavg+Cavg+Dplusavg+Davg+Favg;
			$(".student-total").text(plus);
			$(".percent-total").text(percenttotal);
			
			google.charts.load('current', {packages:['corechart']});
			
			// 로딩 완료시 함수 실행하여 차트 생성
			google.charts.setOnLoadCallback(drawChart);

			function drawChart() {

				// 차트 데이터 설정
				var data = google.visualization.arrayToDataTable([
					
					['항목', '인원', {role:'style'}], // 항목 정의
					['A+', count.Aplus, '#c4954e'], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
					['A', count.A, '#c99e5d'],
					['B+', count.Bplus,'#cea76c'],
					['B', count.B,'#d3af7a'],
					['C+', count.Cplus,'#ddc198'],
					['C', count.C,'#e1caa6'],
					['D+', count.Dplus,'#e6d3b5'],
					['D', count.D,'#f0e4d3'],
					['F', count.F,'#f5ede1'],
				]);

				// 그래프 옵션
				var options = {
						
					width : 1600, // 가로 px
					height : 400, // 세로 px
					bar : {
						groupWidth : '25%' // 그래프 너비 설정 %
					},
					legend : {
						position : 'none' // 항목 표시 여부 (현재 설정은 안함)
					},
					vAxis : {
						title : '학생 수(명)'
					}
				};
				var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
				chart.draw(data, options);
			}
		})
		
		
		
		
	</script>
</body>
</html>