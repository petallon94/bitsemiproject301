<%@page import="data.dto.StarMapDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.StarMapDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 매장정보 페이지 -->
	<%
		StarMapDao db = new StarMapDao();

	int totalCount = db.getTotalCount();
	int perPage = 3; //한 페이지당 보여지는 글의 갯수
	int perBlock = 4; //한 블럭당 출력할 페이지의 갯수
	int totalPage; //총 페이지의 갯수
	int startPage; //각 블럭당 시작 페이지 번호
	int endPage; //각 블럭당 끝 페이지 번호
	int start; //각 블럭당 불러올 글의 시작번호
	int end; //각 블럭당 불러올 글의 끝번호
	int currentPage; //현재 보여질 페이지번호

	//현재 페이지 번호 구하기
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null)
		currentPage = 1;//페이지번호가 없을 경우 무조건 1페이지로 간다
	else
		currentPage = Integer.parseInt(pageNum);

	//총 페이지 구하기(예: 총글수가 9 이구 한페이지당 2개씩 볼 경우)
	totalPage = totalCount / perPage + (totalCount % perPage > 0 ? 1 : 0);
	//시작페이지와 끝페이지 구하기
	//예: 한페이지당 3개만 볼경우 현재 페이지가 2라면 sp:1, ep:3
	//현재 페이지가 7이라면 sp:7 ep:9
	startPage = (currentPage - 1) / perBlock * perBlock + 1;
	endPage = startPage + perBlock - 1;
	//마지막 블럭은 endPage 를 totalPage 로 해놔야한다
	if (endPage > totalPage)
		endPage = totalPage;
	//mysql 은 첫 글이 0번(오라클은 1번)
	start = (currentPage - 1) * perPage;

	//각 페이지에서 출력할 시작번호
	//총 50개일 경우 1페이지는 50
	//               2페이지는 40
	int no = totalCount - (currentPage - 1) * perPage;
	//mysql 에서 해당 페이지에 필요한 목록 가져오기
	List<StarMapDto> getlist = db.getList(start, perPage);
	%>


	<%
		if (totalCount > 0) {
	%>
	<div class="hadanhadan">
		<div>
			<table>
				<%
					for (StarMapDto dto : getlist) {
				%>
					
				<div id="maphadan" align="left">
					<input id="shopnum" type="hidden" name="shopnum" value="<%=dto.getShopnum()%>">
					<div id="hadan">
						<h3><%=dto.getShopname()%></h3>
					</div>
					<div id="hadan"><%=dto.getShopaddr()%></div>
					<div id="hadan"><%=dto.getShopaddrdetail()%></div>
					<div id="hadan"><%=dto.getShophp()%></div>
					<div id="hadan"><%=dto.getShopdetail()%></div>
				</div>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="pagepage">
		<div class="container" id="mappagination">
			<ul class="pagination">
				<%
					if (startPage > 1) {
				%>
				<li class="page-item mappage"><a class="page-link"
					href="index.jsp?main=map/map.jsp?pageNum=<%=startPage - 1%>#mappage">이전</a></li>
				<%
					}
				for (int i = startPage; i <= endPage; i++) {
				String url = "index.jsp?main=map/map.jsp?pageNum=" + i;//이동할 페이지 추가
				if (i == currentPage) {
				%>
				<li class="page-item mappage"><a class="page-link"
					href="<%=url%>#mappage"><%=i%></a></li>
				<%
					} else {
				%>
				<li class="page-item mappage"><a class="page-link"
					href="<%=url%>#mappage"><%=i%></a></li>
				<%
					}
				}

				if (endPage < totalPage) {
				%>
				<li class="page-item mappage"><a class="page-link"
					href="index.jsp?main=map/map.jsp?pageNum=<%=endPage + 1%>#mappage">다음</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<%}%>
	<a id="mappage"></a>
	<!-- 매장정보 페이지-->
</body>
</html>