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
        height: 250px;   
        overflow:auto; 
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
    .profile-img-padding{padding:10px;}
	.profile-padding{padding-left: 22px; padding-right: 21px;}
	#student-info-table td {text-align: left;}
</style>
<div class="sidebar" style="height: 100vh;">

	<c:if test="${not empty LOGIN_STUDENT }">
		<div class="row">
			<div class="col-sm-12 profile-img-padding">
				<br>
				<c:choose>
					<c:when test="${empty LOGIN_STUDENT.photoName }">
						<img src="/ju/resources/images/profile.jpg" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/ju/resources/images/students/${LOGIN_STUDENT.photoName }" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
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
			<div class="col-sm-12 profile-padding">
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
			<div class="col-sm-12 profile-img-padding">
				<br>
				<c:choose>
					<c:when test="${empty LOGIN_PROFESSOR.photoName }">
						<img src="/ju/resources/images/profile.jpg" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/ju/resources/images/students/${LOGIN_PROFESSOR.photoName }" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12 profile-img-padding">
				<p class="text-center">
					<strong>${LOGIN_PROFESSOR.name }</strong>님 환영합니다.
					<a href="/ju/logout" class="btn btn-default btn-xs">로그아웃</a>
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12 profile-padding">
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
				<c:choose>
					<c:when test="${empty LOGIN_EMPLOYEE.photoName }">
						<img src="/ju/resources/images/profile.jpg" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/ju/resources/images/students/${LOGIN_EMPLOYEE.photoName }" id="profile" style="width: 50%; height: 50%; margin-bottom: 20px;" />
					</c:otherwise>
				</c:choose>
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
			<div class="col-sm-12 profile-padding">
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
                                <form class="form" id="sendNote" method="POST" action="/ju/sendmessage">
                                    <table class="table">
                                    	<colgroup>
                                    		<col width="30%">
                                    		<col width="70%">                                    		
                                    	</colgroup>
                                        <tbody>
                                            <tr>
                                                <th>받는 사람</th>
                                                <td><input type="radio" value="학생" name="type"> 학생
                                                	<input type="radio" value="교수" name="type"> 교수
                                                	<input type="radio" value="직원" name="type"> 직원</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                	<select id="selectTypeDetail" class="form-control">
                                                		<option value="">선택</option>
                                                	</select>
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td id="personlist" colspan="2">
                                            		<span></span>
                                            		<div class="text-line">
	                                            		<table class="table"></table>                                            		
                                            		</div>
                                            	</td>
                                            </tr>
                                            <tr>
                                            	<td colspan="2"><textarea class="form-control" name="contents"></textarea></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><button type="submit" id="sendMessage" class="btn btn-info">전송</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="received-note">
                                <div class="note-list-button">
                                    <button type="button" class="btn btn-default btn-xs" class="allCheck">전체 선택</button>
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
    		$("#selectTypeDetail").hide();
    		$("#personlist").hide();
    		
    		$("#send-note input:radio[name='type']").change(function() {
    			$("#selectTypeDetail option:eq(0)").prop("selected", true);
    			$("#personlist table").empty();
    		})
    		
    		$("#send-note input:radio[name='type']").click(function() {
	    		var checkedType = $(this).val();
    			
	    		if(checkedType == '학생' || checkedType == '교수') {
		    		$.ajax({
		    			type:"POST",
		    			url:"/ju/findgubun",
		    			success: function(map) {
		    				$.each(map.majors, function(index, m) {
		    					var row = "<option value='"+m.no+"'>"+m.name+"</option>";
		    					
		    					$("#selectTypeDetail").append(row);
		    				})
		    			}
		    		})
		    		
		    		$("#selectTypeDetail").show();	    		
	    		} else if(checkedType == '직원') {
	    			$.ajax({
	    				type:"POST",
	    				url:"/ju/findgubun",
	    				success: function(map) {
	    					$.each(map.departments, function(index, d) {
	    						var row = "<option value='"+d.id+"'>"+d.name+"</option>";
	    						
	    						$("#selectTypeDetail").append(row);
	    					})
	    				}
	    			})

		    		$("#selectTypeDetail").show();	 
	    		}
    		})
    		
    		$('#selectTypeDetail').change(function() {
    			var selectOption = $('#selectTypeDetail option:selected').val();
    			var checkedType = $("#send-note input:radio[name='type']:checked").val();
    			
    			console.log(selectOption);
    			console.log(checkedType);
    			
    			$.ajax({
    				type:"POST",
    				url:"/ju/findperson",
    				data:{checkedType:checkedType, majorNo:selectOption, deptId:""},
    				dataType:"json",
    				success:function(map) {
    					var student = map.student;
    					var professor = map.professor;
    					
    					if(checkedType == '학생') {
	    					$("#personlist table").empty();
	    						
	    					var row = "<thead>";
	    					row += "<tr>";
	    					row += "<th>선택</th>";
	    					row += "<th>학번</th>";
	    					row += "<th>학년</th>";
	    					row += "<th>이름</th>";
	    					row += "</tr>";
	    					row += "</thead>";
	    						
	    					$.each(map.student, function(index, s) {
	    						row += "<tbody>";
	    						row += "<tr>";
	    						row += "<td><input type='checkbox' name='receiver' value='"+s.no+"'></td>";
	    						row += "<td>"+s.no+"</td>";
	    						row += "<td>"+s.grade+"</td>";
	    						row += "<td>"+s.name+"</td>";
	    						row += "</tr>"
	    						row += "</tbody>";
    						})
	    					$("#personlist table").append(row);
	    					$("#personlist").show();
	    					
    					} else if(checkedType == '교수') {
	    					$("#personlist table").empty();
	    						
	    					var row = "<thead>";
	    					row += "<tr>";
	    					row += "<th>선택</th>";
	    					row += "<th>교수번호</th>";
	    					row += "<th>직위</th>";
	    					row += "<th>이름</th>";
	    					row += "</tr>";
	    					row += "</thead>";
	    						
    						$.each(map.professor, function(index, p) {
	    						row += "<tbody>";
	    						row += "<tr>";
	    						row += "<td><input type='checkbox' name='receiver' value='"+p.no+"'></td>";
	    						row += "<td>"+p.no+"</td>";
	    						row += "<td>"+p.position.name+"</td>";
	    						row += "<td>"+p.name+"</td>";
	    						row += "</tr>";
	    						row += "</tbody>";
    						})
    						$("#personlist table").append(row);
	    					$("#personlist").show();
    						
    					}
    				}
    			})
    					
    			$.ajax({
    				type:"POST",
    				url:"/ju/findperson",
    				data:{checkedType:checkedType, deptId:selectOption, majorNo:0},
    				dataType:"json",
    				success:function(map) {
    					var employee = map.employee;
    					
    					if(checkedType == '직원') {
	    					$("#personlist table").empty();
	    						
	    					var row = "<thead>";
	    					row += "<tr>";
	    					row += "<th>선택</th>";
	    					row += "<th>직원번호</th>";
	    					row += "<th>부서</th>";
	    					row += "<th>직위</th>";
	    					row += "<th>이름</th>";
	    					row += "</tr>";
	    					row += "</thead>";
	    						
    						$.each(map.employee, function(index, e) {
	    						row += "<tbody>";
	    						row += "<tr>";
	    						row += "<td><input type='checkbox' name='receiver' value='"+e.no+"'></td>";
	    						row += "<td>"+e.no+"</td>";
	    						row += "<td>"+e.department.name+"</td>";
	    						row += "<td>"+e.position.name+"</td>";
	    						row += "<td>"+e.name+"</td>";
	    						row += "</tr>"
	    						row += "</tbody>";	    						
    						})
    						$("#personlist table").append(row);
	    					$("#personlist").show();
    					}
    				}
    			})
    		})
    		
    		/* $("#sendMessage").click (function() {
    			var contents = $("[name=contents]").val();
    			var receiver = $("[name=receiver]").val();
    			var type = $("#send-note input:radio[name='type']:checked").val();
    			
    			console.log(contents, "con");
    			console.log(receiver, "rec");
    			console.log(type, "type");
    			
    			$.ajax({
    				type:"POST",
    				url:"/ju/sendmessage",
    				data:{contents:contents, receiver:receiver, receiverType:type},
    				dataType:"json",
    				success:function(map) {
    					console.log("!!!");
    				}
    			})
    		}) */
    		
       		$('#note-modal').on('hidden.bs.modal', function (e) {
       			$("#send-note").addClass('active').siblings().removeClass('active');
       			$('.nav-tabs li:nth-child(1)').addClass('active').siblings().removeClass('active');
       			
       			$("#selectTypeDetail option:eq(0)").prop("selected", true);
      			$("#selectTypeDetail").hide();
    			$("#personlist").hide();
			})
			
			$("#sendMessage").submit(function(event) {
				event.preventDefault();
			});

			$("#sendMessage").submit();
		});
			
		$(window).scroll(function() {
			var scroll = $(window).scrollTop();
			if (scroll >= 60) {
				$(".sidebar").css({"height" : "200vh"});
			}else if(scroll > 150){
				$(".sidebar").css({"height" : "230vh"});
			} else {
				
			}
		});
    </script>
</div>