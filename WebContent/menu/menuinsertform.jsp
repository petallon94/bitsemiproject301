<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: 'Noto Sans KR', sans-serif;}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){

	$('#category').change(function(){
		var s = $(this).val();
		if (s == '-') {
			$("#menucategory").val("");
			$("#menucategory").focus();

		} else {
			$("#menucategory").val(s);
		}
		
	});
	
	
	
});



</script>

<body>

<div class="container">
  <h2>메뉴 추가 화면</h2>
  <br><hr>
  <br>
  <form action="menuinsertaction.jsp" method="post" enctype="multipart/form-data">
    <div class="menuform">
      <label for="menuname">메뉴이름</label>
      <input type="text" class="form-control" id="menuname"  name="menuname">
    </div>
    <br>
    <div class = "classform" >
    <label for="category">분류</label>
    <select id="category" name="category">
    <option selected disabled hidden="">종류 선택</option>
    
    <%
		String[] drinks = { "커피", "음료", "디저트", "프라푸치노" };
						//for Sting co :colors 이렇게 써도 된다
			for (int i = 0; i < drinks.length; i++) {
				%>
				<option value="<%=drinks[i]%>"><%=drinks[i]%></option>
	<%};%> 
	
	</select>
	<input type="hidden" class="form-control" id="menucategory"  name="menucategory">
    </div>
    <br>
    <div class="menuform">
      <label for="menuprice">가격</label>
      <input type="text" class="form-control" id="menuprice"  name="menuprice" required = "required">
    </div>
    <div class="menuform">
      <label for="menupthoto">상품 사진</label>
      <input type="file" class="form-control" id="menuphoto"  name="menuphoto" required = "required">
    </div>
    <br>
    <div class="menuform">
      <label class="menudetail"> 메뉴소개</label>
      <input type="text" class="form-control" id="menudetail"  name="menudetail" required = "required">
      
    </div>
    <br>
    <div class="menuform">
      <label class="mipgoday"> 판매시작일</label>
      <%
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(new Date()); %>
		<input type= "date" name = "mipgoday" value = "<%=day %>" required = "required">
					
    </div>
    <br>
    <button type="submit" class="btn btn-primary" onclick ="location.href='index.jsp?main=menu/menulist.jsp'">추가</button>
  </form>
</div>



</body>
</html>