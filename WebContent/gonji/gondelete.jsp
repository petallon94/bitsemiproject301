<%@page import="data.dao.GonjiDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//gonnum�б�
	String gonnum=request.getParameter("gonnum");
	//dao����
	GonjiDao dao=new GonjiDao();
	//���� �޼��� ȣ��
	dao.deleteGonji(gonnum);
%>