<%@page import="data.dao.GonjiDao"%>
<%@page import="data.dto.GonjiDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  gonnum에 해당하는 데이터 가져와서 폼에 출력
	    수정폼 작성하기
	  hidden으로 gonnum과 pageNum을 넣어주기     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	//변수명gonnum이 getdata 변수명(gonnum)이랑 같아야 한다
	String gonnum=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	//num에 해당하는 dto가져오기
	GonjiDao dao=new GonjiDao();
	GonjiDto dto=dao.getData(gonnum);
%>
<body>
<div class="gonupdateform">
  <form action="gonji/gonupdateaction.jsp" method="post">
    <!-- hidden -->
    <input type="text" name="num" value="<%=gonnum%>">
    <input type="text" name="pageNum" value="<%=pageNum%>">
    
    
  </form>
</div>
</body>
</html>