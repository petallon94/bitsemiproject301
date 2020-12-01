<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.mp_menu_list {width:100%;padding:0 10px;font-size:0;position:absolute;left :50px; margin-top:20px;}
.mp_menu_list li{width:20%;max-width:250px;height : 100px;padding:10px 0;border:1px solid #bfbfbf;margin-bottom:5px;font-size:1rem;color:#909090;background:#fff;}
.mp_menu_list li a{display:block; text-align :center;top : 50%; }

/*내용 나오는 곳*/

.my_page_content {width:100%;max-width:1200px;position : absolute;left:400px;border:2px solid #bfbfbf; margin-top:20px;}
.my_page_content img{max-width:100%;height :200px;}
/*submenu*/
.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300;}
.sub_visual .txt h1:after{display:block;width:40px;height:2px;margin:32px auto;background:#202020;content:'';}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);}



</style>
<body>
<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>스타보틀에 오신것을 환영합니다.</p>
    </div>
  
</div>


<div class="mypage_content"> 
<div id = "my_page_menu" class = "my_page_menu">
<ul class ="mp_menu_list" style=" list-style:none;">
<li><a>개인정보수정</a></li>
<li><a>주문내역</a></li>
<li><a>admin : 메뉴관리</a></li>
<li><a>admin : 지점관리</a></li>
<li><a>admin : 회원관리</a></li>
</ul>
</div>
<div class = "my_page_content">
<img src ="./image/welcom.jpg"><br>
<a>윤선영님 환영합니다!!!</a>

</div>
</div>

</body>
</html>