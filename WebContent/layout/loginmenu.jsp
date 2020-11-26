<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script type="text/javascript">
$(function() {	
	if(localStorage.menu!=null){
		$("nav.mainmenu ul li").each(function (i, element) {
			if(localStorage.menu==$(this).attr("menu")){
				$(this).addClass("bottom");
				$(this).next().click();//해당 메뉴의 a태그 이벤트 호출
			}			
		});		
	}else {
		$("nav.mainmenu ul li").eq(0).addClass("bottom");
	}
	$("nav.mainmenu ul li a").click(function(e){
		//기본 이벤트 무효화
		e.preventDefault();
		$("nav.mainmenu ul li").removeClass("bottom");
		$(this).parent().addClass("bottom");
		//href 값을 얻어서 해당 url로 이동
		var href=$(this).attr("href");
		location.href=href;
		var menu=$(this).parent().attr("menu");
		localStorage.menu=menu;
	});
	
	$("a.logo").click(function(e){
		e.preventDefault();
		location.href="index.jsp";
	});
		
});
</script>
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
<nav class="topmenu" id="topmenu">
   <span><a href="<%=url %>/index.jsp?main=member/memberform.jsp" class="topmenu_btn">회원가입</a></span> 
   <span><a href="<%=url %>/index.jsp?main=login/loginform.jsp" class="topmenu_btn">로그인</a></span>
   <span><a href="<%=url %>/index.jsp?main=mypage/mypageform.jsp" class="topmenu_btn">마이페이지</a></span> 
   <span><a href="<%=url %>/index.jsp?main=order/orderform.jsp" class="topmenu_btn">주문</a></span>
   <!--카트아이콘 <i class="fas fa-shopping-cart"><i> -->
</nav>
</body>
</html>