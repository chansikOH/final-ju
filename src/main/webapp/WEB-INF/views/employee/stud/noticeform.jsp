<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap Example</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<!-- 스마트에디터 관련 자바스크립트 라이브러리 추가 -->
	<script type="text/javascript" src="/ju/resources/js/se2/js/HuskyEZCreator.js"></script>
<style type="text/css">
	.side-padding{padding-left: 0;}
	.title {margin-top: 30; padding-bottom:20px; font-size: 40px;}
	iframe {width: 101% !important;}
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 side-padding">
				<%@ include file="../../common/sidebar.jsp"%>
			</div>
			<div class="col-sm-10">
				<h1 class="title">학생 공지사항 입력</h1> 
				<form id="register-form" method="get" action="addnotice.do">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="title" id="board-title"/>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input type="text" class="form-control" name="writer" id="board-writer" placeholder="관리자" readonly="readonly" value="관리자"/>
				</div> 
				<div class="form-group">
					<label>내용</label>
					<textarea rows="10" class="form-control" name="contents" id="board-contents"></textarea>
				</div>
				<div class="text-right">
					<button type="button" class="btn btn-primary" id="btn-add-form">등록</button>
				</div>
				</form>	
			</div>
		</div>
	</div>
<body> 
<script type="text/javascript">
	// 스마트에디터 스킨을 추가하기 위한 스크립트코드
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
   		elPlaceHolder: "board-contents",
   		sSkinURI: "/ju/resources/js/se2/SmartEditor2Skin.html",
    	fCreator: "createSEditor2"
	});
	
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
		setTimeout(function() {
	    	var sHTML = '<img src="/ju/resources/images/photo/'+filepath+'">';
	    	oEditors.getById["board-contents"].exec("PASTE_HTML", [sHTML]);
		}, 5000);
	}
 
	// 등록버튼 클릭시 실행할 코드
	$('#btn-add-form').click(function() {
		if ($("#board-title").val() == '') {
			alert("제목을 입력하세요");
			return false;
		}
		if ($("#board-writer").val() == '') {
			alert("작성자를 입력하세요");
			return false;
		}
		oEditors.getById["board-contents"].exec("UPDATE_CONTENTS_FIELD", [ ]);
		if ($("#board-contents").val() == '') {
			alert("내용을 입력하세요");
			return false;
		}
		
		$("#register-form").submit();
	});
 
</script>
</body>
</html>
