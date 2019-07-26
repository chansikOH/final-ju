<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<h2 class="text-center">기안서 등록폼</h2>
    <div class="well">
    	<div class="row">
        	<div class="col-sm-2">
            </div>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-4">
                        <tr>
	                       <th>작성자</th>
	                        <td><textarea rows="1" class="form-control"></textarea></td>
	                        <th>제목</th>
	                        <td>
	                        <textarea rows="1" class="form-control"></textarea>
	                        </td>
	                    </tr>
                    </div>
                    <div class="col-sm-4">
	                    <tr>
		                    <th>결재자</th>
		                    <td><textarea rows="1" class="form-control"></textarea></td>
		                    <th>시행일자</th>
		                    <td>
		                    <input type="date" class="form-control">   
		                    </td>
	                    </tr>
                    </div>
                    <div class="col-sm-4">
                        <th>결재자</th>
                        <td><textarea rows="1" class="form-control"></textarea></td>
                        <th>보존년한</th>
                        <td>
	                        <select class="form-control">
	                            <option value=""> 1년</option>
	                            <option value=""> 2년</option>
	                            <option value=""> 3년</option>
	                            <option value=""> 4년</option>
	                            <option value=""> 5년</option>
	                        </select>
                        </td>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-2">
                    </div>
                    	<div class="col-sm-8">
	                   		<div class="form-group">
		                       <label>기안서내용</label>
		                       <textarea class="form-control" rows="25"></textarea> 
	                   		</div>
	                   </div>
                    <div class="col-sm-2">
                    </div>
                </div>
            </div>
            <div class="col-sm-2">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
              <tr>
              	<td><input type="file"></td>
              </tr>
              <div class="text-right">
	             <button type="reset" class="btn btn-danger" value="">취소</button>
	             <button type="submit" class="btn btn-info" value="">제출</button>
              </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
