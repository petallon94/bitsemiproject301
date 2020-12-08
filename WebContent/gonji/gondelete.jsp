<%@page import="data.dao.GonjiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//gonnum읽기
	String gonnum=request.getParameter("gonnum");
	//dao선언
	GonjiDao dao=new GonjiDao();
	//삭제 메서드 호출
	dao.deleteGonji(gonnum);
%>