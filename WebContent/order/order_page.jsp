<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="order_style.css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div id="ord_ctn">
	<div class="img">
		<img src="../img/sumnail">
	</div>
	<form action="#" class="ord_frm">
		<div class="info">
			<p class="main_t">아메리카노</p>
			<span class="sub_t">스타보틀만의 특별한 원두로 만들어진 향긋한 아메리카노</span><br>
		</div>
		<p class="ord_label s">Size</p>
		<select id="size">
			<option value="hide">---- Size ----</option>
		    <option value="small" >Small</option>
		    <option value="medium">Medium</option>
		    <option value="large">Large</option>
		    <option value="jumbo">Jumbo</option>
		</select>
		<p class="ord_label hc">Hot / Cold</p>
		<div class="switch-field">
			<input type="radio" id="radio-one" name="switch-one" value="Hot" checked/>
			<label for="radio-one">H</label>
			<input type="radio" id="radio-two" name="switch-one" value="Cold" />
			<label for="radio-two">C</label>
		</div>
		<p class="ord_label oi">Take Out / Eat In</p>
		<div class="switch-field">
			<input type="radio" id="radio-three" name="switch-two" value="Out" checked/>
			<label for="radio-three">Out</label>
			<input type="radio" id="radio-four" name="switch-two" value="In" />
			<label for="radio-four">In</label>
		</div>
		<div id="price"><b class="money">7,800</b><span class="won"> 원</span></div>
		<button type="button" id="btncart" class="btn btn-outline-warning">장바구니 담기</button>
		<button type="button" id="btnorder" class="btn btn-warning">주문하기</button>
	</form>
</div>
</body>
</html>