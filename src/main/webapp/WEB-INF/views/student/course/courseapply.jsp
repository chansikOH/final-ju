<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
		height: 300px;
	}
	
	.box-bottom {
		height: 300px;
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
				<h1>수강신청</h1>
				<br>
				<div class="row">
					<div class="col-sm-12">
						<span style="font-size: 20px; color: #333;"><strong>개설과목</strong></span>
					</div>
				</div>
				<div class="row result">
					<div class="col-sm-12 box-top auto">
						<table class="table table-striped" id="course-apply-table">
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
									<th>신청인원</th>
									<th>정원</th>
									<th>강의계획서</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty minusCourses }">
									<c:forEach var="course" items="${minusCourses }" varStatus="index">
										<tr>
											<td>${index.count }</td>
											<td>${course.year }</td>
											<td>${course.term }학기</td>
											<td>${course.no }</td>
											<td>${course.name }</td>
											<td>${course.getMust() }</td>
											<td>${course.credit }</td>
											<td>${course.professor.name }</td>
											<td id="course-count-${course.no }">${course.count }</td>
											<td>${course.quota }</td>
											<td>
												<a href="courseplan?cno=${course.no }" class="btn btn-default btn-sm">강의계획서</a>
											</td>
											<td>
												<a href="signupCourse?cno=${course.no }" class="btn btn-default">신청</a>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="11">수강 가능한 과목이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
								
							</tbody>
						</table>
					</div>
				</div>
				
				<br>
				
				<div class="row">
					<div class="col-sm-3">
						<span style="font-size: 20px; color: #333;"><strong>수강신청내역</strong></span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>수강가능학점 : 24</span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>신청과목수 : ${totalCount }</span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>신청학점 : <span id="creditCount">${creditCount }</span></span>
					</div>
				</div>
				
				<div class="row result">
					<div class="col-sm-12 box-bottom auto">
						<table class="table table-striped">
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
									<th>신청일</th>
									<th>강의계획서</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty myCourses }">
										<c:forEach var="course" items="${myCourses }" varStatus="index">
											<tr>
												<td>${index.count }</td>
												<td>${course.year }</td>
												<td>${course.term }학기</td>
												<td>${course.no }</td>
												<td>${course.name }</td>
												<td>${course.getMust() }</td>
												<td>${course.credit }</td>
												<td>${course.professor.name }</td>
												<td><fmt:formatDate value="${course.createDate }"/></td>
												<td>
													<a href="courseplan?cno=${course.no }" class="btn btn-default btn-sm">강의계획서</a>
												</td>
												<td>
													<a href="dropCourse?cno=${course.no }" class="btn btn-default">취소</a>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="10">수강신청한 과목이 없습니다.</td>
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
	
	<script type="text/javascript">
		$(function() {
			var webSocket = new WebSocket("ws://localhost/ju/applicant.do");
			
			webSocket.onmessage = function(event) {
				var code = event.data.split(":")[0];
				var cnt = event.data.split(":")[1];
				
				$('#course-count-' + code).text(cnt);
			}
			
			if($("#creditCount").text() >= 24) {
				$("#course-apply-table tbody tr td a").click(function(e) {
					e.preventDefault();
					alert("수강가능학점은 최대 24학점입니다.")
				});
			}
			
		})
	</script>
</body>
</html>
