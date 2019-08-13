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
    .student-search .search-btn{padding: 5px 20px; margin-top: 5px;}
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
    
    .page{text-align: center; width: 100%;}
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
                    <h1>학적상태 변경 신청내역</h1>
                </div>
                <div class="col-sm-12 table-wrap">
                    <form method="get" action="changestatus.json">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th class="border-top">신청구분</th>
                                    <td class="border-top">
                                        <select name="statusDiv">
                                            <option value="전체">전체</option>
                                            <option value="복학">복학</option>
                                            <option value="휴학">휴학</option>
                                            <option value="자퇴">자퇴</option>
                                        </select>
                                    </td>
                                    <th class="border-top">승인여부</th>
                                    <td class="border-top">
                                        <select name="passYn">
                                            <option value="전체">전체</option>
                                            <option value="W">대기</option>
                                            <option value="P">승인</option>
                                            <option value="R">거절</option>
                                        </select>
                                    </td>
                                    <th class="border-top">신청날짜</th>
                                    <td class="border-top">
                                    	<input type="date" name="requestDate"> 
                                    </td>
                                </tr>
                                <tr>
                                	<th class>학과</th>
                                    <td class>
                                        <select name="major">
                                            <option>전체</option>
                                            <c:forEach var="major" items="${majors }">
                                            <option value="${major.name }">${major.name }</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <th>학생명</th>
                                    <td>
                                        <input name="name">
                                    </td>
                                    <th>학번</th>
                                    <td>
                                        <input name="studentNo">
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
                            		<col width="5%">
                            		<col width="7%">
                            		<col width="8%">
                            		<col width="8%">
                            		<col width="8%">
                            		<col width="8%">
                            		<col width="6%">
                            		<col width="10%">
                            		<col width="10%">
                            		<col width="10%">
                            		<col width="10%">
                            		<col width="10%">
                            	</colgroup>
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>현재구분</th>
                                        <th>신청구분</th>
                                        <th>적용년도</th>
                                        <th>학기수</th>
                                        <th>학과</th>
                                        <th>신청날짜</th>
                                        <th>승인여부</th>
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
    
    <!-- 변경사유 modal -->
    <div class="modal fade bs-reason-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        	<div class="modal-content">
		     	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        	<h3>변경사유</h3>
		      	</div> 
      			<div class="modal-body">
        			<div class="reason-of-change">
        			
        			</div>
      			</div>
      			<div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      	</div>
    		</div>   
        </div>
    </div>
    
    <!-- 학적상태변경 modal -->
    <div id="change-division-modal" class="modal fade bs-status-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h3 class="modal-title">학적상태 변경</h3>
		    	</div>
		    	<div class="modal-body">
	                <form class="form"> 
	                	<input type="hidden" id="statusNo" >
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
    		
    	/* 조회버튼 클릭 */
        $(".search-btn").click(function(){
        	searchStudent(1)
        });
    	
    	/*페이지번호 클릭*/
        $('#pagination-box').on('click', 'a', function() {
        	searchStudent($(this).attr('data-pno'));
    	   	return false;
    	}); 

    	/*검색 및 페이징처리*/
    	function searchStudent(pageNo){
    		
   	    	var statusDiv = $("[name=statusDiv]").val(); 
   	    	var passYn = $("[name=passYn]").val(); 
   	    	var requestDate = $("[name=requestDate]").val(); 
   	    	var major = $("[name=major]").val(); 
   	    	var name = $("[name=name]").val(); 
   	    	var studentNo = $("[name=studentNo]").val(); 
   	    	
   	    	$.ajax ({
	               type:"GET",
	               url:"changestatus.json",
	               data:{statusDiv:statusDiv, passYn:passYn, requestDate:requestDate, major:major, name:name, studentNo:studentNo, pageNo:pageNo},
	               dataType:"json", 
	               success:function(data) {
	    	    	  $("#search-result-table tbody tr").empty();
	            	  var students = data.searchStudents;
                 	  var pagination = data.pagination;
                 	  
	            	  /* student 표현  */
	                  if(students.length != 0) {
	                     $.each(students, function(index, stud) {
	                        var row = "<tr id='row-"+stud.studentStatus.no+"'>";
	                        row += "<td>"+(pagination.index + index)+"</td>";
	                        row += "<td>"+stud.no+"</td>";
	                        row += "<td>"+stud.name+"</td>";
	                        row += "<td>"+stud.division+"</td>";
	                        row += "<td>"+stud.studentStatus.division+"</td>";
	                        row += "<td>"+stud.studentStatus.startTerm+"</td>";
	                        row += "<td>"+stud.studentStatus.termCount+"</td>";
	                        row += "<td>"+stud.major.name+"</td>";
	                        row += "<td>"+stud.studentStatus.createDateStr+"</td>";
	                        row += "<td>"+stud.studentStatus.passYn+"</td>";
	                        row += "<td class='btn-update'><button id='reason-of-change"+stud.studentStatus.no+"' class='btn btn-default' ' data-no="+stud.studentStatus.no+">변경사유</button></td>";
	                        row += "<td class='btn-update'><button id='student-status"+stud.studentStatus.no+"' class='btn btn-default'  data-no="+stud.no+" data-statusno="+stud.studentStatus.no+">학적상태변경</button></td>";
	                        row += "</tr>";
	                        $("#search-result-table tbody").append(row);
	                     })
	                  } else {
	                     var row = "<tr>";
	                     row += "<td colspan='12' class='text-center'>조건에 해당하는 학생이 없습니다.</td>";
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
    	
    	/*변경사유*/
    	$("#search-result-table tbody").on('click', '[id^=reason-of-change]', function() {
    		event.preventDefault();
    		var statusNo = $(this).attr('data-no');
    		$(".reason-of-change").empty();
    		
    		$.ajax({
    			type: "GET",
    			url: "statuschangereason.json",
    			data: {statusNo:statusNo}, 
    			dataType :"json",
    			success : function (data) {
    				var row = "<p>"+data.reason+"</p>"
                    $(".reason-of-change").append(row); 		
		    		$(".bs-reason-modal-lg").modal('show')
    			}
    		});
    	})	    
    	
    	/*학적상태 변경*/
    	$("#search-result-table tbody").on('click', '[id^=student-status]', function() {
    		event.preventDefault();
    		var studentNo = $(this).attr('data-no');
    		var statusNo = $(this).attr('data-statusno');
    		$('#statusNo').val(statusNo);
    		
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
                    
		    		$(".bs-status-modal-lg").modal('show')
    			}
    		});
    	})	    
    	
    	/*학적상태변경 저장*/
    	$(".result-save").click(function(){
    		var afterStatus = $("#change-student-status").val(); 
    		var studentNo = $(".student-status td:first").text(); 
    		var statusNo = $('#statusNo').val();
    		
    	 	$.ajax({
    			type:"GET",
    			url:"statuschange.json",
    			data:{afterStatus:afterStatus, studentNo:studentNo, statusNo:statusNo},
    			dataType:"json",
    			success: function (student) {
    				$("#row-"+statusNo).find('td:eq(3)').text(student.division);
    				$("#row-"+statusNo).find('td:eq(9)').text('P');
    				$('#change-division-modal').modal('hide');
    				alert('학적상태 변경이 완료되었습니다.');
    			}
    		}); 
    	})
    	
    </script>
</body>
</html>