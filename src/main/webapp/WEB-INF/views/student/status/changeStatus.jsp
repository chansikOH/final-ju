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
                                    <td>${student.no }</td>
                                    <td>${student.major.name }</td>
                                    <td>${student.grade }</td>
                                    <td>${student.division }</td>
                                    <td>${student.professor.name }</td>
                                    <td>${student.phoneNumber }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <h4>[휴학 및 자퇴 신청현황]</h4>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>시작년도</th>
                                    <th>학기 수</th>
                                    <th>학부(과)</th>
                                    <th>신청구분</th>
                                    <th>변동사유</th>
                                    <th>신청일자</th>
                                    <th>승인여부</th>
                                    <th>취소</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty status }">
                            			<tr>
                            				<td colspan="8">조회된 신청내역이 없습니다.</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            			<c:forEach var="sta" items="${status }">
		                            		<tr>
		                            			<c:choose>
		                            				<c:when test="${sta.studentStatus.startTerm != 0 && sta.studentStatus.division != '복학' }">
					                                    <td>${sta.studentStatus.startTerm }</td>
		                            				</c:when>
		                            				<c:otherwise>
		                            					<td>-</td>
		                            				</c:otherwise>
		                            			</c:choose>
		                            			<c:choose>
		                            				<c:when test="${sta.studentStatus.termCount != '0' }">
					                                    <td>${sta.studentStatus.termCount }</td>
		                            				</c:when>
		                            				<c:otherwise>
		                            					<td>-</td>
		                            				</c:otherwise>
		                            			</c:choose>
			                                    <td>${sta.major.name }</td>
			                                    <td>${sta.studentStatus.division }</td>
			                                    <td>${sta.studentStatus.contents }</td>
			                                    <td><fmt:formatDate value="${sta.studentStatus.createDate }"/></td>
			                                    <c:choose>
			                                    	<c:when test="${sta.studentStatus.passYn eq 'W' }">
			                                    		<td>대기중</td>
			                                    	</c:when>
			                                    	<c:when test="${sta.studentStatus.passYn eq 'P' }">
			                                    		<td>승인</td>
			                                    	</c:when>
			                                    	<c:when test="${sta.studentStatus.passYn eq 'N' }">
			                                    		<td>반려</td>
			                                    	</c:when>
			                                    </c:choose>
			                                    <c:choose>
			                                    	<c:when test="${sta.studentStatus.passYn eq 'W' && sta.studentStatus.division != '복학' }">
			                                    		<td><a href="delete.status?no=${sta.studentStatus.no }&sta=${param.sta }" class="btn btn-danger btn-xs" id="cancle">취소하기</a></td>
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		<td>-</td>
			                                    	</c:otherwise>
			                                    </c:choose>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            	
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-12">
                        <h4>[신청입력 정보]</h4>
                        
                        <c:choose>
                        	<c:when test="${param.sta eq 'leave' }">
                        		<form class="form" method="post" action="changeStatus?sta=${param.sta }">
		                            <table class="table form-table">
		                                <tbody>
		                                    <tr>
		                                        <th>재적구분</th>
		                                        <td><input type="text" value="휴학" class="form-control" name="division"></td>
		                                                        
		                                        <th>학기 수</th>
		                                        <td><input type="text" class="form-control" name="termCount"></td>
		                                        
		                                        <th>휴학예정기간</th>
		                                        <td class="expected"><input type="text" name="startTerm"> 년도
		                                                        <input type="text"> 학기</td>
		                                    </tr>
		                                    <tr>
		                                        <th>휴학사유</th>
		                                        <td colspan="5"><textarea class="form-control" name="contents"></textarea></td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="6">
		                                            <button type="submit" class="btn btn-success" id="btn-insert">신청</button> 
		                                            <button type="reset" class="btn btn-default">초기화</button>
		                                        </td>
		                                    </tr>
		                                </tbody>
		                            </table>
		                        </form>
                        	</c:when>
                        	
                        	<c:when test="${param.sta eq 'goingback' }">
		                        <p>※ 복학접수가 완료되면 수강신청 및 등록사항 반드시 확인</p>
		                        <p>※ 복학 학부(과) 선택의 신청구분에 체크한 후 접수버튼 클릭</p>
		                        <p class="danger">※ 복학 신청한 내용은 취소 불가</p>
		                        <form class="form" method="POST" action="changeStatus?sta=${param.sta }" >
			                        <table class="table">
			                            <thead>
			                                <tr>
			                                	<th>번호</th>
			                                    <th>시작년도</th>
			                                    <th>학부(과)</th>
			                                    <th>학적상태</th>
			                                    <th>신청일자</th>
			                                    <th>신청구분</th>
			                                </tr>
			                            </thead>
			                            <tbody>
			                            	<c:choose>
			                            		<c:when test="${leaveStudents eq null }">
			                            			<tr>
			                            				<td colspan="6">조회된 복학 가능 내역이 없습니다.</td>
			                            			</tr>
			                            		</c:when>
			                            		<c:otherwise>
						                            <tr>				                            	
								                        <td>${leaveStudents.studentStatus.no }</td>
								                        <td>${leaveStudents.studentStatus.startTerm }</td>
								                        <td>${leaveStudents.major.name }</td>
								                        <td>${leaveStudents.studentStatus.division }</td>
								                        <td><fmt:formatDate value="${leaveStudents.studentStatus.createDate }" /></td>
										                <td><input type="checkbox"></td>
							                        </tr>
						                            <tr>
						                                <td colspan="6">
						                                	<input type="hidden" name="division" value="복학" class="form-control" />
						                                	<input type="hidden" name="startTerm" value="${leaveStudents.studentStatus.no }" class="form-control" />
						                                	<input type="hidden" name="termCount" value="0" class="form-control" />
						                                	<input type="hidden" name="contents" value="-" class="form-control" />
						                                	<button class="btn btn-success pull-right">신청</button>
						                                </td>
						                            </tr>
			                            		</c:otherwise>
			                            	</c:choose>
			                            </tbody>
			                        </table>
		                        </form>
                        	</c:when>
                        	
                        	<c:when test="${param.sta eq 'drop' }">
		                        <form class="form" method="POST" action="changeStatus?sta=${param.sta }">
		                            <table class="table form-table">
		                                <tbody>
		                                    <tr>
		                                        <th>재적구분</th>
		                                        <td><input type="text" value="자퇴" class="form-control" name="division"></td>
		                                        		                                        
		                                        <th>신청일자</th>
		                                        <td><input type="date" id="currentDate" class="form-control" disabled></td>
		                                    </tr>
		                                    <tr>
		                                        <th>자퇴사유</th>
		                                        <td colspan="3"><textarea class="form-control" name="contents"></textarea></td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="4">
		                                        	<input type="hidden" name="startTerm" value="0" class="form-control" />
		                                        	<input type="hidden" name="termCount" value="0" class="form-control" />
		                                            <button type="submit" class="btn btn-success" id="btn-insert">신청</button>
		                                            <button type="reset" class="btn btn-default">초기화</button>
		                                        </td>
		                                    </tr>
		                                </tbody>
		                            </table>
		                        </form>
                        	</c:when>
                        </c:choose>
                        
                    </div>
                </div>
            </div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		$(function() {
			
			function getQueryStringObject() {
			    var a = window.location.search.substr(1).split('&');
			    if (a == "") return {};
			    var b = {};
			    for (var i = 0; i < a.length; ++i) {
			        var p = a[i].split('=', 2);
			        if (p.length == 1)
			            b[p[0]] = "";
			        else
			            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
			    }
			    return b;
			}
			
			var qs = getQueryStringObject();
			var result = qs.result;
			if(result=="fail") {
				alert("이미 신청한 내역이 있습니다.");
			}
			
			document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
			
			$("#cancle").click(function() {
				if(confirm("취소하시겠습니까?")) {
					return true;
				} else {
					return false;
				}
			})
			
			$("#btn-insert").click(function() {
				if(confirm("신청하시겠습니까?")) {
					return true;
				} else {
					return false;
				}
			});
			
		})
	</script>
	
</body>
</html>