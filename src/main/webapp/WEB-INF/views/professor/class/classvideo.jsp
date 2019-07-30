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
	<style>
		a{color: #000;}
	    a:hover{text-decoration: none;}
	    .course-create{font-size: 14px;}
	    .input-sm{font-size: 14px !important;}
	    .course-create .title{margin: 20px 0;}
	    .course-create .title h1{font-size: 26px;}
	    .course-create .btn{padding: 8px 30px;}
	    .course-create .table-wrap .table{padding: 10px 0 30px; border: 1px solid #ccc;}
	    .course-create .table-wrap .table th, .course-create .table-wrap .table td{border: none; padding-top: 25px}
	    .course-create .table-wrap .table>tbody>tr>td{padding: 12px 20px;}
	    .course-create .table-wrap .table>tbody>tr>th{padding: 40px 20px 18px;}
	    .course-create .table-wrap .table .search{text-align: right; padding: 30px 20px 37px 0;}
	    
	</style>
</head>
<body>
<%@include file="../../common/header.jsp" %>
<div class="container-fluid">
        <div class="row">
            <div class="col-sm-2">
                <!-- 정보 넣는 곳-->
                <%@include file="../../common/sidebar.jsp" %>
            </div>
            <div class="col-sm-10 course-create">
                <div class="col-sm-12 title">
                    <h1>동영상 등록</h1>
                </div>
                <div class="col-sm-12 table-wrap">
                    <form class="form" method="post" action="addvideo" enctype="multipart/form-data">
                        <table class="table">
                            <tbody>
                                <tr class="top">
                                    <th>교과목명</th>
                                    <th>교과목번호</th>
                                    <th>교수번호</th>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control input-sm" value="${course.name }" disabled>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control input-sm" value="${course.no }" disabled>
                                    </td>
                                    <td><input type="text" class="form-control input-sm" value="${course.professor.no }" disabled></td>
                                </tr>
                                <tr>
                                    <th colspan="3">단원주차 / 단원명</th>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <select class="form-control input-sm" name="coursePartNo">
                                        <c:forEach var="coursepart" items="${courseParts }">
                                            <option value="${coursepart.no }">${coursepart.week } / ${coursepart.name }</option>
                                        </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3">강의명</th>
                                    
                                </tr>
                                <tr>
                                     <td colspan="3">
                                        <input class="form-control input-sm" type="text" name="name">
                                    </td>
                                </tr>
                                <tr>
                               		<th colspan="3">동영상 첨부</th>
                                </tr>
                                <tr>
                                    <td colspan="1">
                                        <input class="form-control input-sm" type="file" name="videoFile">
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                             	
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td class="search">
                                        <button class="btn btn-default" type="submit">등록</button>
                                        <a href="#" class="search-btn btn btn-default btn-danger">취소</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>