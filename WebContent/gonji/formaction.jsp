
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
		//제목에 html태그 안되게 < >특수기호로 변경(문자열text)로 저장한다
		String gonsubject=multi.getParameter("gonsubject").replace("<", "&lt;").replace(">", "&gt;");
		String gonid=multi.getParameter("gonid");
		String goncontent=multi.getParameter("goncontent");
		
		//파라미터로 받은 입력된 값들을 dto에 넣어준다
		GonjiDto dto=new GonjiDto();
		dto.setGoncontent(goncontent);
		dto.setGonid(gonid);
		dto.setGonsubject(gonsubject);
		
		db.insertGonji(dto);
		
		//최근 추가된 num구하기
		int gonnum=db.getMaxNum();
		//글 올린 내용보기로 바로 이동하기
		//content의 String gonnum=request.getParameter("num");파라미터 num과 일치
		String path="../index.jsp?main=gonji/content.jsp?num="+gonnum+"&pageNum=1";
		response.sendRedirect(path);
		
	}catch(Exception e){
		out.write("파일 업로드 오류:"+e.getMessage());
	}
%>
<body>

</body>
</html>





