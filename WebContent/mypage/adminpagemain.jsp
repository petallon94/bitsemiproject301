<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
 <style>
.my_page_menu {position: absolute; left: 20px; top: 700px; padding: 20px;}
.nav {display: flex; flex-direction: column;}
a {width: 200px;}
	
.my_page_content {width:100%;max-width:1200px;position : absolute;left:400px;border:2px solid #bfbfbf; margin-top:20px;}
.my_page_content img{max-width:100%;height :200px;}

/*submenu*/
.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300;}
.sub_visual .txt h1:after{display:block;width:40px;height:2px;margin:32px auto;background:#202020;content:'';}
.sub_visual .txt p{font-size:1.25rem;font-weight:300;}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);} 
</style> 
<script>

$(document).ready(function(){
    $("#mypage_tabs1").load("menu/menuadmin.jsp");
    $("#mypage_tabs2").load("menu/menuadmin.jsp");
    $("#mypage_tabs3").load("mypage/memberlist.jsp");
});
</script>

</head>
<%
	//프로젝트의 경로 구하기
	String url=request.getContextPath();	

%>
<body>
<div class="sub_visual bg-menu">
 	<div class="txt">
 		<h1>스타보틀</h1>
		<p>스타보틀에 오신것을 환영합니다.</p>
	</div>
</div>
<div class="admin_page_menu">
  <ul class="nav nav-tabs nav-justified">
  	<li><a href="#mypage_tabs1">메뉴관리</a></li>
    <li><a href="#mypage_tabs2">지점관리</a></li>
    <li><a href="#mypage_tabs3">회원관리</a></li>
  </ul>
</div>
<div class="admin_page_content">
<img src ="./image/welcom.jpg"><br>
<div id="mypage_tabs1"></div>
<div id="mypage_tabs2"></div>
<div id="mypage_tabs3"></div>

</div>
</body>
</html>


