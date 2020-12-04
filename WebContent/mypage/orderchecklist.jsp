<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.FOrderDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.FOrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#ordchkl table tr td{
		text-align: center;
	}
</style>
</head>
<%
	//dao선언
	FOrderDao db = new FOrderDao();

	int totalCount=db.getTotalCount(); //총 글의 갯수
	int perPage=5; //한페이지당 보여지는 글의 갯수
	int perBlock=5; //한블럭당 보여지는 페이지번호의 수
	int currentPage;//현재페이지,만약 널값이면 1로 줌
	int totalPage; //총 페이지의 갯수
	int startNum;//한페이지당 보여지는 시작번호
	int endNum;//한페이지당 보여지는 끝번호
	int startPage; //한 블럭당 보여지는 시작페이지번호
	int endPage; //한 블럭당 보여지는 끝페이지번호
	int no; //게시글에 붙일 시작번호
	
	//현재 페이지
	if(request.getParameter("pageNum")!=null)
		currentPage=Integer.parseInt(request.getParameter("pageNum"));
	else
		currentPage=1;
	//총 페이지수
	totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
	//각 페이지에 보여질 시작번호와 끝번호 구하기
	startNum=(currentPage-1)*perPage+1;
	endNum=startNum+perPage-1;
	//예를 들어 모두 45개의 글이 있을경우
	  //마지막 페이지는 endnum 이 45 가 되야함
	  if(endNum>totalCount)
			endNum=totalCount;
	
	//각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
	startPage= (currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	//예를 들어 총 34페이지일경우
	//마지막 블럭은 30-34 만 보여야함
	if(endPage>totalPage)
	   endPage=totalPage;
	
	List<FOrderDto> list=db.getOrderList(startNum, endNum);
	//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
	no=totalCount-((currentPage-1)*perPage);
	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
%>
<body>
<div id="ordchkl">
	<table width="800">
		<tr>
			<th width="10%">No</th>
			<th width="30%">음료정보</th>
			<th width="20%">옵션</th>
			<th width="20%">가격</th>
			<th width="20%">상태</th>
		</tr>
		<%if(totalCount==0){ %>
			<tr align="center" height="50">
				<td colspan="5" style="vertical-align: middle;"><b>주문내역이 없습니다</b></td>
			</tr>
		<%} %>
		<%for(FOrderDto dto:list) {%>
			<tr>
				<td><%=no-- %></td>
				<td><b><%=dto.getFmnname() %></b></td>
				<td><%=dto.getFsize() %> / <%=dto.getFtemp() %><br><%=dto.getForderdate() %></td>
				<td><%=nf.format(dto.getForderprice()) %></td>
				<td>주문 완료</td>
			</tr>
		<%} %>
	</table>
</div>
</body>
</html>