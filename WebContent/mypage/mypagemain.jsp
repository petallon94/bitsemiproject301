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
/* 
.mp_menu_list {width:100%;padding:0 10px;font-size:0;position:absolute;left :50px; margin-top:20px;}
.mp_menu_list li{width:20%;max-width:250px;height : 100px;padding:10px 0;border:1px solid #bfbfbf;margin-bottom:5px;font-size:1rem;color:#909090;background:#fff;}
.mp_menu_list li a{display:block; text-align :center;top : 50%; }

/*내용 나오는 곳*/
.my_page_menu {
		position: absolute;
		left: 20px;
		top: 500px;
		padding: 20px;
	}
.my_page_menu li{
		width: 200px;
		font-size: 17px;		
	}
.my_page_content {width:100%;max-width:1200px;position : absolute;left:400px;border:2px solid #bfbfbf; margin-top:20px;}
.my_page_content img{max-width:100%;height :200px;}

/*submenu*/
.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300;}
.sub_visual .txt p{font-size:1.25rem;font-weight:300;}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);} 
</style> 
</head>

<%
	//세션 로그인상태
	String loginok=(String)session.getAttribute("loginok");
	//세션에서 id 얻기
	String myid=(String)session.getAttribute("myid");
	//dao 선언
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	String name=dao.getName(myid);
%>

<body>
<div class="sub_visual bg-menu">
 	<div class="txt">
 		<h1>스타보틀</h1>
		<p>스타보틀에 오신것을 환영합니다.</p>
	</div>

  <ul class="my_page_menu nav flex-column nav-tabs">
    <li><a href="#">개인정보수정</a></li>
    <li><a href="#">주문내역</a></li>
    <li><a href="#">회원탈퇴</a></li>
  </ul>
</div>

<div class="my_page_content">
<img src ="./image/welcom.jpg"><br>
<a><%=name %>님 환영합니다!!!</a>
</div>
</body>
</html>



