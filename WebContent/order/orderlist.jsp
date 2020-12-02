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
<title>Insert title here</title>
<style type="text/css">
.table tr th{
	text-align: center;
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
<%-- <h4 class=""><%=id %>님의 장바구니</h4> --%>
<h3 class="myid">admin님의 장바구니</h3>
<table class="table" style="width: 920px;">
	<thead class="thead-dark">
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
		int p = Integer.parseInt(map.get("price"));
	%>
		<tbody>
			<tr>
				<td align="center" style="vertical-align: middle;">
					<input type="checkbox" name="menunum" class="menunum" menunum="<%=map.get("menunum")%>">
				</td>
				<td>
					<div ></div>
				</td>
			</tr>
		</tbody>
	<%}%>
</table>
</body>
</html>