<%@page import="data.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<html>
<title>메뉴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
body{font-family: 'Noto Sans KR', Arial, sans-serif;}
.w3-bar-block .w3-bar-item {padding:20px}

/*godetail*/

.godetail img{cursor:pointer;}
.menu_list h3{margin-bottom: 50px;}
.w3-content{max-width: 1100px;}

/* sub */
.img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.4);z-index:1;background-size:cover;}
.sub_visual .txt{position: absolute;top:50%;left:50%;transform: translate(-50%, -50%);color: white;z-index: 2;text-align: center;}
.sub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
.sub_visual .txt p{font-size: 14pt; font-weight: 300;}
.sub_visual{position: relative;background-image: url(./image/coffee-5132832_1920.jpg);height: 400px;background-size: cover;text-align: center;background-position:center;}

.sub_visual .page_tab{width:100%;padding:0 10px;font-size:0;position:absolute;bottom:41px;left:0;cursor : pointer;z-index: 2;}
.sub_visual .page_tab li{display:inline-block;width:20%;max-width:170px;padding:10px 0;border:1px solid #bfbfbf;border-left:0;font-size:1rem;color:#909090;background:#fff;}
.sub_visual .page_tab li:first-child{border-left:1px solid #bfbfbf;}
.sub_visual .page_tab li a{display:block;}
.sub_visual .page_tab li.on, .sub_visual .page_tab li:hover{color:#000;background:#f6c244;transition:background .3s ease;-webkit-transition:background .3s ease;}

</style>
<script>
$(function(){
	
	$("img.godetail").click(function(e){
	  	  
	   	 e.preventDefault(); 
	   	 var menunum = $(this).attr("menunum");
	   	 location.href ="index.jsp?main=menu/menudetailpage.jsp?menunum="+menunum;
	   	  
	     });
	
	
	
});
</script>
</head>
<%
	MenuDao dao =new MenuDao();
	List<MenuDto> list = dao.getoneMenus("디저트");
	
%>


<body>
  
<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>오직 스타보틀에서만 만나보실 수 있는 시그니처 메뉴입니다.</p>
    </div>
    <ul class="page_tab st-2">
		<li><a onclick ="location.href='index.jsp?main=menu/menulist.jsp'">전체</a></li>
		<li><a onclick ="location.href='index.jsp?main=menu/menulistcoffee.jsp'">커피</a></li>
		<li><a onclick ="location.href='index.jsp?main=menu/menulistdrink.jsp'">음료</a></li>
		<li><a onclick ="location.href='index.jsp?main=menu/menulistdess.jsp'">디저트</a></li>
		<li><a onclick ="location.href='index.jsp?main=menu/menulistprep.jsp'">프라푸치노</a></li>
	</ul>
	<div class="img-cover"></div>
</div>
  
<!-- !PAGE CONTENT! 페이지 부분 -->
<div class="menu_list w3-content" style="margin-top:100px" >

	<h3>디저트</h3>

	
	<!-- 출력연습하기 -->

	<div class="menu_contain w3-main w3-content" >
	
	<%
	
		for(MenuDto dto : list){%>
			<div class="w3-quarter godetail" >
      		<img src ="menusave/<%=dto.getMenuphoto()%>" class ="godetail" menunum = "<%=dto.getMenunum()%>" style="width:240px;height :250px;">
      		<h4 style="margin: 10px 0 40px 0;"><%=dto.getMenuname() %></h4>
     		<input type="hidden" class="form-control" id="menunum"  name="menunum" value =<%=dto.getMenunum()%>>
 		   </div>
		<%}%>
		<br>
	
	</div>
<!-- End page content -->
</div>
<div class="menu_footer w3-padding" style="margin-top:100px">
</div>



<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}


</script>

</body>
</html>
