<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap Example</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style>
	 a{color: #000;}
     a:hover{text-decoration: none;}
    .student-search .title{margin: 20px 0;}
    .student-search .table-wrap .table{border: 1px solid #ccc;}
    .student-search .title h1{font-size: 26px;}
    .student-search .search-btn{padding: 5px 20px;}
    .student-search .table-wrap .table .border-top{border: none; padding-top: 25px}
    .student-search .table-wrap .table>tbody>tr>td, .student-search .table-wrap .table>tbody>tr>th, .student-search .table-wrap .table>tfoot>tr>td, .student-search .table-wrap .table>tfoot>tr>th, .student-search .table-wrap .table>thead>tr>td, .student-search .table-wrap .table>thead>tr>th{padding:25px 20px;}
    .student-search .search{text-align: right;}
    .student-search .search-btn{margin-right: 71px;}
    .student-search select, input{width:174px; height: 22px;}
    
    .result{padding: 0 15px;}
    .result div:first-child{margin: 35px 0 5px 0; padding: 0;}
    .result div:nth-child(2){padding: 0;}
    .result p{text-align: right; font-size: 15px; color: #0000ff;}
    .result th{background: #faf6f0; }
    .result th,td{text-align: center; }
    .modal-content .btn-default{padding: 0 22px;}
    .result .file{box-sizing: border-box;}
    .result .attach {padding-left: 41px;}
    
    .pagination{width: 100%;}
    .pagination .page{width: 100%; text-align: center;}
    .pagination a{color: #777; font-size: 15px; padding: 10px;}
    .pagination .page-active{color: #111; font-weight: bold;}
    .pagination a:hover{color: #777; text-decoration: none;}
    
    .modal-content table th{text-align: center;}
    .modal-content h3{margin: 25px 0 10px 25px; font-size: 20px; font-weight: bold; color: #555;}
    
    .student-search .table .btn-update{padding: 18px 10px !important;}
    .dl-horizontal dt {text-align: left;}
    .img-rounded {width: 250px; height: 250px;}
    
    .bs-grade-modal-lg .input-sm {height: 30px;}
    .result-save{padding: 15px 0 0 0 !important;}
    .result-close{text-align: right;}
    
	</style>
</head>
<body>
<%@ include file="../../common/header.jsp" %>
	<div class="container-fluid">
        <div class="row student-search">
            <div class="col-sm-2">
               <%@include file="../../common/sidebar.jsp" %>
            </div>
            <!-- 정보 넣는 곳-->
            <div class="col-sm-10">
                <div class="col-sm-12 title">
                    <h1>학생 조회</h1>
                </div>
                <div class="col-sm-12 table-wrap">
                    <form method="get" action="checklist.json">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th class="border-top">학적상태</th>
                                    <td class="border-top">
                                        <select name="status">
                                            <option>전체</option>
                                            <option>재학</option>
                                            <option>휴학</option>
                                            <option>졸업</option>
                                            <option>자퇴</option>
                                        </select>
                                    </td>
                                    <th class="border-top">학년</th>
                                    <td class="border-top">
                                        <select name="grade">
                                            <option value="전체">전체</option>
                                            <option value="1">1학년</option>
                                            <option value="2">2학년</option>
                                            <option value="3">3학년</option>
                                            <option value="4">4학년</option>
                                        </select>
                                    </td>
                                    <th class="border-top">학과</th>
                                    <td class="border-top">
                                        <select name="major">
                                            <option>전체</option>
                                            <c:forEach var="major" items="${majors }">
                                            <option value="${major.no }">${major.name }</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>학생명</th>
                                    <td>
                                        <input name="name">
                                    </td>
                                    <th>학번</th>
                                    <td>
                                        <input name="studentNo">
                                    </td>
                                    <th>전화번호</th>
                                    <td>
                                        <input name="tel"> 
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td></td>
                                    <th></th>
                                    <td></td>
                                    <th></th>
                                    <td class="search"> 
                                        <button type="submit" class="search-btn btn btn-default">조회</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="row result">
                        <div class="col-sm-12">
                            <p>총 <span>10</span>건 조회</p>
                        </div>
                        <div class="col-sm-12">
                            <table class="table" id="search-result-table">
                                <thead>
                                    <tr>
                                        <th>순번</th>
                                        <th></th>
                                        <th></th>
                                        <th>학년</th>
                                        <th>학과</th>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>학적상태</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="hiden">
                                        <td>1</td>
                                        <td></td>
                                        <td></td> 
                                        <td>1학년</td>
                                        <td>컴퓨터공학과</td>
                                        <td>20119111</td>
                                        <td>양해림</td>
                                        <td>재학중</td>
                                        <td></td>
                                        <td class="btn-update"><a href="#" class="btn btn-default" data-toggle="modal" data-target=".bs-detail-modal-lg">상세정보</a></td>
                                        <td class="btn-update"><a href="#" class="btn btn-default" data-toggle="modal" data-target=".bs-change-modal-lg">학적상태변경</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row pagination">
                    <div class="col-sm-12 page">
                        <span class="glyphicon glyphicon-menu-left"></span>
                        <a href="#" class="page-active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <span class="glyphicon glyphicon-menu-right"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Large modal -->
    <div class="modal fade bs-detail-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
        	<div class="modal-content">
                <h3>학생 상세정보</h3>
      			<div class="modal-body">
        			<div class="row">
	    				<div class="col-sm-3">
	    					<img src="/ju/resources/images/profile.jpg" class="img-thumbnail">
	    				</div>
	    				<div class="col-sm-9">		  
	    					<dl class="dl-horizontal">
							  <dt>이름</dt><dd>양해림</dd> 				  
							  <dt>성별</dt><dd>여자</dd> 				  
							  <dt>생년월일</dt><dd>1992-02-06</dd> 				  
		         			  <dt>학과</dt><dd>컴퓨터공학과</dd> 				  
							  <dt>학번</dt><dd>20180283</dd> 				  
							  <dt>이메일</dt><dd>yang9202@naver.com</dd>
							  <dt>연락처</dt><dd>031-968-1671</dd>
							  <dt>주소</dt><dd>경기도 고양시 덕양구 화정동 옥빛마을 1506동 1303호</dd>
							</dl>			
	    				</div>
    				</div>
      			</div>
      			<div class="result-close"><button class="btn btn-default input-sm">닫힘</button></div>
    		</div>        
        </div>
    </div>
    <div class="modal fade bs-change-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h3>학적상태 변경</h3>
                <form class="form"> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>학번</th>
                                <th>이름</th>
                                <th>학년</th>
                                <th>학과</th>
                                <th>변경 전</th>
                                <th class="status-result">변경 후</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>20181234</td>
                                <td>양해림</td>
                                <td>2</td>
                                <td>컴퓨터공학과</td>
                                <td>재학</td>
                                <td class="status-result">
                                    <select class="form-control input-sm">
                                        <option>선택</option>
                                        <option>재학</option>
                                        <option>휴학</option>
                                        <option>졸업</option>
                                        <option>자퇴</option>
                                        <option>제적</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="result-save"><button class="btn btn-default input-sm">저장</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$(function() {
    		
    		$("#search-result-table tbody tr").hide()
    		
    		/* $("search-btn").on('click', "#search-result-table tbody tr", function() {
    			var 
    		}); */
    	})
    </script>
</body>
</html>