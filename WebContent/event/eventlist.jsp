<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Insert title here</title>
<style type="text/css">
	.topmenu{
		width: 700px;
		height: 60px;
		border: 1px solid #ccc;
		border-radius: 4px;
		margin-top: 10px;
		margin-left: 10px;
		text-align: center; 
		font-family: 'Noto Sans KR';
	}
	.container{
		margin-top: 10px;
	}
	div .evmenu{
		color:black;
	} 
	div .evmenu:hover{
		text-decoration: underline;
		color: black;
	}
	.nav-item{
		border-radius: 4px;
		width: 200px;
		
	}

</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
</head>
<script type="text/javascript">
$(function(){

});
</script>
<body>
 <div class="topmenu">
  <div class="container">
   <ul class="nav justify-content-center">
     <li class="nav-item" id="allevent">
      <a class="evmenu nav-link" href="#" id="evmenu1">전체 이벤트</a>
     </li>
     <li class="nav-item" id="nowevent">
      <a class="evmenu nav-link" href="#" id="evmenu2">진행중인 이벤트</a>
     </li>
     <li class="nav-item" id="endevent">
      <a class="evmenu nav-link" href="#"id="evmenu3">종료된 이벤트</a>
     </li>
   </ul>
 </div>
</div>

</body>
</html>