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
        .wrapper {
        	margin-top: 20px;
            padding: 20px;
        }
        /* .wrapper a, #opinion a{color: #000;} */
        
        .wrapper table {
            padding: 20px;
            text-align: center;
        }
        
        .wrapper th {
            background-color: #faf6f0;
            text-align: center;
        }
        
        #search-course-term {
            width: 150px;
            height: 30px;
        }
        
	    .center {
	        text-align: center;
	    }
	
	    .bg-color-gray {
	        background-color: #eee;
	    }
	
	    .table th {
	        background-color: #faf6f0;
	    }
	    
	    .course-opinion-table {
	        padding: 30px;
	    }
	    
	    .score-check {
	        margin-top: 20px;
	        margin-bottom: 20px;
	    }
	    
	    .course-opinion-table th {
	        text-align: center;
	    }
	    
	    .course-info td {
	        text-align: center;
	    }
	    .course-opin{
	    	
	    }
	    .course-opin td{
	        text-align: center;
	        line-height: 30px !important;
	    }
	    
	    .modal-lg {
	    	width: 1000px;
	    }
	    
	    textarea {
	    	resize: none;
	    }
		#opinion .modal-body {height: 100%;}
		.side-padding{padding-left: 0;}
    </style>
  	
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 shadow side-padding">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10 wrapper">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>[성적입력]</h4>               
                        <p>※ 이번학기 담당강좌 성적만 입력 가능</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <table class="table table-striped">
                        	<colgroup>
                        		<col width="8%">
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="32%">
                        		<col width="10%">
                        		<col width="20%">
                        	</colgroup>
                            <thead>
                                <tr>
                                	<th>순번</th>
                                    <th>학년도</th>
                                    <th>학기</th>
                                    <th>교과목번호</th>
                                    <th>교과목명</th>
                                    <th>강의학점</th>
                                    <th>성적입력기간</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="course" items="${courses }" varStatus="status">
                            		<tr>
                            			<td>${status.count }</td>
	                                    <td>${course.year }</td>
	                                    <td>${course.term }</td>
	                                    <td>${course.no}</td>
	                                    <td><a href="#" class="course-modal" data-value="${course.no }">${course.name }</a></td>
	                                    <td>${course.credit}</td>
	                                   	<td>2019-08-01 ~ 2019-08-07</td>
                                	</tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
		</div>
		
		<div id="opinion" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-body">
						<div class="course-opinion-table">
			                <h4>[성적입력]</h4>
			                   
							<form class="form" method="post" action="updategrade">
				                <table class="table table-bordered course-info">
					                <tbody>
					                
					                </tbody>
				                </table>
				
				              	<h4>[수강생 목록]</h4>
				
				                <table class="table table-bordered course-opin">
					                <thead>
						                 <tr>
							                <th>순번</th>
							                <th>학번</th>
							                <th>이름</th>
							                <th>점수</th>
							                <th>성적</th>
						                </tr>
					                </thead>
					                <tbody>
						               
					                </tbody>
					                <tfoot>
						                <tr class="data-field">
							                <td colspan="5">
							                	<input type="hidden" value="" name="courseNo" id="hiddenCourseNo" class="form-control">
							                	<button type="submit" class="btn btn-success">제출</button>
							                	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							                </td>
						                </tr>
						            </tfoot>
					        	</table>
			                </form> 
		                </div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).on("click", ".course-modal", function () {
				var cno = $(this).attr('data-value');
				
				$.ajax({
					type: "GET",
					url: "gradeinsertlist",
					data: {courseNo : cno},
					dataType:"json",
					success: function(data){
						$(".course-info tbody").empty();
						$(".course-opin tbody").empty();
						var course = data.course
						var students = data.students
						
						var row = "<tr>";
						row += "<th>교과목번호</th>";
						row += "<td>"+course.no+"</td>";
						row += "<th>교과목명</th>";
						row += "<td>"+course.name+"</td>";
						row += "<th>강의학점</th>";
						row += "<td>"+course.credit+"</td>";
						row += "<th>학기</th>";
						row += "<td>"+course.term+"</td>";
						row += "</tr>"
						
						$(".course-info tbody").append(row);
						
						$.each(students, function(index, student){
							var row = "<tr>";
							row += "<td>"+(index+1)+"<input type='hidden' name='courseNo' value='"+student.SNO+"' ></td>"
							row += "<td>"+student.NO+"<input type='hidden' name='studentNo' value='"+student.NO+"'></td>";
							row += "<td><a href='#' class='record-modal'>"+student.NAME+"</a></td>";
							row += "<td>"+student.SCORE+"</td>";
							if(student.RECORD == 'A+'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+' selected>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'A'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A' selected>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'B+'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+' selected>B+</option><option value='B' >B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'B'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B' selected>B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'C+'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+' selected>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'C'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+'>C+</option><option value='C' selected>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'D+'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+' selected>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'D'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D' selected>D</option><option value='F'>F</option>";
							}else if(student.RECORD == 'F'){
								row += "<td><select class='form-control' name='record'><option>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F' selected>F</option>";
							}else{
								row += "<td><select class='form-control' name='record'><option selected>선택</option><option value='A+'>A+</option><option value='A'>A</option><option value='B+'>B+</option><option value='B'>B</option><option value='C+'>C+</option><option value='C'>C</option><option value='D+'>D+</option><option value='D'>D</option><option value='F'>F</option>";
							}
							row += "</tr>"
							$(".course-opin tbody").append(row);
						});
					}
				})
					
		 		$("#opinion").modal('show');
				return false;
		 		$(".close-modal").on('hide', function(){
		 			
		 		});
				
			});
			
		
		</script>
		
	</div>
</body>
</html>