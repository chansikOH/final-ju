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
			<h2 class="text-center">휴가계획서 상세페이지</h2>
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
	    				<td>${vacation.MIDDLE_PERSON_NAME }</td>
	    				<th>최종결재자</th>
	    				<td>${vacation.FINAL_PERSON_NAME}</td>
	    			</tr>
	    			<tr>
	    				<th>휴가시작</th>
	    				<td><fmt:formatDate value="${vacation.START_DATE }"/></td>
	    				<th>휴가종료</th>
	    				<td><fmt:formatDate value="${vacation.END_DATE }"/></td>
	    			</tr>
	    			<tr>
	    				<th>종류</th>
	    				<td colspan="3">${vacation.VACATION_DIV}</td>
	    			</tr>
	    			<tr>
	    				<th>내용</th>
	    				<td colspan="3">${vacation.CONTENTS}</td>
	    			</tr>
	    			<tr>
	    				<th>첨부파일</th>
	    				<c:choose>
							<c:when test="${not empty file.fileName }">
								<td>${file.fileName }</td>
							</c:when>
							<c:otherwise>
								<td>없음</td>
							</c:otherwise>
						</c:choose>
    				</tr>
	    		</tbody>
	    	</table>
    		<div class="text-right">
    			 <a href="/ju/doc/draft/update" class="btn btn-primary btn btn-sm ">반려</a> 
	             <input type="button" class="btn btn-default" value="뒤로가기" onclick="history.back(-1);">
    		</div>
		</div>
	</div>
</div>
</body>
</html>