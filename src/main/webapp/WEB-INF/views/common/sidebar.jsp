<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	.sidebar > div {
		padding: 0px;
	}
	
	img {
		border-radius: 50%;
		display: block;
		margin: 0px auto;
	}
	
	.center {
		text-align: center;
	}
	
	.sidebar {
		background-color: #faf6f0;
		padding: 0;
	}
	
	.bg-color-gray {
		background-color: #E3DCCC;
	}
	
	#student-info-table td {text-align: left;}
</style>
<div class="sidebar" style="height: 100vh;">

	<c:if test="${not empty LOGIN_STUDENT }">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<c:choose>
					<c:when test="${empty LOGIN_STUDENT.photoName }">
						<img src="/ju/resources/images/profile.jpg" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/ju/resources/images/students/${LOGIN_STUDENT.photoName }" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<p class="text-center">
					<strong>${LOGIN_STUDENT.name }</strong>님 환영합니다.
					<a href="/ju/logout" class="btn btn-default btn-xs">로그아웃</a>
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<table class="table" id="student-info-table">
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<td class="bg-color-gray">학번</td>
							<td>${LOGIN_STUDENT.no }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학과</td>
							<td>${LOGIN_STUDENT.major.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학년</td>
							<td>${LOGIN_STUDENT.grade }학년</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이름</td>
							<td>${LOGIN_STUDENT.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">주소</td>
							<td>${LOGIN_STUDENT.address }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">연락처</td>
							<td>${LOGIN_STUDENT.phoneNumber }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이메일</td>
							<td>${LOGIN_STUDENT.email }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty LOGIN_PROFESSOR }">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<img src="/ju/resources/images/profile.jpg" style="width: 50%; height: 50%; margin-bottom: 20px;" />
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<p class="center">
					<strong>${LOGIN_PROFESSOR.name }</strong>님 환영합니다.
					<a href="/ju/logout" class="btn btn-default btn-xs">로그아웃</a>
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<table class="table">
					<tbody>
						<tr>
							<td class="bg-color-gray">학번</td>
							<td>20173868</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학과</td>
							<td>컴퓨터정보공학과</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학년</td>
							<td>2학년</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이름</td>
							<td>김다윤</td>
						</tr>
						<tr>
							<td class="bg-color-gray">주소</td>
							<td>서울시 영등포구 서울시 영등포구</td>
						</tr>
						<tr>
							<td class="bg-color-gray">연락처</td>
							<td>010-0000-0000</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이메일</td>
							<td>kim@naver.com</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty LOGIN_EMPLOYEE }">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<img src="/ju/resources/images/profile.jpg" style="width: 50%; height: 50%; margin-bottom: 20px;" />
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<p class="center">
					<strong>${LOGIN_EMPLOYEE.name }</strong>님 환영합니다.
					<a href="/ju/logout" class="btn btn-default btn-xs">로그아웃</a>
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<table class="table">
					<tbody>
						<tr>
							<td class="bg-color-gray">학번</td>
							<td>20173868</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학과</td>
							<td>컴퓨터정보공학과</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학년</td>
							<td>2학년</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이름</td>
							<td>김다윤</td>
						</tr>
						<tr>
							<td class="bg-color-gray">주소</td>
							<td>서울시 영등포구 서울시 영등포구</td>
						</tr>
						<tr>
							<td class="bg-color-gray">연락처</td>
							<td>010-0000-0000</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이메일</td>
							<td>kim@naver.com</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
</div>