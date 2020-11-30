<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.StarMapDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.StarMapDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//dao선언
	StarMapDao StarDao=new StarMapDao();
	//목록 가져오기
	List<StarMapDto> list=StarDao.getMainList();
	//반복문
	%>
	
<list>
<%
	for(StarMapDto dto:list)
	{%>
		<store>
			<num><%=dto.getShopnum() %></num>
			<shopname><%=dto.getShopname() %></shopname>
			<shophp><%=dto.getShophp() %></shophp>
			<shopaddr><%=dto.getShopaddr()%></shopaddr>
			<shopaddrdetail><%=dto.getShopaddrdetail()%></shopaddrdetail>
			<shopphoto><%=dto.getShopphoto()%></shopphoto>
			<shopdetail><%=dto.getShopdetail()%></shopdetail>
			<mpositionx><%=dto.getMpositionx()%></mpositionx>
			<mpositiony><%=dto.getMpositiony()%></mpositiony>
		</store>
	<%}

%>
</list>