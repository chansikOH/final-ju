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
	    .course-info td{text-align: center;}
		.course-opin td{text-align: center;}
		.course-opin tr td:nth-child(2){text-align: left;}
		.close-box{text-align: center;}
		.side-padding{padding-left: 0;}
		.wrapper h4{font-size: 26px;}
		.modal-content h4 {
		    margin: 25px 0 15px 0px;
		    font-size: 20px;
		    font-weight: bold;
		    color: #555;
		}
    </style>
  	
</head>
<body>

	<div class="container-fluid">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="row">
			<div class="col-sm-2 shadow side-padding">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			
			<div class="col-sm-10 wrapper">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>강의평가 조회</h4>               
                        <p>※ 강의평가 후 성적조회 가능</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>순번</th>
                                    <th>교과목번호</th>
                                    <th>교과목명</th>
                                    <th>강의년도</th>
                                    <th>강의학기</th>
                                    <th>수강학점</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach	var="course" items="${courses }" varStatus="loop">
                            		<tr>
                            			<td>${loop.count }</td>
	                            		<td>${course.no }</td>
	                            		<td class="course-name"><a href="#" class="open-opinionModal" >${course.name }</a><input class="course-no" type="hidden" name="cno" value="${course.no }"></td>
	                            		<td class="course-year">${course.year }</td>
	                            		<td class="course-term">${course.term }</td>
	                            		<td>${course.credit }</td>
                            		<tr>
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
			                <h4>강의평가 조회</h4>
			                   
			                <table class="table table-bordered course-info">
				                <tbody>
				                
				                </tbody>
			                </table>
			
			                <div class="score-check">
				                <p>이 설문지의 목적은 여러분의 의견을 반영하여 보다 좋은 강의를 제공할 수 있도록 돕는 것입니다. 이 목적에 도움이 되도록 성실하고 솔직하게 답변해 주시면 감사하겠습니다.</p>
				                <p>이 평가서는 익명으로 작성되며, 성적평가 후 개봉/정리되어 담당교수의 다음 학기 강의 준비에 참고가 될 것입니다.</p>
				                <hr/>
				                <p>각 문항별로 여러분이 동의하는 정도에 따라 1~5 중 하나를 선택해주십시오.</p>
				                <p>1: 전혀 그렇지 않다. 2: 그렇지 않다. 3: 보통이다. 4: 그렇다. 5: 정말 그렇다.</p>
			                </div>
			                <table class="table table-bordered course-opin">
			                	<colgroup>
			                		<col width="5%">
			                		<col width="62%">
			                		<col width="5%">
			                		<col width="5%">
			                		<col width="5%">
			                	</colgroup>
				                <thead>
					                <tr>
						                <th>문항</th>
						                <th>설문내용</th>
						                <th>최저</th>
						                <th>최고</th>
						                <th>평균</th>
					                </tr>
				                </thead>
				                <tbody>
					                <tr>
						                <td>1</td>
						                <td>교수님의 강의 준비는 충실 하였습니까?</td>
						                <td class="q1-min question"></td>
						                <td class="q1-max question"></td>
						                <td class="q1-avg question"></td>
					                </tr>
					                <tr>
						                <td>2</td>
						                <td>교수님은 임의로 지각, 단축수업, 휴강 후 보강미실시 등 수업 결손 없이 강의를 성실하게 진행하셨습니까?</td>
						                <td class="q2-min question"></td>
						                <td class="q2-max question"></td>
						                <td class="q2-avg question"></td>
					                </tr>
					                <tr>
						                <td>3</td>
						                <td>과제물이나 기말평가에 관한 충분한 정보와 설명이 사전에 주어졌습니까?</td>
						                <td class="q3-min question"></td>
						                <td class="q3-max question"></td>
						                <td class="q3-avg question"></td>
					                </tr>
					                <tr>
						                <td>4</td>
						                <td>교수님은 학생들의 기말평가나 과제물을 공정하고 정확하게 평가하였습니까?</td>
						                <td class="q4-min question"></td>
						                <td class="q4-max question"></td>
						                <td class="q4-avg question"></td>
					                </tr>
					                <tr>
						                <td>5</td>
						                <td>시험이나 퀴즈, 과제물 등 학생의 성취도 평가에 대한 피드백은 빠른 시간 내에 이루어졌습니까?</td>
						                <td class="q5-min question"></td>
						                <td class="q5-max question"></td>
						                <td class="q5-avg question"></td>
					                </tr>
					                <tr>
						                <td>6</td>
						                <td>수업 중에는 질문을 자유롭게 하고 충분한 토론을 할 기회가 주어졌습니까?</td>
						                <td class="q6-min question"></td>
						                <td class="q6-max question"></td>
						                <td class="q6-avg question"></td>
					                </tr>
					                <tr>
						                <td>7</td>
						                <td>강의내용은 귀하의 전공과 적절하게 연계가 되어있습니까?</td>
						                <td class="q7-min question"></td>
						                <td class="q7-max question"></td>
						                <td class="q7-avg question"></td>
					                </tr>
					                <tr>
						                <td>8</td>
						                <td>강의 내용이 졸업 후 실무에 도움이 될 것이라 생각합니까?</td>
						                <td class="q8-min question"></td>
						                <td class="q8-max question"></td>
						                <td class="q8-avg question"></td>
					                </tr>
					                <tr>
						                <td>9</td>
						                <td>귀하는 학기초 이 강좌를 통하여 기대하였던 학습 목표가 달성되었다고 생각하십니까?</td>
						                <td class="q9-min question"></td>
						                <td class="q9-max question"></td>
						                <td class="q9-avg question"></td>
					                </tr>
					                <tr>
						                <td>10</td>
						                <td>이 강좌를 동일한 교수님이 다음 학기에 강의한다면 귀하의 친구나 선,후배에게 추천하겠습니까?</td>
						                <td class="q10-min question"></td>
						                <td class="q10-max question"></td>
						                <td class="q10-avg question"></td>
					                </tr>
					                
				                </tbody>
			                </table>
			                <div class="close-box">
			                	<button type="button" class="btn btn-default close-btn" data-dismiss="modal">닫기</button>
			                </div>
		                </div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			
		
		
			$(document).on("click", ".open-opinionModal", function () {
				var courseNo = $(this).next().val();
				$(".question").empty();
				$.ajax({
					type:"GET",
					url:"opiniondetail",
					data: {cno : courseNo},
					dataType : "json",
					success:function(data){
						$(".course-opin tbody tr.comments").empty();
						$("#opinion .course-info tbody").empty();
						
						var c = data.course;
						var avg = data.avg;
						var min = data.min;
						var max = data.max;
						var comments = data.comments;
						console.log(data);
						
						var row = "<tr>";
						row += "<th>교과목번호</th>";
						row += "<td>"+c.no+"</td>";
						row += "<th>교과목명</th>";
						row += "<td>"+c.name+"</td>"
						row += "<th>강의년도</th>";
						row += "<td>"+c.year+"</td>";
						row += "<th>강의학기</th>";
						row += "<td>"+c.term+"</td>";
						$("#opinion .course-info tbody").append(row);
						
						$(".q1-avg").text(Math.round(avg.Q1));
		                $(".q2-avg").text(Math.round(avg.Q2));
		                $(".q3-avg").text(Math.round(avg.Q3));
		                $(".q4-avg").text(Math.round(avg.Q4));
		                $(".q5-avg").text(Math.round(avg.Q5));
		                $(".q6-avg").text(Math.round(avg.Q6));
		                $(".q7-avg").text(Math.round(avg.Q7));
		                $(".q8-avg").text(Math.round(avg.Q8));
		                $(".q9-avg").text(Math.round(avg.Q9));
		                $(".q10-avg").text(Math.round(avg.Q10));
		                
		                $(".q1-min").text(Math.round(min.Q1));
		                $(".q2-min").text(Math.round(min.Q2));
		                $(".q3-min").text(Math.round(min.Q3));
		                $(".q4-min").text(Math.round(min.Q4));
		                $(".q5-min").text(Math.round(min.Q5));
		                $(".q6-min").text(Math.round(min.Q6));
		                $(".q7-min").text(Math.round(min.Q7));
		                $(".q8-min").text(Math.round(min.Q8));
		                $(".q9-min").text(Math.round(min.Q9));
		                $(".q10-min").text(Math.round(min.Q10));
		                
		                $(".q1-max").text(Math.round(max.Q1));
		                $(".q2-max").text(Math.round(max.Q2));
		                $(".q3-max").text(Math.round(max.Q3));
		                $(".q4-max").text(Math.round(max.Q4));
		                $(".q5-max").text(Math.round(max.Q5));
		                $(".q6-max").text(Math.round(max.Q6));
		                $(".q7-max").text(Math.round(max.Q7));
		                $(".q8-max").text(Math.round(max.Q8));
		                $(".q9-max").text(Math.round(max.Q9));
		                $(".q10-max").text(Math.round(max.Q10));
						
						$.each(comments, function(index, comment){
							var commentRow = "<tr class='comments'>"
							commentRow += "<td>기타</td>";
							commentRow +="<td colspan='5'>";
							commentRow += comment.q11;
							commentRow += "</td><br>";
							commentRow += "</tr>"
							$(".course-opin tbody").append(commentRow);
						})
						
					}
				})
					$('#opinion').modal('show');
			 		return false;
			 		$(".close-btn").on('hide', function(){
			 			
			 		});
				
			});
		</script>
		
	</div>
</body>
</html>