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
.big-box {
	height: 100vh;
}

.left-box {
	height: 100%;
}

.right-box {
	border-left: 1px solid white;
	height: 100%;
}

div {
	border: 1px solid blue;
}

.result {
	padding: 0 15px;
}

.result div:first-child {
	margin: 15px 0 5px 0;
	padding: 0;
}

.result th {
	background: #faf6f0;
}

.result th, td {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row big-box">
			<div class="col-sm-9 left-box">
				<h1>시험보기</h1>
			</div>
			<div class="col-sm-3 right-box"></div>
		</div>
	</div>

</body>
</html>