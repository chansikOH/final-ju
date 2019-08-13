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
	.side-padding{padding-left: 0;}
	
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
    
    .page {text-align: center !important; width: 100%;}
    .pagination li a{color: #777; font-size: 15px; padding: 10px;}
    .page-active{color: #0000ff; font-weight: bold;}
    .pagination li a:hover{color: #777; text-decoration: none;}
    
    .modal-content table th{text-align: center;}
    .modal-content h3{margin: 25px 0 10px 25px; font-size: 20px; font-weight: bold; color: #555;}
    
    .student-search .table .btn-update{padding: 18px 10px !important;}
    .dl-horizontal dt {text-align: left; font-size: 17px;}
    
    .bs-grade-modal-lg .input-sm {height: 30px;}
    .result-save{padding: 15px 0 0 0 !important;}
    .result-modify{padding: 15px 0 0 0 !important;}
    .result-close{text-align: right;}s
    
	</style>
</head>
<body>
<%@ include file="../../common/header.jsp" %>
	<div class="container-fluid">
        <div class="row student-search">
            <div class="col-sm-2 side-padding">
               <%@include file="../../common/sidebar.jsp" %>
            </div>
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
                                            <option value="전체">전체</option>
                                            <option value="재학">재학</option>
                                            <option value="휴학">휴학</option>
                                            <option value="졸업">졸업</option>
                                            <option value="자퇴">자퇴</option>
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
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="search"> 
                                        <button type="button" class="search-btn btn btn-default">조회</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form> 
                    
                    <div class="row result">
                        <div class="col-sm-12">
                            <p>총 <span id="search-result-count">0</span>건 조회</p>
                        </div>
                        <div class="col-sm-12">
                            <table class="table" id="search-result-table">
                            	<colgroup>
                            		<col width="10%">
                            		<col width="10%">
                            		<col width="*">
                            		<col width="15%">
                            		<col width="15%">
                            		<col width="10%">
                            		<col width="10%">
                            		<col width="10%">
                            	</colgroup>
                                <thead>
                                    <tr>
                                        <th>순번</th>
                                        <th>학년</th>
                                        <th>학과</th>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>학적상태</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
               
                <div class="row">
					<div class="col-sm-12 page">
						<ul class="pagination" id="pagination-box">
							
						</ul>
					</div>
				</div>
				
            </div>
        </div>
    </div>
    
    <!-- 상세정보 modal -->
    <div class="modal fade bs-detail-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
        	<div class="modal-content">
		     	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        	<h3>학생 상세정보</h3>
		      	</div> 
      			<div class="modal-body">
        			<div class="row">
	    				<div class="col-sm-3">
	    					<img src="/ju/resources/images/profile.jpg" class="img-thumbnail">
	    				</div>
	    				<div class="col-sm-9">		  
	    					<dl class="dl-horizontal">
	    					<!-- ajax 정보추가 -->		
	    				</div>
    				</div>
      			</div>
      			<div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      	</div>
    		</div>   
        </div>
    </div>
    
    <!-- 학적상태변경 modal -->
    <div id="change-division-modal" class="modal fade bs-change-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h3 class="modal-title">학적상태 변경</h3>
		    	</div>
		    	<div class="modal-body">
	                <form class="form"> 
	                    <table class="table">
	                        <thead>
	                            <tr>
	                                <th>학번</th>
	                                <th>학년</th>
	                                <th>이름</th>
	                                <th>학과</th>
	                                <th>변경 전</th>
	                                <th class="status-result">변경 후</th>
	                            </tr>
	                        </thead>
	                        <tbody class="student-status">
	                        <!-- ajax 정보추가 -->	
	                        </tbody>
	                    </table>
	                </form>		    		
		      	</div>
      			<div class="modal-footer">
		        	<a class="result-save" href="#"><button class="btn btn-default input-sm">저장</button></a>
		      	</div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$(function() {
    		$("#search-result-table tbody tr").hide();
    	})
    		
    	/* 조회버튼 클릭 */
    	function searchCourse(pageNo){
    		
   	    	var status = $("[name=status]").val(); 
   	    	var grade = $("[name=grade]").val(); 
   	    	var major = $("[name=major]").val(); 
   	    	var name = $("[name=name]").val(); 
   	    	var studentNo = $("[name=studentNo]").val(); 
   	    	var tel = $("[name=tel]").val(); 
   	    	
   	    	$.ajax ({
	               type:"GET",
	               url:"checklist.json",
	               data:{pageNo:pageNo ,status:status, grade:grade, major:major, name:name, studentNo:studentNo, tel:tel},
	               dataType:"json", 
	               success:function(data) {
	    	      $("#search-result-table tbody tr").empty();
	            	  var students = data.searchStudents;
                 	  var pagination = data.pagination;
                 	  
	            	  /* student 표현  */
	                  if(students.length != 0) {
	                     $.each(students, function(index, stud) {
	                        var row = "<tr id='row-"+stud.no+"'>";
	                        row += "<td>"+(pagination.index + index)+"</td>";
	                        row += "<td>"+stud.grade+"</td>";
	                        row += "<td>"+stud.major.name+"</td>";
	                        row += "<td>"+stud.no+"</td>";
	                        row += "<td>"+stud.name+"</td>";
	                        row += "<td>"+stud.division+"</td>";
	                        row += "<td class='btn-update'><a href='#' id='detail-student' class='btn btn-default' data-toggle='modal' data-target='.bs-detail-modal-lg' data-no="+stud.no+">상세정보</a></td>";
	                        row += "<td class='btn-update'><a href='#' id='check-student-status' class='btn btn-default' data-toggle='modal' data-target='.bs-change-modal-lg' data-no="+stud.no+">학적상태변경</a></td>";
	                        row += "</tr>";
	                        $("#search-result-table tbody").append(row);
	                     })
	                  } else {
	                     var row = "<tr>";
	                     row += "<td colspan='12' class='text-center'소속된 사원이 없습니다.></td>";
	                     row += "</tr>";
	                     $("#search-result-table tbody").append(row);
	                  }
	                  
	                  /* pagination */
	                  	var page = pagination.page;		/* 현재 페이지*/
	                  	var begin = pagination.begin;	/* 화면에 보여질 첫번째 번호 */
	                  	var end = pagination.end;		/* 화면에 보여질 마지막 번호 */
	                  	var first = pagination.first;	/* ture or false*/
	                  	var last = pagination.last;		/* ture or false*/

	                    var row = "";
	                  	
	     				if (!first) {
	     					row += "<li><a href='' data-pno='"+(pagination.page -1 )+"'><span class='glyphicon glyphicon-menu-left'></span></li>";
	     				}
	     				for (var i=pagination.begin; i<=pagination.end; i++) {
	     					if (page == i) {
	     						row += "<li class='page-active'><a href='' data-pno='"+i+"'>"+i+"</li>";
	     					} else {
	  	   					row += "<li><a href='' data-pno='"+i+"'>"+i+"</li>";
	     					}
	     				}
	     				if (!last) {
	     					row += "<li><a href='' data-pno='"+(pagination.page +1 )+"'><span class='glyphicon glyphicon-menu-right'></span></li>";
	     				}
	     				$("#pagination-box").html(row);
	     				
		               /*조회건수 변경*/
		               var count = data.count;
		               $("#search-result-count").text(count); 
	               
	               }
	            });
    	}
        
        $(".search-btn").click(function(){
        	searchCourse(1)
        });
    	    
    	$('#pagination-box').on('click', 'a', function() {
    	    searchCourse($(this).attr('data-pno'));
    	   	return false;
    	}); 
    	
    	
    	/*모달 상세정보*/
    	$("#search-result-table").on('click',"#detail-student",function(event){
    		event.preventDefault();
    		var studentNo = $(this).attr('data-no');
    		
    		$.ajax({
    			type: "GET",
    			url: "studentdetail.json",
    			data: {studentNo:studentNo}, 
    			dataType :"json",
    			success : function (stud) {
    				var row = "<dt>이름</dt><dd>"+stud.name+"</dd>";
                    row += "<dt>성별</dt><dd>"+stud.gender+"</dd>";
                    row += "<dt>생년월일</dt><dd>"+stud.birth+"</dd>";
                    row += "<dt>학과</dt><dd>"+stud.major.name+"</dd>";
                    row += "<dt>학번</dt><dd>"+stud.no+"</dd>";
                    row += "<dt>이메일</dt><dd>"+stud.email+"</dd>";
                    row += "<dt>연락처</dt><dd>"+stud.phoneNumber+"</dd>";
                    row += "<dt>주소</dt><dd>"+stud.address+"</dd>";
                    $(".dl-horizontal").html(row); 		
                    if(stud.photoName != null){
	                    var img = '/ju/resources/images/students/'+ stud.photoName ;
	                    $(".img-thumbnail").attr('src',img); 
                    }
    			}
    		});
    	});
    	
    	/*학적상태변경 확인*/
    	$("#search-result-table").on('click','#check-student-status',function(event){
    		event.preventDefault();
    		var studentNo = $(this).attr('data-no');
    		
    		$.ajax({
    			type:"GET",
    			url:"statuscheck.json",
    			data:{studentNo:studentNo},
    			dataType:"json",
    			success: function (stud) {
    				var row = "<tr>"; 
                    row += "<td>"+stud.no+"</td>";
                    row += "<td>"+stud.grade+"</td>";
                    row += "<td>"+stud.name+"</td>";
                    row += "<td>"+stud.major.name+"</td>";
                    row += "<td>"+stud.division+"</td>";
                    row += "<td class='status-result'>";
                    row += "<select class='form-control input-sm' id='change-student-status'>";
                    row += "<option value=''>선택</option>";
                    row += "<option value='재학'>재학</option>";
                    row += "<option value='휴학'>휴학</option>";
                    row += "<option value='졸업'>졸업</option>";
                    row += "<option value='자퇴'>자퇴</option>";
                    row += "<option value='제적'>제적</option>";
                    row += "</select>";
                    row += "</td>";
                    row += "</tr>";
                    $(".student-status").html(row); 		
    			}
    		});
    	});
    	
    	
    	/*학적상태변경 저장*/
    	$(".result-save").click(function(){
    		var afterStatus = $("#change-student-status").val(); 
    		var studentNo = $(".student-status td:first").text(); 
    		
    	 	$.ajax({
    			type:"GET",
    			url:"statuschange.json",
    			data:{afterStatus:afterStatus, studentNo:studentNo},
    			dataType:"json",
    			success: function (student) {
    				console.log(student)
    				$("#row-"+student.no).find('td:eq(5)').text(student.division);
    				$('#change-division-modal').modal('hide');
    				alert('학적상태 변경이 완료되었습니다.');
    			}
    		}); 
    	})
    </script>
</body>
</html>