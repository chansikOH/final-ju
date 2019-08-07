<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	.sidebar > div {
		padding: 0px;
	}
	
	#profile {
		border-radius: 50%;
		display: block;
		margin: 0px auto;
	}
	
	.center {
		text-align: center;
	}
	
	.sidebar {
		background-color: #faf6f0;
		padding: 0;
	}
	
	.bg-color-gray {
		background-color: #E3DCCC;
	}
	
	 .modal-message-body {
        height: 440px;
    }
    
    .text-line {
        display: block;
        width:300px; 
        overflow:hidden; 
        text-overflow:ellipsis; 
        white-space:nowrap;
    }
    
    textarea {
        resize: none;
    }

    textarea.form-control {
        height: 250px;
    }

    #send-note .table,
    #received-note .table,
    #sent-note .table {
        text-align: center;
    }

    #received-note th,
    #sent-note th {
        text-align: center;
        background-color: #faf6f0;
    }

    #received-note .new {
        background-color: #faf6f0;
    }
    
    .note-list-button {
        padding-top: 10px;
    }

    .note-list {
        padding-top: 10px;
        height: 300px;
        overflow: auto;
    }
    
    a, a:hover, a:link {
        text-decoration: none;   
    }
	
	#student-info-table td {text-align: left;}
</style>
<div class="sidebar" style="height: 100vh;">

	<c:if test="${not empty LOGIN_STUDENT }">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<c:choose>
					<c:when test="${empty LOGIN_STUDENT.photoName }">
						<img src="/ju/resources/images/profile.jpg" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/ju/resources/images/students/${LOGIN_STUDENT.photoName }" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<p class="text-center">
					<strong>${LOGIN_STUDENT.name }</strong>님 환영합니다.
					<a href="/ju/logout" class="btn btn-default btn-xs">로그아웃</a>
                    <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#note-modal">쪽지</button>
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<table class="table" id="student-info-table">
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<td class="bg-color-gray">학번</td>
							<td class="sidebar-message-no">${LOGIN_STUDENT.no }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학과</td>
							<td>${LOGIN_STUDENT.major.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">학년</td>
							<td>${LOGIN_STUDENT.grade }학년</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이름</td>
							<td>${LOGIN_STUDENT.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">주소</td>
							<td>${LOGIN_STUDENT.address }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">연락처</td>
							<td>${LOGIN_STUDENT.phoneNumber }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이메일</td>
							<td>${LOGIN_STUDENT.email }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty LOGIN_PROFESSOR }">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<c:choose>
					<c:when test="${empty LOGIN_PROFESSOR.photoName }">
						<img src="/ju/resources/images/profile.jpg" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/ju/resources/images/students/${LOGIN_PROFESSOR.photoName }" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<p class="text-center">
					<strong>${LOGIN_PROFESSOR.name }</strong>님 환영합니다.
					<a href="/ju/logout" class="btn btn-default btn-xs">로그아웃</a>
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<table class="table" id="student-info-table">
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<td class="bg-color-gray">사원번호</td>
							<td class="sidebar-message-no">${LOGIN_PROFESSOR.no }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">부서</td>
							<td>${LOGIN_PROFESSOR.major.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">직위</td>
							<td>${LOGIN_PROFESSOR.position.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이름</td>
							<td>${LOGIN_PROFESSOR.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">주소</td>
							<td>${LOGIN_PROFESSOR.address }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">연락처</td>
							<td>${LOGIN_PROFESSOR.phoneNumber }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이메일</td>
							<td>${LOGIN_PROFESSOR.email }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty LOGIN_EMPLOYEE }">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<img src="/ju/resources/images/profile.jpg" style="width: 50%; height: 50%; margin-bottom: 20px;" />
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<p class="center">
					<strong>${LOGIN_EMPLOYEE.name }</strong>님 환영합니다.
					<a href="/ju/logout" class="btn btn-default btn-xs">로그아웃</a>
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<table class="table">
					<tbody>
						<tr>
							<td class="bg-color-gray">사원번호</td>
							<td class="sidebar-message-no">${LOGIN_EMPLOYEE.no }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">부서</td>
							<td>${LOGIN_EMPLOYEE.department.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">직위</td>
							<td>${LOGIN_EMPLOYEE.position.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이름</td>
							<td>${LOGIN_EMPLOYEE.name }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">주소</td>
							<td>${LOGIN_EMPLOYEE.address }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">연락처</td>
							<td>${LOGIN_EMPLOYEE.phoneNumber }</td>
						</tr>
						<tr>
							<td class="bg-color-gray">이메일</td>
							<td>${LOGIN_EMPLOYEE.email }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
	
	<div class="modal fade" id="note-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-fullsize">
            <div class="modal-content modal-fullsize">
                <div class="modal-body modal-message-body">
                    <button type="button" class="close" data-dismiss="modal" aria-l abel="Close"><span aria-hidden="true">&times;</span></button>
                    <div role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#send-note" aria-controls="send-note" role="tab" data-toggle="tab">쪽지보내기</a></li>
                            <li role="presentation"><a href="#received-note" aria-controls="received-note" role="tab" data-toggle="tab">받은 쪽지</a></li>
                            <li role="presentation"><a href="#sent-note" aria-controls="sent-note" role="tab" data-toggle="tab">보낸 쪽지</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="send-note">
                                <form class="form" id="sendNote">
                                    <table class="table">
                                        <colgroup>
                                            <col width="20%" />
                                            <col width="80%" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td>받는 사람</td>
                                                <!--<td><div class="input-group">
                                                            <input type="text" class="form-control" placeholder="Search" name="search">
                                                            <div class="input-group-btn">
                                                              <button class="btn btn-default" type="submit">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                              </button>
                                                            </div>
                                                          </div></td>-->
                                                <td><input type="text" class="form-control" name="receiver"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><textarea class="form-control" name="contents" ></textarea></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><button type="button" id="sendMessage" class="btn btn-info">전송</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="received-note">
                                <div class="note-list-button">
                                    <button type="button" class="btn btn-default btn-xs">전체 선택</button>
                                    <button type="button" class="btn btn-default btn-xs">읽음 표시</button>
                                    <button type="button" class="btn btn-default btn-xs">삭제</button>
                                </div>
                                <div class="note-list">
                                    <table class="table">
                                        <colgroup>
                                            <col width="10%" />
                                            <col width="20%" />
                                            <col width="50%" />
                                            <col width="20%" />
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>보낸 사람</th>
                                                <th>내용</th>
                                                <th>날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="sent-note">
                                <div class="note-list-button">
                                    <button type="button" class="btn btn-default btn-xs">전체 선택</button>
                                    <button type="button" class="btn btn-default btn-xs">읽음 표시</button>
                                    <button type="button" class="btn btn-default btn-xs">삭제</button>
                                </div>
                                <div class="note-list">
                                    <table class="table">
                                        <colgroup>
                                            <col width="10%" />
                                            <col width="20%" />
                                            <col width="45%" />
                                            <col width="25%" />
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>받는 사람</th>
                                                <th>내용</th>
                                                <th>날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="note-detail">
                                <form class="form">
                                    <table class="table">
                                        <colgroup>
                                            <col width="20%" />
                                            <col width="80%" />
                                        </colgroup>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    	$(function() {
        	var no = $(".sidebar-message-no").text();
        		
       		$.ajax({
       			type:"POST",
       			url:"/ju/message",
       			data: {no:no},
       			dataType:"json",
       			success: function(map) {
       				var receive = map.receiveMessage;
       				var call = map.callMessage;
       				
       				$("#sent-note tbody").empty();
       				$("#received-note tbody").empty();
       					
       				if(receive != null) {
   	    				$.each(map.receiveMessage, function(index, m) {
           					var d = new Date(m.createDate);
           					var month = d.getMonth() + 1;
           					var day = d.getDate();
           					var year = d.getFullYear();
           					var date = year + '-' + month + '-' + day;
   	    					
   	    					var row = "<tr>";
   	    					row += "<td><input type='checkbox'></td>";
   	    					row += "<td>"+m.receiver.name+"</td>";
   	    					row += "<td><span class='text-line'><a href='javascript:void()' onclick='detail()'>"+m.contents+"</a></span></td>";
   	    					row += "<td>"+date+"</td>";
   	    					row += "</tr>";
   	    					
   	    					$("#sent-note tbody").append(row);
   	    					
   	    					function detail() {
   	    						$("#sent-note table").empty();
   	    					}
   	    				})
       				} else {
       					var row = "<tr>";
       					row += "<td colspan='4'>보낸 쪽지가 없습니다.</td>";
       					row += "</tr>";
       					
       					$("#sent-note tbody").append(row);
       				}
       				
       				if(call.length != 0) {
       					$.each(map.callMessage, function(index, m) {
           					var d = new Date(m.createDate);
           					var month = d.getMonth() + 1;
           					var day = d.getDate();
           					var year = d.getFullYear();
           					var h = d.getHours();
           					
           					var date = year + '.' + month + '.' + day;
           					
           					console.log(h);
       						var row = "<tr>";
       						row += "<td><input type='checkbox'></td>";
       						row += "<td>"+m.caller.name+"</td>";
       						row += "<td><span class='text-line'><a href='#note-detail' aria-controls='note-detail' role='tab' data-toggle='tab' data-no='"+m.no+"'>"+m.contents+"</a></span></td>";
       						row += "<td>"+date+"</td>";
       						row += "</tr>";
       						
       						$("#received-note tbody").append(row);     						
       					})
       				} else if(call.length == 0) {
       					var row = "<tr>";
       					row += "<td colspan='4'>받은 쪽지가 없습니다.</td>";
       					row += "</tr>";
       					
       					$("#received-note tbody").append(row);
       				}
       			}
       		})
        })
    
    	$("#sendMessage").click(function() {
    		
    		var receiver = $("[name=receiver]").val();
    		var contents = $("[name=contents]").val();
    		
    		$.ajax({
    			type:"GET",
    			url:"/ju/sendmessage",
    			data: {receiver:receiver, contents:contents},
    			dataType: "json",
    			success: function(data) {
    				$("#send-note tbody input").val("");
    				$("#send-note tbody textarea").val("");
    				
    			},
    			error: function(request, error){
    				alert("쪽지 보내기를 실패하였습니다.");
    			}
    		});
    	})
    </script>
</div>