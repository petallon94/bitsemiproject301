<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>main page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<!-- 신메뉴 또는 베스트메뉴 -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  <h3>신메뉴</h3>
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
  
 <!--모든 메뉴-->
  <div class="w3-row-padding w3-padding-16 w3-center">
  <h3>모든메뉴</h3>
    <div class="w3-quarter">
      <img src="./image/1.jpg" alt="Popsicle" style="width:100%">
      <h3>All I Need Is a Popsicle</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./image/2.jpg" alt="Salmon" style="width:100%">
      <h3>Salmon For Your Skin</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./image/new2.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./image/new4.jpg" alt="Croissant" style="width:100%">
      <h3>Le French</h3>
      <p>Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
  
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