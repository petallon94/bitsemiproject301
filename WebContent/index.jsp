<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap4 -->
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 반응형 -->
<!-- <style type="text/css"> 
@media all and (max-width: 320px) {
        body { background-color: red; }
        h1 { color: white; }
}
@media all and (min-width: 321px) and (max-width: 768px) {



        body { background-color: green; }
}
@media all and (min-width: 769px) {
        body { background-color: blue; }
        h1 { color: yellow; }
}
</style> -->


<title>스타보틀 STARBOTTLE</title>

<style type="text/css">
	html, body {
	width: 100%;
	margin:0;
	padding:0;
	}

	div.layout div.menu{
	display: flex;
	justify-content: center;
	font-size: 20px;
	text-align: center;
	font-family: 'Gothic A1', sans-serif;
	}
	
	div.layout div.login{
	display: flex;	
	font-size: 15px;
	justify-content: flex-end;
	font-family: 'Gothic A1', sans-serif;
	margin-right: 40px;
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
</div>
</body>

</html>