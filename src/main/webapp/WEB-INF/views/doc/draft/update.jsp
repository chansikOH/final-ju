<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
.well{ background-color: #faf6f0; width: 1000px; margin: 0 auto;}
.form-control{resize: none;}
</style>
<style>
.well{ background-color: #faf6f0; width: 1000px; margin: 0 auto;}
.form-control{resize: none;}
</style>
<body>
<div class="container-fluid">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="row">
		<div class="col-sm-2 shadow">
		<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
		</div>
		<div class="col-sm-10">
    		<h2 class="text-center">기안서 결재 확인</h2>
		    <div class="well">
		    	<form method="post" action="draftUpdate">
		    		<div class="form-group">
		    			<label>중간결재자</label>
		    			<input type="text" class="form-control" name="middlePerson" value="${draft.doc.middlePerson }" readonly >
		    			<br/>
		    			<label>최종결재자</label>
		    			<input type="text" class="form-control" name="finalPerson" value="${draft.doc.finalPerson}" readonly >
		    			<br/>
		    			<label>제목</label>
		    			<input type="text" class="form-control" name="title" value="${draft.title}" />
		    			<br/>
		    			<label>내용</label>
		    			<input type="text" class="form-control" name="contents" value="${draft.contents}" />
		    			<br/>
			    		<label>첨부파일</label>
			    		<input type="file" class="form-control">
			    		<br/>
		    			<label>시행일자</label>
		    			<input type="date" class="form-control" name="startDate" value="${draft.startDate }" />
		    		</div>
		    		<br/>
		    		<div class="text-center">
		    			<div class="radio">
		    				<label class="radio-inline"></label>
		    				<input type="radio" name="license" value="결재중" checked="checked"> 결재중
		    				<label class="radio-inline"></label>
		    				<input type="radio" name="license" value="완료"> 완료
		    				<label class="radio-inline"></label>
		    				<input type="radio" name="license" value="반려"> 반려
		    			</div>
		    		</div>
		    		<div class="form-group">
	                 	<label>반려 사유</label>
	                 	<textarea class="form-control" rows="5"></textarea> 
	             	</div>
		    		<div class="text-right">
			             <button type="reset" class="btn btn-danger" value="반려">반려</button>
			             <button type="submit" class="btn btn-info" value="승인">승인</button>
		    		</div>
		    	</form>
		    </div>
		</div>
	</div>
</div>
</body>
</html>
