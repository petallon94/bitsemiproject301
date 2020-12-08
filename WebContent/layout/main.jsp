<%@page import="data.dto.GonjiDto"%>
<%@page import="data.dao.GonjiDao"%>
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
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!--   slick api -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
body{
font-family: 'Noto Sans KR', Arial, sans-serif;
}
h1,h2,h3 {
font-family: 'Noto Sans KR', Arial, sans-serif;
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
    font-family: 'Noto Sans KR', Arial, sans-serif;
}
#pageTop {
    overflow: hidden;
    position: fixed;
    z-index: 300;
    right: 31px;
    bottom: 0;
    width: 58px;
    height: 58px;
    border: 0;
    background: url('./image/backtotop_icon.png') no-repeat 50% 50%;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
    opacity: 0;
    transition: background .2s;
    background-size: cover;
    background-position: center;
}
.shop_div {
	overflow: hidden;
}
.shop_div img {
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
.shop_div:hover img {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2); 
    overflow: hidden;   
}
.promotion_slide {
width: 1200px;
}
#Menu, #Event, #Shop {
margin-top: 40px;
}

.slide_container{
width:1240px; 
height : 450px;
} 
.slide_title{
text-align: center;
}
.menuslide_box div a:hover{text-decoration: none; color: black;}
.menuslide_box div a p:hover{color: black;}
.eventslide_box div{margin-right: 30px;}
.eventslide_box div:last-child{margin-right: 0;}
.eventslide_box div a:hover{text-decoration: none; color: black;}
.eventslide_box div a p.desc_box{color: black; font-size: 14pt; font-weight: 300;}

a.gon_link{color: #333;}
a.gon_link:hover{text-decoration: none; color: #666;}
a.map_link{color: #333;}
a.map_link:hover{text-decoration: none; color: #666;}

</style>
<script>
$(function(){
		jQuery('.promotion_slide1 > div').slick({
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
					slidesToShow: 3,
					slidesToScroll: 3
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
		jQuery('.promotion_slide2 > div').slick({
			infinite: true,	
			arrows: false,
			autoplay: true,
			autoplaySpeed: 3000,
			speed: 2000,
			pauseOnHover : false,
			slidesToShow: 4,
			slidesToScroll: 4,
			responsive: [
				{
				  breakpoint: 1200,
				  settings: {
					slidesToShow: 3,
					slidesToScroll: 3
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
<div>
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

<%-- 공지사항 메인 출력 --%>
<%
   //공지 게시판 dao 선언
   GonjiDao gdao=new GonjiDao();
   //getNewList에서 목록 가져오기
   List<GonjiDto> glist=gdao.getNewList();
   //totalcount 값 구하기(+대신)
   int totalcount=gdao.getTotalCount();
%>
<div class="notice_gonji" style="width: 50%; height:50px; background-color: #f6c244; float: left;">
    <ul class="rolling list-group">
    <%
       for(GonjiDto gdto:glist)
       {%>
       <div class="gon_txt" style="font-size: 12pt; margin-left: 30%; line-height: 50px;">
        <strong style="margin-left: 40px;">공지사항</strong>&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
          <a href="index.jsp?main=gonji/content.jsp?num=<%=gdto.getGonnum()%>&pageNum=1&key=a" class="gon_link"
          style="font-weight: 400;"><%=gdto.getGonsubject()%><span style="float: right; margin-right: 20px;">&gt;</span>
          </a>
        </div>
       <%}
    %> 
   </ul>
</div>
<div class="notice_map" style="width: 50%; height:50px; background-color: #eee; float: left;">
	<div class="gon_txt" style="font-size: 12pt; line-height: 50px;">
        <strong style="margin-left: 40px;">매장찾기</strong>&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
          <a href="index.jsp?main=map/map.jsp" class="map_link"
          style="font-weight: 400;">스타보틀 매장이 어디있는지 궁금하세요?<span style="margin-left: 100px;">&gt;</span>
          </a>
        </div>
</div>

<!-- 사이트 메인 중앙 컨텐츠 -->
<div class= "tabb" style="width:100%; margin-top : 100px; display:flex; justify-content : center">

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


<div style="width:1200px; height : 100%; margin-top: 50px;">
	<div class="slide_container">
		<h1 class="slide_title" style="font-weight: 600;">스타보틀 인기메뉴</h1>
		<p style="text-align: center;">
			<a style="cursor :pointer; color: #888; font-weight: 300; font-size: 14pt;" onclick ="location.href='index.jsp?main=menu/menulist.jsp'">
				스타보틀만의 시그니처 메뉴를 만나보세요&nbsp;&gt;
			</a>
		<p>
	 	<div class="promotion_slide1 w3-container tabs" id="Menu" style="padding:0;">  			
			<div class="menuslide_box" >        
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
	   	</div>
   	</div>

   	<div class="event_container" style="width: 100%; height: 800px; text-align: center; margin-top: 160px;">

	   	<h1 class="event_title" style="font-weight: 600;">이벤트</h1>
	   	<p style="text-align: center; margin-bottom: 70px;">
		   	<a style="cursor :pointer; color: #888; font-weight: 300; font-size: 14pt;" onclick ="location.href='index.jsp?main=event/eventlist.jsp'">
					스타보틀의 다양한 이벤트가 진행중입니다&nbsp;&gt;
			</a>	
		</p>
	   	<div class="event_con" id="Event">  			
			<div class="eventslide_box" style="width: 1200px;" >        
					<%for(EventDto evdto : liste){%>	
					<div style="float: left;">
						<a href="index.jsp?main=event/eventcontent.jsp?eventnum=<%=evdto.getEventnum()%>" target="_self">
							<p class="photo">
								<img src="eventsave/<%=evdto.getEvlistimage() %>" style ="width : 380px; height:470px;" class="t_hidden m_hidden"/>									
							</p>
							<p class="desc_box">
								<span class="subject"><%=evdto.getEvsubject() %></span>									
							</p>
						</a>						
					</div>
					 <%} %>
			</div> 
	   	</div>	 

	</div>
	<div class="slide_container" style="width: 100%; height: 820px;">

	   	<h1 class="slide_title" style="font-weight: 600;">매장</h1>
		<p style="text-align: center;">
		   	<a style="cursor :pointer; color: #888; font-weight: 300; font-size: 14pt;" onclick ="location.href='index.jsp?main=map/map.jsp'">
				스타보틀 매장을 어디서나 만나보세요&nbsp;&gt;
			</a>	
		</p>	
	  <div id="Shop" class="w3-container tabs" style ="display : flex; justify-content : center; flex-flow:wrap;"> 
	   
	    <%	
			for(StarMapDto smdto : listsm){%>
			<div style ="margin: 40px;" class ="shopdetail" shopnum = "<%=smdto.getShopnum()%>">
			<div class ="shop_div" style ="width : 212px; height:212px; border-radius:125px;">
	   		<img src ="shopmapsave/<%=smdto.getShopphoto() %>"  style ="width : 212px;height:212px;">
	   		</div>
	

	   		<p style ="width : 212px; text-align:center; margin-top: 10px;"><%=smdto.getShopname() %></p>   		

	   		</div>
			 <%} %>   
	
		</div>
	</div>

</div>

 
  <!-- 매장위치 카카오맵
  <div class="main_location" id="main_location"> 매장위치</div>-->



<a href="#top" id="pageTop" class="on" style="opacity:1;">맨 위로 가기</a>

</div>
</div>

</body>
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
	
</script>

</html>