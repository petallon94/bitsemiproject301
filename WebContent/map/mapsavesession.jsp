<%@page import="java.util.List"%>
<%@page import="data.dto.StarMapDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.StarMapDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	String key=request.getParameter("search");
	String value=request.getParameter("word");
	/* System.out.println(key);
	System.out.println(value); */
	//한글 엔코딩
	
%>
<!-- dto,dao usebean -->
	<jsp:useBean id="dao" class="data.dao.StarMapDao"></jsp:useBean>
	<jsp:useBean id="dto" class="data.dto.StarMapDto"></jsp:useBean>
<!-- setproperty : 전체데이터 읽기 -->
	<jsp:setProperty property="*" name="dto"/>
<%

	List<StarMapDto> list=dao.getSearchList(key, value);

	
	/* System.out.println(key);
	System.out.println(value); */
%>
<list>
<%
	for(StarMapDto mdto:list)
	{%>
		<store>
			<shopnum><%=dto.getShopnum()%></shopnum>
			<shopname><%=dto.getShopname() %></shopname>
			<shophp><%=dto.getShophp() %></shophp>
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