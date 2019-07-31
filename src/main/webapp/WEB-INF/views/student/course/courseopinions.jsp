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
                   <h4>[강의평가]</h4>
                   
                    <table class="table table-bordered course-info">
                        <tr>
                            <th>교과목명</th>
                            <td>자바의 소리</td>

                            <th>학과명</th>
                            <td>컴퓨터공학과</td>

                            <th>담당교수</th>
                            <td>오찬식</td>

                            <th>학기</th>
                            <td>2019년 1학기</td>
                        </tr>
                    </table>

                   <div class="score-check">
                        <p>이 설문지의 목적은 여러분의 의견을 반영하여 보다 좋은 강의를 제공할 수 있도록 돕는 것입니다. 이 목적에 도움이 되도록 성실하고 솔직하게 답변해 주시면 감사하겠습니다.</p>
                        <p>이 평가서는 익명으로 작성되며, 성적평가 후 개봉/정리되어 담당교수의 다음 학기 강의 준비에 참고가 될 것입니다.</p>
                        <hr/>
                        <p>각 문항별로 여러분이 동의하는 정도에 따라 1~5 중 하나를 선택해주십시오.</p>
                        <p>1: 전혀 그렇지 않다. 2: 그렇지 않다. 3: 보통이다. 4: 그렇다. 5: 정말 그렇다.</p>
                    </div>

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
                                <td>교수님의 강의계획서를 통해 한 학기동안 진행된 강의내용의 윤관을 잘 파악할 수 있었다.</td>
                                <td>
                                    <input type="radio" value="1"> 1
                                    <input type="radio" value="2"> 2
                                    <input type="radio" value="3"> 3
                                    <input type="radio" value="4"> 4
                                    <input type="radio" value="5"> 5
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>교수님의 강의계획서를 통해 한 학기동안 진행된 강의내용의 윤관을 잘 파악할 수 있었다.</td>
                                <td>
                                    <input type="radio" value="1"> 1
                                    <input type="radio" value="2"> 2
                                    <input type="radio" value="3"> 3
                                    <input type="radio" value="4"> 4
                                    <input type="radio" value="5"> 5
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>교수님의 강의계획서를 통해 한 학기동안 진행된 강의내용의 윤관을 잘 파악할 수 있었다.</td>
                                <td>
                                    <input type="radio" value="1"> 1
                                    <input type="radio" value="2"> 2
                                    <input type="radio" value="3"> 3
                                    <input type="radio" value="4"> 4
                                    <input type="radio" value="5"> 5
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>교수님의 강의계획서를 통해 한 학기동안 진행된 강의내용의 윤관을 잘 파악할 수 있었다.</td>
                                <td>
                                    <input type="radio" value="1"> 1
                                    <input type="radio" value="2"> 2
                                    <input type="radio" value="3"> 3
                                    <input type="radio" value="4"> 4
                                    <input type="radio" value="5"> 5
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>교수님의 강의계획서를 통해 한 학기동안 진행된 강의내용의 윤관을 잘 파악할 수 있었다.</td>
                                <td>
                                    <input type="radio" value="1"> 1
                                    <input type="radio" value="2"> 2
                                    <input type="radio" value="3"> 3
                                    <input type="radio" value="4"> 4
                                    <input type="radio" value="5"> 5
                                </td>
                            </tr>
                            <tr>
                            	<td colspan="3">
                            		<button class="btn btn-success">제출</button>
                            	</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
		</div>
	</div>

</body>
</html>