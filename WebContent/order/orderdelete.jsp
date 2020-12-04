<%@page import="data.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//xml형태로 작성
	//ordernum읽기
	int ordernum = Integer.parseInt(request.getParameter("ordernum"));

	//dao선언
	OrderDao dao = new OrderDao();
	
	//장바구니 목록 삭제
	dao.deleteOrder(ordernum);
%>