<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.btn-doc {background-color: #E3DCCC;}
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
				<div class="col-sm-10">
					<div class="button-righ">
						<a href="" class="btn btn-warning btn-doc">결재중(2)</a>
						<a href="" class="btn btn-warning btn-doc">결재대기(2)</a>
						<a href="" class="btn btn-info btn-doc">반려(1)</a>
						<a href="" class="btn btn-default btn-doc">완료(1)</a>
					</div>
				</div>
				<div class="col-sm-2 tetxt-right">
					<a href="deleteDocs?no=${doc.no }" class="btn btn-danger  btn-doc"  >선택삭제</a>
				</div>
				<br/>
			<div class="row" style="maring-top:20px;">
				<div class="col-sm-12" style="margin-top: 20px">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="10%">
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
						<c:forEach var="doc" items="${docs }">
							<tr>
								<c:choose>
									<c:when test="${doc.DRAFT_TITLE eq '휴가신청서' }">
										<td><input type="checkbox"/>${doc.DOC_NO}</td>
										<td><a href="vacation/detail?no=${doc.DOC_NO }">${doc.DRAFT_TITLE }</a></td>
										<td>${doc.DOC_FILE_YN }</td>
										<td>${doc.EMPLOYEE_NAME }</td>
										<td>${doc.EMPLOYEE_NAME_1 }</td>
										<td><fmt:formatDate value="${doc.DOC_CREATE_DATE }"/> </td>
										<td>
											<c:if test="${doc.DOC_STATE eq '결재중' }">
												<c:choose>
													<c:when test="${doc.DOC_MIDDLE_STATUS eq 'N' and doc.DOC_FINAL_STATUS eq 'N' and doc.DOC_MIDDLE_PERSON eq LOGIN_EMPLOYEE.no}">
														<span class="label label-warning">결재대기</span><a href="changeDocMiddleStatus?docNo=${doc.DOC_NO }" class="btn  btn-success btn-xs" >결재하기</a>
													</c:when>
													<c:when test="${doc.DOC_MIDDLE_STATUS eq 'Y' and doc.DOC_FINAL_STATUS eq 'N' and doc.DOC_FINAL_PERSON eq LOGIN_EMPLOYEE.no}">
														<span class="label label-warning">결재대기</span> <a href="changeDocMiddleStatus?docNo=${doc.DOC_NO }" class="btn  btn-success btn-xs" >결재하기</a>
													</c:when>
													<c:otherwise>
														<span class="label label-info">결재중</span> 
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${doc.DOC_STATE eq '완료' }">
												<span class="label label-primary">결재완료</span>
											</c:if>
										</td>
									</c:when>
									<c:when test="${doc.DRAFT_TITLE eq '퇴직신청서' }">
										<td><input type="checkbox"/>${doc.DOC_NO}</td>
										<td><a href="retire/detail?no=${doc.DOC_NO }">${doc.DRAFT_TITLE }</a></td>
										<td>${doc.DOC_FILE_YN }</td>
										<td>${doc.EMPLOYEE_NAME }</td>
										<td>${doc.EMPLOYEE_NAME_1 }</td>
										<td><fmt:formatDate value="${doc.DOC_CREATE_DATE }"/> </td>
										<td>
											<c:if test="${doc.DOC_STATE eq '결재중' }">
												<c:choose>
													<c:when test="${doc.DOC_MIDDLE_STATUS eq 'N' and doc.DOC_FINAL_STATUS eq 'N' and doc.DOC_MIDDLE_PERSON eq LOGIN_EMPLOYEE.no}">
														<span class="label label-warning">결재대기</span><a href="changeDocMiddleStatus?docNo=${doc.DOC_NO }" class="btn  btn-success btn-xs" >결재하기</a>
													</c:when>
													<c:when test="${doc.DOC_MIDDLE_STATUS eq 'Y' and doc.DOC_FINAL_STATUS eq 'N' and doc.DOC_FINAL_PERSON eq LOGIN_EMPLOYEE.no}">
														<span class="label label-warning">결재대기</span> <a href="changeDocMiddleStatus?docNo=${doc.DOC_NO }" class="btn  btn-success btn-xs" >결재하기</a>
													</c:when>
													<c:otherwise>
														<span class="label label-info">결재중</span> 
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${doc.DOC_STATE eq '완료' }">
												<span class="label label-primary">결재완료</span>
											</c:if>
										</td>
									</c:when>
									<c:otherwise>
										<td><input type="checkbox"/>${doc.DOC_NO}</td>
										<td><a href="draft/detail?no=${doc.DOC_NO }">${doc.DRAFT_TITLE }</a></td>
										<td>${doc.DOC_FILE_YN }</td>
										<td>${doc.EMPLOYEE_NAME }</td>
										<td>${doc.EMPLOYEE_NAME_1 }</td>
										<td><fmt:formatDate value="${doc.DOC_CREATE_DATE }"/> </td>
										<td>
											<c:if test="${doc.DOC_STATE eq '결재중' }">
												<c:choose>
													<c:when test="${doc.DOC_MIDDLE_STATUS eq 'N' and doc.DOC_FINAL_STATUS eq 'N' and doc.DOC_MIDDLE_PERSON eq LOGIN_EMPLOYEE.no}">
														<span class="label label-warning">결재대기</span><a href="changeDocMiddleStatus?docNo=${doc.DOC_NO }" class="btn  btn-success btn-xs" >결재하기</a>
													</c:when>
													<c:when test="${doc.DOC_MIDDLE_STATUS eq 'Y' and doc.DOC_FINAL_STATUS eq 'N' and doc.DOC_FINAL_PERSON eq LOGIN_EMPLOYEE.no}">
														<span class="label label-warning">결재대기</span> <a href="changeDocMiddleStatus?docNo=${doc.DOC_NO }" class="btn  btn-success btn-xs" >결재하기</a>
													</c:when>
													<c:otherwise>
														<span class="label label-info">결재중</span> 
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${doc.DOC_STATE eq '완료' }">
												<span class="label label-primary">결재완료</span>
											</c:if>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 text-right">
					<a href="/ju/doc/draft/addform" class="btn btn-primary btn-sm ">기안서작성</a> 
					<a href="/ju/doc/vacation/addform" class="btn btn-sm btn-info">휴가서작성</a> 
					<a href="/ju/doc/retire/addform" class="btn btn-sm btn-warning">퇴직서작성</a>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 text-center">
					<ul class="pagination">
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#sub-menu1').hide();
	$('#sub-menu2').hide();
	$('#sub-menu3').hide();
	$('#sub-menu4').hide();
	$('#sub-menu5').hide();
	$('.navbar-header a').click(function() {
		
		var clickthis = $(this).attr('id');
		
		$(this).parent('li').addClass('active').siblings().removeClass('active');
		
		var menuName = document.getElementById("sub-" + clickthis);
		
		if (menuName != null) {
			$("#sub-" + clickthis).slideDown().siblings('div').slideUp();
			$('#sub-' + clickthis).position(function() {
				var parents = document.getElementById(clickthis);
			})
			
		} else {
			$('.sub-menu > .container > div') .slideUp();
		}
			$("#sub-" + clickthis + ' a').click( function() {
			$(this).css('color', 'red').parent('li').siblings().children('a').css('color', 'navy');
		});
	});
});
</script>
</div>
</body>
</html>
