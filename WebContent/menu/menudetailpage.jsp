<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.content02 { width:1100px; margin:auto;} /* 제품 상세보기 */

div.product_view_wrap1 { width:1100px; padding-bottom:40px; border-bottom:1px solid #ddd; margin-bottom:40px; }
	div.product_view_wrap1:after { content:""; display:block; clear:both; }
	div.product_view_pic { width:450px; float:left; }
	div.product_view_pic ul { width:450px; }
	div.product_view_pic:after { content:""; display:block; clear:both; }
	div.product_view_pic ul li { float:left; }

	div.product_view_pic div.product_big_pic { position:relative; width:450px; height:470px; margin-bottom:8px; }
	div.product_view_pic div.card_big_pic { position:relative; height:286px; }
	div.product_view_pic div.card_big_pic a { cursor:default; }
	div.product_view_pic div.product_big_pic p.more_btn { position:absolute; right:15px; bottom:15px; }
	
	div.product_view_pic ul.product_thum li { margin-right:8px; }
	div.product_view_pic ul.product_thum li.last { margin-right:0; }

	div.product_view_detail { width:610px; float:right; position:relative; }
	div.product_view_detail div.myAssignZone { position:relative; }
	div.product_view_detail h4 { font-size:24px; font-weight:bold; color:#222; border-bottom:2px solid #333; padding-bottom:18px; margin-bottom:20px; }
	div.product_view_detail h4 span { font-size:14px; font-family:"Arial"; font-weight:normal; color:#666; }
	div.product_view_detail p.t1 { font-size:16px; color:#444; margin-bottom:20px; line-height:1.6; min-height:40px; }
	div.product_view_detail p.card_launch { padding:18px 12px; background:#f4f4f2; color:#222; font-size:14px; border-radius:3px; margin-bottom:20px; }
	div.product_view_detail p.card_launch span { color:#222; }
	div.product_view_detail div.myDrink { position:absolute; right:0; top:7px; }
	div.product_view_detail div.myDrink a { display:block; width:111px; height:28px; line-height:28px; background:#006633; font-size:12px; color:#fff; text-align:center; border-radius:3px; }
	div.product_view_detail div.myAssignZone .storeInfo{display:block; padding-top: 20px; color:#444; font-size:16px} /*20171204 추가*/

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
				<div class="content02">
					<!-- 제품 상세보기 -->
					<div class="product_view_wrap1">
						<div class="product_view_pic">
						<img src ="data:image/jpeg;base64,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">
						</div>
						<div class="product_view_detail">
						<h3>제품 이름 있어야할곳</h3><br>
						<div class ="product_desc_detail">
						
						<p> 제품 설명 좌르르르륵</p>
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
                                                        <dt>1회 제공량 (kcal)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                              	<li class="sat_FAT">
                                                    <dl>
                                                        <dt>포화지방 (g)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="protein">
                                                    <dl>
                                                        <dt>단백질 (g)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="fat" style="display:none;">
                                                    <dl>
                                                        <dt>지방 (g)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="trans_FAT" style="display:none;">
                                                    <dl>
                                                        <dt>트랜스지방 (g)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                
                                            </ul>
                                            <ul>
                                                <li class="sodium">
                                                    <dl>
                                                        <dt>나트륨 (mg)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="sugars">
                                                    <dl>
                                                        <dt>당류 (g)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="caffeine last">
                                                    <dl>
                                                        <dt>카페인 (mg)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="cholesterol" style="display:none;">
                                                    <dl>
                                                        <dt>콜레스테롤 (mg)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                                <li class="chabo" style="display:none;">
                                                    <dl>
                                                        <dt>탄수화물 (g)</dt>
                                                        <dd></dd>
                                                    </dl>
                                                </li>
                                            </ul>
										</div>
										<div class="product_factor">
											<p></p>
										</div>
										
									</div>
								</fieldset>
							</form>
							
							<div class="product_view_order">주문하기</div>
							</div>
						</div>
						
						
					</div>
					
					<!-- 제품 상세보기 end -->
					




</body>
</html>