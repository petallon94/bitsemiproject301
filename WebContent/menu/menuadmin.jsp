<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<style>

.menu_total h4{display:flex;justify-content:center;position:relative;margin-top : 20px; margin-right : 580px; overflow:hidden;font-size : 20px;}

.menu_stat {display:flex;justify-content:center;position:relative; margin:0 auto; margin-top:20px; overflow:hidden;}
.menu_stat a{font-size : 25px;color:black; margin-left :5px;}
.menu_coffee{display:inline-block;postion:relative; border : 4px solid #eeeeee; margin :0 auto; width :200px;height :200px; overflow : hidden;}
.menu_dess{display:inline-block;postion:relative; border : 4px solid #eeeeee; margin :0 auto; width :200px;height :200px; overflow : hidden;}
.menu_drink{display:inline-block;postion:relative; border : 4px solid #eeeeee; margin :0 auto; width :200px;height :200px; overflow : hidden;}
.menu_prep{display:inline-block;postion:relative; border : 4px solid #eeeeee; margin :0 auto; width :200px;height :200px; overflow : hidden;}

.coffee_count{display: flex;justify-content : center;align-items: flex-end;font-size : 100px;}
.dess_count{display: flex;justify-content : center;align-items: flex-end;font-size : 100px;}
.drink_count{display: flex;justify-content : center;align-items: flex-end;font-size : 100px;}
.prep_count{display: flex;justify-content : center;align-items: flex-end;font-size : 100px;}
/*숫자 나오는 부분*/


.menu_insert{display:flex;justify-content :center;position:relative; margin:0 auto; overflow:hidden;}

/*페이징부분 */
.menus-view {position:relative; margin:0 auto; margin-top : 30px; margin-bottom:20px; overflow:hidden;}
.menus-view .menus-outline {position:relative;border:1px solid #e0e0e0; margin:0 auto;width:720px; border:4px solid #eeeeee;overflow:hidden;}

.menus-view .menus-box {position:relative; float:left; width:288px;text-align: center;padding-top: 45px;}
.menus-view .menus-box img {width:206px;}

.menus-view .menus-bg {position:relative; float:left; width:407px;min-height: 270px;border-left:4px solid #EEEEEE;height: auto;padding: 10px;}


.menu_update{display:flex;justify-content :flex-end;position:relative; margin:0 auto; overflow:hidden;}
.menu_update button {display:flex; margin-left:10px; overflow:hidden;}


.page{display :flex ;justify-content : center}
</style>
<body>
<%
	MenuDao dao = new MenuDao();

	int totalcount = dao.getTotalcount();
	int coffeecount = dao.getMenucount("커피");
	int desscount = dao.getMenucount("디저트");
	int drinkcount = dao.getMenucount("음료");
	int prepcount = dao.getMenucount("프라푸치노");
	
	//리스트 불러오기
	
	
	//페이지 구현
	int perPage=5; //한페이지당 보여질 글의 갯수
	int perBlock=5; //한블럭당 출력할 페이지의 갯수
	int totalPage;//총 페이지의 갯수
	int startPage;//각 블럭당 시작 페이지번호
	int endPage;//각 블럭당 끝 페이지번호
	int start;//각 블럭당 불러올 글의 시작번호
	int end;//각 블럭당 불러올 글의 끝번호
	int currentPage;//현재 보여질 페이지 번호
	
	//페이징 관련 함수
	
	
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)
		currentPage=1;//페이지번호가 없을경우 무조건 1페이지로 간다
	else
		currentPage=Integer.parseInt(pageNum);
	
	//총 페이지 구하기(예: 총글수가 9 이구 한페이지당 2개씩 볼경우-
	//나머지가 있을경우에는 1페이지 더 추가)
	totalPage=totalcount/perPage+(totalcount%perPage>0?1:0);
	//시작페이지와 끝페이지구하기
	//예:한페이지당 3개만 볼경우 현재 페이지가 2라면 sp:1, ep:3
	//현재 페이지가 7라면 sp:7, ep:9
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	//마지막 블럭은 endPage 를 totalPage 로 해놔야 한다
	if(endPage>totalPage)
		endPage=totalPage;

	//mysql 은 첫 글이 0번(오라클은 1번)
	start=(currentPage-1)*perPage;
	
	//각 페이지에서 출력할 시작번호
	//총 50개일경우 1페이지는 50
	//              2페이지는 40
	int no=totalcount-(currentPage-1)*perPage;
	
	List<MenuDto> list = dao.getListMenus(start,perPage);
	

%>
<div>
	<div class ='menu_total'><h4>총 <%=totalcount %>개의 메뉴가 있습니다.</h4></div>
	<div class='menu_stat'>
		
		<div class="menu_count">
			<div class='menu_coffee'>
				<a>커피</a>
				<div class='coffee_count'><%=coffeecount %></div>
			</div>
			<div class='menu_dess'>
				<a>디저트</a>
				<div class='dess_count'><%=desscount %></div>
			</div>
			<div class='menu_drink'>
				<a>음료</a>
				<div class='drink_count'><%=drinkcount %></div>
			</div>
			<div class='menu_prep'>
				<a>프라푸치노</a>
				<div class='prep_count'><%=prepcount %></div>
			</div>
		</div>
		
	</div>
	<br>
		<div class = 'menu_insert'>
	<button onclick ="location.href='javascript:pageinsert()'">메뉴 추가</button>
	</div>
	
	<!--  메뉴 리스트 출력 -->
	<div class='menus-view ' id='menus-view'>
	<%
	
		for(MenuDto dto : list){%>
	
    <div class='menus-outline'>
      <div class='menus-box'><img src='menusave/<%=dto.getMenuphoto()%>' /></div> 
      <div class='menus-bg'>
			<div class='menus-title_wrap'>
				<input type="hidden" class="form-control" id="menunum"  name="menunum" value =<%=dto.getMenunum()%>>
				<div class='menus-title'><%=dto.getMenuname() %></div>
				<div class='menus-etitle'></div>
				<div class='menus-txt'><%=dto.getMenudetail() %></div>
			</div>
			<div class='menus-info_wrap'>
				<ul class='menus-info info'>
					<li class='info_cell'>
						<span class='cell0'>칼로리</span>
						<span class='cell1'><%=dto.getMenukcal() %></span>
					</li>
					<li class='info_cell'>
						<span class='cell0'>나트륨</span>
						<span class='cell1'><%=dto.getMenunat() %></span>
					</li>
					<li class='info_cell'>
						<span class='cell0'>당류</span>
						<span class='cell1'><%=dto.getMenusugar() %></span>
					</li>
					<li class='info_cell'>
						<span class='cell0'>카페인</span>
						<span class='cell1'><%=dto.getMenucaff() %></span>
					</li>
				</ul>
			</div>
			<div class = 'menu_update'>
		<button onclick = "location.href ='javascript:pageupdate(<%=dto.getMenunum()%>)'" >메뉴 수정</button>
			<button onclick = "location.href ='javascript:pagedelete(<%=dto.getMenunum()%>)'">메뉴 삭제</button>
		</div>	
      </div>
    </div>
    
    <%} %>
    
    
    </div>
   
<%
if(totalcount>0)
{%>
	<div style = "width : 900px: text-align : center;" class = "page">
	<ul class = "pagination">
	<%
		if(startPage>1){ %>
		<li class="page-item"><a href = "javascript:paging(<%=startPage-1 %>)"></a>
		</li>
	<%}
	
	for(int i = startPage;i<=endPage;i++){
		
		if(i==currentPage) {%>
		<li class = "page-item active">
			<a href = "javascript:paging(<%=i %>)"><%=i %></a></li>
		<% }else {%>
		<li><a href = "javascript:paging(<%=i %>)"><%=i %></a></li>
		<%} 
	}
	
	if(endPage<totalPage){%>
	<li class="page-item"><a href = "javascript:paging(<%=endPage+1 %>)">다음</a></li>
	<% }%>
	
	</ul>
	</div>	
	
<%} %>
</div>
</body>
<script type="text/javascript">
	function paging(pn)
	{
		$(".admin_page_content").load("menu/menuadmin.jsp?pageNum="+pn);
	}
	
	function pageupdate(num1){
		
		$(".admin_page_content").load("menu/menuupdateform.jsp?num="+num1);
	}
	function pagedelete(num2){
		
		$(".admin_page_content").load("menu/menudeleteform.jsp?num="+num2);
	}
	
	function pageinsert(){
		
		$(".admin_page_content").load("menu/menuinsertform.jsp");
	}
	
</script>
</html>