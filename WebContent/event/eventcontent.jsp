<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.EventDto"%>
<%@page import="data.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>

<%
	String eventnum=request.getParameter("eventnum");
	
	EventDao dao=new EventDao();
	
	EventDto dto=dao.getData(eventnum);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String []evcontentimage=dto.getEvcontentimage().split(",");
%>

<script type="text/javascript">
$(function(){
	
});
</script>


<body>




  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">


  
  

 
  
  <hr id="about">
  
  <h3><%=dto.getEvsubject()%></h3><p><%=dto.getEvstartday()%> ~ <%=dto.getEvendday()%></p>
  <hr id="about">

  <!-- About Section -->
  <div class="w3-container w3-padding-32 w3-center">  
    
    <img src="" class="w3-image" style="display:block;margin:auto" width="800" height="533">
    <div class="w3-padding-32">
      <h4><b><%=dto.getEvcontent()%></b></h4>
     <img src="eventsave/<%=evcontentimage[evcontentimage.length-1]%>">
     <%
     	if(evcontentimage.length>1)
     	{
     		for(int i=evcontentimage.length-2;i>=0;i--)
     		{%>
     			<img src="eventsave/<%=evcontentimage[i]%>">
     		<%}
     	}
     %>
      <p>내용3@@@@@@@@@@@@@@@@@@@</p>
    </div>
  </div>
  <hr>
  
 

  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="/w3images/sandwich.jpg" style="width:100%">
      <p>event1<br>
      기간이요
      </p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/steak.jpg" style="width:100%">
      <p>event2<br>
      기간이요
      </p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/cherries.jpg" style="width:100%">
      <p>event3<br>
      기간이요
      </p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/wine.jpg" style="width:100%">
      <p>event4<br>
      기간이요
      </p>
    </div>
  </div>
  


  
 <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
<!-- End page content -->
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