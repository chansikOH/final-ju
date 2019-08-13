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
	.side-padding{padding-left: 0;}
	.result{padding: 0 15px;}
	.result div:first-child{margin: 15px 0 5px 0; padding: 0;}
	.result th{background: #faf6f0; }
	.result th{text-align: center; }
</style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../../common/header.jsp"%>
		<div class="row">
			<div class="col-sm-2 side-padding">
				<%@ include file="../../common/sidebar.jsp"%>
			</div>
			<div class="col-sm-10">
				<h1>공지사항</h1>
				<div class="row result">
					<div class="col-sm-12">
						<table class="table">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>
							<tbody>
								<tr>
									<th>제목</th>
									<td>${notice.title }</td>
									<th>작성일</th>
									<td><fmt:formatDate value="${notice.createDate }"/></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td colspan="3">${notice.writer }</td>
								</tr>
								<tr>
									<th>파일명</th>
									<c:choose>
										<c:when test="${not empty notice.fileName }">
											<td>${notice.fileName }</td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">${notice.contents }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="text-right">
					<a href="list" class="btn btn-default">목록</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>