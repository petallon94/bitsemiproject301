<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
span .topmenu_btn {
	margin-right: 25px;
}
#login_oktitle {
color:#f6c244;
margin-right: 25px;
}

/* 로그인모달창 */
#loginModal .modal-header, #loginModal .modal-title, #loginModal .close {
background-color: #f6c244;
color:white;
text-align: center;
font-size: 25px;
}
#loginModal .modal-header .modal-title{
padding:15px 30px;
text-align: center;
}

#loginModal .modal-body{
padding:40px 100px;

}
#loginModal .modal-body input{
margin-bottom: 20px;

}  
#loginModal .modal-footer {
  background-color: #f9f9f9;
}
#topmenu span a, a:active{
	text-decoration: none;
	color: black;
}
#topmenu span a:hover{
	text-decoration: none;
	color: #00979f;
}

</style>

</head>
<body>
<%	

 	//프로젝트의 경로 구하기
	String url=request.getContextPath();	
	//세션 로그인상태
	String loginok=(String)session.getAttribute("loginok");
	//세션에 저장된 아이디
	String myid=(String)session.getAttribute("myid"); 
	//dao 선언
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	String name=dao.getName(myid);
	//session 에 saveid 가 있을경우(아이디저장체크한경우)
	//세션에서 myid를 얻는다
	String saveid=(String)session.getAttribute("saveid");
	String id="";
	if(saveid!=null){
		id=(String)session.getAttribute("myid");
	}

	
	//OrderDao 선언
	//OrderDao cdao=new OrderDao();
	//카트 갯수 얻어오기
	//int cartSize=cdao.getOrderList(id).size();
	
 %>
 
<!-- topmenu -->
<div class="topmenu" id="topmenu">
	
	<%if(loginok==null){%>
   	<span><a href="<%=url %>/index.jsp?main=member/memberform.jsp" class="topmenu_btn">회원가입</a></span>   	
   	<span><a href="#loginform" id="loginmenu_loginbtn" class="topmenu_btn">로그인</a></span>
	<%}else{%>
	<span id="login_oktitle"><%=name %>님 환영합니다.</span>
	<span><a href="<%=url %>/index.jsp?main=login/logoutform.jsp" class="topmenu_btn">로그아웃</a></span>
	<%}%>
	<%
	if(loginok!=null && myid.equals("admin")){%>
		<span><a href="<%=url %>/index.jsp?main=mypage/adminpagemain.jsp" class="topmenu_btn">관리페이지</a></span> 
	<%}else{%>
   		<span><a href="<%=url %>/index.jsp?main=mypage/mypagemain.jsp" class="topmenu_btn">마이페이지</a></span> 
	<%}%>

	<%
	if(loginok!=null){%>
   		<span><a href="<%=url %>/index.jsp?main=order/orderlist.jsp" class="topmenu_btn">주문
	<%}else{%>
	<%} %>


	<%-- <i class="fas fa-shopping-cart"></i><span class="count"><%=cartSize%></span> --%>
	</a></span>
</div>
<!-- 로그인 모달창 -->
<form action="login/loginaction.jsp" method="post" id="loginform" name="loginform">
  <div class="modal fade" id="loginModal">
  <input type="hidden" name="id" id="myid"
					placeholder="아이디" class="form-control"
					value="<%=id%>">
    <div class="modal-dialog">    
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">로그인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <div>아이디</div>
        <input type="text" class="form-control" id="login_id" name="login_id" placeholder="아이디를 입력해주세요" required="required">
		<div>비밀번호</div>         
		<input type="password" class="form-control" id="login_password" name="login_password" placeholder="비밀번호를 입력해주세요" required="required">
        <input type="checkbox" name="login_saveid" <%=saveid==null?"":"checked"%>>아이디저장
        <br>        
        <button type="submit" class="btn btn-warning btn-block" id="login_enterbtn">로그인</button>
        <button type="button" class="btn btn-info btn-block" id="login_joinbtn">회원가입</button> 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
        </div>        
      </div>
    </div>
  </div>
  </form>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click", "#loginmenu_loginbtn", function(event){
		
		$("#loginModal").modal();
	});
});

$("#login_joinbtn").click(function(){
	location.href="index.jsp?main=member/memberform.jsp";    
});  

</script>
</html>