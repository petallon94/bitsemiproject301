<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//gonlist에서 검색관련 변수 받기
	String search=request.getParameter("search");
	String word=request.getParameter("word");
	
	//세션에 key,value로 저장
	//key값은 같은 key로 주면 덮어쓴다
	session.setAttribute("key", search);
	session.setAttribute("value", word);
%>