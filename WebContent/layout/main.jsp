<%@page import="data.dto.StarMapDto"%>
<%@page import="data.dao.StarMapDao"%>
<%@page import="data.dto.EventDto"%>
<%@page import="data.dao.EventDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>main page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
  
  
<style>
body{
font-family: 'Gothic A1', sans-serif;
}
h1,h2,h3 {
font-family: "Karma", sans-serif
}
h2{margin:50px 0 20px 33px;}
.carousel-container{
width: 50%;
}
.image-container{
width: 50%;
}
.carousel-inner img{
width: 100%;
height: 100%;
}

#image-container_bg{
position: relative;
width: 100%;
}

#image-container_title{
    height: 104px;
    left: 50%;
    margin-left: 50px;
    position: absolute;
    top: 210px;
    width: 440px;
    z-index: 4;
    color: #ffffff;
    font-family: "Karma", sans-serif

}

.fixed-btn {
    position: fixed;
    z-index: 49;
    right: 0;
    bottom: 0;
    overflow: hidden;
}
.fixed-btn #topbutton {
    width: 60px;
    height: 60px;
    background: url('./image/backtotop_icon.png') no-repeat center;
    background-size: cover;
    vertical-align: middle;
}
#topbutton span{
text-align: center;
}
</style>
<script type="text/javascript">

//공지사항 롤링 함수(안쓸수도 있음)

$("#gonji_roll").rolling(490,290,{autoscroll:1, delay:1500});


</script>


<body>
<!-- 메인 사진 -->
<div style="width:100%; margin:0 auto; display:flex;">
<!-- 사이트메인 좌측배너 -->
<div class="carousel-container">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
<ol class="carousel-indicators">
	<li data-taget="#myCarousel" data-slide-to="0" class="active"></li>
	<li data-taget="#myCarousel" data-slide-to="1" ></li>
	<li data-taget="#myCarousel" data-slide-to="2" ></li>
</ol>
<div class="carousel-inner">
  <div class="carousel-item active">
    <img src="./image/closeup-coffee-machine-wide.jpg" alt="cafe1">
  </div>
  <div class="carousel-item">
    <img src="./image/close-up-of-hands-barista-wide.jpg" alt="cafe2">

  </div>
  <div class="carousel-item">
    <img src="./image/people-coffee-shop-wide.jpg" alt="cafe3">
  </div>
</div>
  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
</div>
<!-- 사이트메인 우측배너 -->
<div class="image-container">
<div id="image-container_title">
<h1>Code your dream</h1>
<h2>with STARBOTTLE</h2>
</div>
<img class="image-container_bg" src="./image/coffee-5132832_1920.jpg" alt="cafe4" style="width: 100%;">
</div>
</div>

<!-- 사이트 메인 중앙 컨텐츠 -->
<div class= "tabb" style="width:100%; margin-top : 100px; display:flex; justify-content : center">
<div class=" w3-bar-block w3-light-grey " style="width:200px">
  <button class="w3-bar-item w3-button tablink" style ="height : 33%; text-align:center;" onclick="openMenu(event, 'Menu')">메뉴</button>
  <button class="w3-bar-item w3-button tablink" style ="height : 33%; text-align:center;" onclick="openMenu(event, 'Event')">이벤트</button>
  <button class="w3-bar-item w3-button tablink" style ="height : 33%; text-align:center;" onclick="openMenu(event, 'Shop')">매장</button>
</div>

<%
	//메뉴 dao 선언
	MenuDao medao = new MenuDao();
	List<MenuDto> list = medao.getRandomMenus();
	//event dao 선언
	EventDao edao = new EventDao();
	List<EventDto> liste = edao.getMainEvent();
	//매장 dto 선언
	StarMapDao smdao = new StarMapDao();
	List<StarMapDto> listsm = smdao.getRandomList();
	
%>
<div style="width:1200px;height : 450px;background-color : #eee;">
  <div id="Menu" class="w3-container tabs">
    <h2>스타보틀 메뉴</h2>
   	<div style ="display : flex;">
   	<%
	
		for(MenuDto medto : list){%>
		<div style ="width 270px;height 300px;margin-left: 33px;">
   		<img src ="menusave/<%=medto.getMenuphoto() %>" style ="width : 250px;height:250px;margin-bottom: 8px;">
   		<p><%=medto.getMenuname() %></p>
   		</div>
		 <%} %>
   	
   	</div>
  </div>

  <div id="Event" class="w3-container tabs" style="display:none">
    <h2>이벤트 안내</h2>
    <div style ="display : flex;">
    <%
	
		for(EventDto evdto : liste){%>
		<div style ="width 270px;height 300px; margin-left: 33px;">
   		<img src ="eventsave/<%=evdto.getEvlistimage() %>" style ="width : 250px;height:250px; margin-bottom: 8px;">
   		<p style ="width:250px"><%=evdto.getEvsubject() %></p>
   		</div>
		 <%} %>
	</div>
  </div>

  <div id="Shop" class="w3-container tabs" style="display:none">
    <h2>매장소개</h2>
    <div style ="display : flex;">
    <%
	
		for(StarMapDto smdto : listsm){%>
		<div style ="width 270px;height 300px;margin-left: 33px;">
   		<img src ="eventsave/<%=smdto.getShopphoto() %>" style ="width : 250px;height:250px; border-radius:125px;border : 1px solid black; margin-bottom: 8px;">
   		<p><%=smdto.getShopname() %></p>
   		</div>
		 <%} %>
    
    
    </div>
  </div>

</div>

</div>



<!-- 신메뉴 또는 베스트메뉴 -->

<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
  
  
  

  
  <!-- 매장위치 -->
  <div class="main_location"> 매장위치</div>

  <!-- Footer -->
  <footer class="footer">
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  </footer>

<!-- End page content -->
</div>
<!-- top button 작동안됨 -->
<div class="fixed-btn">
<button type="button" class="top" id="topbutton" onclick="scrollMov(0, 200);"><span>TOP</span></button>
</div>
<script>
function openMenu(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("tabs");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-red", ""); 
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}
</script>


</body>
</html>