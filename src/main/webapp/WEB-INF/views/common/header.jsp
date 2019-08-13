<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:parseDate value="0831" pattern="MMdd" var="termDate" />
	<fmt:parseDate value="0801" pattern="MMdd" var="termDate2"/> 
	
	<fmt:formatDate value="${now }" pattern="MMdd" var="nowDate"/>
	<fmt:formatDate value="${now }" pattern="yyyy" var="nowYear"/>
	<fmt:formatDate value="${termDate }" pattern="MMdd" var="term" />
	<fmt:formatDate value="${termDate2 }" pattern="MMdd" var="term2" />
	
<style>
	body {
	overflow-x: hidden;
	}
	li {
		list-style: none;
	}
	.nav-sub {
		padding: 0 15px;
	}
	.navbar-header .logo {
		position: absolute;
		left: 100px;
		padding: 0;
		display: inline-block;
		font-size: 20px;
		color: #333;
	}
	
	.nav-sub {
 		width: 840px;
		float: right;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	.nav-sub>li {
		padding: 0 10px;
	}
	.nav-sub a {
		padding: 20px 10px;
	}
	ul {
		padding-top: 10px;
	}
	.sub-menu a {
		padding: 20px 10px;
	}
	.sub-menu {
		min-height: 0px;
	}
	.sub-menu div {
		display: none;
	}
	a:hover {
		text-decoration: none !important;
	}
	.sub-menu li {
		display: inline-block;
	}
	.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:focus, .navbar-default .navbar-nav>.active>a:hover {
		background-color: #E3DCCC;
		font-weight: bold;
		color: #111;
		text-decoration: none;
	}
	.header-nav{
		position: relative;
		height: 50px;
	}
	.navbar-default .navbar-nav>li>a {
		color: #333;
		font-size: 15px;
	}
	.navbar-default {
		background-color: #E3DCCC;
	}
	.header-under {
		left: 30%;
	}
	.header-under a {
		color: #402600;
	}
	.prof .header-under{left: 40% !important;}
	.prof-sub{
		width:370px !important;
	}
</style>
	<c:if test="${not empty LOGIN_STUDENT }">
		<div class="row">
			<div class="col-sm-12 header-nav navbar-default">
				<div class="navbar-header">
					<a href="/ju/student/mypage" class="logo">
						<img alt="logo" src="/ju/resources/images/logo.png" width="200" height="50">
					</a>
					<ul class="nav-sub navbar-nav">
						<li><a href="#" id="menu1">학적관리</a></li>
						<li><a href="/ju/student/course/courselist" id="menu2">강의</a></li>
						<li><a href="/ju/student/mypage" id="menu3">개인정보관리</a></li>
						<li><a href="/ju/student/records" id="menu4">성적조회</a></li>
						<li><a href="#" id="menu5">휴/복학 신청</a></li>
						<li><a href="/ju/student/notice/list" id="menu6">공지사항</a></li>
					</ul>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-sm-12 sub-menu header-under">
				<div id="sub-menu1">
					<ul>
						<li><a href="/ju/student/course/apply">수강 신청</a></li>
						<li><a href="/ju/student/course/select">수강 조회</a></li>
					</ul>
				</div>
				<div id="sub-menu2">
				</div>		
				<div id="sub-menu3">
				</div>
				<div id="sub-menu4">
				</div>
				<div id="sub-menu5">
					<ul>
						<li><a href="/ju/student/status/chStatus?sta=leave">휴학 신청</a></li>
						<li><a href="/ju/student/status/chStatus?sta=goingback">복학 신청</a></li>
						<li><a href="/ju/student/status/chStatus?sta=drop">자퇴 신청</a></li>
					</ul>
				</div>
				<div id="sub-menu6">
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${not empty LOGIN_PROFESSOR }">
		<div class="row">
			<div class="col-sm-12 header-nav navbar-default">
				<div class="navbar-header">
					<a href="#" class="logo">
						<img alt="logo" src="/ju/resources/images/logo.png" width="200" height="50">
					</a>
					<ul class="nav-sub navbar-nav prof-sub">
						<!-- <li><a href="#" id="menu1">학적관리</a></li> -->
						<li><a href="#" id="menu1">강의</a></li>
						<li><a href="#" id="menu2">성적</a></li>
						<li><a href="#" id="menu3">강의평가</a></li>
						<li><a href="#" id="menu4">공지사항</a></li>
					</ul>
				</div>
			</div>
		</div>
	
		<div class="row prof">
			<div class="col-sm-12 sub-menu header-under">
				<div id="sub-menu1">
					<ul>
						<li><a href="/ju/professor/class/list">강의조회</a></li>
						<li><a href="/ju/professor/class/form">강의개설</a></li>
						<li><a href="/ju/professor/course/planform">강의계획작성</a></li>
					</ul>
				</div>		
				<div id="sub-menu2">
					<ul>
						<c:choose>
							<c:when test="${nowDate < term }">
								<li><a href="/ju/professor/grade/grade?term=1&year=${nowYear}">성적입력</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/ju/professor/grade/grade?term=2">성적입력</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="/ju/professor/grade/gradelist">성적조회</a></li>
					</ul>
				</div>
				<div id="sub-menu3">
					<ul>
						<c:choose>
							<c:when test="${nowDate < term2 }">
								<li><a href="/ju/professor/grade/classopinion?term=1&year=${nowYear}">강의평가 조회</a></li>					
							</c:when>
							<c:otherwise>							
								<li><a href="/ju/professor/grade/classopinion?term=2&year=${nowYear}">강의평가 조회</a></li>					
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div id="sub-menu4">
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${not empty LOGIN_EMPLOYEE }">
		<div class="row">
			<div class="col-sm-12 header-nav navbar-default">
				<div class="navbar-header">
					<a href="#" class="logo">
						<img alt="logo" src="/ju/resources/images/logo.png" width="200" height="50">
					</a>
					<ul class="nav-sub navbar-nav">
						<li><a href="#" id="menu1">구성원 관리</a></li>
						<li><a href="#" id="menu2">신청내역</a></li>
						<li><a href="/ju/employee/statistic" id="menu3">학교현황</a></li>
						<li><a href="#" id="menu4">공지사항 관리</a></li>
						<li><a href="/ju/doc/list" id="menu5">결재</a></li>
					</ul>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-sm-12 sub-menu header-under">
				<div id="sub-menu1">
					<ul>
						<li><a href="/ju/employee/stud/register">학생 등록</a></li>
						<li><a href="/ju/employee/stud/checklist">학생 조회</a></li>
					</ul>
				</div>
				<div id="sub-menu2">
					<ul>
						<li><a href="/ju/employee/stud/changestatus">학적변경신청</a></li>
					</ul>
				</div>		
				<div id="sub-menu3">
				</div>
				<div id="sub-menu4">
					<ul>
						<li><a href="/ju/employee/stud/noticelist">공지사항</a></li>
						<li><a href="/ju/employee/stud/noticeform">공지사항 등록</a></li>
					</ul>
				</div>
				<div id="sub-menu5">
				</div>
			</div>
		</div>
	</c:if>
	
<script type="text/javascript">
	$(function() {
		$('.navbar-header a').click(function() {
			var clickthis = $(this).attr('id');
			
			$(this).parent('li').addClass('active').siblings().removeClass('active');
                  
			var menuName = $("#sub-"+clickthis);
               
			if(menuName != null) {
			    $("#sub-"+clickthis).slideToggle().siblings('div').slideUp();
			} else {                    
			    $('.sub-menu > .container > div').slideUp();
			}
			                                
			$("#sub-"+clickthis+' a').click(function() {
			    $(this).parents('.sub-menu').find('a').css('color', '#402600').css('font-weight', '400');
			    $(this).css('font-weight', 'bold').css('text-decoration', 'none');
			});
		});
	});
</script>
