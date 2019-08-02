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
	overflow-y: hidden;
}

.left-box {
	height: 100%;
	padding-top: 50px;
	padding-left: 100px;
	padding-right: 100px;
}

.right-box {
	border-left: 1px solid white;
	height: 100%;
}

#header {
	height: 50px;
	background-color: #E3DCCC;
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

#title{
	font-weight: bold;
	font-size: 15px;
	margin: 15px;
}

#top-margin {
	margin-top: 15px;
}

#div-line {
	border-right: 3px solid #E3DCCC;
	height: 100vh;
}

.answer-div {
	padding-top: 5px;
	padding-bottom: 5px;
}

.btn {
	margin-top: 10px;
	padding-top: 10px;
	background-color: #E3DCCC;
}

#div-line span, .answer-div span{
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container-fluid big-box">
		<div class="row" id="header">
			<div class="text-center" id="top-margin">
				<span id="title">과목명 : ${course.name }</span>
				<span id="title">문제 수 : 20문제</span>
				<span id="title">시험 시간 : 30분</span>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-9 left-box" id="div-line">
				<c:forEach var="question" items="${questions }">
					<div id="question-div-${question.no }" data-question="${question.no }">
						<p style="font-weight: bold;">${question.no }. ${question.question }</p>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;<span data-answer="1" class="div-line-span" data-question="${question.no }">①</span> ${question.example1 }</p>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;<span data-answer="2" class="div-line-span" data-question="${question.no }">②</span> ${question.example2 }</p>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;<span data-answer="3" class="div-line-span" data-question="${question.no }">③</span> ${question.example3 }</p>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;<span data-answer="4" class="div-line-span" data-question="${question.no }">④</span> ${question.example4 }</p>
						<br><br>
						<div id="prev-next-box">
							<span style="margin-left: 150px;" id="prev-span-${question.no }" data-question="${question.no }"><i class="glyphicon glyphicon-triangle-left"></i>이전</span>
							<span style="margin-left: 60px;" id="next-span-${question.no }" data-question="${question.no }">다음<i class="glyphicon glyphicon-triangle-right"></i></span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-3 right-box">
				<c:forEach var="question" items="${questions }">
					<div class="row answer-div" id="answer-div-${question.no }">
						<div class="col-sm-4">
							<span id="check-no-${question.no }" data-question="${question.no }"><strong>${question.no }</strong></span>
						</div>
						<div class="col-sm-2">
							<span id="check-1" class="answer-div-span">①</span>
						</div>
						<div class="col-sm-2">
							<span id="check-2" class="answer-div-span">②</span>
						</div>
						<div class="col-sm-2">
							<span id="check-3" class="answer-div-span">③</span>
						</div>
						<div class="col-sm-2">
							<span id="check-4" class="answer-div-span">④</span>
						</div>
					</div>
				</c:forEach>
				<a href="#" class="btn" style="width: 100%;">제출하기</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#div-line > div").hide();
			$("#question-div-1").show();
			$("#prev-span-1").hide();
			$("#next-span-1").css('margin-left', '255px');
			$("#next-span-20").hide();
			
			$('.div-line-span').click(function() {
				var qno = $(this).attr('data-question');
				var answer = $(this).attr("data-answer");
				
				answerdelete(qno);
				$(this).html("&#9899;");
				
				checkdelete(qno);
				$('#answer-div-' + qno).find('.answer-div-span').eq(answer-1).html("&#9899;");;
			});
	
			$("[id^=next-span]").click(function() {
				var qno = $(this).attr('data-question');
				
				$("#div-line > div").hide();
				$("#question-div-" + (Number(qno) + 1)).show();
			});
	
			$("[id^=prev-span]").click(function() {
				var qno = $(this).attr('data-question');
				
				$("#div-line > div").hide();
				$("#question-div-" + (qno - 1)).show();
			});
			
			$("[id^=check-no]").click(function() {
				var qno = $(this).attr('data-question');
				
				$("#div-line > div").hide();
				$("#question-div-" + qno).show();
			});
			
			function answerdelete(qno) {
				var $spans = $('#question-div-' + qno).find('.div-line-span');
				$spans.eq(0).html("①");
				$spans.eq(1).html("②");
				$spans.eq(2).html("③");
				$spans.eq(3).html("④");
			}
			
			function checkdelete(qno) {
				var $spans = $('#answer-div-' + qno).find('.answer-div-span');
				$spans.eq(0).html("①");
				$spans.eq(1).html("②");
				$spans.eq(2).html("③");
				$spans.eq(3).html("④");
			}
		})
	</script>
</body>
</html>