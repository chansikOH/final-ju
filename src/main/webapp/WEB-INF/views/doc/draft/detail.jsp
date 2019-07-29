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
<body>
<div class="container-fluid">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="row">
		<div class="col-sm-2 shadow">
		<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
		</div>
		<div class="col-sm-10">
			<h2 class="text-center">기안서 양식</h2>
		    <div class="well">
		    	<form action="">
		    		<div class="form-group">
		    			<label>작성자</label>
		    			<input type="text" class="form-control">
		    			<br/>
		    			<label>중간결재자</label>
		    			<input type="text" class="form-control">
		    			<br/>
		    			<label>최종결재자</label>
		    			<input type="text" class="form-control">
		    			<br/>
		    			<label>제목</label>
		    			<textarea type="text" rows="1" class="form-control"></textarea>
		    			<br/>
		    			<label>내용</label>
		    			<textarea type="text" rows="15" class="form-control"></textarea>
		    			<br/>
			    		<label>첨부파일</label>
			    		<input type="file">
			    		<br/>
		    			<label>보존년한</label>
		    			<select class="form-control">
                            <option value=""> 1년</option>
                            <option value=""> 2년</option>
                            <option value=""> 3년</option>
                        </select>
                        <br/>
		    			<label>시행일자</label>
		    			<input type="date" class="form-control">
		    		</div>
		    		<br/>
		    		<div class="text-right">
			             <input type="button" class="btn btn-default" value="뒤로가기" onclick="history.back(-1);">
			             <button type="submit" class="btn btn-info" value="">제출</button>
		    		</div>
		    	</form>
		    </div>
		    <dr>
		</div>
	</div>
</div>
</body>
</html>
