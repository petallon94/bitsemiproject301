<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#ftarea{width: 100%; height: 210px; background-color: #fafafa; position: relative;}
.ftcnt .ft_img{position: absolute; top: 50%; left: 15%; transform:translate(-50%, -50%);}
.ftcnt img{width: 120px;}
.ftcnt .ft_info{color: #999; margin-left: 30px; position: absolute; top: 50%; left: 48%; transform:translate(-50%, -50%);}
.ftcnt .ft_info .email{padding-left: 30px;}
.ftcnt .ft_css{position: absolute; top: 50%; left: 27%; transform:translate(-50%, -50%);}
.ftcnt .ft_css .link{color: #999; cursor: pointer;}
.ftcnt .ft_css .link:hover{text-decoration: none;}
.ftcnt .ft_css .layout-ft_css_tel{margin: -8px 0 -14px 0;}
.ftcnt .ft_css .tel{color: #f6c244; font-size: 32pt; font-weight: 700; }
.ftcnt .ft_css .time{color: #999; padding-left: 3px;}
.ftcnt .ft_icon{position: absolute; top: 50%; left: 81%; transform:translate(-50%, -50%);}
.ftcnt .ft_icon span{color: #999; font-size: 10pt;}
.ftcnt .ft_icon span a{margin: 0 6px; color: #999;}
.ftcnt .ft_icon span a:hover{text-decoration: none;}
.ftcnt .ft_icon img{width: 300px; cursor: pointer;}
.ftcnt .ft_copy{color: #888; font-weight: 400; position: absolute; top: 88%; left: 50%; transform:translate(-50%, -50%);}
</style>
</head>
<body>
<div id="ftarea">
	<div class="ftcnt">
		<div class="ft_img"><img src="image/sb_symbol_black.png"></div>
		<div class="ft_info">
			<b>주소</b>&nbsp;&nbsp;서울 서초구 강남대로 459 비트빌딩 레드버그 컴퍼니<br>
			<b>대표이사</b>&nbsp;&nbsp;갓지혜<br>
			<b>팩스</b>&nbsp;&nbsp;012-1234-5678<span class="email"><b>메일</b>&nbsp;&nbsp;redbug123@redbug.com</span>
		</div>
		<div class="ft_css">
			<div class="layout-ft_css">
				<a class="link" href="#">고객센터&nbsp;&gt;</a>
			</div>
			<div class="layout-ft_css_tel"><a class="tel" href="tel:1234-5678">1234 - 5678</a></div>
			<span class="time">평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)</span>
		</div>
		<div class="ft_icon">
			<a href="#"><img src="image/ft_icon.png"></a><br>
			<span><a href="#">개인정보처리방침</a> | <a href="#">이용약관</a> | <a href="#">회사소개</a> | <a href="#">고객센터</a></span>
		</div>
		<div class="ft_copy">Copyright© by StarBottle, All rights reserved.</div>
	</div>
</div>
</body>
</html>