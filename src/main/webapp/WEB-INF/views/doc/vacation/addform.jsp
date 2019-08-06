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
			<h2 class="text-center">휴가계획서 등록</h2>
		    <div class="well">
		    	<form:form method="post" action="insertVacation" modelAttribute="RetireForm" enctype="multipart/form-data">
		    		<div class="form-group">
		    			<label>중간결재자</label>
						<select class="form-control" name="middlePersonNo">
						<c:forEach var="emp" items="${employees }">
                            <option value="${emp.no }"> ${emp.name } ${emp.position.name }</option>
						</c:forEach> 
                        </select>
		    			<br/>
		    			<label>최종결재자</label>
		    			<select class="form-control" name="finalPersonNo"> 
		    			<c:forEach var="emp" items="${employees }">
                            <option value="${emp.no }"> ${emp.name } ${emp.position.name }</option>
		    			</c:forEach>
                        </select>
		    			<br/>
		    			<label>종류</label>
		    			<select class="form-control" name="div">
	                        <option value="3"> 연차</option>
	                        <option value="4"> 월차</option>
	                    </select>
		    			<br/>
		    			<label>휴가시작</label>
		    			<input type="date" class="form-control" name="startDate">
		    			<br/>
		    			<label>휴가종료</label>
		    			<input type="date" class="form-control" name="endDate">
		    			<br/>
		    			<label>내용</label>
		    			<textarea rows="15" class="form-control" name="contents"></textarea>
		    			<br/>
		    			<label>파일</label>
			    		<input type="file" name="upfile">
			    		<br/>
		    		</div>
		    		<br/>
		    		<div class="text-right">
			             <input type="button" class="btn btn-default" value="뒤로가기" onclick="history.back(-1);">
			             <button type="submit" class="btn btn-info" value="">제출</button>
		    		</div>
		    	</form:form>
		    </div>
		</div>
	</div>
</div>
</body>
</html>