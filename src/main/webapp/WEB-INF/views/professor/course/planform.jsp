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
    .course-create .title{margin: 20px 0;}
    .course-create .title h1{font-size: 26px;}
    .table-wrap .btn{padding: 8px 30px;}
    .course-create .table-wrap .table{padding: 10px 0 30px; border: 1px solid #ccc;}
    .course-create .table-wrap .table th, .course-create .table-wrap .table td{border: none; padding-top: 25px}
    .course-create .table-wrap .table>tbody>tr>td{padding: 8px 20px;}
    .course-create .table-wrap .table>tbody>tr>th{padding: 40px 20px 18px;}
    .course-create .table-wrap .table .search{text-align: left; padding: 30px 20px 37px 0;}
    
    .course-create .table-wrap .table .part-padding th{padding-top: 20px;}
    .part-title{font-size: 22px;}
    .course-create .table-wrap .table .search .add-btn{float: left; margin-left: 20px}
    
    .modal-content table th, .modal-content table td{text-align: center;}
    .modal-content table .save-btn{text-align: right;}
    .modal-content h3{margin: 25px 0 10px 25px; font-size: 20px; font-weight: bold; color: #555;}
    .course-detail:hover{text-decoration: underline;}
    .course-search .table .btn-update{padding: 18px 10px !important;}
    
    .move-btn{width: 123px; padding: 8px 0 !important;}
    .test-file{width: 230px !important; padding: 8px 18px !important;}
    .test-result{width: 125px; padding: 5px 17px !important;}
    .bs-grade-modal-lg .input-sm {height: 30px;}
    .insert{float: right;}
    .result-save{padding: 15px 0 0 15px !important;}
    .modal-content .part-textarea{ border-top: none;}
    .modal-content .part-textarea textarea{font-size: 15px;}
    .modal-content .part-cont{padding: 16px 0 0;}
    .modal-content input{font-size: 15px;}
    .modal-content td{padding-top: 5px !important;}
    .modal-content .course-no{padding-top: 8px !important;}
    .delete-btn{font-size: 12px;}
    .check-text{color: #ff0000; text-align: left;}
    .course-create .table-wrap .table .add{text-align: right;}
    .side-padding{padding-left: 0;}
	</style>
</head>
<body>
<%@include file="../../common/header.jsp" %>
<div class="container-fluid">
        <div class="row course-create">
            <div class="col-sm-2 side-padding">
                <!-- 정보 넣는 곳-->
                <%@include file="../../common/sidebar.jsp" %>
            </div>
            <div class="col-sm-10">
                <div class="col-sm-12 title">
                    <h1>강의계획서 작성</h1>
                </div>
                <div class="col-sm-12 table-wrap">
                    <form class="form" method="post" action="addplanform">
                        <table class="table">
                            <tbody>
                                <tr class="top">
                                    <th>교과목번호 / 교과목명</th>
                                	<th>강의계획서 번호</th>
                                    <th>교수번호</th>
                                    <th>교수이름</th>
                                </tr>
                                <tr>
                                    <td>
                                        <select id="cno" name="courseNo" class="form-control">
                                        	<option value="">선택</option>
                                        	<c:forEach var="course" items="${courses }">
                                        		<option data-courseNo="${course.no }" value="${course.no }">${course.no } / ${course.name } </option>
                                        	</c:forEach>
                                        </select>
                                    </td>
                                	<td>
                                		<input id="cpno" type="text" name="no" class="form-control input-sm">
                                	</td>
                                    <td>
                                        <input type="text" class="form-control input-sm" value="${LOGIN_PROFESSOR.no }" disabled>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control input-sm" value="${LOGIN_PROFESSOR.name }" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주교재</th>
                                    <th>부교재1</th>
                                    <th>부교재2</th>
                                    <th>부교재3</th>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="mainbook" type="text" name="mainBook" class="form-control input-sm">
                                    </td>
                                    <td>
                                        <input type="text" name="subBook1" class="form-control input-sm">
                                    </td>
                                    <td>
                                        <input type="text" name="subBook2" class="form-control input-sm">
                                    </td>
                                    <td>
                                        <input type="text" name="subBook3" class="form-control input-sm">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th colspan="4">교육목표</th>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <textarea id="goal" rows="4" name="goal" class="form-control input-sm"></textarea>
                                    </td>
                                   
                                </tr>
                                <tr>
                                    <th colspan="4">교과목개요</th>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                            <textarea id="summary" rows="5" name="summary" class="form-control input-sm"></textarea>
                                        </td>
                                </tr>
                                <tr>
                                    <th colspan="4">평가방법</th>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <textarea rows="4" id="testprocess" name="testProcess" class="form-control input-sm"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" class="part-title">단원목록</th>
                                </tr>
                                <tr class="part-padding">
                                    <th>단원주차</th>
                                    <th>단원명</th>
                                    <th>단원내용</th>
                                    <th></th>
                                </tr>
                                
                                <tr id="add-part" >
                                    <td class="search"><a href="#" class="add-btn btn btn-primary" id="part-add">단원추가</a></td>
                                    <td></td>
                                    <td></td>
                                    <td class="search add">
                                        <button id="addbtn" class="btn btn-default" type="submit">등록</button>
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
    <div id="course-part-form" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h3>교과목정보 조회</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>교과목번호</th>
                            <th class="part-week">주차</th>
                            <th>단원명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="course-no">10000</td>
                            <td class="input-text"><input class="form-control input-sm" type="text" name="modal-week"></td>
                            <td class="input-text"><input class="form-control input-sm" type="text" name="modal-name"></td>
                        </tr>
                        <tr>
                            <th class="part-cont">단원내용</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                           <td colspan="3" class="part-textarea input-text">
                                <textarea class="form-control input-sm" rows="5" name="modal-content"></textarea>
                            </td>
                        </tr>
                        <tr>
                           <td></td>
                           <td></td>
                           <td class="save-btn"><button class="btn btn-default btn-add" type="button">저장</button>
                           <button type="button" class="btn btn-default btn-danger close-modal">닫기</button>
                           </td>
                        </tr>
                    </tbody>
                </table>
                
            </div>
        </div>
    </div>
    <script>
    
    	$(".table").on("click", "#part-add", function(){
	    	var courseNo = $("[name=courseNo]").val();
	    	$(".course-no").text(courseNo);
	    	
	   		$('#course-part-form').modal('show');
				return false;
			$("#course-part-form").on('hide', function(){
					
			});
    	});
    		
   		$("#course-part-form").on("click", ".btn-add",function(){
    			var week = $("[name=modal-week]").val();
    			var name = $("[name=modal-name]").val();
    			var content = $("[name=modal-content]").val();
    			
    			var row = "<tr id='part' class='course-part'>";
    			row += "<td>"+week+"<input id='week' type='hidden' class='form-control' name='week' value='"+week+"'></td>";
    			row += "<td>"+name+"<input type='hidden' class='form-control' name='name' value='"+name+"'></td>";
    			row += "<td>"+content+"<input type='hidden' class='form-control' name='contents' value='"+content+"'></td>";
				row += " <td><a href='#' class='delete-btn btn btn-default input-sm'>삭제</a></td>";
				row += "</tr>";
				
    			if(week == ""){
    				alert("주차를 입력해주세요.");
    				return;
    			}
   				if(name == ""){
   					alert("단원명을 입력해주세요.");
   					return;
   				}if(content == ""){
   					alert("내용을 입력해주세요.");
   					return;
   				}
    			$("#add-part").before(row);
    			$(".input-text input, .input-text textarea").val("");
    			
    		});
   		
    		$(".table tbody").on("click", ".delete-btn",function(){
    				$(this).parents('tr').remove();
    				return false;
    		});
    		
    		$(".close-modal").click(function(){
    			$(".input-text input, .input-text textarea").val("");
    			
    			$('#course-part-form').modal('hide');
    			
    		})
    		$("#addbtn").bind("click").on("click", function() {
				
				var cno = $("#cno").val();
				var cpno = $("#cpno").val();
				var mainbook = $("#mainbook").val();
				var goal = $("#goal").val();
				var summary = $("#summary").val();
				var testprocess = $("#testprocess").val();
				var week = $("#week").val();
				var check1 = $(".check-text1").text();
				var check2 = $(".check-text2").text();
				var check3 = $(".check-text3").text();
				var check4 = $(".check-text4").text();
				var check5 = $(".check-text5").text();
				var check6 = $(".check-text6").text();
				var check7 = $(".check-text7").text();
				
				if (cno == "" ) {
					if(check1 == ""){
						$("#cno").after("<span class='check-text check-text1'>* 교과목을 선택하세요.</span>");
					}
					$("#cno").focus();
					return false;
				}else {
					$("#cno").siblings().empty();
				}
				
				if (cpno == "" ) {
					if(check2 == ""){
						$("#cpno").after("<span class='check-text check-text2'>* 강의계획서 번호를 입력하세요.</span>");
					}
					$("#cpno").focus();
					return false;
				}else {
					$("#cpno").siblings().empty();
				}
				
				if (mainbook == "" ) {
					if(check3 == ""){
						$("#mainbook").after("<span class='check-text check-text3'>* 주교재를 입력하세요.</span>");
					}
					$("#mainbook").focus();
					return false;
				}else {
					$("#mainbook").siblings().empty();
				}
				
				if (goal == "" ) {
					if(check4 == ""){
						$("#goal").after("<span class='check-text check-text4'>* 교육목표를 입력하세요.</span>");
					}
					$("#goal").focus();
					return false;
				}else {
					$("#goal").siblings().empty();
				}
				
				if (summary == "" ) {
					if(check5 == ""){
						$("#goal").after("<span class='check-text check-text5'>* 교과목개요를 입력하세요.</span>");
					}
					$("#summary").focus();
					return false;
				}else {
					$("#summary").siblings().empty();
				}
				
				if (testprocess == "" ) {
					if(check6 == ""){
						$("#testprocess").after("<span class='check-text check-text6'>* 평가방법을 등록하세요.</span>");
					}
					$("#testprocess").focus();
					return false;
				}else {
					$("#testprocess").siblings().empty();
				}
				
				if ($("#part").hasClass("course-part")) {
					$("#part-add").siblings().empty();
				}else {
					$("#part-add").after("<span class='check-text check-text7'> * 단원을 등록하세요.</span>");
					return false;
				}
		})
    		
    
    </script>
</body>
</html>