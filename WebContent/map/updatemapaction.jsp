<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//한글 엔코딩
	request.setCharacterEncoding("utf-8");
%>
<!-- dto,dao usebean -->
	<jsp:useBean id="dao" class="data.dao.StarMapDao"></jsp:useBean>
	<jsp:useBean id="dto" class="data.dto.StarMapDto"></jsp:useBean>
<!-- setproperty : 전체데이터 읽기 -->
	<jsp:setProperty property="*" name="dto"/>
<%

	dao.updateShop(dto);
%>
	<script type="text/javascript">
	window.open("about:blank","_self").close();
	</script>