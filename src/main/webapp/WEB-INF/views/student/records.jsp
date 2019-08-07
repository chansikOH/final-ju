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
	        text-align: left;
	    }
	    
	    .course-opin td:nth-of-type(1), .course-opin td:nth-of-type(3) {
	        text-align: center;
	    }
	    
	    .modal-lg {
	    	width: 1000px;
	    }
	    
	    textarea {
	    	resize: none;
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
                        <h4>[성적조회]</h4>               
                        <p>※ 강의평가 후 성적조회 가능</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <table class="table table-striped">
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
                            	<c:forEach var="record" items="${records }" varStatus="status">
                            		<tr>
	                                    <td class="courseNo">${record.COURSENO }</td>
	                                    <c:choose>
	                                    	<c:when test="${record.MUSTYN eq 'Y' }">
	                                    		<td>필수</td>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<td>선택</td>
	                                    	</c:otherwise>
	                                    </c:choose>
	                                    <td class="courseName">${record.COURSENAME }</td>
	                                    <td class="courseProfessor">${record.PROFESSORNAME }</td>
	                                    <td>${record.CREDIT }</td>
	                                   <c:choose>
	                                    	<c:when test="${record.COURSEOPINION eq 'N'}">
	                                    		<td>
	                                    			<button type="button" data-courseno="${record.COURSENO }" 
	                                    									data-coursename="${record.COURSENAME }" 
	                                    									data-professor="${record.PROFESSORNAME }" 
	                                    									data-year="${record.YEAR }"
	                                    									data-term="${record.TERM }" data-toggle="modal" data-target="#opinion" class="open-opinionModal btn btn-info btn-xs">강의평가</button>
	                                    		</td>
	                                    		<td></td>
	                                    	</c:when>
	                                    	<c:otherwise>
			                                    <td>${record.TOTALCNT }</td>
			                                    <td>${record.RECORD }</td>
	                                    	</c:otherwise>
	                                    </c:choose>
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
			                <h4>[강의평가]</h4>
			                   
			                <table class="table table-bordered course-info">
				                <tr>
					                <th>교과목번호</th>
					                <td id="modalCourseNo"></td>
					                
					                <th>교과목명</th>
					                <td id="modalCourseName"></td>
					
					                <th>담당교수</th>
					                <td id="modalProfessorName"></td>
					
					                <th>학기</th>
					                <td id="modalCourseYearTerm"></td>
				                </tr>
			                </table>
			
			                <div class="score-check">
				                <p>이 설문지의 목적은 여러분의 의견을 반영하여 보다 좋은 강의를 제공할 수 있도록 돕는 것입니다. 이 목적에 도움이 되도록 성실하고 솔직하게 답변해 주시면 감사하겠습니다.</p>
				                <p>이 평가서는 익명으로 작성되며, 성적평가 후 개봉/정리되어 담당교수의 다음 학기 강의 준비에 참고가 될 것입니다.</p>
				                <hr/>
				                <p>각 문항별로 여러분이 동의하는 정도에 따라 1~5 중 하나를 선택해주십시오.</p>
				                <p>1: 전혀 그렇지 않다. 2: 그렇지 않다. 3: 보통이다. 4: 그렇다. 5: 정말 그렇다.</p>
			                </div>
			
							<form class="form" method="POST" action="updateOpinion">
				                <table class="table table-bordered course-opin">
					                <thead>
						                <tr>
							                <th>문항</th>
							                <th>설문내용</th>
							                <th>점수</th>
						                </tr>
					                </thead>
					                <tbody>
						                <tr>
							                <td>1</td>
							                <td>교수님의 강의 준비는 충실 하였습니까?</td>
							                <td>
							                	
							                
								                <input type="radio" value="1" name="q01"> 1
								                <input type="radio" value="2" name="q01"> 2
								                <input type="radio" value="3" name="q01"> 3
								                <input type="radio" value="4" name="q01"> 4
								                <input type="radio" value="5" name="q01"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>2</td>
							                <td>교수님은 임의로 지각, 단축수업, 휴강 후 보강미실시 등 수업 결손 없이 강의를 성실하게 진행하셨습니까?</td>
							                <td>
								                <input type="radio" value="1" name="q02"> 1
								                <input type="radio" value="2" name="q02"> 2
								                <input type="radio" value="3" name="q02"> 3
								                <input type="radio" value="4" name="q02"> 4
								                <input type="radio" value="5" name="q02"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>3</td>
							                <td>과제물이나 기말평가에 관한 충분한 정보와 설명이 사전에 주어졌습니까?</td>
							                <td>
								                <input type="radio" value="1" name="q03"> 1
								                <input type="radio" value="2" name="q03"> 2
								                <input type="radio" value="3" name="q03"> 3
								                <input type="radio" value="4" name="q03"> 4
								                <input type="radio" value="5" name="q03"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>4</td>
							                <td>교수님은 학생들의 기말평가나 과제물을 공정하고 정확하게 평가하였습니까?</td>
							                <td>
								                <input type="radio" value="1" name="q04"> 1
								                <input type="radio" value="2" name="q04"> 2
								                <input type="radio" value="3" name="q04"> 3
								                <input type="radio" value="4" name="q04"> 4
								                <input type="radio" value="5" name="q04"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>5</td>
							                <td>시험이나 퀴즈, 과제물 등 학생의 성취도 평가에 대한 피드백은 빠른 시간 내에 이루어졌습니까?</td>
							                <td>
								                <input type="radio" value="1" name="q05"> 1
								                <input type="radio" value="2" name="q05"> 2
								                <input type="radio" value="3" name="q05"> 3
								                <input type="radio" value="4" name="q05"> 4
								                <input type="radio" value="5" name="q05"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>6</td>
							                <td>수업 중에는 질문을 자유롭게 하고 충분한 토론을 할 기회가 주어졌습니까?</td>
							                <td>
								                <input type="radio" value="1" name="q06"> 1
								                <input type="radio" value="2" name="q06"> 2
								                <input type="radio" value="3" name="q06"> 3
								                <input type="radio" value="4" name="q06"> 4
								                <input type="radio" value="5" name="q06"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>7</td>
							                <td>강의내용은 귀하의 전공과 적절하게 연계가 되어있습니까?</td>
							                <td>
								                <input type="radio" value="1" name="q07"> 1
								                <input type="radio" value="2" name="q07"> 2
								                <input type="radio" value="3" name="q07"> 3
								                <input type="radio" value="4" name="q07"> 4
								                <input type="radio" value="5" name="q07"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>8</td>
							                <td>강의 내용이 졸업 후 실무에 도움이 될 것이라 생각합니까?</td>
							                <td>
								                <input type="radio" value="1" name="q08"> 1
								                <input type="radio" value="2" name="q08"> 2
								                <input type="radio" value="3" name="q08"> 3
								                <input type="radio" value="4" name="q08"> 4
								                <input type="radio" value="5" name="q08"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>9</td>
							                <td>귀하는 학기초 이 강좌를 통하여 기대하였던 학습 목표가 달성되었다고 생각하십니까?</td>
							                <td>
								                <input type="radio" value="1" name="q09"> 1
								                <input type="radio" value="2" name="q09"> 2
								                <input type="radio" value="3" name="q09"> 3
								                <input type="radio" value="4" name="q09"> 4
								                <input type="radio" value="5" name="q09"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>10</td>
							                <td>이 강좌를 동일한 교수님이 다음 학기에 강의한다면 귀하의 친구나 선,후배에게 추천하겠습니까?</td>
							                <td>
								                <input type="radio" value="1" name="q10"> 1
								                <input type="radio" value="2" name="q10"> 2
								                <input type="radio" value="3" name="q10"> 3
								                <input type="radio" value="4" name="q10"> 4
								                <input type="radio" value="5" name="q10"> 5
							                </td>
						                </tr>
						                <tr>
							                <td>11</td>
							                <td colspan="2">
							                	<p>기타 의견 : </p>
							                	<textarea class="form-control" name="q11"></textarea>
							                </td>
						                </tr>
						                <tr>
							                <td colspan="3">
							                	<input type="hidden" value="" name="courseNo" id="hiddenCourseNo" class="form-control">
							                	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							                	<button type="submit" class="btn btn-success">제출</button>
							                </td>
						                </tr>
					                </tbody>
				                </table>
			                </form> 
		                </div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).on("click", ".open-opinionModal", function () {
				var courseNo = $(this).data('courseno');
				$(".modal-body #modalCourseNo").text(courseNo);
				$("#hiddenCourseNo").val(courseNo);
				
				var courseName = $(this).data('coursename');
				$(".modal-body #modalCourseName").text(courseName);
				
				var professorName = $(this).data('professor');
				$(".modal-body #modalProfessorName").text(professorName);
				
				var year = $(this).data('year');
				var term = $(this).data('term');
				$(".modal-body #modalCourseYearTerm").text(year + "년 " + term + "학기");
			});
		</script>
		
	</div>
</body>
</html>