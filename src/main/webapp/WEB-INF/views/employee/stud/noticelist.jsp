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
     .search{text-align: right;}
		
	.result{padding: 0 15px;}
	.result p{text-align: left; font-size: 18px; padding-left: 30px;}
	.result div:first-child{margin: 15px 0 5px 0; padding: 0;}
	.result th{background: #faf6f0; }
	.result th, td{text-align: center; }
	
	.pagination li{text-align: center;}
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
						<div class="col-sm-12"> 
							<div class="col-sm-6">
		                            <p>총 <strong><span id="search-result-count"></span></strong>건 조회</p>
		                    </div>
					  	    <div class="col-sm-6 search" > 
								<form method="get" action="noticelist.json" class="navbar-form">
								    <div class="form-group">
								  		<input type="text" hidden="" name="pageNo" value="1"> 
								    </div> 
							        <select class="form-control" name="option" >
			                            <option value="">검색조건</option>
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
								<!-- ajax 입력 -->
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-12 page">
						<ul class="pagination" id="pagination-box">
							<!-- ajax 입력 -->
						</ul> 
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">

		var pageNo = $("[name=pageNo]").val(); 
		var option = $("[name=option]").val(); 
		var search = $("[name=search]").val(); 

		gosearch();
			
		function gosearch(){
			$.ajax({
				type:"GET",
				url:"noticelist.json",
				data:{pageNo:pageNo, option:option, search:search},
				dataType: "json",
				success:function(data){
					var notices = data.notices;
					var pagination = data.pagination;
					var count = data.count;
					
					/*공지사항 표현*/
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
	                    row += "<td colspan='12' class='text-center'> 조건에 해당하는 공지사항이 없습니다.</td>";
	                    row += "</tr>";
	                    $(".table-striped tbody").append(row); 
					}
					
					/* pagination */
	              	var page = pagination.page;		/* 현재 페이지*/
	              	var begin = pagination.begin;	/* 화면에 보여질 첫번째 번호 */
	              	var end = pagination.end;		/* 화면에 보여질 마지막 번호 */
	              	var first = pagination.first;	/* ture or false*/
	              	var last = pagination.last;		/* ture or false*/
	
	                var row = "";
	              	
	 				if (!first) {
	 					row += "<li><a href='' data-pno='"+(pagination.page -1 )+"'><span class='glyphicon glyphicon-menu-left'></span></li>";
	 				}
	 				for (var i=pagination.begin; i<=pagination.end; i++) {
	 					if (page == i) {
	 						row += "<li class='page-active'><a href='' data-pno='"+i+"'>"+i+"</li>";
	 					} else {
		   					row += "<li><a href='' data-pno='"+i+"'>"+i+"</li>";
	 					}
	 				}
	 				if (!last) {
	 					row += "<li><a href='' data-pno='"+(pagination.page +1 )+"'><span class='glyphicon glyphicon-menu-right'></span></li>";
	 				}
	 				$("#pagination-box").html(row);		
	 				
					/*갯수 변경*/
		            $("#search-result-count").text(count); 
		    	}
			})
		}
		
		$("[name=option]").on("click", function(){
			$("[name=search]").val(''); 
			var opt = $(this).val();
			if (opt == "createDate"){
				$("[name=search]").attr("type",'date');
			} else {
				$("[name=search]").attr("type",'text');
			}
		})
		
		$(".search form button").on("click",function(){
			pageNo = $("[name=pageNo]").val(); 
			option = $("[name=option]").val(); 
			search = $("[name=search]").val(); 

			gosearch();
		})
	
		$("#pagination-box").on("click", "a", function(event){
			event.preventDefault() 
			pageNo = $(this).attr("data-pno");
			$("[name=pageNo]").val(pageNo);
			$(".search form button").click(); 
		}); 
		
		
	</script>
</body>
</html>