<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//id읽기
String id=request.getParameter("id");
MemberDao dao=new MemberDao();

boolean find=dao.isIdSearch(id);
%>
<data><%=find?"yes":"no"%></data>
