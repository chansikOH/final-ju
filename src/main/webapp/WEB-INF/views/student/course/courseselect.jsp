<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.box-top {
		height: 500px;
	}
	
	.auto {
		overflow: auto;
	}
	
	.result{padding: 0 15px;}
	.result div:first-child{margin: 15px 0 5px 0; padding: 0;}
	.result th{background: #faf6f0; }
	.result th,td{text-align: center; }
</style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../../common/header.jsp" %>
		<div class="row">
			<div class="col-sm-2">
				<%@ include file="../../common/sidebar.jsp" %>
			</div>
			<div class="col-sm-10">
				<h1>수강조회</h1>
				<!-- <div class="row">
					<div class="col-sm-12">
						<span><strong>[학기별성적]</strong></span>
					</div>
				</div> -->
				
				<div class="row">
					<div class="col-sm-2">
						<span><strong>[학기별성적]</strong></span>
					</div>
					<div class="col-sm-5">
						<label>년도-학기</label>
						<select name="year-term">
							<option value="" selected> --- 전체 --- </option>
							<c:forEach var="term" items="${terms }">
								<option value="${term.year }-${term.term}">${term.year }년 ${term.term }학기</option>
							</c:forEach>
						</select>
						<button class="btn btn-default btn-xs" id="btn-select-courses">조회</button>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>학점계 : <span id="creditCount">${creditCount }</span></span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>평점 평균 : <span id="avgScore">${avgScore }</span> / 4.5</span>
					</div>
					<div class="col-sm-1" style="font-weight: bold;">
						<span>총 <span id="totalCourses">${totalCourses }</span> 건</span>
					</div>
				</div>
				
				<div class="row result">
					<div class="col-sm-12 box-top auto">
						<table class="table table-striped" id="course-attend-list">
							<thead>
								<tr>
									<th>NO</th>
									<th>년도</th>
									<th>학기</th>
									<th>교과번호</th>
									<th>교과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>담당교수</th>
									<th>등급</th>
									<th>평점</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="CA" items="${courseAttends }" varStatus="index">
									<tr>
										<td>${index.count }</td>
										<td>${CA.course.year }</td>
										<td>${CA.course.term }학기</td>
										<td>${CA.course.no }</td>
										<td>${CA.course.name }</td>
										<td>${CA.course.must }</td>
										<td>${CA.course.credit }</td>
										<td>${CA.course.professor.name }</td>
										<td>${CA.record }</td>
										<td>${CA.recordScore }</td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			$("#btn-select-courses").click(function() {
				var yearTerm = $("[name=year-term]").val();
				
				var year = yearTerm.substring(0,4);
				var term = yearTerm.substring(5,6);
				$.ajax({
					type:"GET",
					url:"../course.json",
					data: {year:yearTerm.substring(0,4), term:yearTerm.substring(5,6)},
					dataType:"json",
					success:function(result) {
						$("#course-attend-list tbody").empty();
						
						$("#creditCount").text(result.creditCount);
						$("#avgScore").text(result.avgScore);
						$("#totalCourses").text(result.totalCourses);
						
						$.each(result.courseAttends, function(index, ca) {
							var row = "<tr>";
							row += "<td>" + (index + 1) + "</td>";
							row += "<td>" + ca.course.year + "</td>";
							row += "<td>" + ca.course.term + "학기</td>";
							row += "<td>" + ca.course.no + "</td>";
							row += "<td>" + ca.course.name + "</td>";
							row += "<td>" + ca.course.must + "</td>";
							row += "<td>" + ca.course.credit + "</td>";
							row += "<td>" + ca.course.professor.name + "</td>";
							row += "<td>" + ca.record + "</td>";
							row += "<td>" + ca.recordScore  + "</td>";
							row += "<td></td>";
							row += "</tr>";
							
							$("#course-attend-list tbody").append(row);
						});
					}
				});
			});
		})
	</script>
</body>
</html>