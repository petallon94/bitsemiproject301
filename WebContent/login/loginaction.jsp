<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
세션에 저장 
아이디   myid  : 로그인한 아이디를 저장
아이디저장 체크박스 상태  : 체크를 하면 saveid 에 yes 저장
				,체크를 안하면  saveid 세션 삭제
로그인에 성공시  loginok : success 저장
 --%>
 <%
 	//id,pass,saveid 읽기
 	String id=request.getParameter("login_id");
 	String pass=request.getParameter("login_password");
 	String saveid=request.getParameter("login_saveid");//null이면 체크 안한상태를 의미
 	//dao 선언
 	MemberDao dao=new MemberDao();
 	
 	//loginProcess 호출
 	//아이디가  DB 명단에 없을경우 1 반환
    //아이디는 있는데 비번이 안맞는경우 2 반환
    //아이디와 비번 모두 맞는경우 3 반환
    int a=dao.loginProcess(id, pass);
 	//위의 결과 3인경우에만 세션에 위의 설명대로 저장및 삭제후
 	//index로이동
 	//나머지 경우는 적절한 경고창과 함께 이전페이지로 이동하기
  	if(a==1){%>
  		<script type="text/javascript">
			alert("아이디가 존재하지 않습니다\n먼저 회원가입을 해주세요");
			location.href="../index.jsp?main=member/memberform.jsp";    
		</script>
  	<%}else if(a==2){%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			location.href="../index.jsp?main=login/loginmenu.jsp#loginModal";
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
 
 