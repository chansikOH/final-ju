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
.course-table .table .btn-view{padding: 15px !important;}
.course-table .table{border: 1px solid #ccc;}
.course-table .table .border-top{border: none; padding-top: 25px}
.course-table .table>tbody>tr>td, 
.course-table .table>tbody>tr>th,  
.course-table .table>thead>tr>td, 
.course-table .table>thead>tr>th{padding:25px 20px;}
.course-table .table .class-view>td,
.course-table .table .class-view>th{padding: 15px;}
.course-table .table .class-view{display: none;}
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
						<span style="font-size: 20px; color: #402600;"><strong>[컴퓨터공학개론]</strong></span>
					</div>
				</div>
				
				<div class="row course-table">
					<div class="col-sm-12">
						<table class="table">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="70%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>주차</th>
									<th colspan="3">단원명</th>
								</tr>
							</thead>
							<tbody>
								<tr id="course-part-1">
									<td>1</td>
									<td colspan="3"><strong>컴퓨터공학이란 무엇인가?</strong></td>
								</tr>
								<tr class="class-view course-part-1-view">
									<td></td>
									<th>강의</th>
									<td>컴퓨터의이해</td>
									<td class="btn-view"><a href="#" class="btn btn-default btn-xs">강의보기</a></td>
								</tr>
								<tr class="class-view course-part-1-view">
									<td></td>
									<th>강의</th>
									<td>컴퓨터의이해</td>
									<td class="btn-view"><a href="#" class="btn btn-default btn-xs">강의보기</a></td>
								</tr>
								<tr class="class-view course-part-1-view">
									<td></td>
									<th>강의</th>
									<td>컴퓨터의이해</td>
									<td class="btn-view"><a href="#" class="btn btn-default btn-xs">강의보기</a></td>
								</tr>
								<tr id="course-part-2">
									<td>2</td>
									<td colspan="3"><strong>컴퓨터공학이란 무엇인가?</strong></td>
								</tr>
								<tr class="class-view course-part-2-view">
									<td></td>
									<th>강의</th>
									<td>컴퓨터의이해</td>
									<td class="btn-view"><a href="#" class="btn btn-default btn-xs">강의보기</a></td>
								</tr>
								<tr class="class-view course-part-2-view">
									<td></td>
									<th>강의</th>
									<td>컴퓨터의이해</td>
									<td class="btn-view"><a href="#" class="btn btn-default btn-xs">강의보기</a></td>
								</tr>
								<tr class="class-view course-part-2-view">
									<td></td>
									<th>강의</th>
									<td>컴퓨터의이해</td>
									<td class="btn-view"><a href="#" class="btn btn-default btn-xs">강의보기</a></td>
								</tr>
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
	
	$('.btn').click(function() {
		window.open('/ju/', '_blank', 'width=1200, height=600');
	})
})
</script>
</body>
</html>
