<?xml version="1.0" encoding="UTF-8"?>

<%@page import="data.dto.StarMapDto"%>
<%@page import="data.dao.StarMapDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//dao선언
	StarMapDao StarDao=new StarMapDao();
	//목록 가져오기
	List<StarMapDto> list=StarDao.getHp1Hp2List();
	%>
	
<list>
<%
	for(StarMapDto dto:list)
	{%>
		<store num="<%=dto.getShopnum()%>">
			<shopname><%=dto.getShopname() %></shopname>
			<shophp1><%=dto.getShophp1() %></shophp1>
			<shophp2><%=dto.getShophp2() %></shophp2>
			<shoppostcode><%=dto.getShoppostcode()%></shoppostcode>
			<shopaddr><%=dto.getShopaddr()%></shopaddr>
			<shopextraAddress><%=dto.getShopextraAddress()%></shopextraAddress>
			<shopaddrdetail><%=dto.getShopaddrdetail()%></shopaddrdetail>
			<shopphoto><%=dto.getShopphoto()%></shopphoto>
			<shopdetail><%=dto.getShopdetail()%></shopdetail>
			<mpositionx><%=dto.getMpositionx()%></mpositionx>
			<mpositiony><%=dto.getMpositiony()%></mpositiony>
		</store>
	<%}

%>
</list>