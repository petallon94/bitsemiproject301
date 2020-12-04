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
body,h1,h2,h3,h4,h5,h6 {font-family: 'Noto Sans KR', sans-serif;}
.w3-bar-block .w3-bar-item {padding:20px}

/*godetail*/

.godetail img{cursor:pointer;}


/* sub */
.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300;}
.sub_visual .txt h1:after{display:block;width:40px;height:2px;margin:32px auto;background:#202020;content:'';}
.sub_visual .txt p{font-size:1.25rem;font-weight:300;}
.sub_visual .page_tab{width:100%;padding:0 10px;font-size:0;position:absolute;bottom:41px;left:0;cursor : pointer;}
.sub_visual .page_tab li{display:inline-block;width:20%;max-width:170px;padding:10px 0;border:1px solid #bfbfbf;border-left:0;font-size:1rem;color:#909090;background:#fff;}
.sub_visual .page_tab li:first-child{border-left:1px solid #bfbfbf;}
.sub_visual .page_tab li a{display:block;}
.sub_visual .page_tab li.on, .sub_visual .page_tab li:hover{color:#000;background:#ffe600;transition:background .3s ease;-webkit-transition:background .3s ease;}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);}

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
	List<MenuDto> list = dao.getoneMenus("프라푸치노");
	
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
		     
 
</div>

  
<!-- !PAGE CONTENT! 페이지 부분 -->
<div class="menu_list w3-content w3-padding" style="max-width:1600px;margin-top:100px" >

	<h3>전체음료</h3>

	<hr id="about">
	
	
	<!-- 출력연습하기 -->

	<div class="menu_contain w3-main w3-content w3-padding" >
	
	<%
	
		for(MenuDto dto : list){%>
			<div class="w3-quarter godetail" >
      		<img src ="menusave/<%=dto.getMenuphoto()%>" class ="godetail" menunum = "<%=dto.getMenunum()%>" style="width:100%;height :250px;margin-left:10px;marigin_top :10px;">
      		<h3><%=dto.getMenuname() %></h3>
     		<input type="hidden" class="form-control" id="menunum"  name="menunum" value =<%=dto.getMenunum()%>>
 		   </div>
		<%}%>
		<br>
	
	</div>
<!-- End page content -->
</div>
<div class="menu_footer w3-padding" style="max-width:1600px;margin-top:100px">
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
