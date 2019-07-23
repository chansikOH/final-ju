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
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js""></script>
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
						<form method="post" action="#" enctype="multipart/form-data">
							<div class="form-group">
								<label>이름</label>
								<input type="text" class="form-control" value="김다윤" name="name" disabled>
							</div>
							<div class="form-group">
								<label>아이디</label>
								<input type="text" class="form-control" value="20173868" name="no" disabled>
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" class="form-control" name="password">
							</div>
							<div class="form-group">
								<label>비밀번호 확인</label>
								<input type="password" class="form-control" name="checkpassword">
							</div>
							<div class="form-group">
								<label>생일</label>
								<input type="date" class="form-control" value="1999-01-05" name="birth" disabled>
							</div>
							<div class="form-group">
								<label>이메일</label>
								<input type="email" class="form-control" value="linda7567@naver.com" name="email">
							</div>
							<div class="form-group">
								<label>전화번호</label>
								<input type="text" class="form-control" name="phone" value="010-0000-0000">
							</div>
							<div>
								<label>주소</label>
							</div>
							<div class="input-group">
								<input type="text" id="user-postal-code" name="userpostalcode" id="addr1" readonly="readonly" class="form-control" style="width: 15%;" placeholder="우편번호" aria-describedby="basic-addon1">
								<a class="btn btn-default" onclick="execPostCode();" style="float: left;">우편번호 찾기</a>
								<input type="text" id="user-address" name="useraddress" id="addr2" class="form-control" placeholder="도로명주소" readonly="readonly" aria-describedby="basic-addon1">
								<input type="text" id="user-detail-address" name="userdetailaddress" id="addr3" class="form-control" placeholder="상세주소" aria-describedby="basic-addon1">
							</div>
							<br>
							<div class="form-group">
								<label>프로필사진</label>
								<input type="file" class="form-control" name="photofile">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-success btn-sm">변경사항 저장</button>
							</div>
						</form>
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
				$('[name=useraddress]').val(data.address);
				$('[name=userdetailaddress]').val(data.buildingName);
			}
		}).open();
	}
	</script>
</body>
</html>
