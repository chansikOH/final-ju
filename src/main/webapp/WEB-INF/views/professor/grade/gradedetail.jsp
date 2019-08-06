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
        .wrapper {
        	margin-top: 20px;
            padding: 20px;
        }
        .wrapper a, #opinion a{color: #000;}
        
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
    </style>
  	
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 shadow">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10 wrapper">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>[강의정보]</h4>               
                        <p>※ 이번학기 담당강좌 성적만 입력 가능</p>
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
	                                    <td>${course.mustYn}</td>
                                	</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <h4>[성적 상세조회]</h4>               
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
	                					<td class="record">${grade.RECORD }</td>
	                				</tr>
                				</c:forEach>
                			</tbody>
                		</table>
                	</div>
                	<div class="col-sm-12 grade-detail detail-graph">
                		<table class="table .table-bordered">
                			<thead>
                				<tr>
                					<th colspan="10">성적분포</th>
                				</tr>
                			</thead>
                			<tbody>
                				<tr>
                					<th>성적</th><td>A+</td><td>A</td><td>B+</td><td>B</td><td>C+</td><td>C</td><td>D+</td><td>D</td><td>F</td>
                				</tr>
                				<tr>
                					<th>학생수</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                				</tr>
                				<tr>
                					<th>비율</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                				</tr>
                			</tbody>
                		</table>
                		<table class="table">
                			<tbody>
                				<tr>
                					<th>b</th>
                				</tr>
                			</tbody>
                		</table>
                	</div>
                </div>
               
            </div>
		</div>
	</div>
	<script type="text/javascript">
		$(".detail-list").show();
		$(".grade-tab").on("click","li", function(){
			$(this).addClass("active").siblings().removeClass('active');
			var id = $(this).attr("id");
			$('.detail-'+id).show().siblings().hide();
			
			var a = $(".record").text();
			var b = (a.match(/C/g) || []).length;
			
			alert(b);
		})
	</script>
</body>
</html>