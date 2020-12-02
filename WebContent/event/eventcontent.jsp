<%@page import="java.util.List"%>
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

	span.date{
		font-size: 0.6em;
	}
	span.writedate,span.readcount{
		font-size: 0.6em;
		float: right;
	}
	button.goevlist{
		float: right;
	}
	div.ev_list{
		cursor: pointer;
	}
	p.ev_subject{
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
	overflow: hidden;
	word-break: normal;
	display: inline-block;
	}
</style>

<%

	EventDao db=new EventDao();
	//페이징 처리에 필요한 변수들	
	int totalCount=db.getTotalCount(); //총 글의 갯수
	int perPage=4; //한페이지당 보여지는 글의 갯수
	int perBlock=4; //한블럭당 보여지는 페이지번호의 수
	int currentPage;//현재페이지,만약 널값이면 1로 줌
	int totalPage; //총 페이지의 갯수
	int start;//한페이지당 보여지는 시작번호
	int end;//한페이지당 보여지는 끝번호
	int startPage; //한 블럭당 보여지는 시작페이지번호
	int endPage; //한 블럭당 보여지는 끝페이지번호
	
	
	//현재 페이지
	String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(pageNum);
		}
		//총 페이지수
		totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//예를 들어 모두 45개의 글이 있을경우
		  //마지막 페이지는 endnum 이 45 가 되야함
		  if(endPage>totalPage)
				endPage=totalPage;
		
		//mysql은 첫 글이 0번(오라클은 1번)
			start=(currentPage-1)*perPage;
		
		int no=totalCount-(currentPage-1)*perPage;

	List<EventDto> list=db.getList(start, perPage);

	
	String eventnum=request.getParameter("eventnum");
	
	EventDao dao=new EventDao();
	
	EventDto dto=dao.getData(eventnum);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String []evcontentimage=dto.getEvcontentimage().split(",");
%>

<script type="text/javascript">
$(function(){
	$("div.ev_list").click(function(){
		var eventnum=$(this).attr("eventnum");
		location.href="index.jsp?main=event/eventcontent.jsp?eventnum="+eventnum;
	});

	$("#ev_focus").click(function(){
		alert(this);
		$("#ev_page").scrollTop($("#ev_page")[0].scrollHeight);
	});
	
	
});




</script>


<body>




  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">


  
  

 
  
  <hr id="about">
  
  <h3><%=dto.getEvsubject()%><span class="date"><br>
    <%=dto.getEvstartday()%> ~ <%=dto.getEvendday()%></span>
    <span class="writedate">작성일 &nbsp;<%=sdf.format(dto.getEvwriteday())%></span><br>
    <span class="readcount">조회수 &nbsp;</span>
  </h3>
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
  
  <!-- 수정,삭제버튼 admin계정만 보이게 하기 -->
  
    <button type="button" class="goevlist btn btn-outline-secondary"
  	onclick="history.back()">
  	목록</button>
  	<button type="button" class="goevlist btn btn-outline-secondary"
  	onclick="#">
  	삭제</button>
  	<button type="button" class="goevlist btn btn-outline-secondary"
  	onclick="#">
  	수정</button>
  	
 
<br><br><br>


  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  
  <%
  	for(EventDto ldto:list)
  	{%>
  		<div class="ev_list w3-quarter"
  		eventnum="<%=ldto.getEventnum()%>">
  		<img src="eventsave/<%=ldto.getEvlistimage()%>"
  		style="width:75%;">
  		<p class="ev_subject"><%=ldto.getEvsubject()%><br>
  		<%=ldto.getEvstartday()%>~<%=ldto.getEvendday()%>
  		</p>
  		</div>
  	<%}
  %>
  </div>
  


  
 <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar" id="ev_focus">
    <%
    if(startPage>1)
    {%>
      <a href="index.jsp?main=event/eventcontent.jsp?eventnum=<%=dto.getEventnum()%>&pageNum=<%=startPage-1%>" 
      class="w3-bar-item w3-button w3-hover-black">«</a>
   <%}
    %>
    
    <%
    for(int i=startPage;i<=endPage;i++)
    {%>
      <a href="index.jsp?main=event/eventcontent.jsp?eventnum=<%=dto.getEventnum()%>&pageNum=<%=i%>" 
      class="w3-bar-item w3-black w3-button"><%=i%></a>
    <%}
    %>
    <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
	 다음블럭의 startPage 로 가야대 -->
	<%
	if(endPage<totalPage)
	{%>
      <a href="index.jsp?main=event/eventcontent.jsp?eventnum=<%=dto.getEventnum()%>&pageNum=<%=endPage+1%>" 
      class="w3-bar-item w3-button w3-hover-black">»</a>
    <%}
	%>

    </div>
  </div>
<!-- End page content -->
</div>
<div id="ev_page"></div>
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