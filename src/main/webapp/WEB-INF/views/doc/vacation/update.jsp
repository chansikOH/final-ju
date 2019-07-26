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
			<h2 class="text-center">휴가계획서 양식</h2>
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
		    			<label>종류</label>
		    			<select class="form-control">
	                        <option value=""> 연차</option>
	                        <option value=""> 월차</option>
	                    </select>
		    			<br/>
		    			<label>휴가시작</label>
		    			<input type="date" class="form-control">
		    			<br/>
		    			<label>휴가종료</label>
		    			<input type="date" class="form-control">
		    			<br/>
		    			<label>내용</label>
		    			<textarea type="text" rows="15" class="form-control"></textarea>
		    			<br/>
		    			<label>파일</label>
			    		<input type="file">
			    		<br/>
		    		</div>
		    		<br/>
		    		<div class="text-center">
		    			<div class="radio">
		    				<label class="radio-inline"></label>
		    				<input type="radio" name="license" value="1" checked="checked"> 결재중
		    				<label class="radio-inline"></label>
		    				<input type="radio" name="license" value="0"> 완료
		    				<label class="radio-inline"></label>
		    				<input type="radio" name="license" value="0"> 반려
		    			</div>
		    		</div>
		    		<div class="form-group">
	                 	<label>반려 사유</label>
	                 	<textarea class="form-control" rows="5"></textarea> 
	             	</div>
		    		<div class="text-right">
			             <button type="reset" class="btn btn-danger" value="">반려</button>
			             <button type="submit" class="btn btn-info" value="">승인</button>
		    		</div>
		    	</form>
		    </div>
		</div>
	</div>
</div>
</body>
</html>