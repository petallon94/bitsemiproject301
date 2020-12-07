<%@page import="data.dto.StarMapDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.StarMapDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	String key = request.getParameter("mapsearch");
	String value = request.getParameter("word");
	//dao선언
	StarMapDao StarDao=new StarMapDao();
	//목록 가져오기
	List<StarMapDto> list=StarDao.getSearchList(key, value);
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