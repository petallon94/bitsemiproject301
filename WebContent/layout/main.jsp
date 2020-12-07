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
<!--   slick api -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  
<!--   카카오 api -->
  <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services,clusterer,drawing"></script>
<style>
body{
font-family: 'Gothic A1', sans-serif;
}
h1,h2,h3 {
font-family: "Karma", sans-serif
}
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
.event_div {
	overflow: hidden;
}
.event_div img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
    overflow: hidden;
}
.event_div:hover img {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
    
}
.promotion_slide {
width: 1200px;
}
#Menu, #Event, #Shop {
margin-top: 60px;
}
#main_location{
width: 1000px; 
height: 500px;
margin: 200px 500px;
}
.plus{width: 25px;}
</style>
<script>
$(function(){
	
	$("div.eventdetail").click(function(e){
	  	  
	   	 e.preventDefault(); 
	   	 var eventnum = $(this).attr("eventnum");
	   	 location.href ="index.jsp?main=event/eventcontent.jsp?eventnum="+eventnum;
	   	  
	     });
		jQuery('.promotion_slide > div').slick({
			infinite: true,	
			arrows: false,
			autoplay: true,
			autoplaySpeed: 2000,
			speed: 1500,
			pauseOnHover : false,
			slidesToShow: 4,
			slidesToScroll: 2,
			responsive: [
				{
				  breakpoint: 1200,
				  settings: {
					slidesToShow: 2,
					slidesToScroll: 2
				  }
				},
				{
				  breakpoint: 768,
				  settings: {
					slidesToShow: 1,
					slidesToScroll: 1
				  }
				}
			]
		});	
});
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

<div class=" w3-bar-block w3-light-grey " style="width:100px">

  <button class="w3-bar-item w3-button tablink" style ="height : 33%; text-align:center; font-size: 14pt;" onclick="openMenu(event, 'Menu')">메뉴</button>
  <button class="w3-bar-item w3-button tablink" style ="height : 33%; text-align:center; font-size: 14pt;" onclick="openMenu(event, 'Event')">이벤트</button>
  <button class="w3-bar-item w3-button tablink" style ="height : 33%; text-align:center; font-size: 14pt;" onclick="openMenu(event, 'Shop')">매장</button>
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

<div style="width:1300px; height : 450px;background-color : #eee;">
 	<div class="promotion_slide w3-container tabs" id="Menu" style="width: 1200px; margin-right: 0; float: left;">  			
				<div class="slide_box">        
						<%for(MenuDto medto : list){%>
						<div>
							<a href="index.jsp?main=menu/menudetailpage.jsp?menunum=<%=medto.getMenunum()%>" target="_self" style="margin-left: 33px;">
								<p class="photo">
									<img src="menusave/<%=medto.getMenuphoto() %>" class="t_hidden m_hidden" style="width: 270px; height: 270px;"/>									
								</p>
								<p class="desc_box" style="width: 270px; height: 50px; font-size: 14pt;">
									<span class="subject"><%=medto.getMenuname() %></span>									
								</p>
							</a>						
						</div>
						 <%} %>
				</div> 
			<a style="cursor :pointer;" onclick ="location.href='index.jsp?main=menu/menulist.jsp'"><img src="image/plus.png" class="plus" style=""></a>		 	
   	</div>	 
  <div id="Event" class="w3-container tabs" style="display:none">
    <div style ="display : flex;justify-content : space-between;">
    <%
	
		for(EventDto evdto : liste){%>		
		<div style ="width 270px;height 300px;cursor:pointer;" class ="eventdetail" eventnum = "<%=evdto.getEventnum()%>">

   		<div class ="event_div">
   		<img src ="eventsave/<%=evdto.getEvlistimage() %>" style ="width : 250px;height:250px;margin-bottom: 8px;">
   		</div>
   		<p style ="width:250px; height: 50px; font-size: 14pt;"><%=evdto.getEvsubject() %></p>
   		</div>
		 <%} %>
	

		<a style="align-item:flex-end; cursor :pointer" onclick ="location.href='index.jsp?main=event/eventlist.jsp'"><img src="image/plus.png" class="plus"></a>

  </div>
  </div>

  <div id="Shop" class="w3-container tabs" style="display:none; margin-top: 80px;">
 
    <div style ="display : flex;">
    <%
	
		for(StarMapDto smdto : listsm){%>
		<div style ="width 270px;height 300px;margin-left: 33px;">
   		<img src ="eventsave/<%=smdto.getShopphoto() %>" style ="width : 250px;height:250px; border-radius:125px;border : 1px solid black;margin-bottom: 8px;">
   		<p style ="width:250px; height: 50px;font-size: 14pt;"><%=smdto.getShopname() %></p>
   		</div>

		 <%} %>    
		<a style="align-item:flex-end; cursor :pointer" onclick ="location.href='index.jsp?main=event/eventlist.jsp'"><img src="image/plus.png" class="plus"></a>
    </div>
  </div>
</div>
</div>


 
  <!-- 매장위치 -->
  <div class="main_location" id="main_location"> 매장위치</div>


<!-- End page content -->
</div>
<!-- top button 작동안됨 -->
<div class="fixed-btn">
<button type="button" class="top" id="topbutton" onclick="scrollMov(0, 200);"><span>TOP</span></button>
</div>
<script type="text/javascript">
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
	
var container = document.getElementById('main_location');
var options = {
	center: new kakao.maps.LatLng(33.450701, 126.570667),
	level: 3
};
var map = new kakao.maps.Map(container, options);
	
	
</script>

</body>
</html>