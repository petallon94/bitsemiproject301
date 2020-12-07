<%@page import="data.dto.StarMapDto"%>
<%@page import="data.dao.StarMapDao"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dto.EventDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.EventDao"%>
<%@page import="data.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--  slick CSS -->
<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
<!-- slick JS -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<title>Insert title here</title>
<style type="text/css">


/* promotion_slide */
.promotion_slide{
	position: relative;
	top: 0;
	left: 0;
	margin:0 -15px 100px;
}
.promotion_slide .slick-slide{width:380px; margin: 0 15px}
.promotion_slide a{
	display:block;
	overflow:hidden;
}
.promotion_slide .photo{
	overflow: hidden;
	width: 380px;
	margin-bottom:25px;
}
.promotion_slide .desc_box{
	overflow: hidden;
	width:300px;
	height:90px;
	padding:0 40px;
	text-align:center;
}
.promotion_slide .desc_box .subject{
	display:block;
	margin-bottom:15px;
	font-family: 'Archer-Semibold', 'NanumBarunGothic';
	font-size: 18px;
	color:rgb(207,102,26);
	line-height:18px;
}
.promotion_slide .desc_box .context{
	display:block;
	font-family: 'NanumBarunGothic';
	font-size:13px;
	color:rgb(51,51,51);
	line-height:20px;
}

	.promotion_slide .slick-slide{width: auto}  
	.product_slide .photo,
	.promotion_slide .photo{width: 100%;}
	.promotion_slide .desc_box{width: auto; padding: 0 20px}
		.promotion_slide{margin:0 0 80px}
	.promotion_slide .photo{margin-bottom: 5px;}
	.promotion_slide .slick-slide{margin: 0}  
	.promotion_slide .desc_box{
		width: auto;
		height: auto;
		padding: 0;
	}
	.promotion_slide .desc_box .context{
		display:block;
		font-size:13px;
		line-height: 18px;
	}

/* .carousel-item img {
 width:400px; height: 200px;
}

/* 지도Slider */
/* .slick-slider{
	position: relative;
	display: block; 
	-moz-box-sizing: border-box;
     box-sizing: border-box;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
     user-select: none;
    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
     touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.slick-list{position: relative; display: block; overflow: hidden; margin: 0; padding: 0;}
.slick-list:focus{outline: none;}
.slick-list.dragging{cursor: pointer; cursor: hand;}
.slick-slider .slick-track, .slick-slider .slick-list{
    -webkit-transform: translate3d(0, 0, 0);
     -moz-transform: translate3d(0, 0, 0);
     -ms-transform: translate3d(0, 0, 0);
      -o-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
}
.slick-track{position: relative; top: 0; left: 0; display: block;}
.slick-track:before, .slick-track:after{display: table; content: '';}
.slick-track:after{clear: both;}
.slick-loading .slick-track{visibility: hidden;}
.slick-slide{display: none; float: left; height: 100%; min-height: 1px;}
[dir='rtl'] .slick-slide{float: right;}
.slick-slide img{display: block;}
.slick-slide.slick-loading img{display: none;}
.slick-slide.dragging img{pointer-events: none;}
.slick-initialized .slick-slide{display: block;}
.slick-loading .slick-slide{visibility: hidden;}
.slick-vertical .slick-slide{display: block; height: auto; border: 1px solid transparent;}
.slick-arrow.slick-hidden {display: none;}
 */
</style>
<script type="text/javascript">

//공지사항 롤링 함수(안쓸수도 있음)

//$("#gonji_roll").rolling(490,290,{autoscroll:1, delay:1500});

$(document).function() {

/* 
	$('.slide_content').slick({
		infinite: true,
		dots: false,
		arrows: true,
		fade: true,
		autoplay: true,
		autoplaySpeed: 4000,
		pauseOnHover : false,
		slidesToShow: 1
	});
	
	$('.slide_content3').slick({
		infinite: true,
		dots: false,
		arrows: true,
				fade: true,
			autoplay: true,
				autoplaySpeed: 3000,
				pauseOnHover : false,
				slidesToShow: 1
			});

	$('.slide_content2').slick({
	  slidesToShow: 4,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 2000,
	});
	 */
	//function promotionSlide() {
		/*jQuery('.promotion_slide > div')
			.on('init', function(e,slick){
				if (ssq(".promotion_slide .slick-dots").size()>0) ssq(".promotion_slide > #btnControls2").css("display","inline");
				else ssq(".promotion_slide > #btnControls2").css("display","none");
		})
			.on('breakpoint', function(e,slick,breakpoint){
				if (ssq(".promotion_slide .slick-dots").size()>0) ssq(".promotion_slide > #btnControls2").css("display","inline");
				else ssq(".promotion_slide > #btnControls2").css("display","none");
		});*/
		jQuery('.promotion_slide > div').slick({
			infinite: true,
			dots: true,
			arrows: false,
			autoplay: true,
			autoplaySpeed: 4000,
			speed: 3000,
			pauseOnHover : false,
			slidesToShow: 3,
			slidesToScroll: 3,
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
		}).slick("slickPause");
		setTimeout(function(){
			jQuery('.promotion_slide > div').slick("slickPlay");
		},2000);
		var slideListener = function(e) {
			if (ssq(".promotion_slide .slick-dots").size()>0) ssq("#btnControls2").css("display","inline");
			else ssq("#btnControls2").css("display","none");
			setTimeout(function(){
				if (ssq(".promotion_slide .slick-dots").size()>0) ssq("#btnControls2").css("display","inline");
				else ssq("#btnControls2").css("display","none");
			},100);
		};
		jQuery(window).resize(slideListener); slideListener(null);
		jQuery('#btnControls2').on('click', function(){
			var controlsBtn = jQuery(this);
			if (controlsBtn.hasClass('paused')){
				jQuery('.promotion_slide > div').slick('slickPlay');
				controlsBtn.removeClass('paused');
				controlsBtn.addClass('play');
			} else {
				jQuery('.promotion_slide > div').slick('slickPause');
				controlsBtn.removeClass('play');
				controlsBtn.addClass('paused');
			}
		});
	}
	
/* 	function storeSlide() {
		jQuery('.store_slide > div')
			.on('init', function(e,slick){
				if (ssq(".slick-dots").size()>0) ssq("#btnControls1").css("display","inline");
				else ssq("#btnControls1").css("display","none");
		})
			.on('breakpoint', function(e,slick,breakpoint){
				if (ssq(".slick-dots").size()>0) ssq("#btnControls1").css("display","inline");
				else ssq("#btnControl1").css("display","none");
		});
		jQuery('.store_slide > div').slick({
			infinite: true,
			dots: true,
			arrows: false,
			autoplay: true,
			autoplaySpeed: 4000,
			pauseOnHover : false,
			slidesToShow: 3,
			slidesToScroll: 3,
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
		jQuery('#btnControls1').on('click', function(e){
			var controlsBtn = jQuery(this);
			if (controlsBtn.hasClass('paused')){
				jQuery('.store_slide > div').slick('slickPlay');
				controlsBtn.removeClass('paused');
				controlsBtn.addClass('play');
			} else {
				jQuery('.store_slide > div').slick('slickPause');
				controlsBtn.removeClass('play');
				controlsBtn.addClass('paused');
			}
		});
	} */
	
}
</script></head>


<body>
<%-- 
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

  <div class="slide_content" style ="display : flex;justify-content : space-between;">
    <div class="carousel-item active">
    <img src="./image/closeup-coffee-machine-wide.jpg" alt="cafe1">
  </div>
  <div class="carousel-item">
    <img src="./image/close-up-of-hands-barista-wide.jpg" alt="cafe2">

  </div>
  <div class="carousel-item">
    <img src="./image/people-coffee-shop-wide.jpg" alt="cafe3">
  </div>
  <div class="carousel-item">
  <img class="image-container_bg" src="./image/coffee-5132832_1920.jpg" alt="cafe4">

    </div>
    </div>
</div>
   	
   	</div>
  </div>

  <div id="Event" class="w3-container tabs" style="display:none">
   
    <div class="slide_content2" style ="display : flex;justify-content : space-between;">
    <%
	
		for(EventDto evdto : liste){%>
		<div style ="width 270px;height 300px;">
   		<img src ="eventsave/<%=evdto.getEvlistimage() %>" style ="width : 250px;height:250px;">
   		<p style ="width:250px"><%=evdto.getEvsubject() %></p>
   		</div>
		 <%} %>
	</div>
  </div>

  <div id="Shop" class="w3-container tabs" style="display:none">
    
    <div class="slide_content3" style ="display : flex;justify-content : space-between;">
    <%
	
		for(StarMapDto smdto : listsm){%>
		<div style ="width 270px;height 300px;">
   		<img src ="eventsave/<%=smdto.getShopphoto() %>" style ="width : 250px;height:250px; border-radius:125px;border : 1px solid black">
   		<p><%=smdto.getShopname() %></p>
   		</div>
		 <%} %>
    
    
    </div>
  </div> --%>

<h2 class="main_title">What's new</h2>
				<div class="promotion_slide">
					<div class="slide_box">
        
						<div>
							<a href="/news/view.asp?seq=234&page=1&category=1&viewMode=1" target="_self">
								<p class="photo">
									<img src="image/new1.jpg" alt="2020 12 Happy Holidays To You" class="t_hidden m_hidden"/>
									
								</p>
								<p class="desc_box">
									<span class="subject">2020 12 Happy Holidays To You</span>
									<span class="context"></span>
								</p>
							</a>
						</div>
        
						<div>
							<a href="/news/view.asp?seq=233&page=1&category=1&viewMode=1" target="_self">
								<p class="photo">
									<img src="image/new2.jpg" alt="2020 11 Mexican Bulgogi Brrito" class="t_hidden m_hidden"/>
								</p>
								<p class="desc_box">
									<span class="subject">2020 11 Mexican Bulgogi Brrito</span>
									<span class="context"></span>
								</p>
							</a>
						</div>
        
						<div>
							<a href="/news/view.asp?seq=232&page=1&category=1&viewMode=1" target="_self">
								<p class="photo">
									<img src="image/new3.jpg"" alt="2020 11 Holiday MD" class="t_hidden m_hidden"/>
								</p>
								<p class="desc_box">
									<span class="subject">2020 11 Holiday MD</span>
									<span class="context"></span>
								</p>
							</a>
						</div>
        
						<div>
							<a href="/news/view.asp?seq=231&page=1&category=1&viewMode=1" target="_self">
								<p class="photo">
									<img src=""image/new4.jpg"" alt="2020 11 Kahlua Espresso Martini" class="t_hidden m_hidden"/>
							</p>
								<p class="desc_box">
									<span class="subject">2020 11 Kahlua Espresso Martini</span>
									<span class="context"></span>
								</p>
							</a>
						</div>
        
						<div>
							<a href="/news/view.asp?seq=230&page=1&category=1&viewMode=1" target="_self">
								<p class="photo">
									<img src="image/1.jpg"" alt="2020 11 Cookie Butter Drinks" class="t_hidden m_hidden"/>
								</p>
								<p class="desc_box">
									<span class="subject">2020 11 Cookie Butter Drinks</span>
									<span class="context"></span>
								</p>
							</a>
						</div>
        
						<div>
							<a href="/news/view.asp?seq=229&page=1&category=1&viewMode=1" target="_self">
								<p class="photo">
									<img src="image/2.jpg"" alt="2020 11 Baton Sucre with Almond Chocolate" class="t_hidden m_hidden"/>
								</p>
								<p class="desc_box">
									<span class="subject">2020 11 Baton Sucre with Almond Chocolate</span>
									<span class="context"></span>
								</p>
							</a>
						</div>
        

					
					</div>
					<button id="btnControls2" class="btn_controls play" >pause/play</button>
				</div>
				<!-- //promotion_slide -->


</body>
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
</html>