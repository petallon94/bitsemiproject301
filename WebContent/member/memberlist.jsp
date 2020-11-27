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
<title>Insert title here</title>
</head>
<%
	//dao선언
	MemberDao dao=new MemberDao();
	//멤버목록 가져오기
	List<MemberDto2> list=dao.getAllMembers();
%>
<body>
<table class="table table-bordered" style="width: 800px;">
<caption><b>회원 명단</b></caption>
<tr bgcolor="#ffdd22">
	<td style="width:100px;" align="center"><b>아이디</b></td>
	<td style="width:600px;" align="center" colspan="2"><b>정보</b></td>
	<td style="width:100px;" align="center"><b>관리</b></td>
</tr>
	<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	for(MemberDto2 dto:list){
		%>
		<tr>
			<td rowspan="5" style="verticl-align:middle" align="center">
			<%=dto.getId()%>
			</td>
			<td align="center" style="width: 100px;">이름</td>
			<td style="width:500px;"><%=dto.getName()%></td>
			<td rowspan="5" style="verticl-align:middle" align="center">
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
			<td align="center">가입일</td>
			<td><%=sdf.format(dto.getGaipday())%></td>
		</tr>
	<%}
	
	%>
</table>
</body>
</html>