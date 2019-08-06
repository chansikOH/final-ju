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
        .wrapper a, #opinion a{color: #000;}
        
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
    </style>
  	
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 shadow">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10 wrapper">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>[성적조회]</h4>               
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
                        		<col width="10%">
                        		<col width="10%">
                        	</colgroup>
                            <thead>
                                <tr>
                                	<th>순번</th>
                                    <th>강의년도</th>
                                    <th>학기</th>
                                    <th>교과목번호</th>
                                    <th>교과목명</th>
                                    <th>강의학점</th>
                                    <th>수강인원</th>
                                    <th>수강정원</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="course" items="${courses }" varStatus="status">
                            		<tr>
                            			<td>${status.count }</td>
	                                    <td>${course.year }</td>
	                                    <td>${course.term }</td>
	                                    <td>${course.no}</td>
	                                    <td><a href="gradedetail?cno=${course.no }" class="course-modal" >${course.name }</a></td>
	                                    <td>${course.credit}</td>
	                                    <td>${course.count}</td>
	                                    <td>${course.quota}</td>
                                	</tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
		</div>
	</div>
		
</body>
</html>