<%@page import="data.dao.GonjiDao"%>
<%@page import="data.dto.GonjiDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  gonnum�� �ش��ϴ� ������ �����ͼ� ���� ���
	    ������ �ۼ��ϱ�
	  hidden���� gonnum�� pageNum�� �־��ֱ�     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	//������gonnum�� getdata ������(gonnum)�̶� ���ƾ� �Ѵ�
	String gonnum=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	//num�� �ش��ϴ� dto��������
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