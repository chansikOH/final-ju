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

        .table {
            border: 1px solid #ccc;
            text-align: center;
        }

        .table th {
            text-align: center;
        }
        
        .danger {
            color: red;
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
                        <h4>[복학 학부(과) 선택]</h4>
                        <p>※ 복학접수가 완료되면 수강신청 및 등록사항 반드시 확인</p>
                        <p>※ 복학 학부(과) 선택의 신청구분에 체크한 후 접수버튼 클릭</p>
                        <p class="danger">※ 복학 신청한 내용은 취소 불가</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>학번</th>
                                    <th>학부(과)</th>
                                    <th>학적상태</th>
                                    <th>연락처</th>
                                    <th>신청구분</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>20190101</td>
                                    <td>컴퓨터공학과</td>
                                    <td>휴학</td>
                                    <td>010-1111-1111</td>
                                    <td><input type="checkbox"></td>
                                </tr>
                            </tbody>
                            <tr>
                                <td colspan="5"><button class="btn btn-default">복학신청</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
		</div>
	</div>

</body>
</html>