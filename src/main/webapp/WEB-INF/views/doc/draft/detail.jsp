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
		    	<table class="table">
		    	<colgroup>
		    		<col width="10%">
		    		<col width="10%">
		    		<col width="10%">
		    		<col width="10%">
		    		<col width="10%">
		    		<col width="10%">
		    	</colgroup>
		    		<tbody>
		    			<tr>
		    				<th>중간결재자</th>
		    				<td>${draft.MIDDLE_PERSON_NAME }</td>
		    				<th>최종결재자</th>
		    				<td>${draft.FINAL_PERSON_NAME}</td>
		    			</tr>
		    			<tr>
		    				<th>제목</th>
		    				<td>${draft.DRAFT_TITLE}</td>
		    				<th>보존년한</th>
		    				<td>${draft.DRAFT_KEEPING_YEAR}</td>
		    			</tr>
		    			<tr>
		    				<th>내용</th>
		    				<td colspan="3">${draft.DRAFT_CONTENTS}</td>
		    			</tr>
		    			<tr>
		    				<th>시행일자</th>
		    				<td colspan="3"><fmt:formatDate value="${draft.DRAFT_START_DATE}"/></td>
		    			</tr>
		    		</tbody>
		    	</table>
		    		<div class="text-right">
			             <input type="button" class="btn btn-default" value="뒤로가기" onclick="history.back(-1);">
		    		</div>
		</div>
	</div>
</div>
</body>
</html>