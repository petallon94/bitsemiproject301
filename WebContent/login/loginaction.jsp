<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//id,pass,saveid 읽기
 	String id=request.getParameter("login_id");
 	String pass=request.getParameter("login_password");
 	String saveid=request.getParameter("login_saveid");
 	//dao 선언
 	MemberDao dao=new MemberDao();
 	
    int a=dao.loginProcess(id, pass);

  	if(a==1){%>
  		<script type="text/javascript">
			alert("아이디가 존재하지 않습니다\n먼저 회원가입을 해주세요");
			location.href="../index.jsp?main=member/memberform.jsp";    
		</script>
  	<%}else if(a==2){%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			location.href="../index.jsp?main=login/loginform.jsp";    
	</script>
	<%}else{
		//아이디와 비번이 맞는경우
		session.setAttribute("myid", id);
		if(saveid!=null){//아이디저장 체크한경우
			session.setAttribute("saveid", "yes");			
		}else{//체크 안한경우-기존 세션 삭제
			session.removeAttribute("saveid");
		}
		session.setAttribute("loginok", "success");
		//세션 유지 시간 지정
		session.setMaxInactiveInterval(60*60*24);//24시간
		//index 로 이동
		response.sendRedirect("../index.jsp");
	} 
 %>
 
 
 
 