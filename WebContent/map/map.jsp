<%@page import="data.dao.StarMapDao"%>
<%@page import="data.dto.StarMapDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services,clusterer,drawing"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
body{
font-family: 'Noto Sans KR', Arial, sans-serif;
}
.wrap {
	overflow: hidden;
	font-size: 12px;
	font-family: 'Noto Sans KR', Arial, sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .mapinfo {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .mapinfo:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.mapinfo .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.mapinfo .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.mapinfo .close:hover {
	cursor: pointer;
}

.mapinfo .body {
	position: relative;
	overflow: hidden;
}

.mapinfo .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.mapinfo .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.mapinfo:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	/* background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png') */
}

.mapinfo .link {
	color: #5085BB;
}
/*   지도  */

/* 지도 검색창 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', Arial, sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 700px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 300px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	/* background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat; */
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

/* 매장추가,수정,삭제 */
/* #maphadan {
	position: relative;
	top: 150px;
	left: -330px;
	background: url(https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000917/img/basic/a0000917_main.jpg)
		no-repeat;
	width: 200px;
	height: 200px;
	border-radius: 100px;
	float: left;
	margin-left: 400px;
	margin-top: 50px;
}

#hadan {
	position: relative;
	left: 250px;
	top: 30px;
	width: 300px;
}
 */
#shopadd {
	position: relative;
	width: 635px;
	height: 70px;
	border: 1px solid #d5d5d5;
	border-radius: 5px;
	margin-bottom: 20px;
	margin-left: 20px;
}

#shopplus {
	position: absolute;
	text-align: center;
	margin-bottom: 15px;
	top: 13px;
	left: 50px;
}

#shopupdate {
	position: absolute;
	text-align: center;
	margin-bottom: 15px;
	top: 13px;
	left: 245px;
}

#shopdelete {
	position: absolute;
	text-align: center;
	margin-bottom: 15px;
	top: 13px;
	left: 440px;
}

#shopaddspan {
	position: relative;
	font-weight: bold;
	color: #02a8da;
	font-size: 25px;
	top: 0px;
	background-color: white;
	border-radius: 5px;
	padding: 3px;
	padding-left: 20px;
	padding-right: 20px;
}

#shopaddspan:hover {
	cursor: pointer;
	color: white;
	background-color: #02a8da;
}

#mapadd {
	left: 500px;
}
/* 매장추가,수정,삭제 */
/* 매장추가,수정,삭제 */

#photoslide{
	border:1px solid gray;width:300px;height:300px;
	text-align: center; margin: 0 auto;  display: block;
}




/* 배너 */
.img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.5);z-index:1;}
.sub_visual .txt{position: absolute;top:50%;left:50%;transform: translate(-50%, -50%);color: white;z-index: 2;text-align: center;}
.sub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
.sub_visual .txt p{font-size: 14pt; font-weight: 300;}
.sub_visual{position: relative;background-image: url(./image/people-coffee-shop-wide.jpg);height: 400px;background-size:cover;background-position:center;}
/* 배너 */
</style>
<body>
<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>스타보틀</h1>
        <p>스타보틀의 매장을 전국 어디서든 만나보세요</p>
    </div>
    <div class="img-cover"></div>
</div>
	<%
	StarMapDao StarDao = new StarMapDao();
	//목록 가져오기
	List<StarMapDto> list = StarDao.getMainList();
	String shopnum=request.getParameter("shopnum");
	String shopname=request.getParameter("shopname");
	%>
	
	
	<%-- <%
	if(id == id.equals("admin")){

%> --%>

	<%-- 	<%
}
%> --%>
	
	
	<script type="text/javascript">
		$(function() {
			$("#mapadd").hide();
			$("#updatemap").hide();
			
			$("#shopadd").click(function() {
				window.open("map/mapform.jsp","","left=800px,top=100px,width=620px,height=680px");
			});
			$("#shopupdate").click(function() {
				 var shopnum=$("#shopnum").val();
			/* 	 window.open("map/updatemapform.jsp?shopnum="+shopnum,"","left=800px,top=100px,width=620px,height=680px");  */
				 window.open("map/updatemapform.jsp","","left=800px,top=100px,width=620px,height=680px"); 
			 	/* location.href="index.jsp?main=map/updatemapform.jsp?shopnum="+shopnum; */
			});
			$("#shopdelete").click(function() {
				window.open("map/deletemapform.jsp","","left=800px,top=100px,width=600px,height=230px");
			});
			<%-- onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'" --%>
			
			
			//map search 선언 후 옮기기
			
			var mapsearch;
			//var word = $("#word").val();
			//var word2 = $('.word2').val();
			
			$("#shopsearch").change(function() {
				var shopsearch2=$(this).val();
				mapsearch =shopsearch2;
				//alert(shopnum);
				if(shopsearch2=='-'){
					$("#mapsearch").val("");
					$("#mapsearch").focus();
				}else{
					$("#mapsearch").val(shopsearch2);
				}
			});
			
			//search 구현하기
			
			$("#mapbutton").click(function(){
			
				var word = $("#word").val();
				//var word = $(".word").val();
				//var word = $("input[name=word]").val();
				//var search;
				 $.ajax({
					type : "post",
					url : "./map/mapsearch.jsp",
					data : {"mapsearch":mapsearch,"word":word},
					dataType : "xml",
					success : function(data){
						
						var s = "";
						
							$(data).find("store").each(function(i, element){	
								var n=$(element);
								s +="<div class ='result"+i+"' id = 'result'  style ='border-bottom : 2px solid gray;'><img src='//caffebene.com/images/common/s-pin.png' width='55' height='58'>";
								  var shopname = n.find("shopname").text();
								  var shopaddr= n.find("shopaddr").text();
								  var shophp = n.find("shophp").text();
								  var shopdetail = n.find("shopdetail").text();
								
								 s += "<a class='"+shopname+"' id='shopname' onclick='selectFx(this.className)' style ='cursor : pointer;' >지점명 : "+shopname+"</a><br>";
								 s += "<a id='shopaddr'>주소 : "+shopaddr+"</a><br>";
								 s += "<a id='shophp'>매장번호 : "+shophp+"</a><br>";
								 s += "<a id='shopdetail'>영업시간 : "+shopdetail+"</a><br>";
								 s+="</div>";
			                 });s
							
								$("#searchlist").html(s);
					}
					
				});
				
				
			});
			
		});
	</script>
	<!-- 매장추가end -->

	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 750px; position: relative; overflow: hidden;margin-top: 50px;" ></div>

		<div id="menu_wrap" class="bg_white">
			<div class="map-search">
				<select id="shopsearch">
					<option selected disabled hidden>검색방법을 선택해주세요</option>
					<option value="shopname">매장명</option>
					<option value="shopaddr">매장주소</option>
				</select> 
				<input type="hidden" id="mapsearch" name="mapsearch">
				<input type="text" style="width: 200px;" name="word" id="word" class = "word" placeholder="검색단어입력"> 
				<button type="button" class="btn btn-warning" id="mapbutton"
					style="width: 45px;">
					<span class="fas fa-search">검색</span>
				</button>
			</div>
			<hr>
			<div id = "searchlist" style="">
				

			</div>
	</div>

	

	<!-- 매장정보 페이지 -->
	<!-- 매장정보 페이지 -->
	<%
		StarMapDao db = new StarMapDao();
	int totalCount = db.getTotalCount();
	int perPage = 100; //한 페이지당 보여지는 글의 갯수
	int perBlock = 5; //한 블럭당 출력할 페이지의 갯수
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
	
<h1 style="margin-left: 240px; margin-top: 80px; margin-bottom: -70px;"><b style="font-size: 30px;">매장안내</b></h1>
<div style="width: 1500px; margin: 0 auto;">

 <%	
		for (StarMapDto dto : getlist) {
		%>
 <!-- The Tour Section -->
  <div class="w3-white" id="tour" style="margin: 0 auto;  display: block; ">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px; margin: 0 auto;  display: block; margin-left: 50px; float: left; margin-bottom: -105px;">
  
      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
      
        <div class="w3-third w3-margin-bottom">
       
          <img src="../bitsemiproject301/shopmapsave/<%=dto.getShopphoto()%>" alt="New York" style="width:380px; height: 330px; border-radius: 3px;" class="w3-hover-opacity">
          <div class="w3-container w3-white" style="margin-top: 10px;">
            <p style="width: 450px;"><b style="width: 450px; font-size: 20px;"><%=dto.getShopname()%></b></p>
            <p class="w3-opacity" style="width: 450px;"><%=dto.getShophp()%></p>
            <p style="width: 450px;"><%=dto.getShopaddr()%></p>
          	<p style="width: 450px;"><%=dto.getShopdetail()%></p>
          </div>
        </div>
        
      </div>
    </div>
  </div>
	
<%
			}
		%>
</div>	
	<!-- 매장정보 페이지-->


	<script type="text/javascript">
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.50375828621347, 127.02411861828377), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);		
		var geocoder = new kakao.maps.services.Geocoder();		
		var positions = [ 
		   <%for (StarMapDto dto : list) {%>
		   {
		    	  title: '<%=dto.getShopname()%>',
                  content: '<div class="wrap">' + 
                   '    <div class="mapinfo">' + 
                   '        <div class="title">' + 
                   '            <%=dto.getShopname()%>' + 
                   '            <div class="close" id="mapexit" title="닫기" onclick="closeFx()"></div>' + 
                   '        </div>' + 
                   '        <div class="body">' + 
                   '            <div class="img">' +
                   '                <img src="../bitsemiproject301/shopmapsave/<%=dto.getShopphoto()%>" width="73" height="70">' +
                   '           </div>' + 
                   '            <div class="desc">' + 
                   '                <div class="ellipsis"><%=dto.getShopaddr()%></div>' + 
                   '                <div class="jibun ellipsis"><%=dto.getShopaddrdetail()%></div>' + 
                   '				<div class="jibun ellipsis"><%=dto.getShophp()%></div>' +
                   '				<div class="jibun ellipsis"><%=dto.getShopdetail()%></div>' +
                   '            </div>' + 
                   '        </div>' + 
                   '    </div>' +    
                   '</div>',
                  latlng: new kakao.maps.LatLng(<%=dto.getMpositionx()%>, <%=dto.getMpositiony()%>)
              },
		   <%}%>
          ]; 
	
		
   
		var imageSrc = "//caffebene.com/images/common/s-pin.png", // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    

	    ////초기 매장 포지션 표시해 주는곳!!!!!!!!!!!!!!!///////////////
	    for (var i = 0; i < positions.length; i ++) {
	        
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(70, 84); 
	        
	        // 마커 이미지를 생성합니다    
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	        
	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: positions[i].latlng, // 마커를 표시할 위치
	            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : markerImage // 마커 이미지 
	        });
	        
	        var maptitle = positions[i].title;
	        
	        var infowindow = new kakao.maps.InfoWindow({
	            content: positions[i].content // 인포윈도우에 표시할 내용
	        });
	    	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	        //kakao.maps.event.addListener(marker, 'click', makeclickListener(maptitle,marker,infowindow));
		       
	    }
	  //////// 마커 생성 완료//////////
	 	
	 	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	    function makeOverListener(map, marker, infowindow) {
	        return function() {
	        	 infowindow.open(map, marker);
	        };
	    }
	  
	   	
	    function makeclickListener(maptitle, marker, infowindow) {
	        return function() {
	        	 alert(maptitle);
	        };
	    } 
	  
	    

	    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	    function makeOutListener(infowindow) {
	        return function() {
	            infowindow.close();
	        };
	    }
	    
		// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		marker.setClickable(true);


		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		
		//★ ★//
		
		


	/////////////////////마커 표시이이이이이이이//////////////////////
	/* 	// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
////////////////////////////////////////마커 표시///////////////////////////////////



		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
			
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다 참고용
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}


		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다 중요 노지움
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		} */
		
		
		
		/// result 를 클릭 했을때 
		window.onload = function(){
			
		};
		
		
		var close = document.getelementsbyclassname("close");
		
		function closeFx(){
			
			this.infowindow.close();
		}
		
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}
		
		
		function selectFx(tag) {
			///이름이 이거인 매장을 찾는다.
			
			 for (var i = 0; i < positions.length; i ++) {
				 var maptitle = positions[i].title;
				 
				 if(maptitle == tag){
					 //그 마커에 포커스를 찍는다
					 removeMarker();
					 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				        
					 
				        // 마커를 생성합니다
				        var marker = new kakao.maps.Marker({
				            map: map, // 마커를 표시할 지도
				            position: positions[i].latlng, // 마커를 표시할 위치
				            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				            image : markerImage // 마커 이미지 
				        });
				        
				        
				        var infowindow = new kakao.maps.InfoWindow({
				            content: positions[i].content // 인포윈도우에 표시할 내용
				        }); 
				        
				        
				        infowindow.open(map,marker);
				        
				        break;
				        
				 }else continue;
				 
			
			 }
			
			
        }	

		

</script>
</body>

</html>