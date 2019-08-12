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
td.disable-links {pointer-events:none;}
.disable-btn {background-color: #ddd}
.side-padding{padding-left: 0;}
</style>
</head>
<body>
	<div class="container-fluid">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="row">
			<div class="col-sm-2 shadow side-padding">
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
						<p>* 85% 이상 수강하지 않으면 다음 강의를 볼 수 없습니다.</p>
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
									<c:forEach var="partInfo" items="${sources.partInfos }" varStatus="loop">
										<c:if test="${loop.count eq 8 }">
											<c:choose>
												<c:when test="${resultMap.M eq 0 && courseMap.M eq 1 }">
													<tr>
														<td></td>
														<td colspan="2"><strong>${sources.courseName } 중간고사</strong></td>
														<td><a target="_blank" rel="noopener noreferrer" href="test?cno=${param.courNo }&term=M" class="btn btn-default btn-sm">시험보기</a></td>
														<td></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td></td>
														<td colspan="2"><strong>${sources.courseName } 중간고사</strong></td>
														<td class="disable-links"><a href="test?cno=${param.courNo }&term=M" class="btn btn-default btn-sm disable-btn">시험보기</a></td>
														<td></td>
													</tr>
												</c:otherwise>
											</c:choose>
										
										</c:if>
										<tr id="course-part-${partInfo.NO }" class="course-part">
											<td>${partInfo.WEEK }</td>
											<td colspan="2"><strong>${partInfo.NAME }</strong></td>
											<td><strong id="percentage-${partInfo.NO }">${partInfo.AVG } %</strong></td>
											<td></td>
										</tr>
										<c:forEach var="classInfo" items="${sources.classInfos }">
											<c:if test="${classInfo.PARTNO eq partInfo.NO }">
												<tr class="class-view course-part-${classInfo.PARTNO }-view">
													<td></td>
													<th>강의</th>
													<td>${classInfo.CLASSNAME }</td>
													<td class="percentage-${classInfo.PARTNO }-class">${classInfo.PERCENTAGE } %</td>
													<td><button type="button" class="btn btn-default btn-xs btn-view" data-cno="${classInfo.COURSENO }" data-clno="${classInfo.CLASSNO }" disabled>강의보기</button></td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
									<c:choose>
										<c:when test="${resultMap.F eq 0 && resultMap.M eq 1 && courseMap.F eq 1 }">
											<tr>
												<td></td>
												<td colspan="2"><strong>${sources.courseName } 기말고사</strong></td>
												<td><a target="_blank" rel="noopener noreferrer" href="test?cno=${param.courNo }&term=F" class="btn btn-default btn-sm">시험보기</a></td>
												<td></td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td></td>
												<td colspan="2"><strong>${sources.courseName } 기말고사</strong></td>
												<td class="disable-links"><a href="test?cno=${param.courNo }&term=F" class="btn btn-default btn-sm disable-btn">시험보기</a></td>
												<td></td>
											</tr>
										</c:otherwise>
									</c:choose>
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
	$('[class^=percentage-]').each(function(index, per) {
		var percentage = $(per).text().replace(' %', '');
		if(percentage == 100) {
			$(per).css('color', 'green');
		} else if (percentage >= 85) {
			$(per).css('color', 'orange');
		} else if (percentage < 85) {
			$(per).css('color', 'red');
		}
		
		if(index == 0) {
			$(this).parent().find(':last-child').removeAttr('disabled');
		}
		
		if(percentage >= 85) {
			$(this).parent().nextAll().not('[id^=course-part-]').first().find(':last-child').removeAttr('disabled')
		}
	});
	
	$('[id^=percentage-]').each(function(index, el) {
		var id = $(el).attr('id');
		var total = parseInt(0);
		var length = parseInt($('.'+id+'-class').length);
		$('.'+id+'-class').each(function(index, per) {
			var percentage = $(per).text().replace(' %', '');
			total += parseInt(percentage);
		});
		var avg = total / length;
		
		if(avg == 100) {
			$(this).css('color', 'green');	
		} else if (avg == 0) {
			$(this).css('color', 'red');
		} else {
			$(this).css('color', 'orange');
		}
	});
	
	$('[id^=course-part-]').click(function() {
		var id = $(this).attr('id');
		$('.'+id+'-view').toggle();
	})
	
	$('.btn-view').click(function() {
		var cno = $(this).attr('data-cno');
		var clno = $(this).attr('data-clno');

		var win = window.open('/ju/student/course/courseview?cno='+cno+'&clno='+clno, '_blank', 'width=1200, height=600');
		var pollTimer = window.setInterval(function() {
		    if (win.closed !== false) {
		        window.clearInterval(pollTimer);
		        window.location.reload();
		    }
		}, 200);
	})
})
</script>
</body>
</html>
