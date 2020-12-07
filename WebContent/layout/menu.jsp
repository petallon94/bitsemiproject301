<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2??family=Gothic+A1&family=Karma&family=Open+Sans:ital@1&family=Yeon+Sung&display=swap" rel="stylesheet">

<style>
nav.mainmenu {
	width: 1100px;
	height: 160px;
}

nav.mainmenu ul{
	display: flex;
	justify-content: space-around;
	list-style: none;
	
}
nav.mainmenu ul li {
	width: 120px;
	height: 50px;
	line-height: 160px;
	text-align: center;
}
nav.mainmenu ul li.mainmemu_title {

}
nav.mainmenu ul li:hover{
	width: 120px;
	height: 50px;	
	cursor: pointer;
}
nav.mainmenu ul li a, a:hover, a:active{
	text-decoration: none;
	color: black;
}
nav.mainmenu ul li a:hover{
	text-decoration: none;
	color: #00979f;
}
.logo {
	width: 120px;
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

<!--mainmenu -->
<nav class="mainmenu">
	<ul>
		<li menu="menu1">
		<a href="<%=url %>/index.jsp?main=menu/menulist.jsp">커피메뉴</a>
		</li>
		<li menu="menu2">
		<a href="<%=url %>/index.jsp?main=gonji/gonjilist.jsp">공지사항</a>
		</li>		
		<li menu="menu3">
		<a href="<%=url %>/index.jsp"><img class="logo" src="./image/sb_logo.jpg" alt=""></a>
		</li>
		<li menu="menu4">
		<a href="<%=url %>/index.jsp?main=map/map.jsp">매장위치</a>
		</li>
		<li menu="menu5">
		<a href="<%=url %>/index.jsp?main=event/eventlist.jsp">이벤트</a>
	</ul>
</nav>
</body>
</html>