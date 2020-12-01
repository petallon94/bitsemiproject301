<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//로그인 상태 세션 삭제
		session.removeAttribute("loginok");
		//index 로 이동
		response.sendRedirect("../index.jsp");
%>