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
	.result{padding: 0 15px;}
	.result div:first-child{margin: 15px 0 5px 0; padding: 0;}
	.result th{background: #faf6f0; }
	.result th, td{text-align: center; }
	
	.title{padding-left: 30px; font-size: 20px; padding-top: 15px;}
	.search {text-align: right;}
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
				<h1>공지사항</h1>
				<div class="row">
					<div class="col-sm-6">
						<p class="title">총 <strong>${count }</strong>건 조회</p>
					</div>
					<div class="col-sm-6 search">
						<form method="get" action="#" class="navbar-form">
							<div class="form-group">
								<input type="hidden" name="pageNo" value="1">
							</div>
							<select class="form-control" name="option">
								<option value="" selected="selected">전체</option>
								<option value="noticeNo">번호</option>
								<option value="title">제목</option>
								<option value="createDate">작성일</option>
							</select>
							<div class="form-group">
								<input type="text" class="form-control" name="search" placeholder="Search">
							</div>
							<button class="btn btn-default" type="button">검색</button>
						</form>
					</div>
				</div>
				<div class="row result">
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
										<td class="text-left"><a href="detail?no=${notice.no }">${notice.title }</a></td>
										
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
			</div>
		</div>
	</div>
	
	<!-- <script type="text/javascript">
		var pageNo = $("[name=pageNo]").val();
		var option = $("[name=option]").val();
		var search = $("[name=search]").val();
		
		gosearch();
		
		function gosearch() {
			$.ajax({
				type:"GET",
				url:"noticelist.json",
				data:{pageNo:pageNo, option:option, search:search},
				dataType: "json",
				success:function(data){
					var notices = data.notices;
					var pagination = data.pagination;
					var count = data.count;

					$(".table-striped tbody").empty();
					if(notices.length != 0){
						$.each(notices, function(index, notice){
							var row = "<tr>"
							row += "<td>"+notice.no+"</td>";
							row += "<td class='text-left'><a href='noticedetail.do?noticeNo="+notice.no+"'>"+notice.title+"</a></td>";
							row += "<td></td>";
							row += "<td>"+notice.writer+"</td>";
							row += "<td>"+notice.createDateStr+"</td>";
							row += "<tr>" 
							$(".table-striped tbody").append(row); 
						})
					} else {
						var row = "<tr>";
	                    row += "<td colspan='12' class='text-center'>공지사항이 없습니다.</td>";
	                    row += "</tr>";
	                    $(".table-striped tbody").append(row); 
					}
				}
			})
		}
	</script> -->
</body>
</html>