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
            padding: 20px;
        }
        
        .wrapper th {
            background-color: #faf6f0;
        }
        
        textarea {
            resize: none;
            height: 40px;
        }
        
        .table {
            border: 1px solid #ccc;
            text-align: center;
        }
        
        .table th {
            text-align: center;
        }
        
        .form-table {
            border: 2px solid #ccc;
        }
        
        .form-table td {
            text-align: left;
        }
        
        .form-table button {
            float: right;
            margin-left: 10px;
        }
        
        .expected input {
            width: 50px;
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
                    <div class="col-sm-12">
                        <h4>[학적기초정보]</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>학번</th>
                                    <th>학부(과)</th>
                                    <th>학년</th>
                                    <th>학적상태</th>
                                    <th>지도교수</th>
                                    <th>연락처</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>20190101</td>
                                    <td>컴퓨터공학과</td>
                                    <td>1</td>
                                    <td>재학</td>
                                    <td>오찬식</td>
                                    <td>010-1111-1111</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <h4>[휴학 및 자퇴 신청현황]</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>년도</th>
                                    <th>학기</th>
                                    <th>신청구분</th>
                                    <th>변동사유</th>
                                    <th>학부(과)</th>
                                    <th>신청일자</th>
                                    <th>승인여부</th>
                                    <th>반려사유</th>
                                    <th>취소</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2019</td>
                                    <td>1</td>
                                    <td>휴학</td>
                                    <td>군입대</td>
                                    <td>컴퓨터공학과</td>
                                    <td>2019-02-01</td>
                                    <td>신청</td>
                                    <td>-</td>
                                    <td><button class="btn btn-default">취소하기</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-12">
                        <h4>[신청입력 정보]</h4>
                        <form class="form">
                            <table class="table form-table">
                                <tbody>
                                    <tr>
                                        <th>접수상태</th>
                                        <td><input type="text" value="신청" class="form-control"></td>
                                        
                                        <th>학기 수</th>
                                        <td><input type="text" class="form-control"></td>
                                        
                                        <th>복학예정일자</th>
                                        <td><input type="date" class="form-control"></td>
                                    </tr>
                                    <tr class="expected">
                                        <th>휴학예정기간</th>
                                        <td colspan="3"><input type="text"> 학년도
                                                        <input type="text"> 학기 ~
                                                        <input type="text"> 학년도
                                                        <input type="text"> 학기</td>
                                        <th>복학예정학기</th>
                                        <td><input type="text"> 학년도
                                            <input type="text"> 학기</td>
                                    </tr>
                                    <tr>
                                        <th>휴학사유</th>
                                        <td colspan="5"><textarea class="form-control"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <button type="submit" class="btn btn-default">신청</button> 
                                            <button type="reset" class="btn btn-default">초기화</button>
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

</body>
</html>