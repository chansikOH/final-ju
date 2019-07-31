<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  
	날짜 : 2019.07.30
	작성자 : 오찬식
-->	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.major-name{font-size: 20px; color: #402600}
.course-table{padding: 0 15px;}
.course-table div:first-child{margin: 35px 0 5px 0; padding: 0;}
.course-table div:nth-child(2){padding: 0;}
.course-table p{text-align: right; font-size: 15px; color: #0000ff;}
.course-table th{background: #faf6f0; }
.course-table th,.course-table td{text-align: center; }
.course-table .table .btn-update{padding: 18px 10px !important;}
.course-table .table{border: 1px solid #ccc;}
.course-table .table .border-top{border: none; padding-top: 25px}
.course-table .table>tbody>tr>td, 
.course-table .table>tbody>tr>th, 
.course-table .table>tfoot>tr>td, 
.course-table .table>tfoot>tr>th, 
.course-table .table>thead>tr>td, 
.course-table .table>thead>tr>th{padding:25px 20px;}
</style>
</head>
<body>
	<div class="container-fluid">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="row">
			<div class="col-sm-2 shadow">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10">
				<h1>강의 수강</h1>
				<div class="row">
					<div class="col-sm-12">
						<span><strong class="major-name">[수강 중인 교과목]</strong></span>
					</div>
				</div>
				
				<div class="row course-table">
					<div class="col-sm-12">
						<p>총 <span>${countCourses }</span>건 조회</p>
					</div>
					<div class="col-sm-12">
						<table class="table">
							<colgroup>
								<col width="5%">
								<col width="8%">
								<col width="7%">
								<col width="7%">
								<col width="10%">
								<col width="*">
								<col width="10%">
								<col width="6%">
							</colgroup>
							<thead>
								<tr>
									<th>NO</th>
									<th>교과목번호</th>
									<th>수강년도</th>
									<th>수강학기</th>
									<th>학과</th>
									<th>교과목명</th>
									<th>담당교수</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty courses }">
									<c:forEach var="course" items="${courses }" varStatus="loop">
										<tr>
											<td>${loop.count }</td>
											<td>${course.no }</td>
											<td>${course.year }</td>
											<td>${course.term }</td>
											<td>${course.major.name }</td>
											<td>${course.name }</td>
											<td>${course.professor.name }</td>
											<td class="btn-update"><a href="coursedetail?courNo=${course.no }" class="btn btn-default">보기</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="text-center">
										<td colspan="8">조회된 교과목 정보가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
