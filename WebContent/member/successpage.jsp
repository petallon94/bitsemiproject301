<%@page import="data.dao.MemberDao"%>
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
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입완료</title>
<style type="text/css">
body {
display: flex;
justify-content: center;
}
</style>
</head>
<body>
<%	

	//세션에 저장된 아이디
	String id=(String)session.getAttribute("myid"); 
	//dao 선언
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	String name=dao.getName(id);

	
 %>
<input type="text" name="id" id="myid" value="<%=id%>">
<img src="./image/congratulations.PNG">
<div><%=name %> 고객님</div>
<div>스타보틀커피 회원가입이 완료되었습니다.</div><br>
<input type="button" class="btn btn-success" value="로그인하기" onclick="window.location='index.jsp?main=login/loginform.jsp'" >
</body>
</html>