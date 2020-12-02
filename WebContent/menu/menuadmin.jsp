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
	
	<div class ='menu_total'><h4>총 19개의 메뉴가 있습니다.</h4></div>
	<div class='menu_stat'>
		
		<div class="menu_count">
			<div class='menu_coffee'>
				<a>커피</a>
				<div class='coffee_count'>3</div>
			</div>
			<div class='menu_dess'>
				<a>디저트</a>
				<div class='dess_count'>4</div>
			</div>
			<div class='menu_drink'>
				<a>음료</a>
				<div class='drink_count'>5</div>
			</div>
			<div class='menu_prep'>
				<a>프라푸치노</a>
				<div class='prep_count'>6</div>
			</div>
		</div>
		
	</div>
	<br>
		<div class = 'menu_insert'>
	<button onclick ="location.href='../index.jsp?main=menu/menuinsertform.jsp'">메뉴 추가</button>
	</div>
	<div class='menus-view ' id='menus-view'>
    <div class='menus-outline'>
      <div class='menus-box'><img src='../menusave/americano.jpg' /></div> 
      <div class='menus-bg'>
			<div class='menus-title_wrap'>
				<div class='menus-title'>아이스 연유 카페라떼</div>
				<div class='menus-etitle'></div>
				<div class='menus-txt'>쌉사름하고 향긋한 에스프레소에 달콤하고 고소한 베트남 연유가 어우러진 커피</div>
			</div>
			<div class='menus-info_wrap'>
				<ul class='menus-info info'>
					<li class='info_cell'>
						<span class='cell0'>1회 제공량</span>
						<span class='cell1'>360ml</span>
					</li>
					<li class='info_cell'>
						<span class='cell0'>열량</span>
						<span class='cell1'>183kcal</span>
					</li>
					<li class='info_cell'>
						<span class='cell0'>당류</span>
						<span class='cell1'>19g(19%)</span>
					</li>
				</ul>
				<ul class='menus-info info2'>
					<li class='info_cell'>
						<span class='cell0'>단백질</span>
						<span class='cell1'>5g(9%)</span>
					</li>
					<li class='info_cell'>
						<span class='cell0'>포화지방산</span>
						<span class='cell1'>3g(20%)</span>
					</li>
					<li class='info_cell'>
						<span class='cell0'>나트륨</span>
						<span class='cell1'>67mg(3%)</span>
						</li>
				</ul>
			</div>
			<div class = 'menu_update'>
			<button>메뉴 수정</button>
			<button>메뉴 삭제</button>
		</div>	
      </div>
    </div>
    </div>
    <div class ="page">
    <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
    
    </div>
</body>
</html>