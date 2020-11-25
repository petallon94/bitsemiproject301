<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Karma&family=Open+Sans:ital@1&family=Yeon+Sung&display=swap" rel="stylesheet">

<title>Insert title here</title>
<style type="text/css">
	html, body {
	width: 100%;
	margin:0;
	padding:0;
	}
	
	body {
		font-family: 'Karma';	
	}
	a{
		color:black;
		text-decoration: none;
		font-family: 'Karma';		
	}

	div.layout div.menu{
		display: flex;
		justify-content: center;
		font-size: 20px;
		text-align: center;
		top: 100px;
	}
	
	div.layout div.login{
	display: flex;
	justify-content: flex-end;
	}
	
</style>
</head>
<%
	//메인페이지에 들어갈 파일 읽기
	String mainPage="layout/main.jsp";

%>

<body>
<div class="layout">
	<div class="login">
		<jsp:include page="login/loginmain.jsp"/>
	</div>
	<div class="menu">
		<jsp:include page="layout/menu.jsp"/>
	</div>
	<div class="main">
		<jsp:include page="<%=mainPage%>"/>
	</div>
</div>
</body>
</html>