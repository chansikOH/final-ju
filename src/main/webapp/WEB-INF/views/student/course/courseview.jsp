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
.big-box{
	background-color: black;
	height: 100vh;
}
.left-box {
	height: 100%;
}
.right-box {
	border-left: 1px solid white;
	height: 100%;
}
.video-wrapper {
	height: 90vh;
	position: relative;
}
.video-box {
	position: absolute;
	transform: translateY(5%);
}
#video {
	width: 100%;
	height: 100%;
}
.video-ctrl {
	height: 10vh;
}
#play {
	cursor: pointer;
	padding-top: 4px;
	margin-right: 10px;
}
#rewind {
	cursor: pointer;
}
#sound {
	cursor: pointer;
	float: right;
	margin-top: 15px;
}
#currentTime, #duration, #percent {
	color: white;
}
#duration{
	margin-right: 15px;
}
#pBar {
	position: relative;
	display: inline-block;
	border: 1px solid white;
	width: 60%;
	height: 10px;
	background-color: white;
	margin-right: 15px;
}
#cBar{
	position: absolute;
	display: inline-block;
	border: 1px solid red;
	top: 0;
	left: 0;
	width: 0;
	height: 100%;
	background-color: red;
}
.list-name {
	text-align: center;
	color: white;
}
.scroll {
	overflow: auto;
}
.class-table, .class-table a {
	color: white;
	font-size: 12px;
}
.class-table a:hover {
	color: yellow;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row big-box">
		<div class="col-sm-9 left-box">
			<div class="row video-wrapper">
				<div class="col-sm-12 video-box">
					<video id="video">
						<source src="/ju/resources/video/${video }" type="video/mp4">
					</video>
				</div>
			</div>
			<div class="row video-ctrl">
				<div class="col-sm-12">
					<img id="rewind" alt="rewind" src="/ju/resources/images/rewind.png" width="50" height="50">
					<img id="play" alt="play" src="/ju/resources/images/play.png" width="50" height="50">
					<span id="pBar"><span id="cBar"></span></span>
					<span id="currentTime">00:00</span><span id="duration"></span>
					<span id="percent">진행도 0%</span>
					<img id="sound" alt="sound" src="/ju/resources/images/speak.png" width="20" height="20">
				</div>
			</div>
		</div>
		<div class="col-sm-3 right-box scroll">
			<h4 class="list-name">컴퓨터공학개론 강의목록</h4>
			<table class="class-table">
				<colgroup>
					<col width="40%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>제1강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제2강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제3강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제4강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제5강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제6강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제7강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제8강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제9강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제10강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제11강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제12강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제13강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제14강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제15강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제16강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제17강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제18강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제19강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제20강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제21강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제22강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제23강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제24강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제25강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제26강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제27강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제28강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제29강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제30강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제31강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제32강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제33강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제34강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제35강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제36강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제37강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제38강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제39강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제40강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제41강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
					<tr>
						<th>제42강</th>
						<td><a href="#">컴퓨터의 이해</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#play').click(function() {
		if($('#video').get(0).paused) {
			$(this).attr('src', '/ju/resources/images/pause.png');
			$('#video').get(0).play();
		} else {
			$(this).attr('src', '/ju/resources/images/play.png');
			$('#video').get(0).pause();
		}
	});

	$('#rewind').click(function() {
		var cur = $('#video').get(0).currentTime;
		if (cur - 5 < 0) {
			$('#video').get(0).currentTime=0;
		} else {
			$('#video').get(0).currentTime=cur-5;
		}
	});
	
	$('#sound').click(function() {
		$('#video').get(0).muted = !$('#video').get(0).muted;
		var sound = $('#video').get(0).muted;
		if(sound) {
			$(this).attr('src', '/ju/resources/images/silence.png');
		} else {
			$(this).attr('src', '/ju/resources/images/speak.png');
		}	
	});
	
	function changeTime(sec) {
		var pad = function(x) { return (x < 10) ? "0"+x : x; };
		var res;
		if (sec < 3600) {
			res = pad(parseInt(sec / 60 % 60)) + ":" + pad(sec % 60);
		} else {
			res = pad(parseInt(sec / (60*60))) + ":" + pad(parseInt(sec / 60 % 60)) + ":" + pad(sec % 60);
		}
		return res;
	}
	
	$('#video').on('loadedmetadata', function() {
		$('#duration').text(' / '+changeTime(Math.floor($(this).get(0).duration)));
	});
	
	$('#video').on('timeupdate', function() {
		var current = $(this).get(0).currentTime;
		var max = $(this).get(0).duration;
		var percent = current / max*100;
		$('#currentTime').text(changeTime(Math.floor(current)));
		$('#cBar').css('width', percent+'%');
		$('#percent').text('진행도 ' + Math.floor(percent) + '%');
	});
})
</script>
</body>
</html>
