<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
var n=2;
$(function(){
	$("span.evcontentimage").click(function(){
		if(n>3){
			alert("이미지는 최대3개까지등록가능합니다");
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
<div class="eventaddform">
	<form action="#" method="post" 
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
	 				style="width: 100px;">추가하기</button>
	 				
	 				<button type="button" class="btn btn-outline-secondary"
	 				style="width: 100px;"
	 				onclick="location.href='../event/eventlist.jsp'">목록</button>
	 			</td>
	 		</tr>
	 		
	 	</table>
	</form>
</div>
</body>
</html>