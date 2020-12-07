<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//id와 pass 를 읽는다
	String password = request.getParameter("pass");
	String loginid = request.getParameter("loginid");
	String id=request.getParameter("id");

	//dao 선언
	MemberDao dao=new MemberDao();
	//비번이 맞는지 isIdPassCheck 호출(변수 find)
	boolean find=dao.isIdPassCheck(loginid, password);
	//find가 false면 스크립트로 '비밀번호가 틀렸습니다' 경고후 이전페이지이동
	//true면 삭제메서드 호출후 멤버목록으로 이동
	if(find){
		//비번이 맞는경우 삭제
		dao.deleteMember(id);
		response.sendRedirect("../index.jsp?main=mypage/adminpagemain.jsp");
		%>
		<script type="text/javascript">
		$(".admin_page_content").load("mypage/memberlist.jsp");		 
		</script>
		<%
	}else{%>
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다");
			history.back();
		</script>
	<%}
%>






