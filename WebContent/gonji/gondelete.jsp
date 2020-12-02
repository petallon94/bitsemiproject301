<%@page import="data.dao.GonjiDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//gonnum읽기
	String gonnum=request.getParameter("gonnum");
	//dao선언
	GonjiDao dao=new GonjiDao();
	//삭제 메서드 호출
	dao.deleteGonji(gonnum);
%>