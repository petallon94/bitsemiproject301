<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//gonlist���� �˻����� ���� �ޱ�
	String search=request.getParameter("search");
	String word=request.getParameter("word");
	
	//���ǿ� key,value�� ����
	//key���� ���� key�� �ָ� �����
	session.setAttribute("key", search);
	session.setAttribute("value", word);
%>