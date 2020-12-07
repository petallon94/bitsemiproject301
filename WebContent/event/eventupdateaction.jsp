<%@page import="data.dto.EventDto"%>
<%@page import="data.dao.EventDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//업로드 경로
	String uploadPath=getServletContext().getRealPath("/eventsave");
	System.out.println(uploadPath);
	//업로드할 사이즈
	int uploadSize=1024*1024*3;
	
	MultipartRequest multi=null;
	
	
	
	try{
		multi=new MultipartRequest(request,uploadPath,uploadSize,
				"utf-8",new DefaultFileRenamePolicy());
		
		String eventnum=multi.getParameter("eventnum");
		String id=multi.getParameter("id");
		String evsubject=multi.getParameter("evsubject");
		
		
		
		//evnetlist이미지(작은사진, 1개만 업로드가능)
		String evlistimage="";
		Enumeration en=multi.getFileNames();
		String file1=(String)en.nextElement();
		evlistimage=multi.getFilesystemName(file1);
		
		
		
		
		
		
		
		String evcontent=multi.getParameter("evcontent");
		
		
		//본문에 들어갈사진(3개까지 업로드가능)
		String evcontentimage="";
		
		while(en.hasMoreElements())
		{
			String file2=(String)en.nextElement();
			String fileName2=multi.getFilesystemName(file2);
			
			if(fileName2!=null)
			{
			if(evcontentimage.length()==0)
				evcontentimage=fileName2;
			else
				evcontentimage+=","+fileName2;
			}
		}
		
		String evstartday=multi.getParameter("evstartday");
		String evendday=multi.getParameter("evendday");
		
		
		EventDao dao=new EventDao();
		EventDto dto=new EventDto();
		
		
		dto.setId(id);
		dto.setEventnum(eventnum);
		dto.setEvsubject(evsubject);
		dto.setEvlistimage(evlistimage);
		dto.setEvcontent(evcontent);
		dto.setEvcontentimage(evcontentimage);
		dto.setEvstartday(evstartday);
		dto.setEvendday(evendday);
		
		dao.updateEvent(dto);
		
		
		response.sendRedirect("../index.jsp?main=event/eventlist.jsp?eventnum="+eventnum);
		
	}catch(Exception e){
		System.out.println("업로드 오류:"+e.getMessage());
	}
%>