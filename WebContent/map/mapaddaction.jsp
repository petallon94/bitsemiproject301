

<%@page import="data.dto.StarMapDto"%>
<%@page import="data.dao.StarMapDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//업로드 할 경로 구하기(shopsave 폴더 생성후 거기에 업로드)
	String uploadPath=getServletContext().getRealPath("/shopmapsave2");
	//업로드 할 이미지의 사이즈
	
	int uploadSize=1024*1024*2;//2mb;
	
	MultipartRequest multi=null;
	try{
		multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String shopname=multi.getParameter("shopname");
		String shophp1=multi.getParameter("shophp1");
		String shophp2=multi.getParameter("shophp2");
		String shoppostcode=multi.getParameter("shoppostcode");
		String shopaddr=multi.getParameter("shopaddr");
		String shopaddrdetail=multi.getParameter("shopaddrdetail");
		String shopextraAddress=multi.getParameter("shopextraAddress");
		String shopdetail=multi.getParameter("shopdetail");
		String mpositionx=multi.getParameter("mpositionx");
		String mpositiony=multi.getParameter("mpositiony");
		//여러개의 이미지명을 가져오는 데 여러개일경우, 로 연결
		String shopphoto="";
		//file 타입인 요소만 name 을 얻는 다
		Enumeration en=multi.getFileNames();
		while(en.hasMoreElements())
		{
			String name=(String)en.nextElement();
			//System.out.println(uploadPath);
			//name 에 들어가있는 값(이미지명) 가져오기
			String filename=multi.getFilesystemName(name);
			//System.out.println(name+":"+filename);
			if(filename!=null){
			if(shopphoto.length()==0)
				shopphoto=filename;
			else
				shopphoto+=","+filename;
			}
		}
		//System.out.println(photo);
		
		//dao 선언
		StarMapDao starDao=new StarMapDao();
		//dto 에 데이터 넣기
		StarMapDto starDto=new StarMapDto();
		starDto.setShopname(shopname);
		starDto.setShophp1(shophp1);
		starDto.setShophp2(shophp2);
		starDto.setShoppostcode(shoppostcode);
		starDto.setShopaddr(shopaddr);
		starDto.setShopaddrdetail(shopaddrdetail);
		starDto.setShopextraAddress(shopextraAddress);
		starDto.setShopphoto(shopphoto);
		starDto.setShopdetail(shopdetail);
		starDto.setMpositionx(mpositionx);
		starDto.setMpositiony(mpositiony);
		
		
		//db에 추가
		starDao.insertMap(starDto);
		
		//다시 상품폼으로 이동
		response.sendRedirect("../index.jsp?main=map/map.jsp");
	}catch(Exception e){
		System.out.println("업로드 오류 :"+e.getMessage());
	}
	
%>