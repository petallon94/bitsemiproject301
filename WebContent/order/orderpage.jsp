<%@page import="data.dao.MenuDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dto.OrderDto"%>
<%@page import="data.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="order/order_style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
.img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.4);z-index:1;}
.sub_visual .txt{position: absolute;top:50%;left:50%;transform: translate(-50%, -50%);color: white;z-index: 2;text-align: center;}
.sub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
.sub_visual .txt p{font-size: 14pt; font-weight: 300;}
.sub_visual{position: relative;background-image: url(./image/coffee-5132832_1920.jpg);height: 400px;background-size:cover;background-position:center;}
</style>
</head>
<%
	String menunum = request.getParameter("menunum");
	String menuprice = request.getParameter("menuprice");
	String photo = request.getParameter("menuphoto");
	String category = request.getParameter("category");
	
	//로그인한 아이디 구하기 - 수정
	String id = (String)session.getAttribute("myid");

	//String loginnum = "7";
	
	//해당 상품에 대한 데이터 가져오기
	OrderDao odao = new OrderDao();
	MenuDao medao = new MenuDao();
	MenuDto medto = medao.getdata(menunum);
	
	DecimalFormat dmf = new DecimalFormat("###,###");
	
%>
<body>
<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>오직 스타보틀에서만 만나보실 수 있는 시그니처 메뉴입니다.</p>
    </div>
    <div class="img-cover"></div>
</div>
<div id="ord_ctn">
	<div class="img">
	
		<img src="menusave/<%=medto.getMenuphoto()%>" style="height: 640px; width: 480px;">
		<!-- <img src="image/sumnail"> -->
	</div>
	<form action="order/orderprocess.jsp" class="ord_frm" id="frm" method="post">
	<input type="hidden" name="menunum" value="<%=menunum %>">
	<input type="hidden" name="orderid" value="<%=id%>">
	<input type="hidden" name="mnname" value="<%=medto.getMenuname()%>">
	<input type="hidden" name="orderprice" value="<%=medto.getMenuprice()%>">
	<input type="hidden" name="category" value="<%=medto.getCategory()%>">
	
		<div class="menuinfo">
			<p class="main_t"><%=medto.getCategory()%> ) <%=medto.getMenuname() %></p>
			<span class="sub_t"><%=medto.getMenudetail() %></span><br>
		</div>
		<p class="ord_label s">Size</p>
		<select id="size" name="size" required>
			<option value="">---- Size ----</option>
		    <option value="S" >Small</option>
		    <option value="M">Medium</option>
		    <option value="L">Large</option>
		    <option value="J">Jumbo</option>
		</select>
		<%
			if(medto.getCategory().equals("디저트"))
			{%>
				<p class="ord_label hc">데워드릴까요?</p>
				<div class="switch-field">
					<input type="radio" id="radio-one" name="temp" value="Hot" checked/>
					<label for="radio-one">Y</label>
					<input type="radio" id="radio-two" name="temp" value="Cold" />
					<label for="radio-two">N</label>
				</div>
			<%}else if(medto.getCategory().equals("프라푸치노"))
			{%>
				<p class="ord_label hc">Only Cold</p>
				<div class="switch-field">
					<input type="radio" id="radio-one" name="temp" value="Hot" disabled="disabled" />
					<label for="radio-one">H</label>
					<input type="radio" id="radio-two" name="temp" value="Cold" checked />
					<label for="radio-two">C</label>
				</div>
			<%}else{
		%>
		<p class="ord_label hc">Hot / Cold</p>
		<div class="switch-field">
			<input type="radio" id="radio-one" name="temp" value="Hot" checked/>
			<label for="radio-one">H</label>
			<input type="radio" id="radio-two" name="temp" value="Cold" />
			<label for="radio-two">C</label>
		</div>
		<%}%>
		<p class="ord_label oi">Take Out / Eat In</p>
		<div class="switch-field">
			<input type="radio" id="radio-three" name="takeout" value="Out" checked/>
			<label for="radio-three">Out</label>
			<input type="radio" id="radio-four" name="takeout" value="In" />
			<label for="radio-four">In</label>
		</div>
		<div id="price"><b class="money"><%=medto.getMenuprice() %></b><span class="won"> 원</span></div>
		<button type="button" id="btncart" class="btn btn-outline-warning">장바구니 담기</button>
		<button type="submit" id="btnorder" class="btn btn-warning">주문하기</button>
	</form>
</div>
<script type="text/javascript">
$("#btncart").click(function(){
	var select = $("#size").val();
	if(select==""){
		alert("사이즈를 선택해주세요");
		return;
	}
	//form태그의 모든 값을 가져오기
	var formdata=$("#frm").serialize();
	//alert(formdata);
	$.ajax({
		type:"post",
		dataType:"html",
		data:formdata,
		url:"order/orderaction.jsp",
		success:function(data){
			var a=confirm("장바구니에 저장하였습니다\n장바구니로 이동하시겠습니까?")
			if(a){
				location.href="index.jsp?main=order/orderlist.jsp";
			}
		}
	});
});

</script>
</body>
</html>
