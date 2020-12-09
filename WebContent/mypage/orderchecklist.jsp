<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#ordchkl{
		width: 1000px;
		text-align: center;
	}
	#ordchkl table tr td{
		text-align: center;
		height: 80px;
		border-bottom: 1px solid #eee;
	}
	#ordchkl table tr th{
		font-weight: 500;
		font-size: 12pt;
		background-color: #f6c244;
		height: 50px;
		text-align: center;
	}
	
	.container{
		margin: 20px 0 40px 0;
	}
	.container ul li a{
		width:38px;
	}
	#ordchkl .ordname{
		font-size: 24pt;
		font-weight: 500;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
<%
	//dao선언
	FOrderDao db = new FOrderDao();
	
	String orderid = (String)session.getAttribute("myid");

	int totalCount=db.getTotalCount(orderid); //총 글의 갯수
	int perPage=5; //한페이지당 보여지는 글의 갯수
	int perBlock=5; //한블럭당 보여지는 페이지번호의 수
	int currentPage;//현재페이지,만약 널값이면 1로 줌
	int totalPage; //총 페이지의 갯수
	int startNum;//한페이지당 보여지는 시작번호
	int endNum;//한페이지당 보여지는 끝번호
	int startPage; //한 블럭당 보여지는 시작페이지번호
	int endPage; //한 블럭당 보여지는 끝페이지번호
	int no; //게시글에 붙일 시작번호
	
	String pageNum=request.getParameter("pageNum");
	//현재 페이지
	if(request.getParameter("pageNum")!=null)
		currentPage=Integer.parseInt(request.getParameter("pageNum"));
	else
		currentPage=1;
	//총 페이지수
	totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
	//각 페이지에 보여질 시작번호와 끝번호 구하기
	startNum=(currentPage-1)*perPage;
	endNum=startNum+perPage;
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
	
	List<FOrderDto> list=db.getOrderList(startNum, endNum, orderid);
	//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
	no=totalCount-((currentPage-1)*perPage);
	
	DecimalFormat df = new DecimalFormat("###,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	String name=dao.getName(orderid);
%>
<div id="ordchkl">
	<div class="ordname"><%=name %>님의 주문내역</div>
	<table width="800" style="margin: 0 auto;">
		<tr>
			<th width="10%">No</th>
			<th width="30%">음료정보</th>
			<th width="20%">옵션</th>
			<th width="20%">가격</th>
			<th width="20%">상태</th>
		</tr>
		<%-- <tr><td colspan="5"><%=totalCount %></td></tr> --%>
		<%if(totalCount==0){ %>
			<tr align="center" height="50">
				<td colspan="5" style="vertical-align: middle;"><b>주문내역이 없습니다</b></td>
			</tr>
		<%}%>
		<%for(FOrderDto dto:list) {%>
			<tr>
				<td><%=no-- %></td>
				<td><b><%=dto.getFmnname() %></b></td>
				<td><%=dto.getFsize() %> / <%=dto.getFtemp() %><br><span style="color: #bbb;"><%=sdf.format(dto.getForderdate())%></span></td>
				<td><%=df.format(dto.getForderprice()) %> 원</td>
				<td>주문 완료</td>
			</tr>
		<%} %>
	</table>
	<div class="container">
		<ul class="pagination justify-content-center">
		 <%
		  	if(startPage>1)
			{%>
				<li class="page-item"><a class="page-link" href="javascript:paging(<%=startPage-1%>)">&lt;이전</a></li>
			<%}
	  		for(int i=startPage; i<=endPage; i++)
			{
			if(i==currentPage)
			{%>
				<li class="page-item active"><a class="page-link" href="javascript:paging(<%=i%>)"><%=i %></a></li>
			<%}else{%>
				<li class="page-item"><a class="page-link" href="javascript:paging(<%=i%>)"><%=i %></a></li>
			<%}
			}
	  		if(endPage<totalPage)
			{%>
				<li class="page-item"><a class="page-link" href="javascript:paging(<%=endPage+1%>)">다음&gt;</a></li>
			<%}
	  	%>
	  </ul>

	</div>
</div>
<script type="text/javascript">
	function paging(pn)
	{
		$(".my_page_content").load("mypage/orderchecklist.jsp?pageNum="+pn);
	}
</script>
<div id="ordchkl_ad">
	<img src="">
</div>
</body>
</html>
