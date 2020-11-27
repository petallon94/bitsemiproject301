<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<title>메뉴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: 'Noto Sans KR', sans-serif;}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
<body>

<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b>LOGO</b></h3>
  <button type="button" class="btn btn-outline-primary">Primary</button>
  <button type="button" class="btn btn-outline-secondary">Secondary</button>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="#" class="w3-bar-item w3-button">신메뉴</a>
    <a href="#" class="w3-bar-item w3-button">커피</a>
    <a href="#" class="w3-bar-item w3-button">음료</a>
    <a href="#" class="w3-bar-item w3-button">음료</a>
    <a href="#" class="w3-bar-item w3-button">디저트</a>
  </div>
  <a href="#footer" class="w3-bar-item w3-button w3-padding">메뉴추가</a> 
  
</nav>
  
  
  
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

	<h3>음료음료</h3>

	<hr id="about">

  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/4216/0031/5179/98b8b2b03acdcd60b542b792567bbe7b.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich,</h3>
      <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Steak" style="width:100%">
      <h3>Let Me Tell </h3>
       <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/8014/6202/2876/dr1411_01.jpg" alt="Cherries" style="width:100%">
      <h3>Cherries, interrupted</h3>
       <p></p>
      
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/1616/0031/5163/2N2A8230.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>Once Again, R</h3>
       <p></p>
    </div>
  </div>
  
  <!-- third Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Popsicle" style="width:100%">
      <h3>All I Need Is a Popsicle</h3>
      <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Salmon" style="width:100%">
      <h3>Salmon For Your Skin</h3>
      <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect =</h3>
       <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Croissant" style="width:100%">
      <h3>Le French</h3>
       <p></p>
    </div>
  </div>
  
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Popsicle" style="width:100%">
      <h3>All I Need </h3>
       <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Salmon" style="width:100%">
      <h3>Salmon </h3>
       <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect </h3>
       <p></p>
    </div>
    <div class="w3-quarter">
      <img src="https://saint-marc-cafe.s3.amazonaws.com/5016/0031/5173/2N2A8553.jpg" alt="Croissant" style="width:100%">
      <h3>Le French</h3>
       <p></p>
    </div>
  </div>

<!-- End page content -->
</div>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
function myAccFunc() {
	  var x = document.getElementById("demoAcc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}

	// Click on the "Jeans" link on page load to open the accordion for demo purposes
	document.getElementById("myBtn").click();


	// Open and close sidebar
	function w3_open() {
	  document.getElementById("mySidebar").style.display = "block";
	  document.getElementById("myOverlay").style.display = "block";
	}
	 
	function w3_close() {
	  document.getElementById("mySidebar").style.display = "none";
	  document.getElementById("myOverlay").style.display = "none";
	}


</script>

</body>
</html>
