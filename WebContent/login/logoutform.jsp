<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<%
	//세션에서 id 얻기
	String id=(String)session.getAttribute("myid");
	//dao 선언
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	String name=dao.getName(id);
%>
<body>
<div class="cart">
<b><%=name%> 님</b>
로그아웃하시겠습니까?
</div><br><br>
<button type="button" class="btn btn-success"
onclick="location.href='login/logoutaction.jsp'"
style="margin-left: 30px;width: 100px ;">로그아웃</button>

</body>
</html>