<%@page import="data.dto.MemberDto"%>
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
 <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
  <title>Insert title here</title>
 <style>
.my_page_menu {position: absolute; left: 20px; top: 700px; padding: 20px;}
.nav {display: flex; flex-direction: column;}
a {width: 200px;}
	
.my_page_content {width:100%; position : absolute;left:400px; margin-top:20px;}
.my_page_content img{max-width:100%;height :200px;}

/*submenu*/
.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300;}
.sub_visual .txt h1:after{display:block;width:40px;height:2px;margin:32px auto;background:#202020;content:'';}
.sub_visual .txt p{font-size:1.25rem;font-weight:300;}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);} 

.card_title > h3 {
    margin: 50px 0px;
    font-family: 'Montserrat', sans-serif;
    font-size: 2.667em;
    color: rgb(63,18,20);
</style> 
</head>

<%
	//세션 로그인상태
	String loginok=(String)session.getAttribute("loginok");

	//세션에서 id 얻기
	String id=(String)session.getAttribute("myid");
	//dao 선언
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);

%>

<body>
<%
if(loginok==null)
{%>
	<script type="text/javascript">
		alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
		history.back();
	</script>
<%}else{
%>
<div class="sub_visual bg-menu">
 	<div class="txt">
 		<h1>스타보틀</h1>
		<p>스타보틀에 오신것을 환영합니다.</p>
	</div>
</div>
<div class="my_page_menu">
  <ul class="nav nav-tabs nav-justified" role="tablist">
  	<li id="mypage_nav-item1"><a class="nav-link">개인정보수정</a></li>
    <li id="mypage_nav-item2"><a class="nav-link" >주문내역</a></li>
    <li id="mypage_nav-item3"><a class="nav-link">회원탈퇴</a></li>
  </ul>
</div>
<div class="my_page_content">
<div id="mypage_main">
<div class="card_title">
<h3> WELCOME TO STARBOTTLE </h3>
<a><%=name %>님 환영합니다!!!</a></div><br><br>
<button class="btn btn-outline-warning" id="show_card">나의 스타보틀카드보기</button><br>
<div class="card" style="width:400px; height:250px; margin:30px;">
<img src="./image/card.png">
<div>바코드</div></div>
</div></div>
<%} %>
</body>
<script>
	

	$("#mypage_nav-item1").click(function() {
		$(".my_page_content").load("mypage/mypageupdateform.jsp");		 
		return false;
	});
	
	$("#mypage_nav-item2").click(function() {
		$(".my_page_content").load("order/orderlist.jsp");		 
		return false;
	});
	$("#mypage_nav-item3").click(function() {
		$(".my_page_content").load("mypage/mypagedeleteform.jsp");		 
		return false;
	});
	
	$("#show_card").click(function() {
		$(".card").toggle();
	});

</script>
</html>



