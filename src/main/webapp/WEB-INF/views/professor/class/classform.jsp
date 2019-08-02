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
	    .course-create{font-size: 14px;}
	    .input-sm{font-size: 14px !important;}
	    .course-create .title{margin: 20px 0;}
	    .course-create .title h1{font-size: 26px;}
	    .course-create .btn{padding: 8px 30px;}
	    .course-create .table-wrap .table{padding: 10px 0 30px; border: 1px solid #ccc;}
	    .course-create .table-wrap .table th, .course-create .table-wrap .table td{border: none; padding-top: 25px}
	    .course-create .table-wrap .table>tbody>tr>td{padding: 12px 20px;}
	    .course-create .table-wrap .table>tbody>tr>th{padding: 40px 20px 18px;}
	    .course-create .table-wrap .table .search{text-align: right; padding: 30px 20px 37px 0;}
	    .check-text{color: #ff0000;}
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
            <div class="col-sm-10 course-create">
                <div class="col-sm-12 title">
                    <h1>강의 개설</h1>
                </div>
                <div class="col-sm-12 table-wrap">
                    <form class="form" method="post" action="addcourse">
                        <table class="table">
                            <tbody>
                                <tr class="top">
                                    <th>교수번호</th>
                                    <th>학과</th>
                                    <th>교과목번호</th>
                                    <th>강의년도</th>
                                </tr>
                                <tr class="form-input">
                                    <td>
                                        <input type="number" class="form-control input-sm" value="${LOGIN_PROFESSOR.no }" disabled>
                                    </td>
                                    <td>
                                    	<input type="text" class="form-control input-sm" value="${major.name }" disabled>
                                    	<input type="hidden" name="mno" value="${major.no }">
                                    </td>
                                    <td>
                                        <input type="text" name="no" class="form-control input-sm" id="cno">
                                        
                                    </td>
                                    <td>
                                        <input type="text" name="year" class="form-control input-sm" id="year">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>강의학기</th>
                                    <th>교과목구분</th>
                                    <th>강의학점</th>
                                    <th>강의정원</th>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="term" class="form-control input-sm" id="term">
                                            <option value="">선택</option>
                                            <option value="1">1학기</option>
                                            <option value="2">2학기</option>
                                        </select>
                                    </td>
                                     <td>
                                        <select name="mustYn" class="form-control input-sm" id="must">
                                            <option value="">선택</option>
                                            <option value="Y">전공필수</option>
                                            <option value="N">전공선택</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="credit" class="form-control input-sm" id="credit">
                                            <option value="">선택</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="quota" class="form form-control" id="quota">
                                         	<option value="">선택</option>
                                        	<option value="30">30</option>
                                        	<option value="40">40</option>
                                        	<option value="50">50</option>
                                        </select>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>교과목명</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                       <input type="text" name="name" class="form form-control" id="name">
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="search">
                                        <button class="btn btn-default" type="submit" id="addbtn">등록</button>
                                        <a href="#" class="search-btn btn btn-default btn-danger">취소</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
<script type="text/javascript">
	$("#addbtn").bind("click").on("click", function() {
		
		var cno = $("#cno").val();
		var year = $("#year").val();
		var term = $("#term").val();
		var must = $("#must").val();
		var credit = $("#credit").val();
		var quota = $("#quota").val();
		var name = $("#name").val();
		var check1 = $(".check-text1").text();
		var check2 = $(".check-text2").text();
		var check3 = $(".check-text3").text();
		var check4 = $(".check-text4").text();
		var check5 = $(".check-text5").text();
		var check6 = $(".check-text6").text();
		var check7 = $(".check-text7").text();
		
		if (cno == "" ) {
			if(check1 == ""){
				$("#cno").after("<span class='check-text check-text1'>* 교과목번호를 입력하세요.</span>");
			}
			$("#cno").focus();
			return false;
		}else {
			$("#cno").siblings().empty();
		}
		
		if (year == "") {
			if(check2 == ""){				
				$("#year").after("<span class='check-text check-text2'>* 강의년도를 입력하세요.</span>");
			}
			$("#year").focus();
			return false;
		}else{
			$("#year").siblings().empty();
		}
		
		if (term == "") {
			if(check3 == ""){				
				$("#term").after("<span class='check-text check-text3'>* 강의학기를 선택하세요.</span>");
			}
			$("#term").focus();
			return false;
		}else{
			$("#term").siblings().empty();
		}
		
		if (must == "") {
			if(check4 == ""){
				$("#must").after("<span class='check-text check-text4'>* 교과목구분을 선택하세요.</span>");				
			}
			$("#must").focus();
			return false;
		}else{
			$("#must").siblings().empty();
		}
		
		if (credit == "") {
			if(check5 == ""){
				$("#credit").after("<span class='check-text check-text5'>* 강의학점을 선택하세요.</span>");
			}
			$("#credit").focus();
			return false;
		}else{
			$("#credit").siblings().empty();
		}
		
		if (quota == "") {
			if(check6 == ""){
				$("#quota").after("<span class='check-text check-text6'>* 강의정원을 선택하세요.</span>");				
			}
			$("#quota").focus();
			return false;
		}else{
			$("#quota").siblings().empty();
		}
		
		if (name == "") {
			if(check7 == ""){				
				$("#name").after("<span class='check-text check-text7'>* 교과목명을 입력하세요.</span>");
			}
			$("#name").focus();
			return false;
		}else{
			$("#name").siblings().empty();
		}
		
		
	})
	
</script>
</body>

</html>