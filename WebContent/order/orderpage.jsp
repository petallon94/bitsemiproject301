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
</head>
<%
	String menunum = request.getParameter("menunum");
	String menuprice = request.getParameter("menuprice");
	String photo = request.getParameter("menuphoto");
	
	//로그인한 아이디 구하기
	String myid = (String)session.getAttribute("myid");
	//아이디에 해당하는 멤버 테이블의 시퀀스 번호 가져오기
 	MemberDao mdao = new MemberDao();
//	String loginnum = mdao.getNum(myid);
	String loginnum = "7";
	
	//해당 상품에 대한 데이터 가져오기
	OrderDao odao = new OrderDao();
	//MenuDto dto = odao.getData(menunum);
	MenuDao medao = new MenuDao();
	MenuDto medto = medao.getdata(menunum);
	
	DecimalFormat dmf = new DecimalFormat("###,###");
	
	System.out.println(medto.getMenuname());
%>
<body>
<div id="ord_ctn">
	<div class="img">
		<%-- <img src="menusave/<%=medto.getMenuphoto()%>"> --%>
		<img src="image/sumnail">
	</div>
	<form action="order/orderprocess.jsp" class="ord_frm" id="frm" method="post">
	<input type="hidden" name="menunum" value="<%=menunum %>">
	<input type="hidden" name="loginnum" value="<%=loginnum%>">
	<input type="hidden" name="mnname" value="<%=medto.getMenuname()%>">
	<input type="hidden" name="orderprice" value="<%=medto.getMenuprice()%>">
		<div class="info">
			<p class="main_t"><%=medto.getCategory()%> ) <%=medto.getMenuname() %></p>
			<span class="sub_t"><%=medto.getMenudetail() %></span><br>
		</div>
		<p class="ord_label s">Size</p>
		<select id="size" name="size">
			<option value="hide">---- Size ----</option>
		    <option value="S" >Small</option>
		    <option value="M">Medium</option>
		    <option value="L">Large</option>
		    <option value="J">Jumbo</option>
		</select>
		<p class="ord_label hc">Hot / Cold</p>
		<div class="switch-field">
			<input type="radio" id="radio-one" name="temp" value="H" checked/>
			<label for="radio-one">H</label>
			<input type="radio" id="radio-two" name="temp" value="C" />
			<label for="radio-two">C</label>
		</div>
		<p class="ord_label oi">Take Out / Eat In</p>
		<div class="switch-field">
			<input type="radio" id="radio-three" name="takeout" value="Out" checked/>
			<label for="radio-three">Out</label>
			<input type="radio" id="radio-four" name="takeout" value="In" />
			<label for="radio-four">In</label>
		</div>
		<div id="price"><b class="money"><%=medto.getMenuprice() %></b><span class="won"> 원</span></div>
		<button type="button" id="btncart" class="btn btn-outline-warning">장바구니 담기</button>
		<button type="submit" id="btnorder" class="btn btn-warning" onclick="location.href='index.jsp?main=order/orderfinish.jsp'">주문하기</button>
	</form>
</div>
<script type="text/javascript">
$("#btncart").click(function(){
	//form태그의 모든 값을 가져오기
	var formdata=$("#frm").serialize();
	$.ajax({
		type:"post",
		dataType:"html",
		url:"order/orderprocess.jsp",
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