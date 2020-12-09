<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
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
	
	
	

	$('#upcategory').change(function(){
		var s = $(this).val();
		if (s == '-') {
			$("#upmenucategory").val("");
			$("#upmenucategory").focus();

		} else {
			$("#upmenucategory").val(s);
		}
		
	});
	
	
	
});



</script>

<body>
<%
	String menunum = request.getParameter("num");


	MenuDao medao = new MenuDao();
	MenuDto medto = medao.getdata(menunum);
	
	

%>

<div class="container">
  <h2>메뉴 추가 화면</h2>
  <br><hr>
  <br>
  <form action="menu/menuupdateaction.jsp" method="post" enctype="multipart/form-data">
    <input type="text" class="form-control" id="upmenunum"  name="upmenunum" value =<%=menunum%>>
    <div class="upmenu">
      <label for="upmenuname">메뉴이름</label>
      <input type="text" class="form-control" id="upmenuname"  name="upmenuname" value =<%=medto.getMenuname()%> >
    </div>
    <br>
    <div class = "classform" >
    <label for="upcategory">분류</label>
    <select id="upcategory" name="upcategory">
    <option selected disabled hidden="">종류 선택</option>
    
    <%
		String[] drinks = { "커피", "음료", "디저트", "프라푸치노" };
						//for Sting co :colors 이렇게 써도 된다
			for (int i = 0; i < drinks.length; i++) {
				%>
				<option value="<%=drinks[i]%>"><%=drinks[i]%></option>
	<%};%> 
	
	</select>
	<input type="hidden" class="form-control" id="upmenucategory"  name="upmenucategory">
    </div>
    <br>
    <div class="menuform">
      <label for="upmenuprice">가격</label>
      <input type="text" class="form-control" id="upmenuprice"  name="upmenuprice" required = "required" value =<%=medto.getMenuprice()%>>
    </div>
    <div class="menuform">
      <label for="upmenupthoto">상품 사진 ※ 반드시 사진은 재업로드 요망</label>
      <input type="file" class="form-control" id="upmenuphoto"  name="upmenuphoto"  >
      <span id="premenuphoto" name="premenuphoto">전에 선택했던 사진 <%=medto.getMenuphoto()%></span>
    </div>
    <br>
    <div class="upmenuform">
      <label class="menudetail"> 메뉴소개</label>
      <input type="text" class="form-control" id="upmenudetail"  name="upmenudetail" value =<%=medto.getMenudetail()%>>
      
    </div>
    <br>
    <div class="upmenuform">
      <label class="upmipgoday"> 판매시작일</label>
      <%
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(new Date()); %>
		<input type= "date" name = "upmipgoday" value = "<%=medto.getMipgoday()%>" required = "required">
					
    </div>
    <div class ="upmenuinfo">
    <label class="upmenuinfo"> 메뉴 영양정보</label><br>
     <label class="upmenukcal"> 칼로리</label>
      <input type="text" class="form-control" id="upmenukcal"  name="upmenukcal" required = "required" style ="width : 100px;"value =<%=medto.getMenukcal()%>>
       <label class="upmenunat"> 나트륨</label>
      <input type="text" class="form-control" id="upmenunat"  name="upmenunat" required = "required" style ="width : 100px;" value =<%=medto.getMenunat()%> >
       <label class="upmenusugar"> 당류</label>
      <input type="text" class="form-control" id="upmenusugar"  name="upmenusugar" required = "required" style ="width : 100px;"value =<%=medto.getMenusugar()%> >
       <label class="upmenucaff"> 카페인</label>
      <input type="text" class="form-control" id="upmenucaff"  name="upmenucaff" required = "required" style ="width : 100px;"value =<%=medto.getMenucaff()%> >
    </div>
    
    <br>
    <button type="submit" class="btn btn-primary" onclick ="../index.jsp?main=mypage/adminpagemain.jsp">수정</button>
  </form>
</div>



</body>
</html>