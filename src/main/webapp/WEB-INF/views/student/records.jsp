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
            margin-top: 30px;
            padding: 50px;
        }
        
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

    </style>
  	
</head>
<body>

	<div class="container-fluid">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="row">
			<div class="col-sm-2 shadow">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10 wrapper">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>[4학년 1학기]</h4>
                    </div>

                    <div class="col-sm-6">
                        <div class="pull-right">
                            <select id="search-course-term">
                                <option value="" disabled selected> 학기별 조회</option>
                                <option value=""> 4학년 1학기</option>
                                <option value=""> 3학년 2학기</option>
                                <option value=""> 3학년 1학기</option>
                                <option value=""> 2학년 2학기</option>
                                <option value=""> 2학년 1학기</option>
                                <option value=""> 1학년 2학기</option>
                                <option value=""> 1학년 1학기</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>교과목번호</th>
                                    <th>이수구분</th>
                                    <th>교과목명</th>
                                    <th>담당교수</th>
                                    <th>수강학점</th>
                                    <th>성적</th>
                                    <th>등급</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="record" items="${records }">
                            		<tr>
	                                    <td>${record.COURSENO }</td>
	                                    <td>${record.MUSTYN }</td>
	                                    <td>${record.COURSENAME }</td>
	                                    <td>${record.PROFESSORNAME }</td>
	                                    <td>${record.CREDIT }</td>
	                                    <td>${record.cnt }</td>
	                                    <td>B+</td>
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