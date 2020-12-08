<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GonjiDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GonjiDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- 메인페이지에 필요한 링크/부트스트랩  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%--글리피콘아이콘 --%>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->

<style type="text/css">
	/* #cl-dashboard{display: none;} */
	
/*폰트 */
	
	div.gonlist{
		display: flex;
		width: 100%;
		margin-left: 420px;	

		font-family: 'Gothic A1', sans-serif;

	}
	
	/*리스트의 제목 부분 */
	tr.gontitle{
		text-align: center; 
		height:65px;
		line-height: 65px;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
	}
	
	table.table{
		border-left: none;
		border-top: none;
		border-right: none;
		height: 50px;
	}
	
	
	tr:last-child{
		border-bottom: 2px solid gray;
	}
	
	
	
	/* 공통 메인 디자인 css  */
	.sub_visual{
		min-height:399px;
		padding:0 10px;
		text-align:center;
		background-repeat:no-repeat;
		background-size:cover;
		background-position:center;
		position:relative;
	}
	.sub_visual .txt{
		width:100%;
		position:absolute;
		top:148px;left:0;
	}
	.sub_visual .txt h1{
		margin:0;font-size:2.75rem;
		font-weight:300;
		
	}
	.sub_visual .txt h1:after{
		display:block;
		width:40px;
		height:2px;
		margin:32px auto;
		background:#202020;
		content:'';
	}
	.sub_visual .txt p{
		font-size:1.25rem;
		font-weight:300;
		color: #fff;
	}
	.sub_visual.bg-menu{
		background-image:url(./image/people-coffee-shop-wide.jpg);
	}
	
</style>
<script type="text/javascript">
$(function(){
/* 	//전체 체크박스 체크,해제
	$("#all").click(function(){
		var a=$(this).is(":checked");
		if(a){
			//prop속성주는 것:체크속성줄 때는 arrt보다 prop이 정확
			//name으로 줄때는 $("태그이름[name='']")으로 준다!
			$("input[name='search']").prop("checked",true);
		}else{
			$("input[name='search']").prop("checked",false);
		}
	});//체크박스 전체 선택 해제 close */
	
	//검색 
	$("#btndatasearch").click(function(){
		//변수
		var search=$("#search").val();
		var word=$("#word").val();
		//alert(search+":"+word);
		//검색한 값이랑 단어의 값을 넣으면
		//전체 선택했을 경우,
		$.ajax({
			type:"get",
			dataType:"html",
			url:"gonji/gonsavesession.jsp",
			data:{"search":search,"word":word},
			success:function(data){
				//페이지 번호를 없애고 전체 새로고침한다
				location.href="index.jsp?main=gonji/gonjilist.jsp"
			}
		});//$.ajax close
	});//$("#btndatasearch") close
	
	//전체 선택하면 입력단어 지워주기
	$("#search").change(function(){
		$("#word").val("");
	});
});//$function close
</script>
</head>
<%
	//<페이징 처리를 위한 자바함수>
	//dao 선언
	GonjiDao db=new GonjiDao();
	
	//총 갯수 구하기
	int totalCount=db.getTotalCount();
	int perPage=10;//한 페이지당 보여질 글의 갯수
	int perBlock=2;//한 블럭당 출력할 페이지의 갯수
	int totalPage;//총 페이지의 갯수
	int startPage;//각 블럭당 시작할 페이지 번호
	int endPage;//각 블럭당 끝 페이지 번호
	int start;//각 블럭당 불러올 글의 시작 번호
	int end;//각 블럭당 불러올 글의 끝 번호
	int currentPage;//현재 보여질 페이지 번호
	
	//현재 페이지 번호 구하기
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)
		currentPage=1;//페이지 번호가 없을 경우 무조건 1페이지로 간다
		else
			currentPage=Integer.parseInt(pageNum);
	
	//총 페이지 구하기(예: 총글수가 9이고 한페이지당 2개씩 볼 경우)
	//나머지가 있을 경우, 한페이지를 더해준다(예: 실제 글은 11개이고 10페이지로 된 블럭이라면)
	//해석: 토탈카운트를 페이지로 나눴을 때 나머지 숫자가 0보다 크면 1을 더해주고 아니면 0을 (페이지수에) 더해준다
	totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	
	//시작페이지와 끝페이지 구하기
	//예:한 페이지당 3개만 볼 경우: 
	//현재 페이지가 2라면 sp(startPage):1, ep(endPage):3
	//현재 페이지가 7라면 sp:7, ep:9
	//=>시작페이지가 1,4,7...
	startPage=(currentPage-1)/perBlock*perBlock+1;//일반적인 스타트 페이지 공식**
	endPage=startPage+perBlock-1;//엔드 페이지 공식**
	//마지막 블럭: endPage가 totalPage보다 크면 토탈페이지를 엔드페이지로 해둬야 한다
	if(endPage>totalPage)
		endPage=totalPage;
	
	//mysql은 첫 글이 0번(오라클은 1번)
	//start=(currentPage-1)*perPage+1; - 이건 오라클용 
	start=(currentPage-1)*perPage;
	//아랫부분은 오라클용. mysql은 필요없음
	/* end=start+perPage-1;
	//마지막 글번호는 총 글수와 같은 번호라야 한다
	if(end>totalCount)
		end=totalCount; */
	
	//각 페이지에서 출력할 시작번호
	//총 50개일 경우 1페이지는 50, 2페이지는 40
	int no=totalCount-(currentPage-1)*perPage;
		
	//페이징 처리만을 위한 부분->검색과 페이징으로 합침
	//mysql에서 해당 페이지에 필요한 목록 가져오기:list페이지에서 페이징처리
	//List<GonjiDto> list=db.getList(start, perPage);
		
	//<검색>
	//세션으로부터 key,value가져오기
	String key=(String)session.getAttribute("key");
	String value=(String)session.getAttribute("value");
	//검색 후 값 출력 및 페이징 처리
	//검색을 위해 출력목록에 key,value값 필요
	List<GonjiDto> list=db.getSearchList(key, value, start, perPage);
	
%>
<body>
<%-- 공통 메인 디자인  --%>
<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>스타보틀의 공지사항입니다.</p>
    </div>
</div>

<%--공지사항 리스트 페이지 --%>
<br><br><br><br><br>
<h2 style="display: inline;margin-left: 420px;">공지사항	</h2>
<%-- 관리자로 로그인 했을 때만 보이는 페이지 --%>
<%
//<관리자 로그인 id확인을 위한 자바함수>
//세션 로그인상태
String loginok=(String)session.getAttribute("loginok");
//세션에서 id 얻기
String myid=(String)session.getAttribute("myid");
//dao 선언
MemberDao dao=new MemberDao();
//아이디에 해당하는 이름 얻기
//String name=dao.getName(myid);
//myid가 StarBottle(관리자)인 경우에만 보이기
if(loginok!=null && myid.equals("StarBottle"))
{%>
	<b>	총 <span style="color: red;">
	<%=totalCount%></span>개의 글이 있습니다</b>
    <input type="button" value="게시물등록"
    class="btn btn-warning btn-sm" 
   	style="width: 100px;float: right;margin-right: 470px;margin-top: 10px;"
 	onclick="location.href='index.jsp?main=gonji/gonjiform.jsp'">  
<br><br>
 <%
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
<!-- hidden -->
<input type="hidden" name="myid" value="<%=myid%>">

 <div class="gonlist">
 <%--테이블로 제목넣기--%>
 	<table class="table" style="width: 1000px;">
 		<tr class="gontitle" style="text-align: center; ">
 		 	<th width="40">번호</th>
 		 	<th width="400">제 목</th>
 		 	<th width="60">작성자</th>
 		 	<th width="50">조회수</th>
 		 	<th width="70">작성일</th> 		 	
 		</tr>
 	<%
 	if(totalCount==0)
 	{%>
 		<tr align="center" height="50">
 		  <td colspan="5">
 		    <b>등록된 글이 없습니다</b>
 		  </td>
 		</tr>
 	<%}
 	%>
 	<%for(GonjiDto dto:list)//list로부터 dto를 가져온다
 	{%>
		<tr>
			<td align="center"><%=no--%></td>
			<td>
				<a style="color: black;text-align: left;" 
				href="index.jsp?main=gonji/content.jsp?num=<%=dto.getGonnum()%>&pageNum=<%=currentPage%>&key=list">
				<%=dto.getGonsubject()%></a>
			</td>	
			<td align="center"><%=dto.getGonid()%></td>
			<td align="center"><%=dto.getGonreadcount()%></td>
			<td align="center">
				<%=sdf.format(dto.getGonwriteday())%>
			</td>
		</tr>			
 	<%}
 %>
    </table>
</div>    

<%--페이징 처리--%>
<%
  if(totalCount>0)
  {%>
	<div style="width: 900px; text-align: center;margin-left: 460px;margin-top: 20px;">
	  <ul class="pagination justify-content-center">
		<%
		//이전 페이지 표시
		if(startPage>1)
		{%>
			<li class="page-item">
			  <a class="page-link" href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=startPage-1%>#test">
				&lt;</a>
			</li>
		<%}	
			//페이지 블록 표시
			for(int i=startPage; i<=endPage; i++)
			{
				//메인 인덱스를 통해서 방명록이 출력 / i:이동할 페이지 추가(url주소 끝에 추가됨)
				String url="index.jsp?main=gonji/gonjilist.jsp?pageNum="+i;
			
	/* 			//각 페이지에서 출력할 시작번호
				//총 50개일 경우 1페이지는 50, 2페이지는 40
				int no=totalCount-(currentPage-1)*perPage;
					
				//mysql에서 해당 페이지에 필요한 목록 가져오기
				List<BoardDto> list=db.getList(start, perPage); */
				
				if(i==currentPage)
				{%>
					<li class="page-item active">
					  <a class="page-link" href="<%=url%>#test"><%=i%></a>
					</li>
			  
			  <%}else{%>
					<li class="page-item">
					  <a class="page-link" href="<%=url%>#test"><%=i%></a>
					</li>
			  <%}
			}//for문 close
		//다음 페이지 표시
		if(endPage<totalPage)
		{%>
			<%-- 부등호 기호(>)가 출력안될때: &gt; --%>
			<li class="page-item">
			  <a class="page-link" href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=endPage+1%>#test">
			&gt;</a>
			</li>
	  <%}%>
	  </ul>
	</div>
<%}//if문 close
%> 
<%-- 페이징 끝 --%>

<%-- 검색창  --%>
<form action="" class="form-inline">

  <div style="width: 300px;margin-left: 1080px;margin-top: -50px;">

	<div class="form-group">
	<%
		String search=(String)session.getAttribute("key");
		String word=(String)session.getAttribute("value");
		if(search==null)
			search="all";
		if(word==null)
			word=""; 
	%>
		<%-- 검색 폼 --%>
		<select id="search" class="form-control"
			style="width: 100px;">
			<option value="all" <%=search.equals("all")?"selected":""%>>전체</option>
			<option value="myid" <%=search.equals("myid")?"selected":""%>>아이디</option>
			<option value="subject" <%=search.equals("subject")?"selected":""%>>제목</option>
			<option value="content" <%=search.equals("content")?"selected":""%>>내용</option>
		</select>
		<%-- 검색 폼: 체크박스 --%>
<!-- 		<input type="checkbox" value="all" name="search" 
			checked="checked" id="all">전체
			<input type="checkbox" value="subject" name="search"
			id="subject">제목
			<input type="checkbox" value="content" name="search"
			id="content">내용		 -->
		<%-- ajax에서 action호출하기 위한 id --%>
		
		<input type="text" class="form-control" style="width: 200px;"
			name="word" id="word" placeholder="검색단어입력"
			value="<%=word%>">
		<%-- 검색버튼 --%>
		<button type="button" class="btn btn-warning"
			id="btndatasearch" style="width: 45px;">
			<span class="fas fa-search"></span>
		</button>
	</div>
  </div>
</form>

<%-- 관리자가 아닌 경우에 보이는 페이지 --%>
<%}else{%>
 <br><br>
 <%
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
 <div class="gonlist">
 <%--테이블로 제목넣기--%>
 	<table class="table" style="width: 1000px;">
 		<tr class="gontitle" style="text-align: center;">
 		 	<th width="40">번호</th>
 		 	<th width="400">제 목</th>
 		 	<th width="60">작성자</th>
 		 	<th width="50">조회수</th>
 		 	<th width="70">작성일</th> 		 	
 		</tr>
 	<%
 	if(totalCount==0)
 	{%>
 		<tr align="center" height="50">
 		  <td colspan="5">
 		    <b>등록된 글이 없습니다</b>
 		  </td>
 		</tr>
 	<%}
 	%>
 	<%for(GonjiDto dto:list)//list로부터 dto를 가져온다
 	{%>
		<tr>
			<td align="center"><%=no--%></td>
			<td>
				<a style="color: black;text-align: left;" 
				href="index.jsp?main=gonji/content.jsp?num=<%=dto.getGonnum()%>&pageNum=<%=currentPage%>&key=list">
				<%=dto.getGonsubject()%></a>
			</td>	
			<td align="center"><%=dto.getGonid()%></td>
			<td align="center"><%=dto.getGonreadcount()%></td>
			<td align="center">
				<%=sdf.format(dto.getGonwriteday())%>
			</td>
		</tr>			
 	<%}
 %>

    </table>
</div>    

<%--페이징 처리--%>

<%
  if(totalCount>0)
  {%>
	<div style="width: 900px; text-align: center;margin-left: 460px;margin-top: 20px;">
	  <ul class="pagination justify-content-center">
		<%
		//이전 페이지 표시
		if(startPage>1)
		{%>
			<li class="page-item">
			  <a class="page-link" href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=startPage-1%>#test">
			&lt;</a>
			</li>
		<%}	
			//페이지 블록 표시
			for(int i=startPage; i<=endPage; i++)
			{
				//메인 인덱스를 통해서 방명록이 출력 / i:이동할 페이지 추가(url주소 끝에 추가됨)
				String url="index.jsp?main=gonji/gonjilist.jsp?pageNum="+i;
			
	/* 			//각 페이지에서 출력할 시작번호
				//총 50개일 경우 1페이지는 50, 2페이지는 40
				int no=totalCount-(currentPage-1)*perPage;
					
				//mysql에서 해당 페이지에 필요한 목록 가져오기
				List<BoardDto> list=db.getList(start, perPage); */
				
				if(i==currentPage)
				{%>
					<li class="page-item">
					  <a class="page-link" href="<%=url%>#test"><%=i%></a>
					</li>
			  
			  <%}else{%>
					<li class="page-item">
					  <a class="page-link" href="<%=url%>#test"><%=i%></a>
					</li>
			  <%}
			}//for문 close
		//다음 페이지 표시
		if(endPage<totalPage)
		{%>
			<%-- 부등호 기호(>)가 출력안될때: &gt; --%>
			<li class="page-item">
			  <a class="page-link" href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=endPage+1%>#test">
			&gt;</a>
			</li>
	  <%}%>
	  </ul>
	</div>
<%}//if문 close
%> 
<%-- 페이징 끝 --%>

<%-- 검색창  --%>
<form action="" class="form-inline">
  <div style="width: 600px; margin-left: 1080px;margin-top: -50px;">
	<div class="form-group">
	<%
		//검색창에 검색한 단어 남아있게 해주기
		String search=(String)session.getAttribute("key");
		String word=(String)session.getAttribute("value");
		if(search==null)
			search="all";
		if(word==null)
			word="";
	%>
		<%-- 검색 폼 --%>
		<select id="search" class="form-control"
			style="width: 100px;">
			<option value="all" <%=search.equals("all")?"selected":""%>>전체</option>
			<option value="myid" <%=search.equals("myid")?"selected":""%>>아이디</option>
			<option value="subject" <%=search.equals("subject")?"selected":""%>>제목</option>
			<option value="content" <%=search.equals("content")?"selected":""%>>내용</option>
		</select>
		<%-- 검색 폼: 체크박스 --%>
<!-- 		<input type="checkbox" value="all" name="search" 
			checked="checked" id="all">전체
			<input type="checkbox" value="subject" name="search"
			id="subject">제목
			<input type="checkbox" value="content" name="search"
			id="content">내용		 -->
		<%-- ajax에서 action호출하기 위한 id --%>
		<input type="text" class="form-control" style="width: 200px;"
			name="word" id="word" placeholder="검색단어입력"
			value="<%=word%>">
		<%-- 검색버튼 --%>
		<button type="button" class="btn btn-warning"
			id="btndatasearch" style="width: 45px;">
			<span class="fas fa-search"></span>
		</button>
	</div>
  </div>
</form>
<%} //else close
%>
<a id="test"></a>
</body>
</html>