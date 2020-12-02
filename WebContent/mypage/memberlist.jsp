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
<h4>회원 관리</h4>
<table class="table table-bordered" style="width: 800px;">
<thead class="thead-light">
<tr>
	<th>아이디</th>
	<th>관리</th>
	<th colspan="2">정보</th>
</tr>
</thead>
<tbody>
	<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	for(MemberDto2 dto:list){
		%>
		<tr>
			<td rowspan="7">
			<%=dto.getId()%>(<%=dto.getName()%>)
			</td>
			<td rowspan="7">
			<button class="btn btn-info btn-sm" onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getLoginnum()%>'">정보수정</button><br>
			<button type="button" class="btn btn-danger btn-sm"
				 onclick="location.href='index.jsp?main=member/deletepassform.jsp?id=<%=dto.getId()%>'">
				회원탈퇴</button>

			</td>				
		</tr>
		<tr>
			<td align="center">핸드폰</td>
			<td><%=dto.getHp()%></td>
		</tr>
		<tr>
			<td align="center">주소</td>
			<td><%=dto.getAddress()%>&nbsp;<%=dto.getAddrdetail()%></td>
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
		<tr>
			<td align="center">가입일</td>
			<td><%=sdf.format(dto.getGaipday())%></td>
		</tr>
		<tr>
				
		</tr>
	<%}%>
</tbody>
</table>
</body>
</html>