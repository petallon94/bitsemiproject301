<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.MemberDao"/>
<jsp:useBean id="dto" class="data.dto.MemberDto"/>
<!-- 전체 데이타 읽어서 dto에 넣기 -->
<jsp:setProperty property="*" name="dto"/>
<%
//메서드 호출
dao.insertMember(dto);
//successpage 페이지 이동
response.sendRedirect("../index.jsp?main=member/successpage.jsp");
%>