<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

</body>
<div class="alert alert-info" style="width: 600px; height: 200px; text-align: center; vertical-align: middle; padding-top: 20px;">
	<form action="deletemapaction.jsp" method="post">
		<b>삭제할 매장명을 입력해주세요</b><br><br>
		<input type="text" name="shopname" class="shopname form-control" style="width: 200px; margin-left: 177px;" required="required" autofocus="autofocus">
		
		<button style="margin-left: 320px; margin-top: -66px;" type="submit" class="btn btn-danger">매장삭제</button>
	</form>
</div>
</html>