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
  
  
  
<style>
body{
font-family: 'Gothic A1', sans-serif;
}
h1,h2,h3 {
font-family: "Karma", sans-serif
}
h2{
margin-bottom: 20px;
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

/*공지 & 이벤트 게시판 */

.list_gonji{ display:inline-block; width : 50%;height : 70px; background-color :black;color : white;font-size:30px;}
.gonji_roll{display:inline-block;;}
.list_event{ width : 50%;height : 70px; background-color :white;color : black;font-size:30px;}

/*rolling bul */

.ticker { height: 30px; overflow: hidden; margin: 0; padding: 0; list-style: none; } 
.ticker li { height: 30px; padding: 5px; margin: 0px 5px; }



.drink_intro{display:flex;width:100%; background-color:#99C4F7; margin:0 auto; height : 400px;}
.snack_intro{display:flex;width:100%; background-color:#9E5E4A;margin:0 auto;height : 400px;}
.shop_intro{display:flex;width:100%; background-color:#1867C4;margin:0 auto; height : 500px;}



.hello-again{position:relative;margin-bottom:80px;background:#f2f2f2}
.hello-again:before{content:'';display:block;position:absolute;left:0;bottom:0;width:1280px;height:610px;background:#e8eaf0;}
.hello-again:after{content:'';display:block;position:absolute;right:0;bottom:0;width:1280px;height:436px;background:#e8eaf0;z-index:0;}
.hello-again .static{position: relative;height:1530px;z-index:1;}
.hello-again h3{position:absolute;top:0;left:0;width:600px;height:242px;}
.hello-again .ha-bx1{position:absolute;width:600px;height:476px;top:242px;left:0}
.hello-again .ha-bx1 a{display:block;width:300px}
.hello-again .ha-bx1 .tit-ar{position: absolute;top:0;left:0;width:300px;height:476px;background:#fff;text-align: center;}
.hello-again .ha-bx1 .tit-ar img{margin-top:109px}
.hello-again .ha-bx1 .tit-ar p{padding-top:29px;text-align:center;font-size:14px;color:#3a476a;line-height:1.43;}
.hello-again .ha-bx1 .pho-ar{position: absolute;top:0;right:0;width:300px;height:476px;}
.hello-again .mov-ar{position: absolute;top:0;right:0}
.hello-again .mov-ar img{width:590px;height:618px}
.hello-again .mov-ar .btn-play{position: absolute;top:50%;left:50%;width:108px;height:108px;margin:-54px 0 0 -54px;background:url(../../images/ico-play.png) no-repeat 50% 50%;font-size:0}
.hello-again .pho-ar2{position: absolute;left:0;bottom:0;width:600px;height:812px}
.hello-again .pho-ar2 img{width:100%;height:812px}
.hello-again .pho-ar3{position: absolute;top:618px;left:600px;width:330px;height:710px;}
.hello-again .pho-ar3 img{width:331px;height:710px}
.hello-again .pho-ar3-txt{position: absolute;bottom:85px;left:38px;}
.hello-again .pho-ar3-txt h4{margin-bottom:28px;font-size:26px;line-height:32px;color:#3a476a;font-weight:700;}
.hello-again .pho-ar3-txt .tx1{margin-bottom:20px;font-size:14px;color:#454545;line-height:1.14;}
.hello-again .pho-ar3-txt .tx2{margin-bottom:30px;font-size:14px;color:#979797;line-height:1.43;font-weight:300}
.hello-again .pho-ar4{position: absolute;top:618px;right:0;width:260px;height:476px}
.hello-again .pho-ar4 img{width:100%;height:476px}
.hello-again .pho-ar5{position: absolute;bottom:136px;right:0;width:260px;height:300px}
.hello-again .ha-shop{position: absolute;bottom:0;right:0;width:260px;height:436px;background:#838dab}
.hello-again .ha-news{position: absolute;right:260px;bottom:0;width:404px;height:202px;background:#d5bbb4;}
.hello-again .ha-event{position: absolute;left:123px;bottom:0;width:404px;height:202px;background:#d2c7c3;}
.hello-again .ha-news h4, .hello-again .ha-event h4,.hello-again .ha-shop h4{position:absolute;font-size:20px;font-family:'Roboto';font-weight: 700;color:#fff;letter-spacing:0;}
.hello-again .ha-news h4, .hello-again .ha-event h4{top:58px;left:40px;}
.hello-again .ha-news .btn-plus, .hello-again .ha-event .btn-plus{position: absolute;left:40px;bottom:69px}
.hello-again .ha-news img, .hello-again .ha-event img{position: absolute;top:0;right:0}
.hello-again .ha-shop h4{bottom:80px;left:40px;}
.hello-again .ha-shop .btn-plus{position: absolute;left:40px;bottom:31px}




</style>
<script type="text/javascript">

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




<div style="width:100%; margin:0 auto; display:flex;">
<div class= "list_gonji">
<a>공지사항</a>
			<div class = "gonji_roll" id ="gonji_roll">
				<ul id="ticker" class="ticker">
					<li><a href="#">111</li>
					<li><a href="#">222</li>
					<li><a href="#">333</li>
					<li><a href="#">444</li>
				</ul>
			</div>
		</div>
<div class= "list_event">
<a>스타보틀 이벤트 게시판 확인해보자</a>
</div>
</div>


<div class ="drink_intro"></div>
<div class ="snack_intro"></div>
<div class ="shop_intro"></div>




<!-- 신메뉴 또는 베스트메뉴 -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  <h2>신메뉴</h2>
    <div class="w3-quarter">
      <img src="./image/new1.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real NYC Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./image/new3.jpg" alt="Steak" style="width:100%">
      <h3>Let Me Tell You About This Steak</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./image/new4.jpg" alt="Cherries" style="width:100%">
      <h3>Cherries, interrupted</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
      <p>What else?</p>
    </div>
    <div class="w3-quarter">
      <img src="./image/new2.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>
  
  
  <section class="hello-again">
			<div class="static">
								<h3><img src="/uploads/sbanner/20200623430813.jpg" alt="배너1"></h3>
								<div class="ha-bx1">
										<a href="/caffebene/brand.html" target="_self" class="tit-ar">						<img src="/uploads/sbanner/20200623865131.gif" alt="배너2">
						<p>'좋은’ 사람들이<br>
							‘좋은’ 원두로 <br>
							‘좋은’ 커피를 내리는 곳<br>
							 바로 카페베네입니다.</p>
					</a>															<a href="/caffebene/benecat.html" target="_self" class="pho-ar"><img src="/uploads/sbanner/20200623383159.jpg" alt="배너3"></a>									</div>
								<div class="mov-ar">
					<!-- 이미지 이거나 동영상 -->
										<img src="/uploads/sbanner/20200623802367.gif" alt="배너5">									</div>
				
								<div class="pho-ar2">
					<a href="/contents/content_view.html?seq=1" target="_self"><img src="/uploads/sbanner/20200623927998.png" alt="배너4"></a>				</div>
												<div class="pho-ar3">
					<a href="http://www.caffebene.co.kr/contents/content_view.html?seq=78" target="_self"><img src="/uploads/sbanner/20201117133013.png" alt="배너6"></a>				</div>
												<div class="pho-ar4">
					<img src="/uploads/sbanner/20200623873281.jpg" alt="배너7">				</div>
								<a href="https://smartstore.naver.com/caffebeneonline?NaPm=" target="_blank" class="ha-shop">
					<img src="http://caffebene.com/images/pho-ar5.jpg" alt="BENE Shop">
					<h4>BENE Shop</h4>
					<span class="btn-plus white">BENE Shop 더보기</span>
				</a>
				<a href="http://caffebene.com/caffebene/news_list.html" class="ha-news">
					<h4>News</h4>
					<span class="btn-plus white">News 더보기</span>
					<img src="http://caffebene.com/images/ha-news.jpg" alt="News">
				</a>
				<a href="http://caffebene.com/contents/content_list.html?code=013005" class="ha-event">
					<h4>Event</h4>
					<span class="btn-plus white">Event 더보기</span>
					<img src="http://caffebene.com/images/ha-event.jpg" alt="Event">
				</a>
			</div>
		</section>
  
  
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
</body>
</html>