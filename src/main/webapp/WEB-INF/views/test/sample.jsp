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
.check {
	border: 1px dashed red;
}
.box {
	border: 1px solid blue;
}
.big-box{
	border: 1px dashed yellow;
	background-color: black;
}
#pause{
	display: none;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row big-box" style="height: 100vh">
		<div class="col-sm-9 box" style="height: 100%">
			<div class="row check" style="height: 90vh; position: relative;">
				<div class="col-sm-12" style="position: absolute; transform: translateY(5%)">
					<video id="video1" width="100%" height="100%">
						<source src="/ju/resources/video/Flowers - 7924.mp4" type="video/mp4">
					</video>
				</div>
			</div>
			<div class="row check" style="height: 10vh">
				<div class="col-sm-12">
					<img id="play" alt="play" src="/ju/resources/images/play.png" width="50" height="50">
					<img id="pause" alt="pause" src="/ju/resources/images/pause.png" width="50" height="50">
				</div>
			</div>
		</div>
		<div class="col-sm-3 box" style="height: 100%">
		
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#play').click(function() {
		$(this).hide();
		$('#pause').show();
		$('#video1').get(0).play();
	});
	
	$('#pause').click(function() {
		$(this).hide();
		$('#play').show();
		$('#video1').get(0).pause();
	});
})
</script>
</body>
</html>
