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
	
	
		.ev_endpng{
		margin-left : 10px;
		width: 232px;
		height: 230px;
		background: #000;
		display: block;
		opacity: 0.7;
		filter:alpha(opacity=70);
		position:absolute;
		border-radius: 4px;
	}
	
	
	
	/* sub */
.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300;}
.sub_visual .txt h1:after{display:block;width:40px;height:2px;margin:32px auto;background:#202020;content:'';}
.sub_visual .txt p{font-size:1.25rem;font-weight:300;}
.sub_visual .page_tab{width:100%;padding:0 10px;font-size:0;position:absolute;bottom:41px;left:0;}
.sub_visual .page_tab li{display:inline-block;width:20%;max-width:170px;padding:10px 0;border:1px solid #bfbfbf;border-left:0;font-size:1rem;color:#909090;background:#fff;}
.sub_visual .page_tab li:first-child{border-left:1px solid #bfbfbf;}
.sub_visual .page_tab li a{display:block;}
.sub_visual .page_tab li.on, .sub_visual .page_tab li:hover{color:#000;background:#ffe600;transition:background .3s ease;-webkit-transition:background .3s ease;}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);}
</style>
<script type="text/javascript">
$(function(){
	$("div.ev_content").click(function(){
		var eventnum=$(this).attr("eventnum");
		location.href="index.jsp?main=event/eventcontent.jsp?eventnum="+eventnum+"&key=a";
		
	});
	
});

</script>
<%
	EventDao dao=new EventDao();
	List<EventDto> list=dao.getAllEvent();
	List<EventDto> ilist=dao.getIngEvent();
	List<EventDto> elist=dao.getEndEvent();
	
	
	
	
	//세션로그인 상태
	String loginok=(String)session.getAttribute("loginok");
	//세션에저장된 아이디
	String myid=(String)session.getAttribute("myid");
	
	
	
%>

<body>

<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>오직 스타보틀에서만 만나보실 수 있는 시그니처 메뉴입니다.</p>
    </div>
</div>


	



<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">
<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:15px 15px">
  <div class="w3-padding-32">
  
  	<!--이벤트탭들 이름에맞게 출력되게 수정-->
    <div class="w3-bar w3-border">
      <a href="index.jsp?main=event/eventlist.jsp" class="w3-bar-item w3-button">전체 이벤트</a>
      <a href="index.jsp?main=event/ingevent.jsp" class="w3-bar-item w3-button w3-light-grey">진행중인 이벤트</a>
      <a href="index.jsp?main=event/endevent.jsp" class="w3-bar-item w3-button">종료된 이벤트</a>
    </div>
    
    
    
    
    
    <!--이벤트추가버튼 admin 계정으로만 보이게-->
    <br><br>
    <%
    if(loginok!=null && myid.equals("admin")){%>
    <button type="button" class="btn btn-outline-secondary"
	onclick="location.href='index.jsp?main=event/eventaddform.jsp'">
	이벤트추가
	</button>
	<%}%>
  </div>
</header>
</div>



  <!--각 이벤트들 반복문으로 출력하기-->
  <!--전체-->
<div id="ev_tabs-1">
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
  
  <p style="margin-right: 650px;float: right;">진행중인 이벤트</p><br>
  <hr>
    <div class="w3-row w3-padding-32">
    
      <%
      	for(EventDto idto:ilist)
      	{%>
      		<div class="ev_content w3-third"
      		 eventnum="<%=idto.getEventnum()%>">
      		 <img src="eventsave/<%=idto.getEvlistimage()%>" 
      		 class="w3-round w3-margin-bottom" style="width:90%">
      		  <p class="ev_subject"><%=idto.getEvsubject()%><br>
      		  <%=idto.getEvstartday()%>~<%=idto.getEvendday()%>
      		  </p>
      		 
      		</div> 
      	<%}
      %>
    </div>
    <br><br><br>
    
    
   <p style="margin-right: 650px;">종료된 이벤트</p>
   <hr>
     <div class="w3-row w3-padding-32">
    	
    	
    	<%
      	for(EventDto edto:elist)
      	{%>
      		<div class="ev_content w3-third"
      		 eventnum="<%=edto.getEventnum()%>">
      		 <a>
      		 <span class="ev_endpng">
      		 <img src="./image/end_event.png" style="position:absolute;margin-left:-17%;margin-top: 33%;
      		 ">
      		 </span>
      		 
      		 <img src="eventsave/<%=edto.getEvlistimage()%>" class="w3-round w3-margin-bottom" style="width:90%">
      		 </a> 
      		  <p class="ev_subject"><%=edto.getEvsubject()%><br>
      		  <%=edto.getEvstartday()%>~<%=edto.getEvendday()%>
      		  </p>
      		 
      		</div> 
      	<%}
      %>
    
    
     </div>
  </div>
</div>





</body>
</html>
