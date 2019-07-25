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
	 .img-rounded {width: 150px; height: 150px;}
	 .header {margin: 30px;}
	 .btn-success {margin: 30px;}
	 .form-group {width: 750px;}
	 .input-group {width: 750px; margin: 10px; margin-left: 0; margin-top: 0;}
	 .shadow {padding:0; box-shadow: 1px 1px 1px 1px #999;}
  	 .submit {margin: 0 auto 15px;}
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
		  		<form method="post" action="#" enctype="multipart/form-data">
					<div class="form-group">
						<label>이름</label> 
						<input type="text" class="form-control" name="name" placeholder="이름을 입력하세요">
					</div>
					<div class="form-group">
						<label>성별</label> 
						<div>
							<label class="radio-inline">
							  <input type="radio" name="gender"  checked="checked"> 남자
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender"> 여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>생일</label> 
						<input type="date" class="form-control" name="birth">
					</div>
					<div class="form-group">
						<label>이메일</label> 
						<input type="email" class="form-control" name="email">
					</div>
					<div class="form-group">
						<label>전화번호</label> 
						<input type="text" class="form-control" name="phone" placeholder="전화번호를 입력하세요">
					</div>
					<div>
						<label>주소</label>
					</div>
					<div class="input-group">
				    	<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-home"></i></span>
					    <input type="text" name="userpostalcode" readonly="readonly" class="form-control" style="width: 15%;" placeholder="우편번호" aria-describedby="basic-addon1">
					    <button type="button" class="btn btn-default" onclick="execPostCode();">우편번호 찾기</button>
					    <input type="text" name="useraddress" class="form-control" placeholder="도로명주소" readonly="readonly" aria-describedby="basic-addon1">
					    <input type="text" name="userdetailaddress" class="form-control" placeholder="상세주소" aria-describedby="basic-addon1">
				    </div>					
					<div class="form-group">
						<label>편입여부</label> 
						<div>
							<label class="radio-inline"> <input type="radio" name="tranfer" "> N </label>
							<label class="radio-inline"> <input type="radio" name="tranfer checked="checked"> Y</label>
						</div>
					</div>
					<div class="form-group">
						<label>학년</label> 
							<select class="form-control" name="grade">
							  <option>1</option>
							  <option>2</option>
							  <option>3</option>
							  <option>4</option>
							</select>
					</div>	
					<div class="form-group">
						<label>프로필사진</label> <input type="file" class="form-control" name="photofile">
			 		</div>
					<div class="form-group submit">
						<button type="submit" class="btn btn-success btn-lg">학생등록</button>
					</div>
				</form>
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