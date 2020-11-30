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
<link href="https://fonts.googleapis.com/css2??family=Gothic+A1&family=Karma&family=Open+Sans:ital@1&family=Yeon+Sung&display=swap" rel="stylesheet">

<title>Insert title here</title>
<style type="text/css">
nav #topmenu {
width: 100%;
white-space: nowrap;
}

nav #topmenu{
    position: relative;
    display: inline-block;
    margin-left: 25px;
    padding-left: 12px;
    font-size: 12px;
    vertical-align: middle;
}
span {
margin-right: 25px;
}

</style>

</head>
<body>
<%
 	//프로젝트의 경로 구하기
	 String url=request.getContextPath();
	
	//세션 로그인상태
	/*String loginok=(String)session.getAttribute("loginok");
	//세션에 저장된 아이디
	String myid=(String)session.getAttribute("myid"); 

 */
 %>
<!-- topmenu -->
<div class="topmenu" id="topmenu">
   <span><a href="<%=url %>/index.jsp?main=member/memberform.jsp" class="topmenu_btn">회원가입</a></span> 
   <span><a href="<%=url %>/index.jsp?main=login/loginform2.jsp" class="topmenu_btn">로그인</a></span>
   <span><a href="<%=url %>/index.jsp?main=mypage/mypageform.jsp" class="topmenu_btn">마이페이지</a></span> 
   <span><a href="<%=url %>/index.jsp?main=order/orderform.jsp" class="topmenu_btn">주문</a></span>
   <!--카트아이콘 <i class="fas fa-shopping-cart"><i> -->
</nav>

</div>
</body>
</html>