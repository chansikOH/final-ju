<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
</head>
<style>
#doclist {margin-top: 20px;}
.btn {background-color: #E3DCCC;}
#tr {background-color: #faf6f0;}
</style>
<body>
<div class="container-fluid">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="row">
<div class="col-sm-2 shadow">
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
</div>
<div class="col-sm-10">
	<div class="row" id="doclist">
		<div class="col-sm-5">
                      <form action="questionlist.jf" class="form-inline">
                        <select name="opt" class="form-control">
                            <option value="">결재번호</option>
                            <option value="">제목</option>
                            <option value="">권한</option>
                        </select>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="검색어입력" />
                            <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                    </form>
                  </div>
                  <div class="col-sm-5">
                      <div class="form-group button-righ">
                            <button type="" class="btn btn-success">대기중</button>
                            <button type="" class="btn btn-warning">진행중</button>
                            <button type="" class="btn btn-info">반려</button>
                            <button type="" class="btn btn-info">완료</button>
                        </div>
                  </div>
		<div class="col-sm-2 text-right">
			<button href="" class="btn">선택삭제</button>
		</div>
	</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-sm-12">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr id="tr">
							<th>결재번호</th>
							<th>제목</th>
							<th>파일</th>
							<th>작성자</th>
							<th>결재자</th>
							<th>등록일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" name="" />100</td>
							<td><a href="">보고서</a></td>
							<td>첨부파일 유무상태</td>
							<td>박인재</td>
							<td>부장</td>
							<td>2018/1/20</td>
							<td>대기중</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="" />200</td>
							<td><a href="">보고서</a></td>
							<td>첨부파일 유무상태</td>
							<td>박재상</td>
							<td>부장</td>
							<td>2018/2/20</td>
							<td>결재중</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="" />300</td>
							<td><a href="">보고서</a></td>
							<td>첨부파일 유무상태</td>
							<td>박ㅇㅇ</td>
							<td>차장</td>
							<td>2018/3/20</td>
							<td>결재중</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="" />400</td>
							<td><a href="">보고서</a></td>
							<td>첨부파일 유무상태</td>
							<td>박지수</td>
							<td>차장</td>
							<td>2018/5/20</td>
							<td>반려</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="" />500</td>
							<td><a href="">보고서</a></td>
							<td>첨부파일 유무상태</td>
							<td>박건우</td>
							<td>차장</td>
							<td>2018/7/10</td>
							<td>완료</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	<div class="row">
		<div class="col-sm-12 text-center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li class="active"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 text-right">
			<a href="" class="btn-sm btn-success">기안서작성</a> 
			<a href="" class="btn-sm btn-info">휴가서작성</a> 
			<a href="" class="btn-sm btn-warning">퇴직서작성</a>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#sub-menu1').hide();
	$('#sub-menu2').hide();
	$('#sub-menu4').hide();
	$('#sub-menu5').hide();
	$('#sub-menu6').hide();
	$('.navbar-header a')
	.click(
		function() {
			var clickthis = $(this).attr('id');
			
			$(this).parent('li').addClass('active')
			.siblings().removeClass('active');
	
			var menuName = document
			.getElementById("sub-" + clickthis);
	
			if (menuName != null) {
				$("#sub-" + clickthis).slideDown()
				.siblings('div').slideUp();
				$('#sub-' + clickthis)
				.position(
		function() {
			var parents = document.getElementById(clickthis);
			})
		} else {
			$('.sub-menu > .container > div') .slideUp();
		}
			$("#sub-" + clickthis + ' a').click( function() {
				$(this).css('color', 'red')
				.parent('li')
				.siblings()
				.children('a').css('color', 'navy');
		});
	});
});
</script>
</body>
</html>
