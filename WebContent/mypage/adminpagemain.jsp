<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
<title>Insert title here</title>
 <style>
.admin_page_menu {display:flex; left: 20px; padding: 20px;float: left;}
.nav {display: flex; flex-direction: column; font-family: 'Noto Sans KR', Arial, sans-serif;}
.nav-link {width: 200px; cursor:pointer; color:#00979f;}
	
.admin_page_content {display:flex; width:1200px; height: 100%; margin-top: 20px; float: left; margin-left: 100px; font-family: 'Noto Sans KR', Arial, sans-serif;}
.admin_page_content img{max-width:100%;height :200px;}

/*submenu*/
.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative; margin-bottom: 30px;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300; font-family: 'Noto Sans KR', sans-serif;}
.sub_visual .txt h1:after{display:block;width:40px;height:2px;margin:32px auto;background:#202020;content:'';}
.sub_visual .txt p{font-size:1.25rem;font-weight:300;font-family: 'Noto Sans KR', sans-serif;}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);} 

</style> 
<script>
$(function() {
	$(".admin_page_content").load("menu/menuadmin.jsp");	
		
	$("#admin_nav-item1").click(function() {
		$(".admin_page_content").load("menu/menuadmin.jsp");		 
		return false;
	});
	
	$("#admin_nav-item2").click(function() {
		$(".admin_page_content").load("mypage/adminmappage.jsp");		 
		return false;
	});
	$("#admin_nav-item3").click(function() {
		$(".admin_page_content").load("mypage/memberlist.jsp");		 
		return false;
	});
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
  <ul class="nav nav-tabs nav-justified" role="tablist">
  	<li id="admin_nav-item1"><a class="nav-link">메뉴관리</a></li>
    <li id="admin_nav-item2"><a class="nav-link">지점관리</a></li>
    <li id="admin_nav-item3"><a class="nav-link">회원관리</a></li>
  </ul>
</div>
<div class="admin_page_content">
</div>
</body>
</html>


