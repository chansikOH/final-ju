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
    .course-search .search-btn{margin-right: 90px;}
    .course-search select, input{width:174px; height: 22px;}
    
    .result{padding: 0 15px;}
    .result div:first-child{margin: 35px 0 5px 0; padding: 0;}
    .result div:nth-child(2){padding: 0;}
    .result p{text-align: right; font-size: 15px; color: #0000ff;}
    .result th{background: #faf6f0; }
    .result th, .result td, .modal td{text-align: center; }
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
    .test-file{width: 230px !important; padding: 8px 18px !important;}
    .test-result{width: 125px; padding: 5px 17px !important;}
    .bs-grade-modal-lg .input-sm {height: 30px;}
    .insert{float: right;}
    .result-save{padding: 15px 0 0 15px !important;}
    
</style>
</head>
<body>
<%@include file="../../common/header.jsp" %>
    <div class="container-fluid">
        <div class="row course-search">
            <div class="col-sm-2">
                <!-- 정보 넣는 곳-->
                <%@include file="../../common/sidebar.jsp" %>
            </div>
            <div class="col-sm-10">
                <div class="col-sm-12 title">
                    <h1>성적 조회</h1>
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
                                    <th>학생명</th>
                                    <td>
                                        <input>
                                    </td>
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
                            <p>총 <span>10</span>건 조회</p>
                        </div>
                        <div class="col-sm-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>순번</th>
                                        <th>교과목번호</th>
                                        <th>교과목구분</th>
                                        <th>학기</th>
                                        <th>시험구분</th>
                                        <th>교과목명</th>
                                        <th>학과</th>
                                        <th>학번</th>
                                        <th>학생명</th>
                                        <th>성적</th>
                                        <th>점수</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>10000</td>
                                        <td>전공</td>
                                        <td>1</td>
                                        <td>중간</td>
                                        <td><a href="#" class="course-detail" data-toggle="modal" data-target=".bs-example-modal-lg">컴퓨터공학개론</a></td>
                                        <td>컴퓨터공학</td>
                                        <td>20119111</td>
                                        <td>홍길동</td>
                                        <td>A0</td>
                                        <td>90</td>
                                        <td class="btn-update"><a href="#" class="btn btn-default" data-toggle="modal" data-target=".bs-grade-modal-lg">성적입력</a></td>
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
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h3>교과목정보 조회</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>교과목번호</th>
                            <th>교과목구분</th>
                            <th>학과</th>
                            <th>교수명</th>
                            <th>강의계획서</th>
                            <th>강의평가</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>10000</td>
                            <td>전공</td>
                            <td>컴퓨터공학과</td>
                            <td>홍길동</td>
                            <td class="move-btn"><a href="#" class="btn btn-default">보기</a></td>
                            <td class="move-btn"><a href="#" class="btn btn-default">보기</a></td>
                        </tr>
                    </tbody>
                </table>
                <h3>수강학생정보</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>학번</th>
                            <th>이름</th>
                            <th>학년</th>
                            <th>학과</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>20181234</td>
                            <td>천성현</td>
                            <td>2</td>
                            <td>컴퓨터공학</td>
                        </tr>
                        <tr>
                            <td>20181234</td>
                            <td>천성현</td>
                            <td>2</td>
                            <td>컴퓨터공학</td>
                        </tr>
                        <tr>
                            <td>20181234</td>
                            <td>천성현</td>
                            <td>2</td>
                            <td>컴퓨터공학</td>
                        </tr>
                        <tr>
                            <td>20181234</td>
                            <td>천성현</td>
                            <td>2</td>
                            <td>컴퓨터공학</td>
                        </tr>
                        <tr>
                            <td>20181234</td>
                            <td>천성현</td>
                            <td>2</td>
                            <td>컴퓨터공학</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade bs-grade-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h3>성적 입력</h3>
                <form class="form" action="#"> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>교과목번호</th>
                                <th>교과목명</th>
                                <th>학기</th>
                                <th>시험구분</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td>10000</td>
                                <td>컴퓨터공학개론</td>
                                <td>1</td>
                                <td>중간</td>
                            </tr>

                        </tbody>
                    </table>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>학번</th>
                                <th>이름</th>
                                <th>학년</th>
                                <th>학과</th>
                                <th>점수</th>
                                <th class="test-result">성적</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>20181234</td>
                                <td>이지민</td>
                                <td>2</td>
                                <td>컴퓨터공학</td>
                                <td>95</td>
                                <td class="test-result">
                                    <select class="form-control input-sm">
                                        <option>선택</option>
                                        <option>A+</option>
                                        <option>A0</option>
                                        <option>B+</option>
                                        <option>B0</option>
                                        <option>C+</option>
                                        <option>C0</option>
                                        <option>D+</option>
                                        <option>D0</option>
                                        <option>F</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="result-save"><button type="submit" class="btn btn-default input-sm">저장</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>	
</body>
</html>