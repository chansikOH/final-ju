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
						<span style="font-size: 20px; color: blue;"><strong>[수강 중인 교과목]</strong></span>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>NO</th>
									<th>년도</th>
									<th>학기</th>
									<th>교과번호</th>
									<th>학과</th>
									<th>교과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>담당교수</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터공학과</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>
										<button class="btn btn-default">보기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
