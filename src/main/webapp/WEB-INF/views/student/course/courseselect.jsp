<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
		height: 500px;
	}
	
	.auto {
		overflow: auto;
	}
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
				<h1>수강조회</h1>
				<!-- <div class="row">
					<div class="col-sm-12">
						<span><strong>[학기별성적]</strong></span>
					</div>
				</div> -->
				
				<div class="row">
					<div class="col-sm-2">
						<span><strong>[학기별성적]</strong></span>
					</div>
					<div class="col-sm-3">
						<label>년도-학기</label>
						<select name="year-term">
							<option value="">1학년 1학기</option>
							<option value="">1학년 2학기</option>
							<option value="">2학년 1학기</option>
							<option value="">2학년 2학기</option>
						</select>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>학점계 : 16</span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>평점계 : 77.7</span>
					</div>
					<div class="col-sm-2" style="font-weight: bold;">
						<span>평점 평균 : 4.44 / 4.5</span>
					</div>
					<div class="col-sm-1" style="font-weight: bold;">
						<span>총 5 건</span>
					</div>
				</div>
				
				<div class="row">
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
									<th>등급</th>
									<th>평점</th>
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
									<td>B+</td>
									<td>3.5</td>
									<td></td>
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
									<td>B+</td>
									<td>3.5</td>
									<td></td>
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
									<td>B+</td>
									<td>3.5</td>
									<td></td>
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
									<td>B+</td>
									<td>3.5</td>
									<td></td>
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
									<td>B+</td>
									<td>3.5</td>
									<td></td>
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
									<td>B+</td>
									<td>3.5</td>
									<td></td>
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
									<td>B+</td>
									<td>3.5</td>
									<td></td>
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