<%@page import="data.dto.EventDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}

	.w3-padding-32{
		margin-bottom: -50px;
	}
	div p{
		margin-top: -5px;
		font-size: ;
	}
	div .w3-third{
		margin-bottom: 10px;
	}
	
	.ev_content{
		cursor: pointer;
		padding-bottom: 10px;
	}
	.ev_subject{
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
	overflow: hidden;
	word-break: normal;
	display: inline-block;
	}
	
</style>
<script type="text/javascript">
$(function(){
	$("div.ev_content").click(function(){
		
		var eventnum=$(this).attr("eventnum");
		location.href="index.jsp?main=event/eventcontent.jsp?eventnum="+eventnum;
		
	});
	
});

</script>
<%
	EventDao dao=new EventDao();
	List<EventDto> list=dao.getAllEvent();
%>

<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">
<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:15px 15px">
  <div class="w3-padding-32">
  
  	<!--이벤트탭들 이름에맞게 출력되게 수정-->
    <div class="w3-bar w3-border">
      <a href="#" class="w3-bar-item w3-button">전체 이벤트</a>
      <a href="#" class="w3-bar-item w3-button w3-light-grey">진행중인 이벤트</a>
      <a href="#" class="w3-bar-item w3-button">종료된 이벤트</a>
    </div>
    
    <!--이벤트추가버튼 admin 계정으로만 보이게-->
    <br><br>
    <button type="button" class="btn btn-outline-secondary"
	onclick="location.href='index.jsp?main=event/eventaddform.jsp'">
	이벤트추가
	</button>
  </div>
</header>
</div>



  <!--각 이벤트들 반복문으로 출력하기-->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
    <div class="w3-row w3-padding-32">
    
      <%
      	for(EventDto dto:list)
      	{%>
      		<div class="ev_content w3-third"
      		 eventnum="<%=dto.getEventnum()%>">
      		 <img src="eventsave/<%=dto.getEvlistimage()%>" 
      		 class="w3-round w3-margin-bottom" style="width:90%">
      		  <p class="ev_subject"><%=dto.getEvsubject()%><br>
      		  <%=dto.getEvstartday()%>~<%=dto.getEvendday()%>
      		  </p>
      		 
      		</div> 
      	<%}
      %>

      
      
    </div>
  </div>






</body>
</html>
