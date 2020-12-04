<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto2"%>
<%@page import="java.util.List"%>
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
<link href="https://fonts.googleapis.com/css2??family=Gothic+A1&family=Karma&family=Open+Sans:ital@1&family=Yeon+Sung&display=swap" rel="stylesheet">

<title>Insert title here</title>
</head>
<%
	//dao선언
	MemberDao dao=new MemberDao();
	//멤버목록 가져오기
	List<MemberDto2> list=dao.getAllMembers();	
	
%>
<body>
<h4 style="margin: 20px;">회원 관리</h4>
<table class="table table-bordered" style="width: 1200px;">
<thead class="thead-light">
<tr>
	<th>아이디</th>
	<th>이름</th>
	<th width="150">핸드폰</th>
	<th colspan="2" align="center">정보</th>	
	<th width="130">가입일</th>
	<th width="100">관리</th>	
</tr>
</thead>
<tbody>
	<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	for(MemberDto2 dto:list){
		%>
		<tr>
			<td rowspan="5">
			<%=dto.getId()%>
			</td>
			<td rowspan="5">
			<%=dto.getName()%>
			</td>	
			<td rowspan="5">
			<%=dto.getHp()%>
			</td>					
		</tr>		
		<tr>
			<td align="center">주소</td>
			<td><%=dto.getAddress()%>&nbsp;<%=dto.getAddrdetail()%></td>
			<td rowspan="5">
			<%=sdf.format(dto.getGaipday())%>
			</td>
			<td rowspan="5">
			<button class="btn btn-outline-info btn-sm" 
			onclick="location.href='index.jsp?main=mypage/adminupdateform.jsp?loginnum=<%=dto.getLoginnum()%>'">정보수정</button><br>
			<button type="button" class="btn btn-outline-danger btn-sm"
				 onclick="location.href='index.jsp?main=mypage/admindeleteform.jsp?id=<%=dto.getId()%>'">
				회원탈퇴</button>
			</td>
		</tr>		
		<tr>
			<td align="center">이메일</td>
			<td><%=dto.getEmail()%></td>
		</tr>
		<tr>
			<td align="center">바코드</td>
			<td><%=dto.getBarcode()%></td>
		</tr>
		<tr>
			<td align="center">생년월일</td>
			<td><%=dto.getBirthday()%></td>
		</tr>
	<%}%>
</tbody>
</table>
</body>
</html>