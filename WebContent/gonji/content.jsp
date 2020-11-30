<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GonjiDto"%>
<%@page import="data.dao.GonjiDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
	
</style>
</head>
<body>
<%
	String gonnum=request.getParameter("gonnum");	
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
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>	
<table class="table table-striped" style="width: 500px;">
	<tr>
		<td width="350">
			<b><%=dto.getGonsubject()%></b>
		</td>
		<td>
			<span style="color: #ccc;font-size: 9pt;">
			<%=sdf.format(dto.getGonwriteday())%></span>
		</td>
	</tr>
	<tr height="350">
		<td colspan="2" valign="top">
			<img src="image/chr15.gif" width="30">
			<b><%=dto.getGonid()%></b>
			<br><br>			
			<pre><%=dto.getGoncontent()%></pre>	
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<span style="color: gray;font-size: 9pt;">
			조회수&nbsp; <%=dto.getGonreadcount()%>
			</span>			
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="button" class="btn btn-warning btn-xs"
			  value="글쓰기" style="width: 60px;"
			  onclick="location.href='index.jsp?main=gonji/gonjiform.jsp'">
			<input type="button" class="btn btn-dark btn-xs"
			  value="글목록" style="width: 60px;"
			  onclick="location.href='index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=pageNum%>'">			
		</td>
	</tr>	
</table>
</body>
</html>