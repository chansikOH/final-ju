<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
		left: 235px;
		padding: 10px 0;
		display: inline-block;
		font-size: 20px;
		color: #333;
	}
	.nav-sub {
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
</style>
	
	<div class="row">
		<div class="col-sm-12 header-nav navbar-default">
			<div class="navbar-header">
				<a href="#" class="logo">중앙사이버대학교</a>
				<ul class="nav-sub navbar-nav">
					<li><a href="#" id="menu1">학적관리</a></li>
					<li><a href="#" id="menu2">강의</a></li>
					<li><a href="#" id="menu3">개인정보관리</a></li>
					<li><a href="#" id="menu4">성적</a></li>
					<li><a href="#" id="menu5">등록금</a></li>
					<li><a href="#" id="menu6">휴/복학 신청</a></li>
					<li><a href="#" id="menu7">학사일정</a></li>
					<li><a href="#" id="menu8">공지사항</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-12 sub-menu header-under">
			<div id="sub-menu1">
				<ul>
					<li><a href="#">수강 신청</a></li>
					<li><a href="#">수강 변경</a></li>
					<li><a href="#">수강 조회</a></li>
				</ul>
			</div>
			<div id="sub-menu2">
				<ul>
					<li><a href="#">소메뉴1</a></li>
					<li><a href="#">소메뉴2</a></li>
					<li><a href="#">소메뉴3</a></li>
					<li><a href="#">시험보기</a></li>
				</ul>
			</div>		
			<div id="sub-menu3">
			</div>
			<div id="sub-menu4">
				<ul>
					<li><a href="#">성적 조회</a></li>
					<li><a href="#">강의 평가</a></li>
				</ul>
			</div>
			<div id="sub-menu5">
				<ul>
					<li><a href="#">등록금 납부내역</a></li>
					<li><a href="#">통지서 조회</a></li>
				</ul>
			</div>
			<div id="sub-menu6">
				<ul>
					<li><a href="#">휴학 신청</a></li>
					<li><a href="#">복학 신청</a></li>
					<li><a href="#">자퇴 신청</a></li>
				</ul>
			</div>
			<div id="sub-menu7">
			</div>
			<div id="sub-menu8">
			</div>
		</div>
	</div>
	
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
