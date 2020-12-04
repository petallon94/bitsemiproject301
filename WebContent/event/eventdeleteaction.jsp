<%@page import="java.io.File"%>
<%@page import="data.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num, pageNum 읽기
	String eventnum=request.getParameter("eventnum");
	String pageNum=request.getParameter("pageNum");
	//dao선언
	EventDao dao=new EventDao();
	//num에 해당하는 photo값 얻기
	String image1=dao.getData(eventnum).getEvlistimage();
	String image2=dao.getData(eventnum).getEvcontentimage();
	//save폴더의 실제 서버에서의 위치를 구한다
	String realPath=getServletContext().getRealPath("/eventsave");
	//실제업로드된 곳의 이미지에 대한 file객체 생성
	File file1=new File(realPath+"\\"+image1);
	File file2=new File(realPath+"\\"+image2);
	//해당폴더에서 photo를 파일삭제
	file1.delete();
	file2.delete();
	dao.deleteEvent(eventnum);
	//다시 보던 페이지로 이동
	response.sendRedirect("../index.jsp?main=event/eventlist.jsp");
%>