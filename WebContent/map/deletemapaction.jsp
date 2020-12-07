
<%@page import="data.dao.StarMapDao"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("utf-8");
	String shopname=request.getParameter("shopname");
	
	StarMapDao dao=new StarMapDao();
	boolean find=dao.isShopPassCheck(shopname);

	if(find==false)
	{%>
		<script type="text/javascript">
		alert("입력하신 매장은 존재하지않습니다");
		history.back();
		</script>
	<%}else{%>
	<script type="text/javascript">
		alert("입력하신 매장을 삭제하였습니다");
		</script>
		<%
	/* System.out.println(shopname); */
	dao.deleteShop(shopname);
	}
	response.sendRedirect("../index.jsp?main=mypage/adminpagemain.jsp");
%>
	