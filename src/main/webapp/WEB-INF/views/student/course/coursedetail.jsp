<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.course-table{padding: 0 15px;}
.course-table div:first-child{margin: 35px 0 5px 0; padding: 0;}
.course-table div:nth-child(2){padding: 0;}
.course-table p{text-align: right; font-size: 15px; color: #0000ff;}
.course-table th{background: #faf6f0; }
.course-table th,.course-table td{text-align: center; }
.course-table .table{border: 1px solid #ccc;}
.course-table .table .border-top{border: none; padding-top: 25px}
.course-table .table>tbody>tr>td, 
.course-table .table>tbody>tr>th,  
.course-table .table>thead>tr>td, 
.course-table .table>thead>tr>th{padding:25px 20px;}
.course-table .table .class-view>td,
.course-table .table .class-view>th{padding: 15px;}
.course-table .table .class-view{display: none;}
.course-part{cursor: pointer;}
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
				<h1>강의 보기</h1>
				<div class="row">
					<div class="col-sm-12">
						<span style="font-size: 20px; color: #402600;"><strong>[${sources.courseName }] 진행도 ${sources.courseAvg } %</strong></span>
					</div>
				</div>
				
				<div class="row course-table">
					<div class="col-sm-12">
						<table class="table">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="60%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>주차</th>
									<th colspan="2">단원명</th>
									<th>진행도</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty sources.partInfos}">
									<c:forEach var="partInfo" items="${sources.partInfos }">
										<tr id="course-part-${partInfo.NO }" class="course-part">
											<td>${partInfo.WEEK }</td>
											<td colspan="2"><strong>${partInfo.NAME }</strong></td>
											<td><strong>${partInfo.AVG } %</strong></td>
											<td></td>
										</tr>
										<c:forEach var="classInfo" items="${sources.classInfos }">
											<c:if test="${classInfo.PARTNO eq partInfo.NO }">
												<tr class="class-view course-part-${classInfo.PARTNO }-view">
													<td></td>
													<th>강의</th>
													<td>${classInfo.CLASSNAME }</td>
													<td>${classInfo.PERCENTAGE } %</td>
													<td><button type="button" class="btn btn-default btn-xs btn-view" value="${classInfo.VIDEO }">강의보기</button></td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="text-center">
										<td colspan="5">조회된 강의가 없습니다.</td>
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
	$('[id^=course-part-]').click(function() {
		var id = $(this).attr('id');
		$('.'+id+'-view').toggle();
	})
	
	$('.btn-view').click(function() {
		var video = $(this).val();
		alert(video);
		var win = window.open('/ju/student/course/courseview?video='+video, '_blank', 'width=1200, height=600');
		var pollTimer = window.setInterval(function() {
		    if (win.closed !== false) {
		        window.clearInterval(pollTimer);
		        alert("강의종료됨")
		    }
		}, 200);
	})
})
</script>
</body>
</html>
