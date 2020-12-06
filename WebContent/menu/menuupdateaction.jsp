<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="java.util.Enumeration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	//업로드 할 경로 구하기
	
	
	
	//getServletContext() : 웹 어플리케이션이 설치되어 있는 경로를 리턴해줌
	//getRealPath() : ServletContext의 getRealPath는 웹어플리케이션이 실행된 곳. 즉 설치된 곳의 경로를 찾음
	
	String uploadPath = getServletContext().getRealPath("/menusave");
	//System.out.println(uploadPath);
	int uploadSize = 1024*1024*2; //2mb 

	
	MultipartRequest multi = null;
	try{
		
		//menuid,menuname,category,menuprice,mipgoday,menuphoto,menudetail
		
		multi = new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		
		
		String menuid = multi.getParameter("upmenuid");
		int menunum = Integer.parseInt(multi.getParameter("upmenunum"));
		String menuname = multi.getParameter("upmenuname");
		String category = multi.getParameter("upmenucategory");
		
		String mipgoday = multi.getParameter("upmipgoday");
		int menuprice = Integer.parseInt(multi.getParameter("upmenuprice"));
		String menudetail = multi.getParameter("upmenudetail");
		
		//고친부분
		int menukcal =Integer.parseInt(multi.getParameter("upmenukcal"));
		int menunat =Integer.parseInt(multi.getParameter("upmenunat"));
		int menusugar =Integer.parseInt(multi.getParameter("upmenusugar"));
		int menucaff =Integer.parseInt(multi.getParameter("upmenucaff"));
		
		
		
		
		
		String menuphoto = ""; //사진
		
		
		String premenuphoto = multi.getParameter("premenuphoto");
		
		///사진/////
		
		Enumeration en = multi.getFileNames();
		while(en.hasMoreElements()){
			String name = (String)en.nextElement();
			
			String fileName = multi.getFilesystemName(name);
			//System.out.println(name+" : "+fileName);
			
			if(fileName!=null){
			if(menuphoto.length()==0){
				menuphoto = fileName;
				
			}else
				menuphoto = premenuphoto;
			
		}
	}
		
		MenuDao dao = new MenuDao();
		MenuDto dto = new MenuDto();
		
		dto.setMenuid(menuid);
		dto.setMenunum(menunum);
		dto.setMenuname(menuname);
		dto.setCategory(category);
		dto.setMenuprice(menuprice);
		dto.setMipgoday(mipgoday);
		dto.setMenuphoto(menuphoto);
		dto.setMenudetail(menudetail);
		
		dto.setMenukcal(menukcal);
		dto.setMenunat(menunat);
		dto.setMenusugar(menusugar);
		dto.setMenucaff(menucaff);
		
		
		dao.updateMenu(dto);
		
		
		response.sendRedirect("../index.jsp?main=mypage/adminpagemain.jsp");
		
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("업로드오류 : "+e.getMessage());
	}
	

%>