<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//id읽기
String id=request.getParameter("id");
//dao 선언
MemberDao dao=new MemberDao();
//메서드 호출
boolean find=dao.isIdSearch(id);
%>
<data><%=find?"yes":"no"%></data>