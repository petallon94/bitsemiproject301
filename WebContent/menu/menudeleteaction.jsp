<%@page import="data.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("utf-8"); %>

<%
	String menunum = request.getParameter("menunum");
	
	MenuDao dao = new MenuDao();
	
		
		dao.deleteMenu(menunum);
		response.sendRedirect("../index.jsp?main=mypage/adminpagemain.jsp");
	
%>




