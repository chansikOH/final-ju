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
<style type="text/css">
	 .header {margin: 30px;}
	 .btn-success {margin: 30px;}
	 .form-group {width: 750px;}
	 .input-group {width: 750px; margin: 10px; margin-left: 0; margin-top: 0;}
	 .shadow {padding:0; box-shadow: 1px 1px 1px 1px #999;}
  	 .submit {margin: 0 auto 15px;}
	 .radio-inline {font-size: 15px; width: 50px;}  	 
  	 .form-group select {width:174px; height: 22px;} 
  	 .form-error {color: red; font-style: italic;}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js""></script>
</head>

<body>
<%@ include file="../../common/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 shadow"> 
			<%@include file="../../common/sidebar.jsp" %>
		</div>
	  	<div class="col-sm-10">
	  		<div class="header">
	  			<h2>학생등록</h2>
	  		</div>
	  		<div class="col-sm-12 ">
		  		<form:form  method="post" action="studentRegister"  modelAttribute="studentRegisterForm"  enctype="multipart/form-data">
					<div class="form-group">
						<label>이름</label>
						<form:input path="name" cssClass="form-control"/>
						<span class="help-block form-error"><form:errors path="name"></form:errors></span>
					</div>
					<div class="form-group"> 
						<label>성별</label> 
						<div>
							<label class="radio-inline">
							  <input type="radio" name="gender"  value="M" checked="checked"> 남자
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" value="F"> 여자
							</label>
						</div>
					</div> 
					<div class="form-group">
						<label>생일</label>
						<form:input path="birth"  type="date" cssClass="form-control"/>
						<span class="help-block form-error"><form:errors path="birth"></form:errors></span>
					</div>
					<div class="form-group">
						<label>이메일</label>
						<form:input path="email" cssClass="form-control" />
						<span class="help-block form-error"><form:errors path="email"></form:errors></span>
					</div>
					<div class="form-group">
						<label>전화번호</label>
						<form:input path="phoneNumber" cssClass="form-control"/>
						<span class="help-block form-error"><form:errors path="phoneNumber"></form:errors></span>
					</div>
					<div>
						<label>주소</label>
					</div>
					<div class="input-group">
						<input type="text" name="userpostalcode"  readonly="true" class="form-control" style="width: 15%;" placeholder="우편번호" aria-describedby="basic-addon1">
						<a class="btn btn-default" onclick="execPostCode();" style="float: left;">우편번호 찾기</a>
						<form:input path="address" cssClass="form-control" />
						<form:input path="detailaddress" cssClass="form-control" />
						<span class="help-block form-error"><form:errors path="address"></form:errors></span>
					</div>
				    <div class="form-group">
						<label>학과</label> 
						<div>
					  	  	<select name="majorNo">
		                  	 	<c:forEach var="major" items="${majors }">
	                            	<option value="${major.no }">${major.name }</option>
	                            </c:forEach>	
	                  	 	</select>
						</div>
					</div>
					<div class="form-group">
						<label>편입여부</label> 
						<div>
							<label class="radio-inline">
							  <input type="radio" name="transferYn" value="N"  checked="checked"> N
							</label>
							<label class="radio-inline">
							  <input type="radio" name="transferYn" value="Y" > Y
							</label>
								<div id="grade-box">
		                            <select name="grade" id="grade-transfer-n">
			                            <option value="1">1학년</option>
		                            </select> 	
								</div>
						</div>
					</div>
					<div class="form-group">
						<label>프로필사진</label>
						<input type="file" class="form-control" name="photoFile">
						<span class="help-block form-error"><form:errors path="photoFile"></form:errors></span>
					</div>
					<div class="form-group submit">
						<button type="submit" class="btn btn-success btn-lg">학생등록</button>
					</div>
				</form:form>
	  		</div>
	  	</div>
	</div>
</div>
	<script type="text/javascript">
	
	/* 주소 API */
	function execPostCode() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=userpostalcode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=address]').val(data.address);
				$('[name=detailaddress]').val(data.buildingName);
			}
		}).open();
	}
	
	/* 학년 select창 */
	$("[name=transferYn]").click(function(){
		var istransfer = $(this).val();
		
		var n = "<select name='grade' id='grade-transfer-n'>"; 
		    n += "<option value='1'>1학년</option>";
            n += "</select>";
       
        var y = "<select name='grade' id='grade-transfer-y'>";
        	y += "<option value='2'>2학년</option>";
        	y += "<option value='3'>3학년</option>"; 
        	y += "<option value='4'>4학년</option>"; 
        	y += "</select>"; 
        
		if(istransfer === 'Y'){
			$('#grade-box').html(y);
		} else {
			$('#grade-box').html(n);
		}
	})
	</script>
</body>
</html>