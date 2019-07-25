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
	    .course-search .title{margin: 20px 0;}
	    .course-search .table-wrap .table{border: 1px solid #ccc;}
	    .course-search .title h1{font-size: 26px;}
	    .course-search .search-btn{padding: 5px 20px;}
	    .course-search .table-wrap .table .border-top{border: none; padding-top: 25px}
	    .course-search .table-wrap .table>tbody>tr>td, .course-search .table-wrap .table>tbody>tr>th, .course-search .table-wrap .table>tfoot>tr>td, .course-search .table-wrap .table>tfoot>tr>th, .course-search .table-wrap .table>thead>tr>td, .course-search .table-wrap .table>thead>tr>th{padding:25px 20px;}
	    .course-search .search{text-align: right;}
	    .course-search .search-btn{margin-right: 70px;}
	    .course-search select, input{width:174px; height: 22px;}
	    .course-search .table-wrap .table td{text-align: center;}
	    .course-search .table-wrap .table .search{text-align: right;}
	    .result{padding: 0 15px;}
	    .result div:first-child{margin: 35px 0 5px 0; padding: 0;}
	    .result div:nth-child(2){padding: 0;}
	    .result p{text-align: right; font-size: 15px; color: #0000ff;}
	    .result th{background: #faf6f0; }
	    .result th, .result td, .modal td{text-align: center;}
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
	    .course-detail:hover{text-decoration: underline;}
	    .course-search .table .btn-update{padding: 18px 10px !important;}
	    
	    .move-btn{width: 123px; padding: 8px 0 !important;}
	    .bs-test-modal-lg .test-file{width: 250px; padding: 5px 20px 6px;}
	    .bs-test-modal-lg .test-select{padding: 5px 0 0 0;}
	    .bs-test-modal-lg .test-btn{text-align: right; padding: 12px 20px 0px;}
	    .modal-content .test-btn button{padding: 5px 15px;}
	    
	    .file-control{width: 250px; padding: 5px 20px !important;}
	    
	    .bs-example-modal-lg .save-btn{text-align: right; padding: 12px 20px 0px;}
	    .bs-example-modal-lg .save-btn button{padding: 5px 15px;}
	</style>
</head>
<body>
<%@include file="../../common/header.jsp" %>
<div class="container-fluid">
        <div class="row">
            <div class="col-sm-2">
                <!-- 정보 넣는 곳-->
                <%@include file="../../common/sidebar.jsp" %>
            </div>
            <div class="col-sm-10 course-search">
                <div class="col-sm-12 title">
                    <h1>강의 조회</h1>
                </div>
                <div class="col-sm-12 table-wrap">
                    <form method="get">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th class="border-top">년도</th>
                                    <td class="border-top">
                                        <select>
                                            <option>2019</option>
                                            <option>2018</option>
                                            <option>2017</option>
                                        </select>
                                    </td>
                                    <th class="border-top">학기</th>
                                    <td class="border-top">
                                        <select>
                                            <option>전체</option>
                                            <option>1학기</option>
                                            <option>2학기</option>
                                        </select>
                                    </td>
                                    <th class="border-top">교과목구분</th>
                                    <td class="border-top">
                                        <select>
                                            <option>전체</option>
                                            <option>전공</option>
                                            <option>교양</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>학과</th>
                                    <td>
                                        <select>
                                            <option>전체</option>
                                            <option>컴퓨터공학과</option>
                                            <option>국문학과</option>
                                        </select>
                                    </td>
                                    <th>교과목번호</th>
                                    <td>
                                        <input>
                                    </td>
                                    <th>교과목명</th>
                                    <td>
                                        <input>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="search">
                                        <button type="submit" class="search-btn btn btn-default">조회</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="row result">
                        <div class="col-sm-12">
                            <p>총 <span>${counts }</span>건 조회</p>
                        </div>
                        <div class="col-sm-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>순번</th>
                                        <th>교과목번호</th>
                                        <th>교과목구분</th>
                                        <th>년도</th>
                                        <th>학기</th>
                                        <th>교과목명</th>
                                        <th>개설학과</th>
                                        <th>교수명</th>
                                        <th>학점</th>
                                        <th>수강인원</th>
                                        <th>정원</th>
                                        <th>진행상태</th>
                                        <th>시험출제</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach varStatus="loop" var="course" items="${courses }">
                                    <tr>
                                        <td>${loop.count }</td>
                                        <td class="abc" data-value="${course.no }">${course.no }</td>
                                       	<c:choose>
                                       		<c:when test="${course.mustYn eq 'Y'}">
                                       			<c:choose>
	                                       			<c:when test="${course.major.no ne 40 }">
	                                       				<td>전공필수</td>
	                                       			</c:when>
	                                       			<c:otherwise>
		                                       			<td>교양필수</td>
	                                       			</c:otherwise>
                                       			</c:choose>
                                       		</c:when>
                                       		<c:otherwise>
                                       			<c:choose>
	                                       			<c:when test="${course.major.no ne 40 }">
	                                       				<td>전공선택</td>
	                                       			</c:when>
	                                       			<c:otherwise>
		                                       			<td>교양선택</td>
	                                       			</c:otherwise>
                                       			</c:choose>
                                       		</c:otherwise>
                                       	</c:choose>
                                       	<td>${course.year }</td>
                                       	<td>${course.term }</td>
                                        <td><a href="#"  class="course-detail" data-value="${loop.count }"data-toggle="modal" data-target=".bs-example-modal-lg">${course.name }</a></td>
                                        <td>${course.major.name }</td>
                                        <td>${course.professor.name}</td>
                                        <td>${course.credit }</td>
                                        <td>${course.count }</td>
                                        <td>${course.quota }</td>
                                        <td>${course.passYn }</td>
                                        <td class="btn-update">
                                            <a href="#" class="btn btn-default" data-toggle="modal" data-target=".bs-test-modal-lg">이동</a>
                                        </td>
                                        <td class="btn-update"><a href="classesupdate.html" class="btn btn-default">강의수정</a></td>
                                    </tr>
                                 </c:forEach>
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
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h3>교과목정보 조회</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>교과목번호</th>
                            <th>년도</th>
                            <th>학기</th>
                            <th>학과</th>
                            <th>교수명</th>
                            <th>강의계획서</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${courseByNo.no }</td>
                            <td>${courseByNo.year }</td>
                            <td>${courseByNo.term }</td>
                            <td>${courseByNo.major.name }</td>
                            <td>${courseByNo.professor.name }</td>
                            <td class="move-btn"><a href="#" class="btn btn-default">보기</a></td>
                            <td class="move-btn"><a href="plansupdate.html" class="btn btn-default">수정</a></td>
                        </tr>
                    </tbody>
                </table>
                <h3>강의 목차</h3>
                <form method="post" action="#">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>단원번호</th>
                                <th>단원명</th>
                                <th>단원주차</th>
                                <th>동영상 등록</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="courseparts" items="${courseParts}">
                            <tr>
                                <td>${courseparts.no }</td>
                                <td>${courseparts.name }</td>
                                <td>${courseparts.week }</td>
                                <td class="file-control"><input type="file" class="form-control input-sm"></td>
                            </tr>
                         </c:forEach>
                           <tr>
                               <td></td>
                               <td></td>
                               <td></td>
                               <td class="save-btn"><button type="submit" class="btn btn-default">저장</button></td>
                           </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <!-- Large modal -->
    <div class="modal fade bs-test-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h3>시험 출제</h3>
                <form method="post" action="">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>교과목번호</th>
                                <th>교과목구분</th>
                                <th>교과목명</th>
                                <th>학과</th>
                                <th>시험구분</th>
                                <th>시험출제</th>
                            </tr>
                           
                        </thead>
                        <tbody>
                            <tr>
                                <td>10000</td>
                                <td>전공</td>
                                <td>컴퓨터공학개론</td>
                                <td>컴퓨터공학과</td>
                                <td class="test-select">
                                    <select class="form-control input-sm">
                                        <option value="">중간</option>
                                        <option value="">기말</option>
                                    </select>
                                </td>
                                <td class="test-file"><input type="file" class="form-control input-sm"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="test-btn">
                                    <button type="submit" class="btn btn-default">저장</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$('.course-detail').click(function(){
	    	var aaa = $(this).attr('data-value');
	    	console.log(aaa);
	    	alert(a);
    		
    	})
    	
    	$()
    </script>
</body>
</html>