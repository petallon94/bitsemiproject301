<%@page import="java.sql.Timestamp"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dto.OrderDto"%>
<%@page import="data.dao.OrderDao"%>
<%@page import="data.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	OrderDao dao = new OrderDao();
	OrderDto odto = new OrderDto();
	MenuDto medto = new MenuDto();
	MemberDto mdto = new MemberDto();
	
	String orderid = request.getParameter("orderid");
	String mnname = request.getParameter("mnname");
	String size = request.getParameter("size");
	String temp = request.getParameter("temp");
	int orderprice = Integer.parseInt(request.getParameter("orderprice"));
	String takeout = request.getParameter("takeout");
	
	odto.setOrderid(orderid);
	odto.setMnname(mnname);
	odto.setSize(size);
	odto.setTemp(temp);
	odto.setOrderprice(orderprice);
	odto.setTakeout(takeout);
	
	dao.insertFinishOrder(odto);
	
	response.sendRedirect("../index.jsp?main=order/orderfinish.jsp");
%>