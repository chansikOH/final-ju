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
<div class="container">
    <h2 class="text-center">기안서 상세 페이지</h2>
    <div class="well">
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-4">
                    <tr>
                    <th>결재자</th>
                    	<td><textarea rows="1" class="form-control"></textarea></td>
                    <th>제목</th>
                    	<td><textarea rows="1" class="form-control"></textarea></td>
                	</tr>
                    </div>
                    <div class="col-sm-4">
                    <tr>
                       <th>결재자</th>
                        	<td><textarea rows="1" class="form-control"></textarea></td>
                        
                       <th>시행일자</th>
                        	<td><input type="date" class="form-control"></td>
                    </tr>
                    </div>
                    <div class="col-sm-4">
                       <tr>
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
                    	</tr>
                    </div>
                </div><br/>
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
        </div>
        <div class="row">
            <div class="col-sm-12">
              <tr>
              	<td><input type="file"></td>
              </tr>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
            </div>
            	<div class="col-sm-8">
            		<div class="text-center">
          				<div class="radio">
            				<label class="radio-inline">
                				<input type="radio" name="license" value="1" checked="checked"> 결재
            				</label>
            				<label class="radio-inline">
                				<input type="radio" name="license" value="0"> 완료
            				</label>
            				<label class="radio-inline">
                				<input type="radio" name="license" value="0"> 반려
            				</label>
         				</div>
      				</div>
	             	<div class="form-group">
	                 	<label>반려 사유</label>
	                 	<textarea class="form-control" rows="5"></textarea> 
	             	</div>
            	</div>
            <div class="col-sm-2">
            </div>
        </div>
        <div class="row">
             <div class="col-sm-12">
                 <div class="text-right">
                    <button type="reset" class="btn btn-danger" value="">반려</button>
                    <button type="submit" class="btn btn-info" value="">승인</button>
                 </div>
             </div>
         </div>
    </div>
</div>
</div>
</body>
</html>
