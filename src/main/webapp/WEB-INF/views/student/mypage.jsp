<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.box-top {
	height: 400px;
}

.box-bottom {
	height: 200px;
}

.auto {
	overflow: auto;
}

div {
	padding: 0;
}

.form-error {
	color: red;
	font-style: italic;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>

<body>
	<div class="container-fluid">
<%@ include file="../common/header.jsp" %>
		<div class="row">
			<div class="col-sm-2" style="padding-right: 0px;">
				<%@ include file="../common/sidebar.jsp"%>
			</div>

			<div class="col-sm-9">
				<h1>개인정보 수정</h1>
				<div class="row">
					<div class="col-sm-12">
						<form:form method="post" action="updatemypage" modelAttribute="studentForm" enctype="multipart/form-data">
							<div class="form-group">
								<label>이름</label>
								<form:input path="name" cssClass="form-control"  disabled="true" />
							</div>
							<div class="form-group">
								<label>학번</label>
								<form:input path="no" cssClass="form-control" disabled="true" />
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<form:input path="password" cssClass="form-control"/>
								<span class="help-block form-error"><form:errors path="password"></form:errors></span>
							</div>
							<div class="form-group">
								<label>비밀번호 확인</label>
								<form:input path="checkpassword" cssClass="form-control"/>
								<span class="help-block form-error"><form:errors path="checkpassword"></form:errors></span>
							</div>
							<div class="form-group">
								<label>생일</label>
								<form:input path="birthday" cssClass="form-control"  disabled="true"/>
							</div>
							<div class="form-group">
								<label>이메일</label>
								<form:input path="email" cssClass="form-control" />
								<span class="help-block form-error"><form:errors path="email"></form:errors></span>
							</div>
							<div class="form-group">
								<label>전화번호</label>
								<form:input path="phone" cssClass="form-control"/>
								<span class="help-block form-error"><form:errors path="phone"></form:errors></span>
							</div>
							<div>
								<label>주소</label>
							</div>
							<div class="input-group">
								<input type="text" id="user-postal-code" name="userpostalcode" id="addr1" readonly="readonly" class="form-control" style="width: 15%;" placeholder="우편번호" aria-describedby="basic-addon1">
								<a class="btn btn-default" onclick="execPostCode();" style="float: left;">우편번호 찾기</a>
								<form:input path="address" cssClass="form-control"  disabled="true"/>
								<form:input path="detailaddress" cssClass="form-control" />
							</div>
							<br>
							<div class="form-group">
								<label>프로필사진</label>
								<input type="file" class="form-control" name="photoFile">
								<span class="help-block form-error"><form:errors path="photoFile"></form:errors></span>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-success btn-sm">변경사항 저장</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=userpostalcode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=address]').val(data.address);
				$('[name=detailaddress]').val(data.buildingName);
			}
		}).open();
	}
	
	$(".btn").submit(function(event) {
		var password = $('[name=password]').val();
		var checkpassword = $('[name=checkpassword]').val();
		
		if($('[name=password]').val() != $('[name=checkpassword]').val()) {
			event.preventDefault();
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		}
	});
	</script>
</body>
</html>
