<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="data.dao.OrderDao"/>
<jsp:useBean id="dto" class="data.dto.OrderDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertCart(dto);
%>