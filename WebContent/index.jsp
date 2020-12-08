<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<!-- bootstrap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="image/sb_symbol.jpg">
<title>스타보틀 STARBOTTLE</title>

<style type="text/css">
	html, body {
	width: 100%;
	margin:0;
	padding:0;
	}
	
	div.layout div.main{
	font-family: 'Noto Sans KR', Arial, sans-serif;
	}
	
	div.layout div.menu{
	display: flex;
	justify-content: center;
	font-size: 20px;
	text-align: center;
	font-family: 'Noto Sans KR', Arial, sans-serif;
	}
	
	div.layout div.login{
	display: flex;	
	font-size: 15px;
	justify-content: flex-end;
	font-family: 'Noto Sans KR', Arial, sans-serif;
	margin-right: 40px;
	}
	div.layout div.footer{
	display:flex;
	width: 100%;
	height:210px;
	font-family: 'Noto Sans KR', Arial, sans-serif;
	left: 0;
	bottom: 0;
	margin-top: 60px;
	}
</style>
</head>
<%
	//메인페이지에 들어갈 파일 읽기
	String mainPage="layout/main.jsp";
	if(request.getParameter("main")!=null){
		mainPage=request.getParameter("main");
	}else{%>
	<script type="text/javascript">
		localStorage.menu="menu3";
	</script>
	<%}
//include는 앞에 url이 들어가면 안된다. 
%>

<body>
<div class="layout">
	<div class="login">
		<jsp:include page="layout/loginmenu.jsp"/>
	</div>	
	<div class="menu">
		<jsp:include page="layout/menu.jsp"/>
	</div>
	<div class="main">
		<jsp:include page="<%=mainPage%>"/>
	</div>
 	<div class="footer">
		<jsp:include page="layout/footer.jsp"/>
	</div>
</div>
</body>

</html>