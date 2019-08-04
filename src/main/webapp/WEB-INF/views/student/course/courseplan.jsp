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
	    .sidebar>div {
	        padding: 0px;
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
	        text-align: left;
	    }
	    
	    .course-opin td:nth-of-type(1), .course-opin td:nth-of-type(3) {
	        text-align: center;
	    }
	
	</style>
  	
  	
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
                <div class="course-opinion-table">
                   <h4>[${plan.COUSENAME } 강의계획서]</h4>
                    <table class="table table-bordered course-info">
                        <tr>
	                		<th>교과목번호</th>
	                		<td>${plan.COURSENO }</td>
	                		<th>교과목이름</th>
	                		<td>${plan.COURSENAME }</td>
	                		<th>교수이름</th>
	                		<td>${plan.PROFESSORNAME }</td>
	                	</tr>
	                	<tr>
	                		<th>교육목표</th>
	                		<td colspan="2">${plan.GOAL }</td>
	                		<th>교과목개요</th>
	                		<td colspan="2">${plan.SUMMARY }</td>
	                	</tr>
	                	<tr>
	                		
	                	</tr>
                    </table>
                </div>
            </div>
		</div>
	</div>
	
	<script type="text/javascript">
	</script>

</body>
</html>