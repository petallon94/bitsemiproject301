<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글 엔코딩
request.setCharacterEncoding("utf-8");

%>
<!-- dto,dao usebean -->
<jsp:useBean id="dao" class="data.dao.MemberDao"/>
<jsp:useBean id="dto" class="data.dto.MemberDto"/>
<!-- setproperty: 전체 데이터 읽기 -->
<jsp:setProperty property="*" name="dto"/>

<%
String password = request.getParameter("pass");
String loginid = request.getParameter("loginid");

boolean find=dao.isIdPassCheck(loginid, password);	

if(find){	
dao.updateMember(dto);	
response.sendRedirect("../index.jsp?main=mypage/adminpagemain.jsp");
%>
<script type="text/javascript">
$(".admin_page_content").load("mypage/memberlist.jsp");		 
</script>
<%
}else{%>
<script type="text/javascript">
alert("비밀번호가 맞지 않습니다.");
history.back();
</script>
<%}
%>

