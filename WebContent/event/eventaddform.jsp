<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.img-cover{
   position: absolute;
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:1;
	}
	.ordsub_visual .txt{
	     position: absolute;
	     top:50%;
	     left:50%;
	     transform: translate(-50%, -50%);                                                                   
	     color: white;
	     z-index: 2;
	     text-align: center;
	}
	.ordsub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
	.ordsub_visual .txt p{font-size: 14pt; font-weight: 300;}
	.ordsub_visual{
	    position: relative;
	    background-image: url(./image/closeup-coffee-machine-wide.jpg);                                                               
	    height: 400px;
	    background-size: cover;
	}



	div.eventaddform{
		margin-top: 150px;
		margin-left: 100px;
	}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<script type="text/javascript">
var n=2;
$(function(){
	$("span.evcontentimage").click(function(){
		if(n>5){
			alert("이미지는 최대5개까지등록가능합니다");
			return;
		}
		var tag="<input type='file' name='evcontentimage"+
		(n++)+"' style='width: 300px;' class='form-control'><br>";
		//기존 html에 추가하는부분
		$("div.addimage").html(function(idx,html){
			return html+tag;
			
		});
	});
});

</script>
<body>


<div class="ordsub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>진행중인 이벤트를 확인하세요.</p>        
    </div>
    <div class="img-cover"></div>
</div>


<div class="eventaddform">
	<form action="event/eventaddaction.jsp" method="post" 
	 enctype="multipart/form-data" class="form-inline">
	 	<table class="table table-bordered" style="width: 800px;">
	 		
	 		<tr>
	 			<td style="width: 120px;">
	 			<b>이벤트명</b>
	 			</td>
	 			<td>
	 				<input type="text" name="evsubject" class="form-control"
	 				style="width: 300px;" placeholder="입력해주세요"
	 				required="required">
	 			</td>
	 		</tr>
	 		<tr>
	 			<td style="width: 100px;">
	 			<b>목록이미지</b>
	 			</td>
	 			<td>
	 				<div class="form-group">
	 					<input type="file" name="evlistimage"
	 					style="width: 300px;" class="form-control" required="required" >
	 				</div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td style="width: 100px;">
	 			<b>기간</b>
	 			</td>
	 			<td>
	 				<input type="date" name="evstartday" required="required">
	 				~
	 				<input type="date" name="evendday" required="required">
	 			</td>
	 		</tr>
	 		<tr>
	 			<td style="width: 100px;">
	 			<b>본문이미지</b>
	 			</td>
	 			<td>
	 				<div class="form-group">
	 					<input type="file" name="evcontentimage1"
	 					style="width: 300px;" class="form-control" required="required" >
	 					<span class="fas fa-plus evcontentimage"
	 					style="margin-left: 20px;font-size: 1.2em;cursor: pointer;"></span>	
	 				</div>
	 				<div class="addimage"></div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td style="width: 100px;">
	 			<b>상세내용</b>
	 			</td>
				<td>
					<textarea style="width: 650px;height: 400px;"
					name="evcontent" required="required"
					class="form-control"></textarea>
				</td>
			</tr>
	 		<tr>
	 			<td colspan="2" align="center">
	 				<button type="submit" class="btn btn-outline-secondary"
	 				style="width: 100px;" 
	 				>추가하기</button>

	 			</td>
	 		</tr>
	 		
	 	</table>
	</form>
</div>
</body>
</html>