<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="data.dao.OrderDao"/>
<jsp:useBean id="odto" class="data.dto.OrderDto"/>
<jsp:useBean id="medto" class="data.dto.MenuDto"/>
<jsp:useBean id="mdto" class="data.dto.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertCart(odto);
%>