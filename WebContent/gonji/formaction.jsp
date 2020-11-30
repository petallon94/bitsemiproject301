
<%@page import="data.dto.GonjiDto"%>
<%@page import="data.dao.GonjiDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<%
	GonjiDao db=new GonjiDao();
	
	MultipartRequest multi=null;
	String realFolder=getServletContext().getRealPath("/gonsave");
	int uploadSize=1024*1024*2;
	
	try{
		multi=new MultipartRequest(request,realFolder,
				uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String gonsubject=multi.getParameter("gonsubject");
		String gonid=multi.getParameter("gonid");
		String goncontent=multi.getParameter("goncontent");
		
		GonjiDto dto=new GonjiDto();
		dto.setGoncontent(goncontent);
		dto.setGonid(gonid);
		dto.setGonsubject(gonsubject);
		
		db.insertGonji(dto);
		
		//최근 추가된 num구하기
		int gonnum=db.getMaxNum();
		//글 올린 내용보기로 바로 이동하기
		String path="../index.jsp?main=gonji/content.jsp?num="+gonnum+"&pageNum=1";
		response.sendRedirect(path);
		
	}catch(Exception e){
		out.write("파일 업로드 오류:"+e.getMessage());
	}
%>
<body>

</body>
</html>





