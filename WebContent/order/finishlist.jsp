<%@page import="data.dto.OrderDto"%>
<%@page import="data.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	int ordernum = Integer.parseInt(request.getParameter("ordernum"));
	
	OrderDao dao = new OrderDao();
	OrderDto dto = dao.getOrderData(ordernum);
	
	dao.insertFinishOrder(dto);
	dao.deleteOrder(ordernum);
	
%>
