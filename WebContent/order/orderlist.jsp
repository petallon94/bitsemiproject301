<%@page import="java.util.HashMap"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title hereㅣㅣㅣ</title>
<style type="text/css">
.ordlist .ordlthead tr th{
	text-align: center;
	background-color: #f6c244;
}
.ordlist .ordlthead tr{
	height: 50px;
}
.ordlist .ordltbody tr{
	height: 120px;
	border-bottom: 1px solid #ddd;
}
.ordlist .ordltbody tr td .ordlmenu{
	margin-left: 30px;
}
.ordlist .ordltbody tr td .ordlmenu b{
	
}
</style>
</head>
<%
	//로그인한 아이디 얻기
	String id = (String)session.getAttribute("myid");
	
	//orderdao선언
	OrderDao dao = new OrderDao();
	
	//장바구니 목록 얻기
	List<HashMap<String,String>> list = dao.getOrderList(id);
	
%>
<body>
<h3 class="myid"><%=id %>님의 장바구니</h3>
<!-- <h3 class="myid">admin님의 장바구니</h3> -->
<table class="ordlist" style="width: 920px;">
	<thead class="ordlthead">
	<tr>
		<th style="width: 20px;"><input type="checkbox" id="allcheck"></th>
		<th style="width: 500px;">음료정보</th>
		<th style="width: 150px;">선택 옵션</th>
		<th style="width: 150px;">금액</th>
		<th style="width: 100px;"></th>
	</tr>
	</thead>
	<%
	int allp=0;
	NumberFormat nf = NumberFormat.getInstance();
	for(int i=0; i<list.size(); i++){
		HashMap<String,String> map = list.get(i);
		String photo = map.get("menuphoto");
		int p = Integer.parseInt(map.get("menuprice"));
	%>
		<tbody class="ordltbody">
			<tr>
				<td align="center" style="vertical-align: middle;">
					<input type="checkbox" name="ordernum" class="ordernum" ordernum="<%=map.get("ordernum")%>">
				</td>
				<td>
					<div menunum="<%=map.get("menunum")%>" class="ordlmenu">
					<img src="menusave/<%=photo%>" class="photo" align="left" hsapce="20" width="100">
					<b><%=map.get("menuname") %></b>
					</div>
				</td>
			</tr>
		</tbody>
	<%}%>
</table>
</body>
</html>