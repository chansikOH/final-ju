<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>JU</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
	 a{color: #000;}
     a:hover{text-decoration: none;}
     .title{margin-top: 30; padding-bottom:20px; font-size: 40px;}

	.result{padding: 0 15px;}
	.result p{text-align: left; font-size: 18px; padding-left: 30px;}
	.result div:first-child{margin: 15px 0 5px 0; padding: 0;}
	.result th{background: #faf6f0; }
	.result th, td{text-align: center; }
	
	.pagination li{text-align: center; width: 100%;}
    .pagination li a{color: #777; font-size: 15px; padding: 10px;}
    .page-active{color: #0000ff; font-weight: bold;}
    .pagination li a:hover{color: #777; text-decoration: none;}
</style>
</head>
<body> 
	<div class="container-fluid">
		<%@ include file="../../common/header.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@ include file="../../common/sidebar.jsp"%>
			</div>
			<div class="col-sm-10">
				<h1 class="title">학생 공지사항</h1> 
				<div class="row result">
					<div class="col-sm-6">
                            <p>총 <strong><span id="search-result-count">${count }</span></strong>건 조회</p>
                    </div>
		  	    <div class="col-sm-6">
				   <div class="input-group">
				  	   <div class="input-group-btn">
					        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" >검색조건 <span class="caret"></span></button>
					        <ul class="dropdown-menu dropdown-menu-right" role="menu">
					          <li><a href="#">번호</a></li>
					          <li><a href="#">제목</a></li>
					          <li><a href="#">작성일</a></li>
					        </ul>
					   </div>
					   <input type="text" class="form-control" placeholder="Search for...">
					   <span class="input-group-btn">
						   <button class="btn btn-default" type="button">검색</button>
					   </span>
			   	   </div>
			    </div>   
				<div class="col-sm-12">
					<table class="table table-striped">
						<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="10%">
							<col width="10%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>파일</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${notices }" varStatus="index">
								<tr>
									<td>${index.count }</td>
									<td class="text-left"><a href="noticedetail.do?noticeNo=${notice.no }">${notice.title }</a></td>
									
									<c:if test="${empty notice.extension }">
										<td></td>
									</c:if>
									<c:if test="${not empty notice.extension && notice.extension eq 'pdf' }">
										<td><img src="/ju/resources/images/pdf.png" style="width: 21px; height: 21px;"/></td>
									</c:if>
									<c:if test="${not empty notice.extension && notice.extension ne 'pdf' }">
										<td><img src="/ju/resources/images/file.png" style="width: 18px; height: 18px;"/></td>
									</c:if>
									<td>${notice.writer }</td>
									<td><fmt:formatDate value="${notice.createDate }"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
				
				<div class="row">
					<div class="col-sm-12 page">
						<ul class="pagination" id="pagination-box">
						<%-- 	<c:if test="${ }">
							
							</c:if> --%>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function() {
		$("#search-result-table tbody tr").hide();
	})
	</script>
</body>
</html>