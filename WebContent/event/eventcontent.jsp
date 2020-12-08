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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: 'Noto Sans KR', Arial, sans-serif;}
.w3-bar-block .w3-bar-item {padding:20px}

	span.date{
		font-size: 0.6em;
	}
	span.writedate,span.readcount{
		font-size: 0.6em;
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
	div.ev_container{
		float: right;
	}
	
	
	/* sub */
.ordsub_visual{min-height:399px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.ordsub_visual .txt{width:100%;position:absolute;top:120px;left:0;}
.ordsub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:500;color:white;}
.ordsub_visual .txt h1:after{display:block;width:40px;height:4px;margin:32px auto;background:#202020;content:'';}
.ordsub_visual .txt p{font-size:1.25rem;font-weight:300;color:white;}
.ordsub_visual.bg-menu{background-image:url(./image/closeup-coffee-machine-wide.jpg);}
	
	
	
	
	
	
</style>

<%

	EventDao db=new EventDao();
	//페이징 처리에 필요한 변수들	
	int totalCount=db.getIngTotalCount(); //총 글의 갯수
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
	String key=request.getParameter("key");
	EventDao dao=new EventDao();
	
	EventDto dto=dao.getData(eventnum);
	if(key!=null)
		dao.updateReadCount(eventnum);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String []evcontentimage=dto.getEvcontentimage().split(",");
	
	
	
	
	
	//세션로그인 상태
	String loginok=(String)session.getAttribute("loginok");
	//세션에저장된 아이디
	String myid=(String)session.getAttribute("myid");	
	
%>

<script type="text/javascript">
$(function(){
	$("div.ev_list").click(function(){
		var eventnum=$(this).attr("eventnum");
		location.href="index.jsp?main=event/eventcontent.jsp?eventnum="+eventnum+"&key=a";
	});


	
});




</script>


<body>

<div class="ordsub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>진행중인 이벤트를 확인하세요.</p>
    </div>
</div>

  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">


  
  

 
  
  <hr id="about">
  
  <h3><%=dto.getEvsubject()%><span class="date"><br>
    <%=dto.getEvstartday()%> ~ <%=dto.getEvendday()%></span>
    <span class="writedate">작성일 &nbsp;<%=sdf.format(dto.getEvwriteday())%></span><br>
    <span class="readcount">조회수 &nbsp;<%=dto.getEvreadcount()%></span>
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
 



  
  
  
  
<div class="ev_container">


  
  <!-- Button to Open the Modal -->
  <%
  if(loginok!=null && myid.equals("admin")){%>
  <button type="button" class="btn btn-outline-secondary"
  onclick="location.href='index.jsp?main=event/eventupdateform.jsp?eventnum=<%=eventnum%>'">
    수정
  </button>
  <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#myModal">
    삭제
  </button>
  <button type="button" class="btn btn-outline-secondary"
  onclick="location.href='index.jsp?main=event/eventlist.jsp'">
    목록
  </button>
  <%}else{%>
  	<button type="button" class="btn btn-outline-secondary"
  	onclick="location.href='index.jsp?main=event/eventlist.jsp'">
    목록
  	</button>
  <%}%>
  
  
  
  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          삭제하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal"
           onclick="location.href='event/eventdeleteaction.jsp?eventnum=<%=eventnum%>'">
          확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">
          취소</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
  

  	
 
 
 
 
 
 
 
 
<br><br><br><br><br>
<p>진행중인 다른이벤트</p>
<hr style="margin-top: -10px;">

<a id="test"></a>
  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  
  <%
  	for(EventDto ldto:list)
  	{%>
  		<div class="ev_list w3-quarter"
  		eventnum="<%=ldto.getEventnum()%>">
  		<img src="eventsave/<%=ldto.getEvlistimage()%>"
  		style="width:204px;height: 204px;">
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
      <a href="index.jsp?main=event/eventcontent.jsp?eventnum=<%=dto.getEventnum()%>&pageNum=<%=startPage-1%>#test" 
      class="w3-bar-item w3-button w3-hover-black">«</a>
   <%}
    %>
    
    <%
    for(int i=startPage;i<=endPage;i++)
    {%>
      <a href="index.jsp?main=event/eventcontent.jsp?eventnum=<%=dto.getEventnum()%>&pageNum=<%=i%>#test" 
      class="w3-bar-item w3-black w3-button"><%=i%></a>
    <%}
    %>
    <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
	 다음블럭의 startPage 로 가야대 -->
	<%
	if(endPage<totalPage)
	{%>
      <a href="index.jsp?main=event/eventcontent.jsp?eventnum=<%=dto.getEventnum()%>&pageNum=<%=endPage+1%>#test" 
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