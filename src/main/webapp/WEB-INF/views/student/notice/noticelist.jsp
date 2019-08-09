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
						<p class="title">총 <strong id="notice-count">${count }</strong>건 조회</p>
					</div>
					<div class="col-sm-6 search">
						<div class="input-group title">
							<select class="form-control" name="option" style="width: 100px;">
								<option value="" selected="selected">전체</option>
								<option value="title">제목</option>
								<option value="contents">내용</option>
							</select>
							<input class="form-control" type="text" name="search" placeholder="Search" style="width: 350px;" value="">
							<button class="btn btn-default" type="button" id="search-word-btn">검색</button>
						</div>
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
								<c:forEach var="notice" items="${notices }">
									<tr>
										<td>${notice.no }</td>
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
				
				<div class="row">
					<div class="col-sm-12 text-center">
						<ul class="pagination" id="pagination-box">
						<!-- &laquo;를 나타내는 c:choose -->
						<c:choose>	
							<c:when test="${pagination.first }">
								<li class="disabled"><a href="#">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="list?pno=${pagination.page - 1 }" data-pno="${pagination.page - 1 }">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						
						<!-- 1페이지, 2페이지 등 페이지번호를 나타내는 c:foreach -->
						<c:forEach begin="${pagination.begin }" end="${pagination.end }" varStatus="index">
							<c:if test="${index.count eq pagination.page }">
								<li class="active"><a href="list?pno=${index.count }">${index.count }</a></li>
							</c:if>
							<c:if test="${index.count ne pagination.page }">
								<li><a href="list?pno=${index.count }">${index.count }</a></li>
							</c:if>
						</c:forEach>
						
						<!-- &raquo;를 나타내는 c:choose -->
						<c:choose>	
						<c:when test="${pagination.last }">
							<li class="disabled"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="list?pno=${pagination.page + 1 }" data-pno="${pagination.page + 1 }">&raquo;</a></li>
						</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			//var pageNo = $("[name=pageNo]").val();
			
			$("[name=option]").change(function() {
				$("[name=search]").val("");
			});
			
			$("#search-word-btn").click(function() {
				var option = $("[name=option]").val();
				var search = $("[name=search]").val();
				$.ajax({
					type:"GET",
					url:"noticelist.json",
					data:{option:option, search:search},
					dataType: "json",
					success:function(data){
						var notices = data.notices;
						var count = data.count;
	
						$(".table-striped tbody").empty();
						if(notices.length != 0){
							$.each(notices, function(index, notice){
								var row = "<tr>"
								row += "<td>"+notice.no+"</td>";
								row += "<td class='text-left'><a href='detail?no="+notice.no+"'>"+notice.title+"</a></td>";
								row += "<td></td>";
								row += "<td>"+notice.writer+"</td>";
								row += "<td>"+notice.createDateStr+"</td>";
								row += "<tr>" 
								$(".table-striped tbody").append(row); 
							})
							
							$("#notice-count").text(count);
						} else {
							var row = "<tr>";
		                    row += "<td colspan='12' class='text-center'>공지사항이 없습니다.</td>";
		                    row += "</tr>";
		                    $(".table-striped tbody").append(row); 
						}
					}
				});
			})
		})
	</script>
</body>
</html>