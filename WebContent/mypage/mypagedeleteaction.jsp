<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//id와 pass 를 읽는다
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	%>
	<script type="text/javascript">
		alert("id");
	</script>
<%
	//dao 선언
	MemberDao dao=new MemberDao();

	boolean find=dao.isIdPassCheck(id, pass);

	if(find){
		//비번이 맞는경우 삭제
		dao.deleteMember(id);
		session.removeAttribute("loginok");
		response.sendRedirect("../index.jsp?main=mypage/memberlist.jsp");		
	}else{%>
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다");
			history.back();
		</script>
	<%}
%>






