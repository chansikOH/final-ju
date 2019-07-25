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
<style>
	.box-top {
		height: 400px;
	}
	
	.box-bottom {
		height: 200px;
	} 
	
	.auto {
		overflow: auto;
	}
	
	.result{padding: 0 15px;}
	.result div:first-child{margin: 15px 0 5px 0; padding: 0;}
	.result th{background: #faf6f0; }
	.result th,td{text-align: center; }
</style>
</head>

<body>
	<div class="container-fluid">
		<%@ include file="../../common/header.jsp" %>
		<div class="row">
			<div class="col-sm-2">
				<%@ include file="../../common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10">
				<h1>수강신청</h1>
				<br>
				<div class="row">
					<div class="col-sm-12">
						<span style="font-size: 20px; color: #333;"><strong>개설과목</strong></span>
					</div>
				</div>
				<div class="row result">
					<div class="col-sm-12 box-top auto">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>NO</th>
									<th>년도</th>
									<th>학기</th>
									<th>교과번호</th>
									<th>교과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>담당교수</th>
									<th>신청인원</th>
									<th>정원</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2</td>
									<td>40</td>
									<td>
										<button class="btn btn-default">신청</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2019</td>
									<td>2학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전선</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2</td>
									<td>40</td>
									<td>
										<button class="btn btn-default">신청</button>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>교필</td>
									<td>2</td>
									<td>김다윤</td>
									<td>2</td>
									<td>40</td>
									<td>
										<button class="btn btn-default">신청</button>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>2019</td>
									<td>2학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>교선</td>
									<td>2</td>
									<td>김다윤</td>
									<td>2</td>
									<td>40</td>
									<td>
										<button class="btn btn-default">신청</button>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td>2019</td>
									<td>2학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>교선</td>
									<td>2</td>
									<td>김다윤</td>
									<td>2</td>
									<td>40</td>
									<td>
										<button class="btn btn-default">신청</button>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>2019</td>
									<td>2학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>교선</td>
									<td>2</td>
									<td>김다윤</td>
									<td>2</td>
									<td>40</td>
									<td>
										<button class="btn btn-default">신청</button>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td>2019</td>
									<td>2학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>교선</td>
									<td>2</td>
									<td>김다윤</td>
									<td>2</td>
									<td>40</td>
									<td>
										<button class="btn btn-default">신청</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<br>
				
				<div class="row">
					<div class="col-sm-3">
						<span style="font-size: 20px; color: #333;"><strong>수강신청내역</strong></span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>수강가능학점 : 24</span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>신청과목수 : 7</span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>신청학점 : 21</span>
					</div>
				</div>
				
				<div class="row result">
					<div class="col-sm-12 box-bottom auto">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>NO</th>
									<th>년도</th>
									<th>학기</th>
									<th>교과번호</th>
									<th>교과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>담당교수</th>
									<th>신청일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2019-02-17</td>
									<td>
										<button class="btn btn-default">취소</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2019-02-17</td>
									<td>
										<button class="btn btn-default">취소</button>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2019-02-17</td>
									<td>
										<button class="btn btn-default">취소</button>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2019-02-17</td>
									<td>
										<button class="btn btn-default">취소</button>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2019-02-17</td>
									<td>
										<button class="btn btn-default">취소</button>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2019-02-17</td>
									<td>
										<button class="btn btn-default">취소</button>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td>2019</td>
									<td>1학기</td>
									<td>1984040</td>
									<td>컴퓨터구조</td>
									<td>전필</td>
									<td>3</td>
									<td>김다윤</td>
									<td>2019-02-17</td>
									<td>
										<button class="btn btn-default">취소</button>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
