<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GonjiDto"%>
<%@page import="data.dao.GonjiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 메인페이지에 필요한 링크/부트스트랩  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	/* #cl-dashboard{display: none;} */
	
/*폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap');

	/* body{
		display: flex;
		width: 100%;
		margin-left: 230px;	
		font-family: 'Noto Serif KR', serif;
	} */
	
	/* 테이블  */
	tbody{
		width: 100%;
	}
	table.table{
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		display: flex;
		width: 100%;
		margin-left: 250px;	
	}
 	#subject{
 		width: 850px;
		height:40px;
		line-height: 40px;
		background-color: #white;
	}
	#datereadcount{
		width: 150px;
		color: gray;
		font-size: 9pt;
		float: right;
	}
	#id{
		border-bottom: 1px solid gray;
		width: 1000px;
	}
	#content{
		height: 350px;
		background-color: white;
		width: 1000px;
		
	}
.img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.4);z-index:1;}
.sub_visual .txt{position: absolute;top:50%;left:50%;transform: translate(-50%, -50%);color: white;z-index: 2;text-align: center;}
.sub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
.sub_visual .txt p{font-size: 14pt; font-weight: 300;}
.sub_visual{position: relative;background-image: url(./image/close-up-of-hands-barista-wide.jpg);height: 400px;background-size: cover;}
	
	
	
		/* sub */
.ordsub_visual{min-height:399px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.ordsub_visual .txt{width:100%;position:absolute;top:120px;left:0;}
.ordsub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:500;}
.ordsub_visual .txt h1:after{display:block;width:40px;height:4px;margin:32px auto;background:#202020;content:'';}
.ordsub_visual .txt p{font-size:1.25rem;font-weight:300;color:white;}
.ordsub_visual.bg-menu{background-image:url(./image/people-coffee-shop-wide.jpg);}
	
	
</style>

<script type="text/javascript">
$(function(){
	//공지글 삭제 이벤트
	$("input.del").click(function(){
		var gonnum=$(this).attr("gonnum");
		var a=confirm("삭제하려면 [확인]을 눌러주세요");
		if(a){
			//alert(gonnum);
			del(gonnum);
			location.href="index.jsp?main=gonji/gonjilist.jsp";
		}
	});//공지글 삭제 이벤트 close
});//$function close

//사용자 함수
function del(gonnum){
	$.ajax({
		type:"get",
		url:"gonji/gondelete.jsp",
		dataType:"html",
		data:{"gonnum":gonnum},
		success:function(d){
			
		}
	});
}
</script>
</head>
<body>

<div class="sub_visual bg-menu">

    <div class="txt">
        <h1>스타보틀</h1>
        <p>스타보틀의 공지사항입니다.</p>
    </div>

    <div class="img-cover"></div>
</div>


<%
	//이부분이 formaction의 String path="../index.jsp?main=gonji/content.jsp?num="
	//에서 변수명이 마지막 num으로 넘어감
	String gonnum=request.getParameter("num");	
	String pageNum=request.getParameter("pageNum");
	String key=request.getParameter("key");
	
	//key 값이 널값이 아니면서 'list' 일경우 
	//(이유:수정후에도 content.jsp 로 오기때문에 목록에서
    //			올 경우에만 증가함)
	//조회수 증가
	GonjiDao db=new GonjiDao();
	if(key!=null && key.equals("list"))
		db.updateReadcount(gonnum);
	
	//번호에 해당하는 dto 가져오기
	GonjiDto dto=db.getData(gonnum);
	
	//제대로 넘어오는지 확인하기
	//System.out.println(dto.getGoncontent());
	//System.out.println(dto.getGonwriteday());
	
	//mysql에서는 시간까지 나오게 하려면 datetime이어야 한다
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//<관리자 로그인 id확인을 위한 자바함수>
	//세션 로그인상태
	String loginok=(String)session.getAttribute("loginok");
	//세션에서 id 얻기
	String myid=(String)session.getAttribute("myid");
	//dao 선언
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	//String name=dao.getName(myid);
%>	

<br><br><br><br><br>
<h2 style="display: inline;margin-left: 410px;">공지사항	</h2>
<table class="table table-striped" style="width: 1000px;margin-left: 410px;">

<tbody>
 <tr>
	<%--제목폼--%>
	<td id="subject">
		<b style="font-size: 1.5em;margin-left: 25px;">
		  <%=dto.getGonsubject()%></b>
	</td>
	<%--날짜/조회수폼 --%>
	<td id="datereadcount">
		<span>
		<%=sdf.format(dto.getGonwriteday())%>
		<br><br>
		조회수&nbsp; <%=dto.getGonreadcount()%>
		</span>
	</td>
  </tr>
  <%--아이디출력폼 --%>
  <tr id="id">
	<td colspan="2" valign="top">
		<img src="image/sb_symbol.jpg" width="30">
		<b><%=dto.getGonid()%></b>
	</td>
  </tr>
  <br><br>
  <%--내용폼:자동줄넘김 적용하기(style) --%>		
  <tr id="content">	
    <td colspan="2">
		<pre style="white-space: pre-wrap;
		  word-wrap:break-word;border: none;">
		  <%=dto.getGoncontent()%>
		</pre>
    </td>
  </tr>

<%-- 버튼들 --%>
<%
	//myid가 StarBottle(관리자)인 경우에만 보이기

	if(loginok!=null && myid.equals("admin"))

	{%>
	<tr>
		<td colspan="2" align="right">
		  <input type="button" class="btn btn-warning"
		    value="글쓰기" style="width: 80px;"
		    onclick="location.href='index.jsp?main=gonji/gonjiform.jsp'">
		  <input type="button" class="btn btn-info"
		    value="목록" style="width: 80px;"
		    onclick="location.href='index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=pageNum%>'">
		  <input type="button" class="update btn btn-dark"
			onclick="location.href='index.jsp?main=gonji/gonupdateform.jsp?num=<%=gonnum%>&pageNum=<%=pageNum%>'"
			style="width: 80px;" value="수정">
		  <input type="button" class="del btn btn-danger"
		    value="삭제" style="width: 80px;"
		    gonnum="<%=dto.getGonnum()%>">		
		</td>
	</tr>	
	<%//로그인 안한 경우,일반회원의 경우 보이는 페이지
	}else{%>
	<tr>
		<td colspan="2" align="right">			
			<input type="button" class="btn btn-info btn-lg"
			  value="목록" style="width: 180px;"
			  onclick="location.href='index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=pageNum%>'">	
		</td>
	</tr>	
</tbody>		
		<%}
	%>	
</table>
</body>
</html>