<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>JU</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
	.result{padding: 0 15px;}
	.result div:first-child{margin: 15px 0 5px 0; padding: 0;}
	.result th{background: #faf6f0; }
	.result th,td{text-align: center; }
</style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../../common/header.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@ include file="../../common/sidebar.jsp"%>
			</div>
			<div class="col-sm-10">
				<h1>공지사항</h1>
				<div class="row result">
					<div class="col-sm-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>작성자</th>
									<th>제목</th>
									<th>생성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇㅇㅇㅇ</td>
									<td>2019.07.30</td>
								</tr>
								<tr>
									<td>2</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇㅇㅇㅇ</td>
									<td>2019.07.30</td>
								</tr>
								<tr>
									<td>3</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇㅇㅇㅇ</td>
									<td>2019.07.30</td>
								</tr>
								<tr>
									<td>4</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇㅇㅇㅇ</td>
									<td>2019.07.30</td>
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