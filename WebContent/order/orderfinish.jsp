<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ordsub_visual{min-height:399px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.ordsub_visual .txt{width:100%;position:absolute;top:120px;left:0;}
.ordsub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:500;}
.ordsub_visual .txt h1:after{display:block;width:40px;height:4px;margin:32px auto;background:#202020;content:'';}
.ordsub_visual .txt p{font-size:1.25rem;font-weight:300;}
.ordsub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);}

.ordfinish{margin: auto; margin-top: 180px; width: 1000px;}
.ordf_logo{text-align: center;}
.ordf_logo img{width: 200px;}
.ordf_info{font-size: 24pt; text-align: center; font-weight: 700; margin-top: 20px;}
.ordf_myid{color: #f6c244; font-size: 27pt; font-weight: 800;}
.ordf_info2{font-size: 24pt; text-align: center; font-weight: 500;}
.ordf_btn{text-align: center; margin: 30px 0 150px 0;}
.ordf_btn button{width: 200px; height: 60px; font-size: 14pt;}
</style>
<%
	//로그인한 아이디 얻기
	String id = (String)session.getAttribute("myid");

	
%>
</head>
<body>
<div class="ordsub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>오직 스타보틀에서만 만나보실 수 있는 시그니처 메뉴입니다.</p>
    </div>
</div>
<div class="ordfinish">
	<div class="ordf_logo"><img src="image/sb_symbol.jpg"></div>
	<div class="ordf_info"><span class="ordf_myid"><%=id %></span>님의 주문이 완료되었습니다.</div>
	<div class="ordf_info2"><span>오늘도 행복한 하루 스타보틀과 함께하세요!</span></div>
	<div class="ordf_btn">
		<button type="button" class="btn btn-warning" onclick="location.href='index.jsp'">메인으로 돌아가기</button>
	</div>
</div>
</body>
</html>