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
			<h2 class="text-center">기안서 상세페이지</h2>
		    <div class="well">
		    	<form:form method="post" action="insertdetail" modelAttribute="DocForm" enctype="multipart/form-data">
		    		<div class="form-group">
		    			<label>중간결재자</label>
						<select class="form-control" name="middlePersonNo"> 
                            <option value=""> 대리</option>
                            <option value=""> 과장</option>
                            <option value=""> 처장</option>
                        </select>
		    			<br/>
		    			<label>최종결재자</label>
		    			<select class="form-control" name="finalPersonNo"> 
                            <option value="처장" ${doc.finalPerson=='처장' ? 'selected' : '' }> 처장</option>
                            <option value="총장" ${doc.finalPerson=='총장' ? 'selected' : '' }> 총장</option>
                        </select>
		    			<br/>
		    			<label>제목</label>
		    			<input type="text" class="form-control" name="title" value="${draft.title }"/>
		    			<br/>
		    			<label>내용</label>
		    			<textarea  rows="15" class="form-control" name="contents" >${draft.contents }</textarea>
		    			<br/>
			    		<label>첨부파일</label>
			    		<input type="file" name="upfile" value="${docFile.name }">
			    		<br/>
		    			<label>보존년한</label>
		    			<select class="form-control" name="keepingYear"> 
                            <option value="1년"${draft.keepingYear}>1년</option>
                            <option value="2년"${draft.keepingYear}>2년</option>
                            <option value="3년"${draft.keepingYear}>3년</option>
                        </select>
                        <br/>
		    			<label>시행일자</label>
		    			<input type="date" class="form-control" name="startDate" value="${draft.startDate }">
		    		</div>
		    		<br/>
		    		<div class="text-right">
			             <input type="button" class="btn btn-default" value="뒤로가기" onclick="history.back(-1);">
		    		</div>
		    	</form:form>
		    </div>
		    <dr>
		</div>
	</div>
</div>
</body>
</html>
