<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.content02 { width:1100px; margin:auto;} /* 제품 상세보기 */

div.product_view_wrap1 { width:1100px; padding-bottom:40px; border-bottom:1px solid #ddd; margin-bottom:40px; }
	div.product_view_pic { width:400px; float:left;margin-right : 10px; }
	div.product_view_pic img { width:400px; float:left; align: center;}


	div.product_view_detail { width:610px; float:right; position:relative; }
	div.product_view_detail div.myAssignZone { position:relative; }
	div.product_view_detail h4 { font-size:24px; font-weight:bold; color:#222; border-bottom:2px solid #333; padding-bottom:18px; margin-bottom:20px; }
	div.product_view_detail h4 span { font-size:14px; font-family:"Arial"; font-weight:normal; color:#666; }
	div.product_view_detail p.t1 { font-size:16px; color:#444; margin-bottom:20px; line-height:1.6; min-height:40px; }
	
	div.product_view_detail div.product_info_head { height:59px; line-height:59px; position:relative; border-top:1px solid #ddd; border-bottom:1px solid #ddd; }
	div.product_view_detail div.product_info_head p.tit { font-size:18px; color:#222; padding-left:10px; }
	div.product_view_detail div.product_info_head div.card_enro { position:absolute; right:0; top:15px; }
	div.product_view_detail div.product_info_head div.card_enro a { display:block; height:28px; line-height:28px; text-align:center; padding:0 10px; background:#006633; color:#fff; font-size:12px; border-radius:3px; }
	div.product_view_detail div.product_select_wrap2 { /*width:375px;*/position:absolute; right:6px; top:6px; display:inline-block} /*20170517수정 : 넓이 제거, right변경*/
	div.product_view_detail div.product_select_wrap2:after { content:""; display:block; clear:both; }
	div.product_view_detail div.product_select_wsrap2 > div { float:left; }
	div.product_view_detail div.product_info_head span.unit { font-size:12px; color:#666; position:absolute; right:0; top:2px; }
	
	
	div.product_view_order{width:200px;padding:10px 0;border:1px solid #bfbfbf;text-align:middle;font-size:1rem;color:#909090;background:#fff;}
/*submenu*/

.sub_visual{min-height:499px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.sub_visual .txt{width:100%;position:absolute;top:148px;left:0;}
.sub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:300;}
.sub_visual .txt h1:after{display:block;width:40px;height:2px;margin:32px auto;background:#202020;content:'';}
.sub_visual .txt p{font-size:1.25rem;font-weight:300;}
.sub_visual .page_tab{width:100%;padding:0 10px;font-size:0;position:absolute;bottom:41px;left:0;}
.sub_visual .page_tab li{display:inline-block;width:20%;max-width:170px;padding:10px 0;border:1px solid #bfbfbf;border-left:0;font-size:1rem;color:#909090;background:#fff;}
.sub_visual .page_tab li:first-child{border-left:1px solid #bfbfbf;}
.sub_visual .page_tab li a{display:block;}
.sub_visual .page_tab li.on, .sub_visual .page_tab li:hover{color:#000;background:#ffe600;transition:background .3s ease;-webkit-transition:background .3s ease;}
.sub_visual.bg-menu{background-image:url(./image/coffee-5132832_1920.jpg);}




</style>
</head>
<script>
$(function(){

	$("div.product_view_order").click(function(e){
	
		e.preventDefault(); 
		var menunum = $("#menunum").val();
	   	location.href ="index.jsp?main=order/orderpage.jsp?menunum="+menunum;
		
	});
	

});
</script>
<body>
<!-- 서브 타이틀 end -->
<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>오직 스타보틀에서만 만나보실 수 있는 시그니처 메뉴입니다.</p>
    </div>
    <ul class="page_tab st-2">
		        <li ><a>전체</a></li>
		        <li ><a>커피</a></li>
		        <li ><a>음료</a></li>
		        <li ><a>디저트</a></li>
		        <li ><a>프라푸치노</a></li>
		    </ul>
		     
 
</div>
<br>
<br>
<%
	//메뉴 자체 아이디 받아오기
	String menunum = request.getParameter("menunum");
	//로그인한 아이디
	String menumyid = (String)session.getAttribute("id");
	//해당 메뉴에 해당하는 테이블의 시퀀스 번호 받아오기ㅣ
	MenuDao medao = new MenuDao();
	MenuDto medto = medao.getdata(menunum);
	//String menunum = medao.getNum("menunum");

%>


				<div class="content02">
					<!-- 제품 상세보기 -->
					<div class="product_view_wrap1">
						<div class="product_view_pic">
						<input type="hidden" class="form-control" id="menunum"  name="menunum" value =<%=medto.getMenunum()%>>		  
						<img src = "menusave/<%=medto.getMenuphoto() %>">
						</div>
						<div class="product_view_detail">
						<h3><%=medto.getMenuname() %></h3><br>
						<div class ="product_desc_detail">
						
						<p><%=medto.getMenudetail() %></p>
						</div>
						
						
						
						<form action="" method="post">
						<fieldset>
									<legend class="hid">제품 영양 정보</legend>
									<div class="product_view_info">
										<div class="product_info_head">
											<p class="tit">제품 영양 정보</p>
											
										</div>
										<div class="product_info_content">
											 <ul>
                                                <li class="kcal">
                                                    <dl>
                                                        <dt>1회 제공량 (kcal) : <%=medto.getMenukcal() %></dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="sodium">
                                                    <dl>
                                                        <dt>나트륨 (mg)  : <%=medto.getMenunat() %></dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="sugars">
                                                    <dl>
                                                        <dt>당류 (g)  :  <%=medto.getMenusugar() %> </dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="caffeine last">
                                                    <dl>
                                                        <dt>카페인 (mg)  :  <%=medto.getMenucaff() %> </dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                            </ul>
										</div>
										
										
									</div>
								</fieldset>
							</form>
							<br></br>
							<div class="product_view_order" style="cursor:pointer;">주문하기</div>
							</div>
						</div>
						
						
					</div>
					
					<!-- 제품 상세보기 end -->
					




</body>
</html>