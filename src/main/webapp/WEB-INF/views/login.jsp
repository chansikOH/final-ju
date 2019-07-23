<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>JU</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style type="text/css">
		body {
			position: relative; height: 100vh;
		}
		
		.div {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		
		.btn-center {
			margin: 0 auto;
			width: 68px;
		}
		
		span {
			font-weight: bold;
			font-size: 20px;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 div">
				<div style="margin: 0 auto; width: 180px; padding: 10px;">
					<span>중앙사이버대학교</span>
				</div>
				<form method="post" action="#">
					<div class="input-group">
						<span class="input-group-addon glyphicon glyphicon-user" id="basic-addon1"></span>
						<input type="text" id="user-id" name="id" class="form-control" placeholder="아이디" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
						<span class="input-group-addon glyphicon glyphicon-lock" id="basic-addon1"></span>
						<input type="password" id="user-pwd" name="password" class="form-control" placeholder="비밀번호(영문 숫자를 사용한 8자 이상)" aria-describedby="basic-addon1">
					</div>
					<div class="btn-center">
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>